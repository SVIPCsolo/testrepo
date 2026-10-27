-- Roblox 飞行脚本（手机触屏 + 电脑键盘）
-- 放置位置：StarterPlayer > StarterPlayerScripts 下新建 LocalScript，粘贴本文件内容
-- 手机：点顶部"飞行"按钮开关；下方摇杆控制前后左右；右侧"升/降"按钮控制高度
-- 电脑：F 开关；WASD 飞行；Space 上升；LeftCtrl 下降
-- 说明：仅作用于自己的角色，属于游戏开发用的能力脚本（需要该游戏允许）

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer

-- ===== 可调参数 =====
local FLY_SPEED = 60            -- 飞行速度（studs/秒）
local TOGGLE_KEY = Enum.KeyCode.F
local UP_KEY = Enum.KeyCode.Space
local DOWN_KEY = Enum.KeyCode.LeftControl

-- ===== 状态 =====
local flying = false
local bodyVelocity, bodyGyro
local hrp, humanoid

-- 触屏输入状态
local joystickVector = Vector2.zero
local upHeld, downHeld = false, false
local moveWidgets = {}
local toggleButton

local startFly, stopFly

-- ===== 触屏 UI =====
local function roundCorner(guiObject, radius)
	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, radius)
	corner.Parent = guiObject
	return corner
end

local function makeButton(text, size, position, textSize)
	local button = Instance.new("TextButton")
	button.Size = size
	button.Position = position
	button.AnchorPoint = Vector2.new(0.5, 0.5)
	button.BackgroundColor3 = Color3.fromRGB(30, 30, 36)
	button.BackgroundTransparency = 0.35
	button.TextColor3 = Color3.fromRGB(255, 255, 255)
	button.TextSize = textSize or 22
	button.Font = Enum.Font.GothamBold
	button.Text = text
	button.AutoButtonColor = false
	button.BorderSizePixel = 0
	roundCorner(button, math.floor(size.Y.Offset / 2))
	return button
end

-- 按住 / 松开时切换状态
local function bindHold(button, onChange)
	button.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.Touch
			or input.UserInputType == Enum.UserInputType.MouseButton1 then
			onChange(true)
		end
	end)
	button.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.Touch
			or input.UserInputType == Enum.UserInputType.MouseButton1 then
			onChange(false)
		end
	end)
end

local function refreshUI()
	if toggleButton then
		toggleButton.Text = flying and "飞行：开" or "飞行：关"
		toggleButton.BackgroundColor3 = flying and Color3.fromRGB(46, 160, 67)
			or Color3.fromRGB(30, 30, 36)
	end
	for _, widget in ipairs(moveWidgets) do
		widget.Visible = flying
	end
end

