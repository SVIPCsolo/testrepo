#!/usr/bin/env python3
"""
多线程终端粒子动画脚本（MT / Multi-Threading）
==============================================

纯标准库实现，无第三方依赖。物理计算分片交给多个线程并行处理，
主线程只负责合成与渲染，用 ANSI 256 色在终端里绘制粒子场。

用法:
    python3 mt_terminal_particles.py                 # 默认 900 粒子 / 4 线程
    python3 mt_terminal_particles.py -n 1500 -t 8    # 自定义粒子数与线程数
    python3 mt_terminal_particles.py --duration 3    # 只跑 3 秒（便于测试）

运行中快捷键:
    q  退出          b  粒子爆发        v  开关漩涡
    +  增强引力      -  减弱引力        r  重置分布
"""

import argparse
import colorsys
import math
import os
import random
import select
import shutil
import sys
import threading
import time

# ---------------------------------------------------------------- 渲染常量
# 亮度字符梯度：从暗到亮
RAMP = " .,:;irsXA253hMHGS#9B&@"
RAMP_LEN = len(RAMP)
TRAIL_DECAY = 0.86  # 每帧亮度衰减，越小拖尾越短


def rgb_to_256(r: float, g: float, b: float) -> int:
    """把 0~1 的 RGB 量化到 xterm-256 的 6x6x6 色立方。"""
    ri = min(5, int(round(r * 5)))
    gi = min(5, int(round(g * 5)))
    bi = min(5, int(round(b * 5)))
    return 16 + 36 * ri + 6 * gi + bi


def build_hue_lut() -> list:
    """预计算 360 个色相对应的 256 色索引，避免每帧重复换算。"""
    lut = []
    for h in range(360):
        r, g, b = colorsys.hsv_to_rgb(h / 360.0, 0.85, 1.0)
        lut.append(rgb_to_256(r, g, b))
    return lut


HUE_LUT = build_hue_lut()


# ---------------------------------------------------------------- 粒子系统
class ParticleField:
    """粒子数据 + 多线程分片更新。

    数据用平行数组存（px/py/vx/vy/hue），每个工作线程只写自己负责的
    那一段区间，互不重叠，因此不需要锁；线程之间用 Barrier 做帧同步。
    """

    def __init__(self, count: int, width: int, height: int,
                 threads: int, gravity: float = 1.0):
        self.count = count
        self.W = width
        self.H = height
        self.threads = max(1, min(threads, count))
        self.gravity = gravity
        self.vortex = False
        self.running = True

        # 平行数组
        self.px = [0.0] * count
        self.py = [0.0] * count
        self.vx = [0.0] * count
        self.vy = [0.0] * count
        self.hue = [0.0] * count

        self._reset()

        # 帧同步：N 个工作线程 + 1 个主线程
        self.barrier = threading.Barrier(self.threads + 1)
        # 爆发请求（由主线程设置，工作线程下一帧消费）
        self.burst_req = None
        # 引力井位置（在主线程里缓慢漂移）
        self.well_x = width * 0.5
        self.well_y = height * 0.5

    # ---------------------------------------------------------- 初始化
    def _reset(self):
        cx, cy = self.W * 0.5, self.H * 0.5
        spread = min(self.W, self.H) * 0.35
        for i in range(self.count):
            ang = random.random() * math.tau
            rad = random.random() * spread
            self.px[i] = cx + math.cos(ang) * rad
            self.py[i] = cy + math.sin(ang) * rad
            self.vx[i] = (random.random() - 0.5) * 1.2
            self.vy[i] = (random.random() - 0.5) * 1.2
            self.hue[i] = random.random() * 360.0

    def resize(self, width: int, height: int):
        """终端尺寸变化时重新映射坐标。"""
        sx = width / max(1, self.W)
        sy = height / max(1, self.H)
        for i in range(self.count):
            self.px[i] *= sx
            self.py[i] *= sy
        self.W, self.H = width, height

    # ---------------------------------------------------------- 物理步进
    def _update_slice(self, start: int, end: int):
        px, py, vx, vy, hue = self.px, self.py, self.vx, self.vy, self.hue
        W, H = self.W, self.H
        g = self.gravity
        vortex = self.vortex
        well_x, well_y = self.well_x, self.well_y
        burst = self.burst_req

        max_speed = 14.0
        for i in range(start, end):
            x, y = px[i], py[i]
            ux, uy = vx[i], vy[i]

            # 引力井：距离越近吸得越强（带一点软化避免奇点）
            dx = well_x - x
            dy = well_y - y
            d2 = dx * dx + dy * dy
            d = math.sqrt(d2) + 1e-4
            if d > 1e-3:
                f = g * 900.0 / (d2 + 300.0)
                ux += dx / d * f
                uy += dy / d * f
                if vortex:
                    # 切向分量，形成漩涡
                    ux += -dy / d * abs(f) * 1.1
                    uy += dx / d * abs(f) * 1.1

            # 爆发：从爆发点向外推
            if burst is not None:
                bx, by = burst
                bdx, bdy = x - bx, y - by
                bd = math.hypot(bdx, bdy) + 1e-4
                ux += bdx / bd * (6.0 + random.random() * 6.0)
                uy += bdy / bd * (6.0 + random.random() * 6.0)

            # 阻尼
            ux *= 0.982
            uy *= 0.982

            # 限速
            sp = ux * ux + uy * uy
            if sp > max_speed * max_speed:
                k = max_speed / math.sqrt(sp)
                ux *= k
                uy *= k

            x += ux
            y += uy

            # 边界环绕（比反弹更顺滑，粒子不会堆在边缘）
            if x < 0:
                x += W
            elif x >= W:
                x -= W
            if y < 0:
                y += H
            elif y >= H:
                y -= H

            px[i], py[i] = x, y
            vx[i], vy[i] = ux, uy

            # 色相随速度漂移
            hue[i] = (hue[i] + math.sqrt(sp) * 0.35) % 360.0

    def _worker(self, start: int, end: int):
        """工作线程主循环：等帧开始 -> 计算 -> 等帧同步。"""
        try:
            while self.running:
                self.barrier.wait()   # 等待主线程发出开始信号
                self._update_slice(start, end)
                self.barrier.wait()   # 计算完成
        except threading.BrokenBarrierError:
            pass  # 主线程退出时打断屏障，正常结束

    def start_workers(self):
        self.workers = []
        base = self.count // self.threads
        rem = self.count % self.threads
        cursor = 0
        for t in range(self.threads):
            n = base + (1 if t < rem else 0)
            th = threading.Thread(
                target=self._worker,
                args=(cursor, cursor + n),
                daemon=True,
            )
            th.start()
            self.workers.append(th)
            cursor += n

    def stop_workers(self):
        self.running = False
        try:
            self.barrier.abort()
        except Exception:
            pass


