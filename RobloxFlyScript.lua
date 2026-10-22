-- Roblox 飞行脚本（客户端 LocalScript）
-- 放置位置：StarterPlayer > StarterPlayerScripts 下新建 LocalScript，粘贴本文件内容
-- 操作：F 键开启/关闭飞行；W/A/S/D 按摄像机方向前后左右飞；Space 上升；LeftCtrl 下降
-- 说明：仅作用于自己的角色，属于游戏开发用的能力脚本（需要该游戏允许）

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer

-- ===== 可调参数 =====
local FLY_SPEED = 60          -- 飞行速度（studs/秒）
local TOGGLE_KEY = Enum.KeyCode.F
local UP_KEY = Enum.KeyCode.Space
local DOWN_KEY = Enum.KeyCode.LeftControl

local flying = false
local bodyVelocity, bodyGyro
local hrp, humanoid

local function stopFly()
	if not flying then
		return
	end
	flying = false

	if bodyVelocity then
		bodyVelocity:Destroy()
	end
	if bodyGyro then
		bodyGyro:Destroy()
	end
	bodyVelocity, bodyGyro = nil, nil

	if humanoid and humanoid.Parent then
		humanoid.PlatformStand = false
	end
end

local function startFly()
	if flying or not hrp or not humanoid or humanoid.Health <= 0 then
		return
	end
	flying = true

	-- 关闭常规行走状态，避免人形物理和飞行速度互相打架
	humanoid.PlatformStand = true

	-- 提供飞行速度
	bodyVelocity = Instance.new("BodyVelocity")
	bodyVelocity.Name = "FlyVelocity"
	bodyVelocity.Velocity = Vector3.zero
	bodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
	bodyVelocity.Parent = hrp

	-- 让角色始终朝向摄像机视线方向，不会翻滚
	bodyGyro = Instance.new("BodyGyro")
	bodyGyro.Name = "FlyGyro"
	bodyGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
	bodyGyro.D = 10
	bodyGyro.P = 3000
	bodyGyro.CFrame = hrp.CFrame
	bodyGyro.Parent = hrp
end

-- 绑定当前角色；角色重生后自动重新绑定
local function bindCharacter(character)
	stopFly()
	hrp = character:WaitForChild("HumanoidRootPart")
	humanoid = character:WaitForChild("Humanoid")
	humanoid.Died:Connect(stopFly) -- 死亡时自动退出飞行
end

if player.Character then
	bindCharacter(player.Character)
end
player.CharacterAdded:Connect(bindCharacter)

-- 按键开关
UserInputService.InputBegan:Connect(function(input, isProcessed)
	if isProcessed then
		return
	end
	if input.KeyCode == TOGGLE_KEY then
		if flying then
			stopFly()
		else
			startFly()
		end
	end
end)

-- 每帧根据按键和摄像机方向计算飞行速度
RunService.RenderStepped:Connect(function()
	if not flying or not bodyVelocity or not bodyGyro or not hrp then
		return
	end

	local camera = workspace.CurrentCamera
	local direction = Vector3.zero

	if UserInputService:IsKeyDown(Enum.KeyCode.W) then
		direction += camera.CFrame.LookVector
	end
	if UserInputService:IsKeyDown(Enum.KeyCode.S) then
		direction -= camera.CFrame.LookVector
	end
	if UserInputService:IsKeyDown(Enum.KeyCode.A) then
		direction -= camera.CFrame.RightVector
	end
	if UserInputService:IsKeyDown(Enum.KeyCode.D) then
		direction += camera.CFrame.RightVector
	end
	if UserInputService:IsKeyDown(UP_KEY) then
		direction += Vector3.yAxis
	end
	if UserInputService:IsKeyDown(DOWN_KEY) then
		direction -= Vector3.yAxis
	end

	bodyVelocity.Velocity = if direction.Magnitude > 0 then direction.Unit * FLY_SPEED else Vector3.zero
	bodyGyro.CFrame = CFrame.new(hrp.Position, hrp.Position + camera.CFrame.LookVector)
end)