local function buildMobileUI()
	local gui = Instance.new("ScreenGui")
	gui.Name = "FlyScriptUI"
	gui.ResetOnSpawn = false
	gui.IgnoreGuiInset = true
	gui.DisplayOrder = 10
	gui.Parent = player:WaitForChild("PlayerGui")

	-- 开关按钮（顶部居中）
	toggleButton = makeButton("飞行：关", UDim2.fromOffset(150, 50), UDim2.fromScale(0.5, 0.1), 24)
	toggleButton.Parent = gui
	toggleButton.Activated:Connect(function()
		if flying then
			stopFly()
		else
			startFly()
		end
	end)

	-- 摇杆底座（屏幕下方，避开左手拇指摇杆区域和右下角跳跃键）
	local base = makeButton("", UDim2.fromOffset(170, 170), UDim2.fromScale(0.5, 0.73), 1)
	base.BackgroundTransparency = 0.55
	base.Text = ""
	base.Parent = gui

	-- 摇杆滑块
	local thumb = Instance.new("Frame")
	thumb.Size = UDim2.fromOffset(66, 66)
	thumb.AnchorPoint = Vector2.new(0.5, 0.5)
	thumb.Position = UDim2.fromScale(0.5, 0.5)
	thumb.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	thumb.BackgroundTransparency = 0.25
	thumb.BorderSizePixel = 0
	roundCorner(thumb, 33)
	thumb.Parent = base

	local MAX_DIST = 62        -- 摇杆最大拖动距离（像素）
	local dragging = false
	local dragStart, dragInput

	local function updateJoystick(position)
		local delta = Vector2.new(position.X - dragStart.X, position.Y - dragStart.Y)
		if delta.Magnitude > MAX_DIST then
			delta = delta.Unit * MAX_DIST
		end
		thumb.Position = UDim2.new(0.5, delta.X, 0.5, delta.Y)
		joystickVector = delta / MAX_DIST
	end

	local function endDrag()
		dragging = false
		dragStart, dragInput = nil, nil
		joystickVector = Vector2.zero
		thumb.Position = UDim2.fromScale(0.5, 0.5)
	end

	base.InputBegan:Connect(function(input)
		if input.UserInputType ~= Enum.UserInputType.Touch
			and input.UserInputType ~= Enum.UserInputType.MouseButton1 then
			return
		end
		if dragging then
			return
		end
		dragging = true
		dragInput = input
		dragStart = input.Position
		updateJoystick(input.Position)
	end)

	base.InputChanged:Connect(function(input)
		if dragging and input == dragInput then
			updateJoystick(input.Position)
		end
	end)

	base.InputEnded:Connect(function(input)
		if input == dragInput then
			endDrag()
		end
	end)

	-- 手指滑出底座后也能正常结束
	UserInputService.InputEnded:Connect(function(input)
		if input == dragInput then
			endDrag()
		end
	end)

	-- 升 / 降按钮（右侧，避开右下角跳跃键）
	local upButton = makeButton("升", UDim2.fromOffset(66, 66), UDim2.fromScale(0.87, 0.55), 26)
	upButton.Parent = gui
	bindHold(upButton, function(state)
		upHeld = state
	end)

	local downButton = makeButton("降", UDim2.fromOffset(66, 66), UDim2.fromScale(0.87, 0.67), 26)
	downButton.Parent = gui
	bindHold(downButton, function(state)
		downHeld = state
	end)

	moveWidgets = { base, upButton, downButton }
	refreshUI()
end

-- ===== 飞行逻辑 =====
stopFly = function()
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

	joystickVector = Vector2.zero
	upHeld, downHeld = false, false
	refreshUI()
end

startFly = function()
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

	refreshUI()
end

-- 绑定当前角色；角色重生后自动重新绑定
local function bindCharacter(character)
	stopFly()
	hrp = character:WaitForChild("HumanoidRootPart")
	humanoid = character:WaitForChild("Humanoid")
	humanoid.Died:Connect(stopFly) -- 死亡时自动退出飞行
end

if UserInputService.TouchEnabled then
	buildMobileUI()
end

if player.Character then
	bindCharacter(player.Character)
end
player.CharacterAdded:Connect(bindCharacter)

-- 键盘开关（电脑）
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

-- 每帧根据按键 / 摇杆 / 摄像机方向计算飞行速度
RunService.RenderStepped:Connect(function()
	if not flying or not bodyVelocity or not bodyGyro or not hrp then
		return
	end

	local camera = workspace.CurrentCamera
	local direction = Vector3.zero

	-- 键盘
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

	-- 触屏摇杆（水平方向，以摄像机为参考）
	if joystickVector.Magnitude > 0.15 then
		direction += camera.CFrame.RightVector * joystickVector.X
		direction += camera.CFrame.LookVector * -joystickVector.Y
	end

	-- 触屏升 / 降
	if upHeld then
		direction += Vector3.yAxis
	end
	if downHeld then
		direction -= Vector3.yAxis
	end

	if direction.Magnitude > 0.01 then
		bodyVelocity.Velocity = direction.Unit * FLY_SPEED
	else
		bodyVelocity.Velocity = Vector3.zero
	end

	bodyGyro.CFrame = CFrame.new(hrp.Position, hrp.Position + camera.CFrame.LookVector)
end)