# ---------------------------------------------------------------- 渲染器
class Renderer:
    def __init__(self, width: int, height: int):
        self.W = width
        self.H = height
        self.intensity = [0.0] * (width * height)
        self.hue_buf = [0.0] * (width * height)

    def clear(self):
        self.intensity = [0.0] * (self.W * self.H)

    def deposit(self, field: ParticleField):
        """把粒子沉积到亮度网格，带邻域轻微扩散。"""
        W, H = self.W, self.H
        inten, hues = self.intensity, self.hue_buf
        px, py, hue = field.px, field.py, field.hue

        for i in range(field.count):
            x = int(px[i])
            y = int(py[i])
            if x < 0 or x >= W or y < 0 or y >= H:
                continue
            idx = y * W + x
            inten[idx] = min(1.0, inten[idx] + 0.85)
            hues[idx] = hue[i]

            # 四邻域淡淡扩散，形成光晕
            if x > 0:
                inten[idx - 1] += 0.20
                hues[idx - 1] = hue[i]
            if x < W - 1:
                inten[idx + 1] += 0.20
                hues[idx + 1] = hue[i]
            if y > 0:
                inten[idx - W] += 0.20
                hues[idx - W] = hue[i]
            if y < H - 1:
                inten[idx + W] += 0.20
                hues[idx + W] = hue[i]

    def decay(self):
        # 列表推导在 C 层完成，比 Python 循环快很多
        self.intensity = [v * TRAIL_DECAY for v in self.intensity]

    def to_ansi(self) -> str:
        """把亮度网格转成 ANSI 字符串。"""
        W, H = self.W, self.H
        inten, hues = self.intensity, self.hue_buf
        out = []
        last_color = -1
        for y in range(H):
            base = y * W
            row = []
            for x in range(W):
                idx = base + x
                v = inten[idx]
                if v < 0.03:
                    row.append(" ")
                    continue
                ch = RAMP[min(RAMP_LEN - 1, int(v * RAMP_LEN))]
                color = HUE_LUT[int(hues[idx]) % 360]
                if color != last_color:
                    row.append(f"\x1b[38;5;{color}m")
                    last_color = color
                row.append(ch)
            row.append("\x1b[0m")
            last_color = -1
            out.append("".join(row))
        return "\n".join(out)


# ---------------------------------------------------------------- 键盘输入
class KeyReader:
    """Unix 下的非阻塞按键读取（不依赖第三方库）。"""

    def __init__(self):
        self.enabled = sys.stdin.isatty()
        self._old = None
        if self.enabled:
            try:
                import termios
                import tty
                self._termios = termios
                fd = sys.stdin.fileno()
                self._old = termios.tcgetattr(fd)
                tty.setcbreak(fd)
            except Exception:
                self.enabled = False

    def read_keys(self) -> list:
        if not self.enabled:
            return []
        try:
            if not select.select([sys.stdin], [], [], 0)[0]:
                return []
            data = os.read(sys.stdin.fileno(), 16)
            return list(data.decode(errors="ignore"))
        except Exception:
            return []

    def restore(self):
        if self._old is not None:
            try:
                self._termios.tcsetattr(sys.stdin.fileno(),
                                        self._termios.TCSADRAIN, self._old)
            except Exception:
                pass


