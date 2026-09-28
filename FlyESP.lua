--[[
    Roblox Fly & ESP Script
    Features: Flight (WASD + Space/Shift), Player ESP (Box, Name, Health, Distance, Tracer)
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

-- ========== Variables ==========
local Flying = false
local FlightSpeed = 50
local ESPEnabled = false
local ShowBoxes = true
local ShowNames = true
local ShowHealth = true
local ShowDistance = true
local ShowTracers = true
local TracerOrigin = "Bottom"
local BoxColor = Color3.fromRGB(255, 255, 255)
local NameColor = Color3.fromRGB(255, 255, 255)
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

FlightSection:AddLabel("Controls: WASD | Space=Up | Shift=Down")

-- ========== ESP UI ==========
local ESPMainSection = ESPTab:AddSection({Name = "Main"})

ESPMainSection:AddToggle({
    Name = "Enable ESP",
    Default = false,
    Callback = function(Value)
        ESPEnabled = Value
        if not ESPEnabled then
            ClearESP()
        end
    end
})

ESPMainSection:AddToggle({
    Name = "Team Check",
    Default = false,
    Callback = function(Value)
        TeamCheck = Value
    end
})

local ESPVisualSection = ESPTab:AddSection({Name = "Visuals"})

ESPVisualSection:AddToggle({
    Name = "Boxes",
    Default = true,
    Callback = function(Value)
        ShowBoxes = Value
    end
})

ESPVisualSection:AddToggle({
    Name = "Names",
    Default = true,
    Callback = function(Value)
        ShowNames = Value
    end
})

ESPVisualSection:AddToggle({
    Name = "Health Bar",
    Default = true,
    Callback = function(Value)
        ShowHealth = Value
    end
})

ESPVisualSection:AddToggle({
    Name = "Distance",
    Default = true,
    Callback = function(Value)
        ShowDistance = Value
    end
})

ESPVisualSection:AddToggle({
    Name = "Tracers",
    Default = true,
    Callback = function(Value)
        ShowTracers = Value
    end
})

ESPVisualSection:AddDropdown({
    Name = "Tracer Origin",
    Default = "Bottom",
    Options = {"Top", "Bottom", "Center"},
    Callback = function(Value)
        TracerOrigin = Value
    end
})

local ESPColorSection = ESPTab:AddSection({Name = "Colors"})

ESPColorSection:AddColorpicker({
    Name = "Box Color",
    Default = Color3.fromRGB(255, 255, 255),
    Callback = function(Value)
        BoxColor = Value
    end
})

ESPColorSection:AddColorpicker({
    Name = "Name Color",
    Default = Color3.fromRGB(255, 255, 255),
    Callback = function(Value)
        NameColor = Value
    end
})

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

    FlightConnection = RunService.RenderStepped:Connect(function()
        if not Flying or not HRP or not bodyVelocity or not bodyGyro then
            StopFlight()
            return
        end

        local CameraCFrame = Camera.CFrame
        bodyGyro.CFrame = CameraCFrame

        local MoveDirection = Vector3.new(0, 0, 0)

        if UserInputService:IsKeyDown(Enum.KeyCode.W) then
            MoveDirection = MoveDirection + CameraCFrame.LookVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then
            MoveDirection = MoveDirection - CameraCFrame.LookVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then
            MoveDirection = MoveDirection - CameraCFrame.RightVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then
            MoveDirection = MoveDirection + CameraCFrame.RightVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
            MoveDirection = MoveDirection + Vector3.new(0, 1, 0)
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) or UserInputService:IsKeyDown(Enum.KeyCode.RightShift) then
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

-- ========== ESP Logic ==========
function CreateESP(Player)
    local Data = {
        Box = Drawing.new("Square"),
        Name = Drawing.new("Text"),
        HealthBar = Drawing.new("Square"),
        HealthBarBG = Drawing.new("Square"),
        Distance = Drawing.new("Text"),
        Tracer = Drawing.new("Line")
    }

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

    Data.Distance.Visible = false
    Data.Distance.Size = 12
    Data.Distance.Center = true
    Data.Distance.Outline = true
    Data.Distance.Font = 2

    Data.Tracer.Visible = false
    Data.Tracer.Thickness = 1

    ESPData[Player] = Data
end

function RemoveESP(Player)
    local Data = ESPData[Player]
    if Data then
        for _, DrawingObj in pairs(Data) do
            DrawingObj:Remove()
        end
        ESPData[Player] = nil
    end
end

function ClearESP()
    for Player, _ in pairs(ESPData) do
        RemoveESP(Player)
    end
end

for _, Player in ipairs(Players:GetPlayers()) do
    if Player ~= LocalPlayer then
        CreateESP(Player)
    end
end

Players.PlayerAdded:Connect(function(Player)
    CreateESP(Player)
end)

Players.PlayerRemoving:Connect(function(Player)
    RemoveESP(Player)
end)

function GetTeamColor(Player)
    if Player.Team then
        return Player.Team.TeamColor.Color
    end
    return Color3.fromRGB(255, 255, 255)
end

RunService.RenderStepped:Connect(function()
    if not ESPEnabled then
        for _, Data in pairs(ESPData) do
            Data.Box.Visible = false
            Data.Name.Visible = false
            Data.HealthBar.Visible = false
            Data.HealthBarBG.Visible = false
            Data.Distance.Visible = false
            Data.Tracer.Visible = false
        end
        return
    end

    local CameraPos = Camera.CFrame.Position

    for Player, Data in pairs(ESPData) do
        local Character = Player.Character
        if not Character then
            Data.Box.Visible = false
            Data.Name.Visible = false
            Data.HealthBar.Visible = false
            Data.HealthBarBG.Visible = false
            Data.Distance.Visible = false
            Data.Tracer.Visible = false
            continue
        end

        local Humanoid = Character:FindFirstChildOfClass("Humanoid")
        local HRP = Character:FindFirstChild("HumanoidRootPart")
        local Head = Character:FindFirstChild("Head")

        if not Humanoid or not HRP or not Head then
            Data.Box.Visible = false
            Data.Name.Visible = false
            Data.HealthBar.Visible = false
            Data.HealthBarBG.Visible = false
            Data.Distance.Visible = false
            Data.Tracer.Visible = false
            continue
        end

        if TeamCheck and Player.Team == LocalPlayer.Team then
            Data.Box.Visible = false
            Data.Name.Visible = false
            Data.HealthBar.Visible = false
            Data.HealthBarBG.Visible = false
            Data.Distance.Visible = false
            Data.Tracer.Visible = false
            continue
        end

        local HRPPos, OnScreen = Camera:WorldToViewportPoint(HRP.Position)
        if not OnScreen then
            Data.Box.Visible = false
            Data.Name.Visible = false
            Data.HealthBar.Visible = false
            Data.HealthBarBG.Visible = false
            Data.Distance.Visible = false
            Data.Tracer.Visible = false
            continue
        end

        local HeadPos = Camera:WorldToViewportPoint(Head.Position + Vector3.new(0, 0.5, 0))
        local LegPos = Camera:WorldToViewportPoint(HRP.Position - Vector3.new(0, 3, 0))

        local BoxHeight = math.abs(HeadPos.Y - LegPos.Y)
        local BoxWidth = BoxHeight * 0.6

        local BoxX = HRPPos.X - BoxWidth / 2
        local BoxY = HeadPos.Y

        local TeamColor = GetTeamColor(Player)

        -- Box
        if ShowBoxes then
            Data.Box.Visible = true
            Data.Box.Color = BoxColor
            Data.Box.Size = Vector2.new(BoxWidth, BoxHeight)
            Data.Box.Position = Vector2.new(BoxX, BoxY)
        else
            Data.Box.Visible = false
        end

        -- Name
        if ShowNames then
            Data.Name.Visible = true
            Data.Name.Text = Player.Name
            Data.Name.Color = NameColor
            Data.Name.Position = Vector2.new(HRPPos.X, BoxY - 16)
        else
            Data.Name.Visible = false
        end

        -- Health
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

        -- Distance
        if ShowDistance then
            local Dist = (CameraPos - HRP.Position).Magnitude
            Data.Distance.Visible = true
            Data.Distance.Text = string.format("%d studs", math.floor(Dist))
            Data.Distance.Color = Color3.fromRGB(200, 200, 200)
            Data.Distance.Position = Vector2.new(HRPPos.X, BoxY + BoxHeight + 2)
        else
            Data.Distance.Visible = false
        end

        -- Tracer
        if ShowTracers then
            Data.Tracer.Visible = true
            Data.Tracer.Color = BoxColor

            local Origin
            if TracerOrigin == "Top" then
                Origin = Vector2.new(Camera.ViewportSize.X / 2, 0)
            elseif TracerOrigin == "Bottom" then
                Origin = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y)
            else
                Origin = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
            end

            Data.Tracer.From = Origin
            Data.Tracer.To = Vector2.new(HRPPos.X, HRPPos.Y)
        else
            Data.Tracer.Visible = false
        end
    end
end)

OrionLib:Init()
