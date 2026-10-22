#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
NEXUS BOOT LOADER 7.0
科技感加载动画 - 从 1% 到 100%
"""

import sys
import time
import random
import shutil
import os

# ============ 颜色定义 ============
class C:
    RESET   = "\033[0m"
    BOLD    = "\033[1m"
    DIM     = "\033[2m"
    CYAN    = "\033[36m"
    GREEN   = "\033[92m"
    RED     = "\033[91m"
    YELLOW  = "\033[93m"
    MAGENTA = "\033[95m"
    BLUE    = "\033[94m"
    GRAY    = "\033[90m"
    WHITE   = "\033[97m"
    BG_CYAN = "\033[46m"
    BG_GREEN= "\033[42m"

# ============ 工具函数 ============
def clear():
    sys.stdout.write("\033[2J\033[H")
    sys.stdout.flush()

def move(x, y):
    sys.stdout.write(f"\033[{y};{x}H")
    sys.stdout.flush()

def width():
    return shutil.get_terminal_size().columns

def slow_type(text, delay=0.003, color=C.CYAN):
    sys.stdout.write(color)
    for ch in text:
        sys.stdout.write(ch)
        sys.stdout.flush()
        time.sleep(delay)
    sys.stdout.write(C.RESET)

# ============ 加载条样式 ============
BAR_CHARS = ["█", "▓", "▒", "░"]

def make_bar(percent, bar_width=40):
    filled = int(bar_width * percent / 100)
    bar = ""
    for i in range(bar_width):
        if i < filled:
            # 渐变色：青->绿
            if i < bar_width * 0.6:
                bar += C.CYAN + "█"
            elif i < bar_width * 0.85:
                bar += C.GREEN + "█"
            else:
                bar += C.YELLOW + "█"
        else:
            bar += C.GRAY + "░"
    return bar

# ============ 科技感系统消息 ============
SYS_MSGS = [
    "INITIALIZING QUANTUM CORE...",
    "CALIBRATING NEURAL INTERFACE...",
    "DECryptING MAINFRAME...",
    "LOADING ASSETS [v7.0.1]...",
    "SYNCING SATELLITE UPLINK...",
    "ESTABLISHING SECURE CHANNEL...",
    "RECONSTRUCTING DATA BLOCKS...",
    "OPTIMIZING MEMORY MATRIX...",
    "VERIFYING BIOMETRIC SIGNATURE...",
    "ROUTING THROUGH NODE 0x7F...",
    "RUNNING DIAGNOSTIC CHECK...",
    "COMPILING NEURAL NETWORK...",
    "PURGING CACHE MEMORY...",
    "ACTIVATING SHIELD PROTOCOL...",
    "SCANNING THREAT LEVEL...",
    "EXECUTING PATCH SEQUENCE...",
    "MAPPING VIRTUAL TOPOLOGY...",
    "BYPASSING FIREWALL...",
    "RENDERING HOLOGRAM...",
    "ENGAGING WARP DRIVE...",
]

WARN_MSGS = [
    "[WARN]  PACKET LOSS DETECTED - RECOVERING...",
    "[ALERT] ANOMALY IN SUBSYSTEM 04 - RESOLVING...",
    "[INFO]  REDUNDANCY CHECK PASSED",
    "[OK]    MODULE VERIFIED",
    "[DBG]   HASH MATCH: 0x" + "".join(random.choices("0123456789ABCDEF", k=8)),
]

# ============ 矩阵雨 ============
def matrix_rain(duration=1.5, density=0.15):
    chars = "01ｱｲｳｴｵｶｷｸｹｺｻｼｽｾｿﾀﾁﾂﾃﾄﾅﾆﾇﾈﾉﾊﾋﾌﾍﾎﾏﾐﾑﾒﾓﾔﾕﾖﾗﾘﾙﾚﾛﾜ"
    w = width()
    cols = [random.randint(0, 20) for _ in range(w)]
    start = time.time()
    while time.time() - start < duration:
        line = ""
        for i in range(w):
            if random.random() < density:
                line += C.GREEN + random.choice(chars)
            elif random.random() < 0.05:
                line += C.WHITE + random.choice(chars)
            else:
                line += " "
        sys.stdout.write(line + C.RESET + "\n")
        sys.stdout.flush()
        time.sleep(0.03)

# ============ 故障特效 ============
def glitch_text(text, frames=8):
    chars = "!@#$%^&*()_+-=[]{}|;:,.<>?/~`"
    for _ in range(frames):
        glitched = list(text)
        for i in range(len(glitched)):
            if random.random() < 0.3:
                glitched[i] = random.choice(chars)
        sys.stdout.write("\r" + C.RED + "".join(glitched) + C.RESET)
        sys.stdout.flush()
        time.sleep(0.05)
    sys.stdout.write("\r" + " " * len(text) + "\r")

# ============ 启动画面 ============
def boot_splash():
    clear()
    lines = [
        r"  ╔═══════════════════════════════════════════════════════╗",
        r"  ║                                                       ║",
        r"  ║     ███╗   ██╗███████╗██╗  ██╗██╗   ██╗███████╗      ║",
        r"  ║     ████╗  ██║██╔════╝╚██╗██╔╝██║   ██║██╔════╝      ║",
        r"  ║     ██╔██╗ ██║█████╗   ╚███╔╝ ██║   ██║███████╗      ║",
        r"  ║     ██║╚██╗██║██╔══╝   ██╔██╗ ██║   ██║╚════██║      ║",
        r"  ║     ██║ ╚████║███████╗██╔╝ ██╗╚██████╔╝███████║      ║",
        r"  ║     ╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝      ║",
        r"  ║                                                       ║",
        r"  ║              N E X U S   B O O T   v 7 . 0           ║",
        r"  ║                                                       ║",
        r"  ╚═══════════════════════════════════════════════════════╝",
    ]
    for line in lines:
        print(C.CYAN + line + C.RESET)
        time.sleep(0.04)
    time.sleep(0.4)
    glitch_text("  >>> ESTABLISHING SECURE CONNECTION <<<", frames=10)
    print()

# ============ 主加载循环 ============
def main_load():
    w = width()
    print()
    print(f"  {C.GRAY}[{time.strftime('%Y-%m-%d %H:%M:%S')}] SYSTEM UPTIME: {C.RESET}")
    print(f"  {C.GRAY}NODE ID: NX-{random.randint(1000,9999)}-{random.randint(1000,9999)}{C.RESET}")
    print()

    spinner = ["⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏"]
    msg_index = 0
    warn_count = 0

    for i in range(1, 101):
        bar = make_bar(i)
        spin = spinner[i % len(spinner)]

        # 切换消息
        if i % 5 == 0:
            msg_index = (msg_index + 1) % len(SYS_MSGS)
        msg = SYS_MSGS[msg_index]

        # 随机插入警告
        extra = ""
        if random.random() < 0.08 and warn_count < 4:
            extra = f"  {C.YELLOW}{random.choice(WARN_MSGS)}{C.RESET}"
            warn_count += 1

        # 颜色随进度变化
        if i < 30:
            pct_color = C.CYAN
        elif i < 70:
            pct_color = C.GREEN
        elif i < 90:
            pct_color = C.YELLOW
        else:
            pct_color = C.MAGENTA

        line = f"  {spin} {bar} {pct_color}{C.BOLD}{i:3d}%{C.RESET}  {C.GRAY}{msg}{C.RESET}{extra}"
        sys.stdout.write("\r" + line + " " * max(0, w - len(line) - 30))
        sys.stdout.flush()

        # 速度变化：开始快，中间慢，最后冲刺
        if i < 20:
            time.sleep(random.uniform(0.02, 0.05))
        elif i < 80:
            time.sleep(random.uniform(0.04, 0.09))
        elif i < 95:
            time.sleep(random.uniform(0.03, 0.06))
        else:
            time.sleep(random.uniform(0.01, 0.03))

    print()
    print()

# ============ 完成动画 ============
def complete():
    print(f"  {C.GREEN}{C.BOLD}████████████████████████████████████████{C.RESET}")
    print(f"  {C.GREEN}{C.BOLD}  ► SYSTEM ONLINE — ALL MODULES READY   {C.RESET}")
    print(f"  {C.GREEN}{C.BOLD}████████████████████████████████████████{C.RESET}")
    print()

    final_lines = [
        f"  {C.GREEN}[ OK ]{C.RESET} CORE ENGINE       : {C.GREEN}ACTIVE{C.RESET}",
        f"  {C.GREEN}[ OK ]{C.RESET} NEURAL NETWORK    : {C.GREEN}SYNCED{C.RESET}",
        f"  {C.GREEN}[ OK ]{C.RESET} SECURITY SHIELD   : {C.GREEN}ARMED{C.RESET}",
        f"  {C.GREEN}[ OK ]{C.RESET} UPLINK CHANNEL    : {C.GREEN}STABLE{C.RESET}",
    ]
    for line in final_lines:
        slow_type(line + "\n", delay=0.01, color=C.RESET)
        time.sleep(0.15)

    print()
    slow_type("  >>> ACCESS GRANTED. WELCOME, OPERATOR. <<<\n", delay=0.02, color=C.MAGENTA + C.BOLD)
    print()

# ============ 主流程 ============
def main():
    try:
        boot_splash()
        time.sleep(0.3)
        main_load()
        complete()
        time.sleep(0.3)
        # 结尾矩阵雨
        matrix_rain(duration=1.0, density=0.08)
        sys.stdout.write(C.RESET)
    except KeyboardInterrupt:
        sys.stdout.write(C.RESET + "\n")
        print(f"{C.RED}[!] ABORTED BY USER{C.RESET}")
        sys.exit(1)

if __name__ == "__main__":
    main()
