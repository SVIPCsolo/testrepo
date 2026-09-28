--[[
    Roblox Fly & ESP Script (Mobile + PC)
    Features: Flight (Thumbstick/WASD + On-screen up/down buttons), Player ESP
    UI: Orion Library
]]

local OrionUrls = {
    "https://raw.githubusercontent.com/jensonhirst/Orion/main/source",
    "https://raw.githubusercontent.com/shlexware/Orion/main/source"
}

local OrionLib
for _, url in ipairs(OrionUrls) do
    local ok, lib = pcall(function()
        return loadstring(game:HttpGet(url))()
    end)
    if ok and lib then
        OrionLib = lib
        break
    end
end

if not OrionLib then
    error("Failed to load Orion Library from all sources")
end
local Window = OrionLib:MakeWindow({Name = "Fly & ESP Hub", HidePremium = false, SaveConfig = true, ConfigFolder = "FlyESPHub"})

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local UserInputService = game:GetService("UserInputService")
local Camera = Workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- ========== Variables ==========
local Flying = false
local FlightSpeed = 50
local ESPEnabled = false
local ShowBoxes = true
local ShowNames = true
local ShowHealth = true
local ShowTracers = true
local TeamCheck = false
local ESPData = {}

-- ========== UI Tabs ==========
local FlightTab = Window:MakeTab({Name = "Flight", Icon = "rbxassetid://4483345998", PremiumOnly = false})
local ESPTab = Window:MakeTab({Name = "ESP", Icon = "rbxassetid://4483345998", PremiumOnly = false})
local SettingsTab = Window:MakeTab({Name = "Settings", Icon = "rbxassetid://4483345998", PremiumOnly = false})

-- ========== Flight UI ==========
local FlightSection = FlightTab:AddSection({Name = "Flight Controls"})

FlightSection:AddToggle({
    Name = "Enable Flight",
    Default = false,
    Callback = function(Value)
        Flying = Value
        if Flying then
            StartFlight()
        else
            StopFlight()
        end
    end
})

FlightSection:AddSlider({
    Name = "Flight Speed",
    Min = 10,
    Max = 300,
    Default = 50,
    Increment = 5,
    ValueName = "studs/s",
    Callback = function(Value)
        FlightSpeed = Value
    end
})

FlightSection:AddLabel("摇杆/WASD移动 | 屏幕按钮升降")

-- ========== ESP UI (Simplified) ==========
local ESPMainSection = ESPTab:AddSection({Name = "ESP"})

ESPMainSection:AddToggle({
    Name = "Enable ESP",
    Default = false,
    Callback = function(Value)
        ESPEnabled = Value
    end
})

ESPMainSection:AddToggle({
    Name = "Team Check (hide teammates)",
    Default = false,
    Callback = function(Value)
        TeamCheck = Value
    end
})

ESPMainSection:AddToggle({
    Name = "Boxes",
    Default = true,
    Callback = function(Value)
        ShowBoxes = Value
    end
})

ESPMainSection:AddToggle({
    Name = "Names",
    Default = true,
    Callback = function(Value)
        ShowNames = Value
    end
})

ESPMainSection:AddToggle({
    Name = "Health Bar",
    Default = true,
    Callback = function(Value)
        ShowHealth = Value
    end
})

ESPMainSection:AddToggle({
    Name = "Tracers",
    Default = true,
    Callback = function(Value)
        ShowTracers = Value
    end
})

ESPMainSection:AddLabel("Tap here and swipe up/down to scroll")

-- ========== Settings UI ==========
local SettingsSection = SettingsTab:AddSection({Name = "Configuration"})

SettingsSection:AddButton({
    Name = "Destroy UI",
    Callback = function()
        OrionLib:Destroy()
        Flying = false
        ESPEnabled = false
        ClearESP()
        StopFlight()
    end
})

-- ========== Mobile Flight Buttons ==========
local FlyGui = Instance.new("ScreenGui")
FlyGui.Name = "FlyControlGui"
FlyGui.ResetOnSpawn = false
FlyGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
FlyGui.Parent = PlayerGui

local function CreateFlyButton(name, text, posX, posY)
    local btn = Instance.new("TextButton")
    btn.Name = name
    btn.Size = UDim2.new(0, 60, 0, 60)
    btn.Position = UDim2.new(posX, 0, posY, 0)
    btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    btn.BackgroundTransparency = 0.3
    btn.Text = text
    btn.TextSize = 28
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.SourceSansBold
    btn.Visible = false
    btn.AutoButtonColor = false

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 12)
    corner.Parent = btn

    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(100, 100, 100)
    stroke.Thickness = 2
    stroke.Parent = btn

    btn.Parent = FlyGui
    return btn
end

local UpButton = CreateFlyButton("UpButton", "▲", 0.82, 0.55)
local DownButton = CreateFlyButton("DownButton", "▼", 0.82, 0.70)