# ---------------------------------------------------------------- 主流程
def terminal_size(fallback=(100, 30)):
    try:
        size = shutil.get_terminal_size(fallback)
        return size.columns, size.lines
    except Exception:
        return fallback


def main():
    parser = argparse.ArgumentParser(description="多线程终端粒子动画")
    parser.add_argument("-n", "--particles", type=int, default=900,
                        help="粒子数量（默认 900）")
    parser.add_argument("-t", "--threads", type=int, default=4,
                        help="工作线程数（默认 4）")
    parser.add_argument("--fps", type=int, default=30, help="目标帧率（默认 30）")
    parser.add_argument("--duration", type=float, default=0,
                        help="运行秒数，0 表示一直运行")
    parser.add_argument("--gravity", type=float, default=1.0, help="初始引力强度")
    parser.add_argument("--width", type=int, default=0, help="强制终端宽度（调试用）")
    parser.add_argument("--height", type=int, default=0, help="强制终端高度（调试用）")
    parser.add_argument("--no-clear", action="store_true", help="不发送清屏/光标控制")
    args = parser.parse_args()

    # 终端尺寸：留一行给状态栏
    if args.width and args.height:
        W, H = args.width, args.height
    else:
        W, H = terminal_size()
    H = max(6, H - 2)
    W = max(20, W)

    field = ParticleField(args.particles, W, H, args.threads, args.gravity)
    renderer = Renderer(W, H)
    keys = KeyReader()

    no_ctl = args.no_clear or not sys.stdout.isatty()
    if not no_ctl:
        sys.stdout.write("\x1b[?25l")  # 隐藏光标
        sys.stdout.write("\x1b[2J")    # 清屏

    field.start_workers()

    frame_time = 1.0 / max(1, args.fps)
    start = time.perf_counter()
    last = start
    frames = 0
    fps_val = 0.0
    exit_code = 0

    try:
        while field.running:
            t0 = time.perf_counter()
            if args.duration and (t0 - start) >= args.duration:
                break

            # 终端尺寸变化时重新适配
            if not (args.width and args.height):
                cw, ch = terminal_size()
                ch = max(6, ch - 2)
                if cw != W or ch != H:
                    W, H = max(20, cw), ch
                    field.resize(W, H)
                    renderer = Renderer(W, H)

            # 引力井缓慢漂移（李萨如曲线），让画面自己动起来
            t = t0 - start
            field.well_x = W * (0.5 + 0.32 * math.sin(t * 0.7))
            field.well_y = H * (0.5 + 0.32 * math.sin(t * 1.13 + 1.7))

            # 按键处理
            for k in keys.read_keys():
                if k in ("q", "Q", "\x03"):
                    field.running = False
                elif k in ("b", "B"):
                    field.burst_req = (field.well_x, field.well_y)
                elif k in ("v", "V"):
                    field.vortex = not field.vortex
                elif k in ("+", "="):
                    field.gravity = min(3.0, field.gravity + 0.25)
                elif k in ("-", "_"):
                    field.gravity = max(-2.0, field.gravity - 0.25)
                elif k in ("r", "R"):
                    field._reset()

            # 帧同步：放行工作线程 -> 等它们算完
            field.barrier.wait()
            field.burst_req = None  # 只生效一帧
            field.barrier.wait()

            # 合成画面
            renderer.decay()
            renderer.deposit(field)
            body = renderer.to_ansi()

            now = time.perf_counter()
            dt = now - last
            last = now
            frames += 1
            if dt > 0:
                fps_val = 0.9 * fps_val + 0.1 * (1.0 / dt) if fps_val else 1.0 / dt

            status = (f"\x1b[0m 粒子 {args.particles} | 线程 {args.threads} "
                      f"| FPS {fps_val:5.1f} | 引力 {field.gravity:+.2f} "
                      f"| 漩涡 {'开' if field.vortex else '关'} "
                      f"| q 退出 b 爆发 v 漩涡 +/- 引力 ")

            if no_ctl:
                sys.stdout.write(body + "\n" + status + "\n")
            else:
                sys.stdout.write("\x1b[H" + body + "\n" + status)
            sys.stdout.flush()

            # 控制帧率
            elapsed = time.perf_counter() - t0
            if elapsed < frame_time:
                time.sleep(frame_time - elapsed)

    except KeyboardInterrupt:
        pass
    finally:
        field.stop_workers()
        keys.restore()
        if not no_ctl:
            sys.stdout.write("\x1b[0m\x1b[?25h\n")  # 恢复光标
            sys.stdout.flush()

    return exit_code


if __name__ == "__main__":
    sys.exit(main())