local function SetupButtonHold(btn)
    local pressing = false
    btn.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
            pressing = true
            btn.BackgroundColor3 = Color3.fromRGB(60, 120, 255)
        end
    end)
    btn.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
            pressing = false
            btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        end
    end)
    return function() return pressing end
end

local GetUpState = SetupButtonHold(UpButton)
local GetDownState = SetupButtonHold(DownButton)

-- ========== Flight Logic ==========
local FlightConnection
local bodyGyro, bodyVelocity

function StartFlight()
    local Character = LocalPlayer.Character
    if not Character then return end
    local Humanoid = Character:FindFirstChildOfClass("Humanoid")
    local HRP = Character:FindFirstChild("HumanoidRootPart")
    if not Humanoid or not HRP then return end

    Humanoid.PlatformStand = true

    bodyGyro = Instance.new("BodyGyro")
    bodyGyro.P = 9e4
    bodyGyro.MaxTorque = Vector3.new(9e4, 9e4, 9e4)
    bodyGyro.CFrame = HRP.CFrame
    bodyGyro.Parent = HRP

    bodyVelocity = Instance.new("BodyVelocity")
    bodyVelocity.MaxForce = Vector3.new(9e4, 9e4, 9e4)
    bodyVelocity.Velocity = Vector3.new(0, 0, 0)
    bodyVelocity.Parent = HRP

    UpButton.Visible = true
    DownButton.Visible = true

    FlightConnection = RunService.RenderStepped:Connect(function()
        if not Flying or not HRP or not bodyVelocity or not bodyGyro then
            StopFlight()
            return
        end

        local CameraCFrame = Camera.CFrame
        bodyGyro.CFrame = CameraCFrame

        local MoveDirection = Vector3.new(0, 0, 0)

        local char = LocalPlayer.Character
        local hum = char and char:FindFirstChildOfClass("Humanoid")
        if hum then
            local md = hum.MoveDirection
            if md.Magnitude > 0.1 then
                MoveDirection = md
            end
        end

        if UserInputService:IsKeyDown(Enum.KeyCode.Space) or GetUpState() then
            MoveDirection = MoveDirection + Vector3.new(0, 1, 0)
        end

        if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) or UserInputService:IsKeyDown(Enum.KeyCode.RightShift) or GetDownState() then
            MoveDirection = MoveDirection - Vector3.new(0, 1, 0)
        end

        if MoveDirection.Magnitude > 0 then
            MoveDirection = MoveDirection.Unit
        end

        bodyVelocity.Velocity = MoveDirection * FlightSpeed
    end)
end

function StopFlight()
    if FlightConnection then
        FlightConnection:Disconnect()
        FlightConnection = nil
    end
    if bodyGyro then
        bodyGyro:Destroy()
        bodyGyro = nil
    end
    if bodyVelocity then
        bodyVelocity:Destroy()
        bodyVelocity = nil
    end
    UpButton.Visible = false
    DownButton.Visible = false
    local Character = LocalPlayer.Character
    if Character then
        local Humanoid = Character:FindFirstChildOfClass("Humanoid")
        if Humanoid then
            Humanoid.PlatformStand = false
        end
    end
end

LocalPlayer.CharacterAdded:Connect(function()
    if Flying then
        task.wait(1)
        StartFlight()
    end
end)

-- ========== ESP Logic (with pcall protection) ==========
local DrawingAvailable = pcall(function() return Drawing.new("Square") end)
if DrawingAvailable then
    -- cleanup test object
    local test = Drawing.new("Square")
    test:Remove()
end

function CreateESP(Player)
    if not DrawingAvailable then return end
    local ok, Data = pcall(function()
        return {
            Box = Drawing.new("Square"),
            Name = Drawing.new("Text"),
            HealthBar = Drawing.new("Square"),
            HealthBarBG = Drawing.new("Square"),
            Tracer = Drawing.new("Line")
        }
    end)
    if not ok then return end

    Data.Box.Visible = false
    Data.Box.Thickness = 1
    Data.Box.Filled = false

    Data.Name.Visible = false
    Data.Name.Size = 13
    Data.Name.Center = true
    Data.Name.Outline = true
    Data.Name.Font = 2

    Data.HealthBar.Visible = false
    Data.HealthBar.Thickness = 1
    Data.HealthBar.Filled = true

    Data.HealthBarBG.Visible = false
    Data.HealthBarBG.Thickness = 1
    Data.HealthBarBG.Filled = true
    Data.HealthBarBG.Color = Color3.fromRGB(0, 0, 0)

    Data.Tracer.Visible = false
    Data.Tracer.Thickness = 1

    ESPData[Player] = Data
end

function RemoveESP(Player)
    local Data = ESPData[Player]
    if Data then
        pcall(function()
            for _, DrawingObj in pairs(Data) do
                DrawingObj:Remove()
            end
        end)
        ESPData[Player] = nil
    end
end

function ClearESP()
    for Player, _ in pairs(ESPData) do
        RemoveESP(Player)
    end
end

if DrawingAvailable then
    for _, Player in ipairs(Players:GetPlayers()) do
        if Player ~= LocalPlayer then
            CreateESP(Player)
        end
    end
end

Players.PlayerAdded:Connect(function(Player)
    CreateESP(Player)
end)

Players.PlayerRemoving:Connect(function(Player)
    RemoveESP(Player)
end)

RunService.RenderStepped:Connect(function()
    if not ESPEnabled or not DrawingAvailable then
        for _, Data in pairs(ESPData) do
            pcall(function()
                Data.Box.Visible = false
                Data.Name.Visible = false
                Data.HealthBar.Visible = false
                Data.HealthBarBG.Visible = false
                Data.Tracer.Visible = false
            end)
        end
        return
    end

    local CameraPos = Camera.CFrame.Position

    for Player, Data in pairs(ESPData) do
        local Character = Player.Character
        if not Character then
            pcall(function()
                Data.Box.Visible = false
                Data.Name.Visible = false
                Data.HealthBar.Visible = false
                Data.HealthBarBG.Visible = false
                Data.Tracer.Visible = false
            end)
            continue
        end

        local Humanoid = Character:FindFirstChildOfClass("Humanoid")
        local HRP = Character:FindFirstChild("HumanoidRootPart")
        local Head = Character:FindFirstChild("Head")

        if not Humanoid or not HRP or not Head then
            pcall(function()
                Data.Box.Visible = false
                Data.Name.Visible = false
                Data.HealthBar.Visible = false
                Data.HealthBarBG.Visible = false
                Data.Tracer.Visible = false
            end)
            continue
        end

        if TeamCheck and Player.Team and LocalPlayer.Team and Player.Team == LocalPlayer.Team then
            pcall(function()
                Data.Box.Visible = false
                Data.Name.Visible = false
                Data.HealthBar.Visible = false
                Data.HealthBarBG.Visible = false
                Data.Tracer.Visible = false
            end)
            continue
        end

        local HRPPos, OnScreen = Camera:WorldToViewportPoint(HRP.Position)
        if not OnScreen then
            pcall(function()
                Data.Box.Visible = false
                Data.Name.Visible = false
                Data.HealthBar.Visible = false
                Data.HealthBarBG.Visible = false
                Data.Tracer.Visible = false
            end)
            continue
        end

        local HeadPos = Camera:WorldToViewportPoint(Head.Position + Vector3.new(0, 0.5, 0))
        local LegPos = Camera:WorldToViewportPoint(HRP.Position - Vector3.new(0, 3, 0))

        local BoxHeight = math.abs(HeadPos.Y - LegPos.Y)
        local BoxWidth = BoxHeight * 0.6

        local BoxX = HRPPos.X - BoxWidth / 2
        local BoxY = HeadPos.Y

        pcall(function()
            if ShowBoxes then
                Data.Box.Visible = true
                Data.Box.Color = Color3.fromRGB(255, 255, 255)
                Data.Box.Size = Vector2.new(BoxWidth, BoxHeight)
                Data.Box.Position = Vector2.new(BoxX, BoxY)
            else
                Data.Box.Visible = false
            end

            if ShowNames then
                Data.Name.Visible = true
                Data.Name.Text = Player.Name
                Data.Name.Color = Color3.fromRGB(255, 255, 255)
                Data.Name.Position = Vector2.new(HRPPos.X, BoxY - 16)
            else
                Data.Name.Visible = false
            end

            if ShowHealth then
                local Health = Humanoid.Health
                local MaxHealth = Humanoid.MaxHealth
                local HealthPercent = math.clamp(Health / MaxHealth, 0, 1)

                Data.HealthBarBG.Visible = true
                Data.HealthBarBG.Size = Vector2.new(2, BoxHeight)
                Data.HealthBarBG.Position = Vector2.new(BoxX - 4, BoxY)

                Data.HealthBar.Visible = true
                Data.HealthBar.Size = Vector2.new(2, BoxHeight * HealthPercent)
                Data.HealthBar.Position = Vector2.new(BoxX - 4, BoxY + BoxHeight * (1 - HealthPercent))

                if HealthPercent > 0.5 then
                    Data.HealthBar.Color = Color3.fromRGB(0, 255, 0)
                elseif HealthPercent > 0.25 then
                    Data.HealthBar.Color = Color3.fromRGB(255, 255, 0)
                else
                    Data.HealthBar.Color = Color3.fromRGB(255, 0, 0)
                end
            else
                Data.HealthBar.Visible = false
                Data.HealthBarBG.Visible = false
            end

            if ShowTracers then
                Data.Tracer.Visible = true
                Data.Tracer.Color = Color3.fromRGB(255, 255, 255)
                Data.Tracer.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y)
                Data.Tracer.To = Vector2.new(HRPPos.X, HRPPos.Y)
            else
                Data.Tracer.Visible = false
            end
        end)
    end
end)

OrionLib:Init()
