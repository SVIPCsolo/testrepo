myconfigs = {
  "zzzzosky#1",
  "TeTraXDev",
  "zzzzzosky"
}
getgenv().setColor = Color3.fromRGB(252, 3, 90)
if setfpscap then
  setfpscap(900)
end
getgenv().Antifog = true
local r0_0 = loadstring(game:HttpGet("https://raw.githubusercontent.com/ieufhosivdlkjv/TSSECURITY/refs/heads/main/Configs"))()
local r1_0 = loadstring(game:HttpGet("https://raw.githubusercontent.com/ieufhosivdlkjv/hexagons/refs/heads/main/Module.lua"))()
local r2_0 = loadstring(game:HttpGet("https://raw.githubusercontent.com/ieufhosivdlkjv/hexagons/refs/heads/main/Conn.Lua"))()
local r3_0 = game:GetService("TeleportService")
local r4_0 = game:GetService("HttpService")
local function r5_0()
  local r0_3 = game:GetService("Players")
  local r1_3 = r0_3.LocalPlayer
  local r2_3 = r1_3.Name
  local r3_3 = r1_3.UserId
  local r4_3 = r1_3.Character
  local r5_3 = r4_3:WaitForChild("Humanoid")
  local r6_3 = r4_3:WaitForChild("HumanoidRootPart")
  local r7_3 = game:GetService("RunService")
  local r8_3 = game:GetService("UserInputService")
  local r9_3 = game:GetService("TeleportService")
  local r10_3 = game:GetService("Workspace").CurrentCamera
  rands = {
    "Head",
    "HumanoidRootPart"
  }
  local r11_3 = {}
  local r12_3 = {}
  local r13_3 = {}
  local r14_3 = loadstring(game:HttpGet("https://raw.githubusercontent.com/TTX-OnTop/CPEnjoyer/refs/heads/main/Settings"))()
  local r15_3 = loadstring(game:HttpGet("https://raw.githubusercontent.com/TTX-OnTop/CPEnjoyer/refs/heads/main/BanCheck"))()
  local r16_3 = loadstring(game:HttpGet("https://pastebin.com/raw/11VPXFx4"))()
  local r17_3 = {}
  function GetEquippedName()
    item = require(game:GetService("ReplicatedStorage").devv.client.Objects.v3item)
    pcall(function()
      l = item.inventory.getEquippedItem().name
      tt = tostring(l)
    end)
    return tt
  end
  function projectileHit(r0_167)
    if game:GetService("ReplicatedStorage").devv.remoteStorage:FindFirstChild("projectileHit") then
      game:GetService("ReplicatedStorage").devv.remoteStorage.projectileHit:FireServer(unpack(r0_167))
    end
  end
  function flameHit(r0_164)
    if game:GetService("ReplicatedStorage").devv.remoteStorage:FindFirstChild("flameHit") then
      game:GetService("ReplicatedStorage").devv.remoteStorage:FindFirstChild("flameHit"):FireServer(unpack(r0_164))
    end
  end
  function acidHit(r0_139)
    if game:GetService("ReplicatedStorage").devv.remoteStorage:FindFirstChild("acidHit") then
      game:GetService("ReplicatedStorage").devv.remoteStorage:FindFirstChild("acidHit"):FireServer(unpack(r0_139))
    end
  end
  function meleeItemHit(r0_264)
    if game:GetService("ReplicatedStorage").devv.remoteStorage:FindFirstChild("meleeItemHit") then
      game:GetService("ReplicatedStorage").devv.remoteStorage:FindFirstChild("meleeItemHit"):FireServer(unpack(r0_264))
    end
  end
  function GetEquipped()
    item = require(game:GetService("ReplicatedStorage").devv.client.Objects.v3item)
    pcall(function()
      l = item.inventory.getEquippedItem().guid
      tt = tostring(l)
    end)
    return tt
  end
  function loadFunc(r0_78, r1_78, r2_78)
    l = require(game:GetService("ReplicatedStorage").devv).load
    l_LocalPlayer_0 = game:GetService("Players")[r0_78]
    v5 = l("ClientReplicator")
    v4 = l("FFCChain")
    warn("[TeTraX] Ohio Loader Activated!")
    v5.Set(l_LocalPlayer_0, r1_78, r2_78)
    v5.Replicate(r1_78)
    print(v5.Get(l_LocalPlayer_0, r1_78))
  end
  function allJewelryCases()
    alljewls = {}
    jewelryloc = game:GetService("Workspace").GemRobbery.JewelryCases
    for r3_230, r4_230 in pairs(jewelryloc.LowYieldSpawns:GetChildren()) do
      table.insert(alljewls, r4_230)
    end
    for r3_230, r4_230 in pairs(jewelryloc.HighYieldSpawns:GetChildren()) do
      table.insert(alljewls, r4_230)
    end
    return alljewls
  end
  function getVehicles()
    vehs = {}
    for r3_232, r4_232 in pairs(workspace.Game.Vehicles:GetChildren()) do
      table.insert(vehs, r4_232)
    end
    return vehs
  end
  local r18_3 = nil
  r18_3 = hookmetamethod(game, "__namecall", function(r0_128, ...)
    local r2_128 = {
      ...
    }
    local r3_128 = getnamecallmethod()
    if getgenv().autofist == true and r3_128 == "FireServer" and r0_128.Name == "equip" then
      return "Fists"
    end
    return r18_3(r0_128, unpack(r2_128))
  end)
  function changeColor()
    color3func = getgenv().setColor or r16_3.setColorfunc()
    game:GetService("Lighting").Atmosphere.Color = color3func
  end
  changeColor()
  function activateColor()
    game:GetService("Lighting").Atmosphere:GetPropertyChangedSignal("Color"):Connect(changeColor)
  end
  activateColor()
  function antifogger()
    if game:GetService("Lighting").Atmosphere.Density > 0 then
      game:GetService("Lighting").Atmosphere.Density = 0
    end
  end
  antifogger()
  function activateAntiFog()
    game:GetService("Lighting").Atmosphere:GetPropertyChangedSignal("Density"):Connect(antifogger)
  end
  activateAntiFog()
  function getTreasure()
    tresleft = {}
    treasure = workspace.Game.Local.Debris
    for r3_79, r4_79 in pairs(treasure:GetChildren()) do
      if r4_79.Name == "TreasureMarker" then
        table.insert(tresleft, r4_79)
      end
    end
    return tresleft
  end
  function chatSpy()
    enabled = true
    spyOnMyself = true
    public = false
    publicItalics = true
    privateProperties = {
      Color = Color3.fromRGB(0, 255, 255),
      Font = Enum.Font.SourceSansBold,
      TextSize = 18,
    }
    StarterGui = game:GetService("StarterGui")
    Players = game:GetService("Players")
    player = Players.LocalPlayer or Players:GetPropertyChangedSignal("LocalPlayer"):Wait() or Players.LocalPlayer
    saymsg = game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest")
    getmsg = game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("OnMessageDoneFiltering")
    instance = (getgenv().chatSpyInstance or 0) + 1
    getgenv().chatSpyInstance = instance
    function onChatted(r0_252, r1_252)
      if getgenv().chatSpyInstance == instance then
        if r0_252 == player and r1_252:lower():sub(1, 4) == "/spy" then
          enabled = not enabled
          wait(0.3)
          local r2_252 = privateProperties
          local r3_252 = "{SPY "
          local r4_252 = enabled
          if r4_252 then
            r4_252 = "EN" or "DIS"
          else
          end
          r2_252.Text = r3_252 .. r4_252 .. "ABLED}"
          StarterGui:SetCore("ChatMakeSystemMessage", privateProperties)
        elseif enabled and (spyOnMyself == true or r0_252 ~= player) then
          r1_252 = r1_252:gsub("[\n\r]", ""):gsub("\t", " "):gsub("[ ]+", " ")
          hidden = true
          conn = getmsg.OnClientEvent:Connect(function(r0_253, r1_253)
            if r0_253.SpeakerUserId == r0_252.UserId and r0_253.Message == r1_252:sub(#r1_252 - #r0_253.Message + 1) and (r1_253 == "All" or r1_253 == "Team" and public == false and Players[r0_253.FromSpeaker].Team == player.Team) then
              hidden = false
            end
          end)
          wait(1)
          conn:Disconnect()
          if hidden and enabled then
            if public then
              local r2_252 = saymsg
              local r4_252 = publicItalics
              if r4_252 then
                r4_252 = "/me " or ""
              else
              end
              r2_252:FireServer(r4_252 .. "{SPY} [" .. r0_252.Name .. "]: " .. r1_252, "All")
            else
              privateProperties.Text = "{SPY} [" .. r0_252.Name .. "]: " .. r1_252
              StarterGui:SetCore("ChatMakeSystemMessage", privateProperties)
            end
          end
        end
      end
    end
    for r3_249, r4_249 in ipairs(Players:GetPlayers()) do
      r4_249.Chatted:Connect(function(r0_254)
        onChatted(r4_249, r0_254)
      end)
      -- close: r3_249
    end
    Players.PlayerAdded:Connect(function(r0_250)
      r0_250.Chatted:Connect(function(r0_251)
        onChatted(r0_250, r0_251)
      end)
    end)
    local r0_249 = privateProperties
    local r1_249 = "{TeTraXChatSPY "
    local r2_249 = enabled
    if r2_249 then
      r2_249 = "EN" or "DIS"
    else
    end
    r0_249.Text = r1_249 .. r2_249 .. "ABLED}"
    StarterGui:SetCore("ChatMakeSystemMessage", privateProperties)
    if not player.PlayerGui:FindFirstChild("Chat") then
      wait(3)
    end
    chatFrame = player.PlayerGui.Chat.Frame
    chatFrame.ChatChannelParentFrame.Visible = true
    local r3_249 = UDim.new()
    local r4_249 = chatFrame
    r4_249 = r4_249.ChatChannelParentFrame
    r4_249 = r4_249.Size
    r4_249 = r4_249.Y
    chatFrame.ChatBarParentFrame.Position = chatFrame.ChatChannelParentFrame.Position + UDim2.new(r3_249, r4_249)
  end
  chatSpy()
  function getJewelryGUIDALL()
    aljewelry = {
      "Dark Matter Gem",
      "Void Gem",
      "Diamond Ring",
      "Diamond",
      "Rollie",
      "Gold Crown",
      "Gold Cup",
      "Emerald",
      "Emerald Ring",
      "Gold Bar",
      "Amethyst",
      "Amethyst Ring",
      "Topaz",
      "Topaz Ring",
      "Sapphire Ring",
      "Sapphire",
      "Ruby",
      "Ruby Ring",
      "Watch",
      nil
    }
    jewelrycases = allJewelryCases()
    guidjca = {}
    for r3_129, r4_129 in pairs(jewelrycases) do
      local r5_129 = pairs
      local r6_129 = aljewelry
      for r8_129, r9_129 in r5_129(r6_129) do
        local r10_129 = r4_129.PrimaryPart
        if r10_129 then
          local r11_129 = r4_129.PrimaryPart.Position
          dis = (r6_3.Position - r11_129).magnitude
          r10_129 = dis
          if r10_129 <= 11 then
            table.insert(guidjca, r4_129:GetAttribute("guid"))
          end
        end
      end
    end
    return guidjca
  end
  function getJewelryGUID()
    jewelry = {
      "Dark Matter Gem",
      "Void Gem",
      "Diamond Ring",
      "Diamond",
      "Rollie",
      "Gold Crown",
      "Gold Cup"
    }
    jewelrycases = allJewelryCases()
    guidj = {}
    for r3_184, r4_184 in pairs(jewelrycases) do
      local r5_184 = pairs
      local r6_184 = jewelry
      for r8_184, r9_184 in r5_184(r6_184) do
        if r4_184.PrimaryPart then
          dis = (r6_3.Position - r4_184.PrimaryPart.Position).magnitude
          if dis <= 10 then
            table.insert(guidj, r4_184:GetAttribute("guid"))
          end
        end
      end
    end
    return guidj
  end
  function equip(r0_105)
    if game:GetService("ReplicatedStorage").devv.remoteStorage:FindFirstChild("equip") then
      game:GetService("ReplicatedStorage").devv.remoteStorage:FindFirstChild("equip"):FireServer(r0_105)
    end
  end
  function buyItem(r0_160)
    if game:GetService("ReplicatedStorage").devv.remoteStorage:FindFirstChild("attemptPurchase") then
      game:GetService("ReplicatedStorage").devv.remoteStorage:FindFirstChild("attemptPurchase"):InvokeServer(r0_160)
    end
  end
  function attemptCall(r0_27)
    if game:GetService("ReplicatedStorage").devv.remoteStorage:FindFirstChild("attemptCall") then
      reqload = require(game:GetService("ReplicatedStorage").devv).load
      loader = reqload("Signal")
      value, callid = loader.InvokeServer("attemptCall", r0_27.UserId)
      loader.FireServer("sendPhoneAction", callid, "hangup")
    end
  end
  function buyAmmo(r0_189)
    if game:GetService("ReplicatedStorage").devv.remoteStorage:FindFirstChild("attemptPurchaseAmmo") then
      game:GetService("ReplicatedStorage").devv.remoteStorage:FindFirstChild("attemptPurchaseAmmo"):InvokeServer(r0_189)
    end
  end
  function Reload(r0_55)
    if game:GetService("ReplicatedStorage").devv.remoteStorage:FindFirstChild("reload") then
      game:GetService("ReplicatedStorage").devv.remoteStorage:FindFirstChild("reload"):FireServer(r0_55)
    end
  end
  function sellitem(r0_231)
    if game:GetService("ReplicatedStorage").devv.remoteStorage:FindFirstChild("sellItem") then
      game:GetService("ReplicatedStorage").devv.remoteStorage.sellItem:FireServer(r0_231)
    end
  end
  function sellallitems()
    gg = require(game:GetService("ReplicatedStorage").devv.client.Objects.v3item)
    for r3_158, r4_158 in next, gg.inventory.ordered, nil do
      sellitem(r4_158)
    end
  end
  function pepperSprayHit(r0_98)
    if game:GetService("ReplicatedStorage").devv.remoteStorage:FindFirstChild("pepperSprayHit") then
      game:GetService("ReplicatedStorage").devv.remoteStorage.pepperSprayHit:FireServer(unpack(r0_98))
    end
  end
  function replicateProjectiles(r0_261)
    if game:GetService("ReplicatedStorage").devv.remoteStorage:FindFirstChild("replicateProjectiles") then
      game:GetService("ReplicatedStorage").devv.remoteStorage.replicateProjectiles:FireServer(unpack(r0_261))
    end
  end
  function rocketHit(r0_15)
    if game:GetService("ReplicatedStorage").devv.remoteStorage:FindFirstChild("rocketHit") then
      game:GetService("ReplicatedStorage").devv.remoteStorage.rocketHit:FireServer(unpack(r0_15))
    end
  end
  function Stomp(r0_190)
    if game:GetService("ReplicatedStorage").devv.remoteStorage:FindFirstChild("stomp") then
      game:GetService("ReplicatedStorage").devv.remoteStorage.stomp:FireServer(unpack(r0_190))
    end
  end
  function grabfunc(r0_171)
    game:GetService("ReplicatedStorage").devv.remoteStorage[tostring(getupvalue(require(game:GetService("ReplicatedStorage").devv.client.Helpers.remotes.Signal).FireServer, 1).grabPlayer)]:FireServer(unpack({
      [1] = r0_171,
    }))
  end
  function getPlayerEquipped()
    pcall(function()
      v3Items = require(game:GetService("ReplicatedStorage").devv.client.Objects.v3item)
      ggg = getupvalues(v3Items.inventory.setEquipped)[7].equipped
    end)
    return ggg
  end
  function killfunc(r0_152)
    getfriend = getFriends()
    if r0_152.Character and not r0_152.Character:FindFirstChild("ForceField") and r0_152.Character:FindFirstChild("HumanoidRootPart") and r0_152.Character:FindFirstChild("Humanoid") then
      vname = r0_152.Name
      vuserid = r0_152.UserId
      vhumrootpart = r0_152.Character.HumanoidRootPart
      vhumanoid = r0_152.Character.Humanoid
      dis = (r6_3.Position - vhumrootpart.Position).magnitude
      if dis <= 25 and vname ~= r2_3 and getfriend[table.find(getfriend, vname)] ~= vname and r11_3[table.find(r11_3, vname)] ~= vname and r17_3[table.find(r17_3, vuserid)] ~= vuserid then
        args = {
          [1] = "player",
          [2] = {
            meleeType = "meleemegapunch",
            hitPlayerId = vuserid,
          },
        }
        reqload = require(game:GetService("ReplicatedStorage").devv).load
        loader = reqload("Signal")
        loader.FireServer("meleeItemHit", unpack(args))
      end
    end
  end
  function equipHash(r0_210)
    if game:GetService("ReplicatedStorage").devv.remoteStorage[tostring(getupvalue(require(game:GetService("ReplicatedStorage").devv.client.Helpers.remotes.Signal).FireServer, 1).equip)] then
      game:GetService("ReplicatedStorage").devv.remoteStorage[tostring(getupvalue(require(game:GetService("ReplicatedStorage").devv.client.Helpers.remotes.Signal).FireServer, 1).equip)]:FireServer(r0_210)
    end
  end
  function sendMessage(r0_206)
    if game:GetService("ReplicatedStorage").devv.remoteStorage:FindFirstChild("sendMessage") then
      game:GetService("ReplicatedStorage").devv.remoteStorage:FindFirstChild("sendMessage"):FireServer(unpack(r0_206))
    end
  end
  function stompfunc(r0_176)
    getfriend = getFriends()
    if r0_176.Character and not r0_176.Character:FindFirstChild("ForceField") and r0_176.Character:FindFirstChild("HumanoidRootPart") and r0_176.Character:FindFirstChild("Humanoid") then
      vname = r0_176.Name
      vuserid = r0_176.UserId
      vhumrootpart = r0_176.Character.HumanoidRootPart
      dis = (r6_3.Position - vhumrootpart.Position).magnitude
      if dis <= 25 and vname ~= r2_3 and getfriend[table.find(getfriend, vname)] ~= vname and r11_3[table.find(r11_3, vname)] ~= vname and r17_3[table.find(r17_3, vuserid)] ~= vuserid then
        args = {
          [1] = r0_176,
        }
        reqload = require(game:GetService("ReplicatedStorage").devv).load
        loader = reqload("Signal")
        loader.FireServer("stomp", unpack(args))
      end
    end
  end
  function getAmmo()
    settings = {}
    items = require(game:GetService("ReplicatedStorage").devv.client.Objects.v3item)
    if items:FindFirstChild("inventory") then
      gg = items.inventory.getEquippedItem().ammoManager.ammo
      table.insert(settings, gg)
    end
    return settings
  end
  function silentBlock()
    l = require(game:GetService("ReplicatedStorage").devv).load
    l_LocalPlayer_0 = game:GetService("Players").LocalPlayer
    v5 = l("ClientReplicator")
    v4 = l("FFCChain")
    if getgenv().silentblock == true and v5.Get(l_LocalPlayer_0, "blocking") == false then
      v5.Set(l_LocalPlayer_0, "blocking", true)
      v5.Replicate("blocking")
    elseif getgenv().silentblocker == false then
      v5.Set(l_LocalPlayer_0, "blocking", false)
      v5.Replicate("blocking")
    end
  end
  function customMessage()
    getgenv().saycustommsgswitch = r16_3.customMessageSettings.Toggle()
    getgenv().saycustommsg = r16_3.customMessageSettings.message()
    getgenv().saycustommsgtime = r16_3.customMessageSettings.messagetime()
    getgenv().mtoastcolor = r16_3.customMessageSettings.messagecolor()
    if getgenv().saycustommsgswitch == true then
      l = require(game:GetService("ReplicatedStorage").devv).load
      v10 = l("makeToast")
      v10(tostring(getgenv().saycustommsg), tostring(getgenv().mtoastcolor), getgenv().saycustommsgtime)
    end
  end
  customMessage()
  function antiGrab()
    l = require(game:GetService("ReplicatedStorage").devv).load
    l_LocalPlayer_0 = game:GetService("Players").LocalPlayer
    v2 = l("ClientReplicator")
    v4 = l("FFCChain")
    if getgenv().antigrab == true and v2.Get(l_LocalPlayer_0, "carried") == true then
      v2.Set(l_LocalPlayer_0, "carried", false)
    end
  end
  function GetCash()
    local r0_229 = {}
    for r4_229, r5_229 in pairs(game:GetService("Workspace").Game.Entities.CashBundle:GetChildren()) do
      table.insert(r0_229, r5_229)
    end
    return r0_229
  end
  function tablecash()
    allcash = GetCash()
    getcashman = {}
    for r3_54, r4_54 in pairs(allcash) do
      if r4_54.PrimaryPart and not r4_54:IsA("MeshPart") and r4_54:FindFirstChildWhichIsA("IntValue") and 300 < r4_54:FindFirstChildWhichIsA("IntValue").Value then
        table.insert(getcashman, r4_54)
      end
    end
    return getcashman
  end
  function GetItems()
    local r0_143 = {}
    for r4_143, r5_143 in pairs(game:GetService("Workspace").Game.Entities:WaitForChild("ItemPickup"):GetChildren()) do
      table.insert(r0_143, r5_143)
    end
    return r0_143
  end
  function GetATMS()
    local r0_85 = {}
    for r4_85, r5_85 in pairs(game:GetService("Workspace").Game.Props.ATM:GetChildren()) do
      table.insert(r0_85, r5_85)
    end
    for r4_85, r5_85 in pairs(game:GetService("Workspace").Game.Props.CashRegister:GetChildren()) do
      table.insert(r0_85, r5_85)
    end
    return r0_85
  end
  function getdestroyedtypes()
    getalltypes = GetATMS()
    cached = {}
    for r3_17, r4_17 in next, getalltypes, nil do
      if r4_17:GetAttribute("state") ~= "destroyed" then
        table.insert(cached, r4_17)
      end
    end
    return cached
  end
  function GetBundles()
    if game:GetService("Workspace").BankRobbery and game:GetService("Workspace").BankRobbery:FindFirstChild("BankCash") then
      bankthing = game:GetService("Workspace").BankRobbery:FindFirstChild("BankCash")
    end
    return bankthing
  end
  function liftDumbell()
    if game:GetService("ReplicatedStorage").devv.remoteStorage:FindFirstChild("liftDumbell") then
      game:GetService("ReplicatedStorage").devv.remoteStorage:FindFirstChild("liftDumbell"):FireServer()
    end
  end
  function stopfarmingwhen()
    stoper = {
      "Money Printer",
      "Military Armory Keycard",
      "Red Lucky Block",
      "Blue Lucky Block",
      "Green Lucky Block",
      "Orange Lucky Block",
      "Purple Lucky Block",
      "Diamond",
      "Diamond Ring",
      "Void Gem",
      "Dark Matter Gem"
    }
    items = {}
    allitems = GetItems()
    for r3_19, r4_19 in pairs(allitems) do
      local r5_19 = pairs
      local r6_19 = stoper
      for r8_19, r9_19 in r5_19(r6_19) do
        local r10_19 = r4_19.Name
        if r10_19 == r9_19 then
          table.insert(stoper, r4_19)
        end
      end
    end
    return stoper
  end
  function Collect(r0_131)
    if r0_131:FindFirstChildOfClass("ClickDetector") then
      fireclickdetector(r0_131:FindFirstChildOfClass("ClickDetector"))
    elseif r0_131:FindFirstChildOfClass("Part") then
      fireclickdetector(r0_131:FindFirstChildOfClass("Part"):FindFirstChildOfClass("ClickDetector"))
    end
  end
  function tablejewels()
    aljewelry = {
      "Dark Matter Gem",
      "Void Gem",
      "Diamond Ring",
      "Diamond",
      "Rollie",
      "Gold Cup",
      "Gold Crown",
      "Emerald",
      "Emerald Ring",
      "Gold Bar",
      "Amethyst",
      "Amethyst Ring",
      "Topaz",
      "Topaz Ring",
      "Sapphire Ring",
      "Sapphire",
      "Ruby",
      "Ruby Ring",
      "Watch",
      nil
    }
    jewelrycases = allJewelryCases()
    cached = {}
    for r3_195, r4_195 in pairs(jewelrycases) do
      local r5_195 = pairs
      local r6_195 = aljewelry
      for r8_195, r9_195 in r5_195(r6_195) do
        local r10_195 = r4_195:FindFirstChild(r9_195)
        if r10_195 then
          table.insert(cached, r4_195)
        end
      end
    end
    return cached
  end
  function cashpickup()
    for r3_134, r4_134 in pairs(game:GetService("Workspace").Game.Entities.CashBundle:GetChildren()) do
      if r4_134:FindFirstChildOfClass("Part") then
        mp = r4_134:FindFirstChildOfClass("Part")
        distance = (r6_3.Position - mp.Position).magnitude
        if r6_3 and distance <= 30 and r4_134:FindFirstChildOfClass("ClickDetector") then
          fireclickdetector(r4_134:FindFirstChildOfClass("ClickDetector"))
        end
      end
    end
  end
  function getAdmins()
    falssadmin = loadstring(game:HttpGet("https://pastebin.com/raw/VP8HxcBK"))()
    admins = {
      falssadmin.special.tetraxowner
    }
    roleloc = game:GetService("ReplicatedStorage").devv
    reqloc = require(roleloc)
    heros = reqloc.data.specialroles.heros.users
    for r3_22, r4_22 in next, heros, nil do
      table.insert(admins, r4_22)
    end
    adminss = reqloc.data.specialroles.admins.users
    for r3_22, r4_22 in next, adminss, nil do
      table.insert(admins, r4_22)
    end
    dev = reqloc.data.specialroles.developer.users
    for r3_22, r4_22 in next, dev, nil do
      table.insert(admins, r4_22)
    end
    return admins
  end
  local r19_3 = {}
  local r20_3 = next
  local r21_3, r22_3 = getAdmins()
  for r23_3, r24_3 in r20_3, r21_3, r22_3 do
    table.insert(r19_3, r24_3)
  end
  function kickOnAdminJoin()
    for r3_222, r4_222 in next, r19_3, nil do
      local r5_222 = next
      local r6_222, r7_222 = r0_3:GetPlayers()
      for r8_222, r9_222 in r5_222, r6_222, r7_222 do
        if r9_222.UserId == r4_222 then
          kickmsg = "\n                        [TeTraXKick]  \n        You have been kicked because tetrax found a admin in the current server!\n                "
          r1_3:Kick(kickmsg)
          task.wait(0.5)
          game.shutdown(game)
        end
      end
    end
  end
  function getHalloweenCandy()
    candylol = {}
    for r3_163, r4_163 in pairs(workspace.Game.Entities.CashBundle:GetChildren()) do
      if r4_163:IsA("MeshPart") then
        table.insert(candylol, r4_163)
      end
    end
    return candylol
  end
  function getHalloweenMobs()
    fileloc = workspace.Halloween
    mobschecker = {}
    local r0_87 = next
    local r1_87, r2_87 = fileloc:GetChildren()
    for r3_87, r4_87 in r0_87, r1_87, r2_87 do
      if r4_87:IsA("Model") then
        table.insert(mobschecker, r4_87)
      end
    end
    return mobschecker
  end
  function CollectCandy()
    candylol = getHalloweenCandy()
    for r3_65, r4_65 in next, candylol, nil do
      if r4_65 then
        fireclickdetector(r4_65:FindFirstChildWhichIsA("ClickDetector"))
      end
    end
  end
  function BypassRemotes()
    getgenv().bypassrmts = true
    loope = false
    if getgenv().bypassrmts == true then
      warn("TeTraX Bypasser Loaded Successfully!")
      while getgenv().bypassrmts do
        task.wait(0.1)
        pcall(function()
          for r3_151, r4_151 in next, debug, nil do
            if not getgenv()[r3_151] then
              getgenv()[r3_151] = r4_151
            end
          end
          local r0_151 = game:GetService("ReplicatedStorage"):WaitForChild("devv"):WaitForChild("client"):WaitForChild("Helpers"):WaitForChild("remotes"):WaitForChild("Signal")
          local r1_151 = next
          local r2_151, r3_151 = getupvalue(require(r0_151).FireServer, 1)
          for r4_151, r5_151 in r1_151, r2_151, r3_151 do
            r5_151.Name = r4_151
          end
        end)
        kickOnAdminJoin()
      end
    end
  end
  r1_3.CharacterAdded:Connect(function(r0_203)
    r4_3 = r0_203
    r5_3 = r4_3:WaitForChild("Humanoid")
    r6_3 = r4_3:WaitForChild("HumanoidRootPart")
  end)
  function getPlayersWithinFOV()
    local r0_192 = {}
    for r4_192, r5_192 in pairs(plrs:GetPlayers()) do
      if r5_192.Character and r5_192.Character:FindFirstChild("HumanoidRootPart") and r5_192.Character:FindFirstChild("Humanoid") then
        local r6_192, r7_192 = r10_3:WorldToViewportPoint(r5_192.Character:FindFirstChild("HumanoidRootPart").Position)
        if r5_192.Character then
          local r8_192 = r5_192.Character:FindFirstChild("Head")
        end
        if notBehindWall(r5_192.Character.HumanoidRootPart) and r7_192 then
          table.insert(r0_192, r5_192)
        end
      end
    end
    return r0_192
  end
  function getFriends()
    local r0_49 = {}
    for r4_49, r5_49 in ipairs(r0_3:GetPlayers()) do
      if r5_49 ~= r1_3 then
        local r6_49, r7_49 = pcall(function()
          return r1_3:IsFriendsWith(r5_49.UserId)
        end)
        if r6_49 then
          if r7_49 then
            table.insert(r0_49, r5_49.Name)
          end
        else
          warn(r7_49)
        end
      end
      -- close: r4_49
    end
    return r0_49
  end
  function getPlayers()
    friendnoeff = getFriends()
    plrtbl = {}
    for r3_193, r4_193 in pairs(r0_3:GetPlayers()) do
      if r4_193.Character and not r4_193.Character:FindFirstChild("ForceField") and r4_193.Character:FindFirstChild("HumanoidRootPart") and r4_193.Character:FindFirstChild("Humanoid") and 1 < r4_193.Character:FindFirstChild("Humanoid").Health and r4_193.Name ~= r2_3 and r4_193.UserId ~= r17_3[table.find(r17_3, r4_193.UserId)] and friendnoeff[table.find(friendnoeff, r4_193.Name)] ~= r4_193.Name and r11_3[table.find(r11_3, r4_193.UserId)] ~= r4_193.UserId then
        table.insert(plrtbl, r4_193)
      end
    end
    return plrtbl
  end
  function Say(...)
    if not SayMessageRequest then
      SayMessageRequest = game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest")
    end
    SayMessageRequest:FireServer(tostring(...), "All")
  end
  function getFriendsID()
    local r0_60 = {}
    for r4_60, r5_60 in ipairs(r0_3:GetPlayers()) do
      if r5_60 ~= r1_3 then
        local r6_60, r7_60 = pcall(function()
          return r1_3:IsFriendsWith(r5_60.UserId)
        end)
        if r6_60 then
          if r7_60 then
            table.insert(r0_60, r5_60.UserId)
          end
        else
          warn(r7_60)
        end
      end
      -- close: r4_60
    end
    return r0_60
  end
  function Teleport(r0_13)
    goto = r0_13
    tweenInfo = TweenInfo.new(0.06, Enum.EasingStyle.Linear)
    tween = game:GetService("TweenService"):Create(r6_3, tweenInfo, {
      CFrame = goto,
    })
    tween:Play()
  end
  function TweenTeleport(r0_209)
    new_CFrame = r0_209
    ts = game:GetService("TweenService")
    part = r6_3
    ti = TweenInfo.new(0.1, Enum.EasingStyle.Linear)
    tp = {
      CFrame = new_CFrame,
    }
    ts:Create(part, ti, tp):Play()
  end
  function TweenBring(r0_181)
    newCFrame = r0_181
    ts = game:GetService("TweenService")
    part = r6_3
    ti = TweenInfo.new(2.5, Enum.EasingStyle.Linear)
    tp = {
      CFrame = newCFrame,
    }
    ts:Create(part, ti, tp):Play()
  end
  function CFrameTP(r0_149)
    r6_3.CFrame = r0_149
  end
  function killAllPlayers()
    local r0_81 = CFrame.new(1653.3216552734375, -16.953155517578125, -529.6856079101563)
    selectedmodekillplrsfunc = selectedmodekillplrs or "All"
    if #getPlayers() > 0 then
      local r1_81 = getPlayers()[math.random(1, #getPlayers())]
      if r1_3.Character and r1_3.Character:FindFirstChild("HumanoidRootPart") and r1_3.Character:FindFirstChild("Humanoid") and r5_3.Health < 50 then
        r5_3.Health = die
      end
    end
    -- warn: not visited block [20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53]
    -- task.wait()
    -- r2_81 = selectedmodekillplrs
    -- if not r2_81
    -- r2_81 = "All"
    -- selectedmodekillplrsfunc = r2_81
    -- r2_81 = killalldisfunc
    -- if not r2_81
    -- r2_81 = 95
    -- killallwhendis = r2_81
    -- r2_81 = aptpdfunc
    -- if not r2_81
    -- r2_81 = 3.8
    -- aptpdfuncc = r2_81
    -- r2_81 = aptpdfuncunder
    -- if not r2_81
    -- r2_81 = -20
    -- aptpdfuncunderu = r2_81
    -- r2_81 = r1_81.Character
    -- if r2_81
    -- r2_81 = r1_81.Character:FindFirstChild("HumanoidRootPart")
    -- if r2_81
    -- r2_81 = r1_81.Character:FindFirstChild("Humanoid")
    -- if r2_81
    -- r2_81 = r1_81.Character:FindFirstChild("Humanoid").Jump
    -- if r2_81 == false
    -- r2_81 = r1_81.Character:FindFirstChild("Head")
    -- if r2_81
    -- r2_81 = r1_81.Character:FindFirstChild("ForceField")
    -- if not r2_81
    -- r2_81 = r1_81.Name
    -- r3_81 = _u2
    -- if r2_81 ~= r3_81
    -- -- <empty>
    -- -- <empty>
    -- r2_81 = friendnokill[table.find(friendnokill, r1_81.Name)]
    -- r3_81 = r1_81.Name
    -- if r2_81 ~= r3_81
    -- -- <empty>
    -- -- <empty>
    -- r2_81 = _u3[table.find(_u3, r1_81.Name)]
    -- r3_81 = r1_81.Name
    -- if r2_81 ~= r3_81
    -- -- <empty>
    -- -- <empty>
    -- r2_81 = _u4[table.find(_u4, r1_81.UserId)]
    -- r3_81 = r1_81.UserId
    -- if r2_81 ~= r3_81
    -- r2_81 = r1_81.Character.Humanoid.Health
    -- if 1 < r2_81
    -- equipHash("Fists")
    -- -- <empty>
    -- -- <empty>
    -- workspace.CurrentCamera.CameraSubject = r1_81.Character.Humanoid
    -- -- <empty>
    -- -- <empty>
    -- _u5.CFrame = CFrame.lookAt(_u5.Position, r1_81.Character:FindFirstChild("HumanoidRootPart").Position)
    -- -- <empty>
    -- -- <empty>
    -- -- <empty>
    -- -- <empty>
    -- _u5.CFrame = r1_81.Character:FindFirstChild("HumanoidRootPart").CFrame * CFrame.new(0, aptpdfuncunderu, aptpdfuncc)
    -- killfunc(r1_81)
    -- stompfunc(r1_81)
    -- r2_81 = getgenv().AutoKillAll
    -- if r2_81 ~= false
    -- r2_81 = r1_81.Character
    -- if r2_81 ~= nil
    -- r2_81 = r1_81.Character:FindFirstChild("ForceField")
    -- if not r2_81
    -- r2_81 = r1_81.Character:FindFirstChild("Humanoid").Health
    -- if r2_81 >= 1
    -- r2_81 = _u0.Character:FindFirstChild("Humanoid").Sit
    -- if r2_81 ~= true
    -- r2_81 = _u1.Health
    -- if r2_81 >= 50
    -- r2_81 = selectedmodekillplrsfunc
    -- if r2_81 ~= "All"
    -- if r1_81.Character
    -- if r1_81.Character:FindFirstChild("Head")
    -- _u5.CFrame = r1_81.Character:FindFirstChild("Head").CFrame
    -- _u5.CFrame = r0_81
    -- workspace.CurrentCamera.CameraSubject = _u1
    -- goto label_353
    -- if _u0.Character
    -- if _u0.Character:FindFirstChild("Humanoid").Sit == true
    -- _u0.Character.Humanoid.Jump = true
    -- goto label_353
  end
  function jsond(r0_205)
    return r4_0:JSONDecode(r0_205)
  end
  function ATMFarmAFK()
    getgenv().farmmode = farmmodes or "AFK"
    gemfarm = tablejewels()
    allatms = GetATMS()
    equippedName = GetEquippedName()
    local r0_201 = nil
    r0_201 = CFrame.new(1653.3216552734375, -16.953155517578125, -529.6856079101563)
    if #GetATMS() > 0 then
      local r1_201 = GetATMS()[math.random(1, #GetATMS())]
      if game:GetService("Workspace").BankRobbery:FindFirstChild("BankCash") and game:GetService("Workspace").BankRobbery:FindFirstChild("BankCash"):FindFirstChild("Cash") then
        bankthing = game:GetService("Workspace").BankRobbery:FindFirstChild("BankCash")
        if #bankthing:FindFirstChild("Cash"):GetChildren() == 0 and r1_201:IsA("Model") and r1_201:GetAttribute("state") ~= "destroyed" then
          task.spawn(function()
            while getgenv().AutoRobATM == true do
              local r0_202 = r1_201:GetAttribute("state")
              if r0_202 ~= "destroyed" then
                task.wait()
                r0_202 = getgenv().AutoRobATM
                if r0_202 == true then
                  cashpickup()
                  equipHash("Fists")
                end
              else
                break
              end
            end
          end)
          while true do
            task.wait()
            getgenv().farmmode = farmmodes or "AFK"
            r6_3.CFrame = r1_201.WorldPivot * CFrame.new(0, -4.9, 0) * CFrame.Angles(math.rad(90), 0, 0)
            allatms = GetATMS()
            local r2_201 = pairs
            local r3_201 = allatms
            for r5_201, r6_201 in r2_201(r3_201) do
              mp = r6_201.WorldPivot
              distance = (r6_3.Position - mp.Position).magnitude
              if r6_201:GetAttribute("state") ~= "destroyed" and distance <= 20 then
                args = {
                  [1] = "prop",
                  [2] = {
                    meleeType = "meleepunch",
                    guid = r6_201:GetAttribute("guid"),
                  },
                }
                game:GetService("ReplicatedStorage").devv.remoteStorage[tostring(getupvalue(require(game:GetService("ReplicatedStorage").devv.client.Helpers.remotes.Signal).FireServer, 1).meleeItemHit)]:FireServer(unpack(args))
              end
            end
            r2_201 = r1_201:GetAttribute("state")
            if r2_201 ~= "destroyed" then
              r2_201 = getgenv().AutoRobATM
              if r2_201 ~= false then
                r2_201 = getgenv().farmmode
                if r2_201 ~= "AFK" then
                  break
                end
              else
                break
              end
            else
              break
            end
          end
          task.wait(0.5)
          cashpickup()
          task.wait()
          r6_3.CFrame = r0_201
        end
      end
      -- close: r1_201
    end
  end
  function ATMFarm()
    getgenv().farmmode = farmmodes or "Regular"
    gemfarm = tablejewels()
    allatms = GetATMS()
    equippedHash = GetEquipped()
    local r0_109 = nil
    r0_109 = equippedHash
    local r1_109 = nil
    r1_109 = r6_3.CFrame
    if #GetATMS() > 0 then
      local r2_109 = GetATMS()[math.random(1, #GetATMS())]
      if game:GetService("Workspace").BankRobbery:FindFirstChild("BankCash") and game:GetService("Workspace").BankRobbery:FindFirstChild("BankCash"):FindFirstChild("Cash") then
        bankthing = game:GetService("Workspace").BankRobbery:FindFirstChild("BankCash")
        if #bankthing:FindFirstChild("Cash"):GetChildren() == 0 and r2_109:IsA("Model") and r2_109:GetAttribute("state") ~= "destroyed" then
          task.spawn(function()
            while getgenv().AutoRobATM == true do
              local r0_110 = r2_109:GetAttribute("state")
              if r0_110 ~= "destroyed" then
                task.wait()
                r0_110 = getgenv().AutoRobATM
                if r0_110 == true then
                  cashpickup()
                  equipHash("Fists")
                end
              else
                break
              end
            end
          end)
          while true do
            task.wait()
            getgenv().farmmode = farmmodes or "Regular"
            r6_3.CFrame = r2_109.WorldPivot * CFrame.new(0, -4.9, 0) * CFrame.Angles(math.rad(90), 0, 0)
            allatms = GetATMS()
            local r3_109 = pairs
            local r4_109 = allatms
            for r6_109, r7_109 in r3_109(r4_109) do
              mp = r7_109.WorldPivot
              distance = (r6_3.Position - mp.Position).magnitude
              if r7_109:GetAttribute("state") ~= "destroyed" and distance <= 20 then
                args = {
                  [1] = "prop",
                  [2] = {
                    meleeType = "meleepunch",
                    guid = r7_109:GetAttribute("guid"),
                  },
                }
                game:GetService("ReplicatedStorage").devv.remoteStorage[tostring(getupvalue(require(game:GetService("ReplicatedStorage").devv.client.Helpers.remotes.Signal).FireServer, 1).meleeItemHit)]:FireServer(unpack(args))
              end
            end
            r3_109 = r2_109:GetAttribute("state")
            if r3_109 ~= "destroyed" then
              r3_109 = getgenv().AutoRobATM
              if r3_109 ~= false then
                r3_109 = getgenv().farmmode
                if r3_109 ~= "Regular" then
                  break
                end
              else
                break
              end
            else
              break
            end
          end
          task.wait(0.5)
          cashpickup()
          task.wait()
          r6_3.CFrame = r1_109
          game:GetService("ReplicatedStorage").devv.remoteStorage[tostring(getupvalue(require(game:GetService("ReplicatedStorage").devv.client.Helpers.remotes.Signal).FireServer, 1).equip)]:FireServer(r0_109)
        end
      end
      -- close: r2_109
    end
  end
  function FarmBankAFK()
    local r0_213 = CFrame.new(1653.3216552734375, -16.953155517578125, -529.6856079101563)
    if workspace.BankRobbery:FindFirstChild("BankCash") and workspace.BankRobbery:FindFirstChild("BankCash"):FindFirstChild("Cash") then
      bankthing = workspace.BankRobbery:FindFirstChild("BankCash")
      if r6_3 and 0 < #bankthing:FindFirstChild("Cash"):GetChildren() then
        while true do
          task.wait()
          getgenv().farmmode = farmmodes or "AFK"
          goto = game:GetService("Workspace").BankRobbery.BankCash.Main.CFrame * CFrame.new(0, -2.7, -1) * CFrame.Angles(math.rad(90), 0, 0)
          CFrameTP(goto)
          local r1_213 = pairs
          local r2_213 = workspace:WaitForChild("BankRobbery")
          for r4_213, r5_213 in r1_213(r2_213:GetDescendants()) do
            if r5_213:IsA("ProximityPrompt") then
              fireproximityprompt(r5_213)
            end
          end
          r1_213 = #bankthing:WaitForChild("Cash"):GetChildren()
          if r1_213 ~= 0 then
            r1_213 = getgenv().RobBankk
            if r1_213 ~= false then
              r1_213 = getgenv().farmmode
              if r1_213 ~= "AFK" then
                break
              end
            else
              break
            end
          else
            break
          end
        end
        task.wait(0.3)
        returnTweenInfo = TweenInfo.new(0.09, Enum.EasingStyle.Linear)
        returnTween = game:GetService("TweenService"):Create(r6_3, returnTweenInfo, {
          CFrame = r0_213,
        })
        returnTween:Play()
      end
    end
  end
  function FarmBank()
    local r0_177 = r6_3.CFrame
    if workspace.BankRobbery:FindFirstChild("BankCash") and workspace.BankRobbery:FindFirstChild("BankCash"):FindFirstChild("Cash") then
      bankthing = workspace.BankRobbery:FindFirstChild("BankCash")
      if r6_3 and 0 < #bankthing:FindFirstChild("Cash"):GetChildren() then
        while true do
          task.wait()
          getgenv().farmmode = farmmodes or "Regular"
          goto = game:GetService("Workspace").BankRobbery.BankCash.Main.CFrame * CFrame.new(0, -2.7, -1) * CFrame.Angles(math.rad(90), 0, 0)
          CFrameTP(goto)
          local r1_177 = pairs
          local r2_177 = workspace:WaitForChild("BankRobbery")
          for r4_177, r5_177 in r1_177(r2_177:GetDescendants()) do
            if r5_177:IsA("ProximityPrompt") then
              fireproximityprompt(r5_177)
            end
          end
          r1_177 = #bankthing:WaitForChild("Cash"):GetChildren()
          if r1_177 ~= 0 then
            r1_177 = getgenv().RobBankk
            if r1_177 ~= false then
              r1_177 = getgenv().farmmode
              if r1_177 ~= "Regular" then
                break
              end
            else
              break
            end
          else
            break
          end
        end
        task.wait(0.3)
        returnTweenInfo = TweenInfo.new(0.09, Enum.EasingStyle.Linear)
        returnTween = game:GetService("TweenService"):Create(r6_3, returnTweenInfo, {
          CFrame = r0_177,
        })
        returnTween:Play()
      end
    end
  end
  function DestroyNearestATM()
    equippedName = GetEquippedName()
    for r3_125, r4_125 in pairs(game:GetService("Workspace").Game.Props.ATM:GetChildren()) do
      if r1_3.Character and r1_3.Character:FindFirstChild("HumanoidRootPart") and r4_125.PrimaryPart then
        mp = r4_125.PrimaryPart
        distance = (r1_3.Character.HumanoidRootPart.Position - mp.Position).magnitude
        if equippedName == "Fists" and r4_125:GetAttribute("state") ~= "destroyed" and distance <= 35 then
          args = {
            [1] = "prop",
            [2] = {
              meleeType = "meleepunch",
              guid = r4_125:GetAttribute("guid"),
            },
          }
          game:GetService("ReplicatedStorage").devv.remoteStorage.meleeItemHit:FireServer(unpack(args))
          cashpickup()
        end
      end
    end
  end
  function makeButton(r0_20)
    if identifyexecutor then
      execsss = {
        "Delta",
        "Fluxus",
        "Hydrogen",
        "ArceusX"
      }
      identify = identifyexecutor()
      if identify == execsss[table.find(execsss, identify)] then
        guitypee = loadstring(r0_20)()
      end
    else
      warn("identifyexecutor function not found or is broken not making button!")
    end
    return guitypee
  end
  getgenv().TPWalkMode = function()
    if getgenv().seltpwallkmode == nil then
      return r5_3.MoveDirection
    end
    if getgenv().seltpwallkmode ~= nil then
      local r0_44 = getgenv().seltpwallkmode
      ... = r0_44() -- error: untaken top expr
    end
  end
  function Tpwalking()
    TpwalkValuefunc = getgenv().TpwalkValue or 3.5
    if getgenv().ToggleTpwalk and r4_3 and r5_3 and r6_3 then
      r6_3.CFrame = r6_3.CFrame + getgenv().TPWalkMode() * TpwalkValuefunc
      r6_3.CanCollide = true
    end
  end
  function openJewelSafes()
    for r3_269, r4_269 in pairs(workspace.Game.Entities.JewelSafe:GetChildren()) do
      mp = r4_269.WorldPivot
      distance = (r6_3.Position - mp.Position).magnitude
      if r6_3 and distance <= 45 then
        buyItem("Lockpick")
        if r4_269:FindFirstChild("ProximityPrompt", true) then
          fireproximityprompt(r4_269:FindFirstChild("ProximityPrompt", true))
        end
      end
    end
    for r3_269, r4_269 in pairs(workspace.Game.Entities.GoldJewelSafe:GetChildren()) do
      gold = r4_269.WorldPivot
      distanceg = (r6_3.Position - gold.Position).magnitude
      if r6_3 and distanceg <= 45 then
        buyItem("Lockpick")
        if r4_269:FindFirstChild("ProximityPrompt", true) then
          fireproximityprompt(r4_269:FindFirstChild("ProximityPrompt", true))
        end
      end
    end
  end
  r20_3 = {
    "Dark Matter Gem",
    "Void Gem",
    "Diamond Ring",
    "Diamond",
    "Rollie",
    "Gold Cup",
    "Gold Crown"
  }
  r21_3 = {
    "Dark Matter Gem",
    "Void Gem",
    "Diamond Ring",
    "Diamond",
    "Rollie",
    "Gold Cup",
    "Gold Crown",
    "Crown",
    "Emerald",
    "Emerald Ring",
    "Gold Bar",
    "Amethyst",
    "Amethyst Ring",
    "Topaz",
    "Topaz Ring",
    "Sapphire Ring",
    "Sapphire",
    "Ruby",
    "Ruby Ring",
    "Watch"
  }
  r22_3 = {
    "Pepper Spray",
    "Fire Extinguisher"
  }
  local r23_3 = {
    "semi",
    "auto",
    "burst"
  }
  local r24_3 = {
    "Chicken",
    "Cookie",
    "Taco"
  }
  local r25_3 = {
    "Fists",
    "Scythe",
    "Katana",
    "Knife",
    "Guitar",
    "Candy Cane",
    "Clown Mallet",
    "Baton",
    "Riot Shield"
  }
  local r26_3 = {}
  local r27_3 = require(game:GetService("ReplicatedStorage").devv.client.Objects.v3item)
  r27_3.inventory.numSlots = 9
  for r31_3, r32_3 in next, r27_3.inventory.ordered, nil do
    table.insert(r26_3, r32_3)
  end
  local r28_3 = {}
  for r32_3, r33_3 in pairs(r0_3:GetPlayers()) do
    local r34_3 = r33_3.Name
    if r34_3 ~= r2_3 then
      r34_3 = r17_3[table.find(r17_3, r33_3.UserId)]
      local r35_3 = r33_3.UserId
      if r34_3 ~= r35_3 then
        table.insert(r28_3, r33_3.Name)
      end
    end
  end
  local r29_3 = {}
  for r33_3, r34_3 in pairs(game:GetService("ReplicatedStorage"):WaitForChild("Anims"):GetChildren()) do
    table.insert(r29_3, r34_3.Name)
  end
  function getItems()
    local r0_238 = {}
    for r4_238, r5_238 in pairs(game:GetService("Workspace").Game.Entities.ItemPickup:GetChildren()) do
      r5_238.Name = r5_238:GetAttribute("itemName")
      table.insert(r0_238, r5_238.Name)
    end
    return r0_238
  end
  local r30_3 = {}
  for r34_3, r35_3 in pairs(game:GetService("Workspace").Game.Airdrops:GetChildren()) do
    table.insert(r30_3, r35_3.Name)
  end
  local r31_3 = {}
  for r35_3, r36_3 in pairs(game:GetService("Workspace").Game.Local.droppables:GetChildren()) do
    table.insert(r31_3, r36_3.Name)
  end
  local r32_3 = {}
  for r36_3, r37_3 in pairs(game:GetService("Workspace").Rocks:GetChildren()) do
    r37_3.Name = r37_3:GetAttribute("oreName")
    table.insert(r32_3, r37_3.Name)
  end
  local r33_3 = {}
  for r37_3, r38_3 in pairs(game:GetService("Workspace").Game.Drones:GetChildren()) do
    table.insert(r33_3, r38_3.Name)
  end
  local r34_3 = {
    "Cruiser",
    "Mustang",
    "Chopper",
    "Black Chopper",
    "Lamborghini",
    "Supercar"
  }
  local r35_3 = {
    "Head",
    "HumanoidRootPart",
    "LeftHand",
    "LeftLowerArm",
    "LeftUpperArm",
    "RightHand",
    "RightLowerArm",
    "RightUpperArm",
    "UpperTorso",
    "LeftFoot",
    "LeftLowerLeg",
    "LeftUpperLeg",
    "RightFoot",
    "RightLowerLeg",
    "RightUpperLeg",
    "LowerTorso"
  }
  local r36_3 = {
    "meleemegapunch",
    "meleepunch",
    "meleejumpKick",
    "meleekick",
    "meleemegaswing",
    "meleeswing"
  }
  local r37_3 = {
    "Acid Gun",
    "AK-47",
    "Gold AK-47",
    "Gold Deagle",
    "Ammo Box",
    "AS Val",
    "AUG",
    "Balloon",
    "Banana Peel",
    "Lockpick",
    "Beans",
    "Taco",
    "Barrett M107",
    "Black Bandana",
    "Bundle of TNT",
    "C4",
    "Chicken",
    "Cookie",
    "Double Barrel",
    "Deagle",
    "Dragunov",
    "Drone",
    "Flamethrower",
    "Flashbang",
    "Frag",
    "Glider",
    "Gravity Gun",
    "Heavy C4",
    "Heavy Vest",
    "Hoverboard",
    "Katana",
    "M249 SAW",
    "MP7",
    "Minigun",
    "Molotov",
    "M4A1",
    "Medium Vest",
    "Military Vest",
    "Pickaxe",
    "Python",
    "P90",
    "Raygun",
    "RPG",
    "RPK",
    "Sawn Off",
    "Scar L",
    "Segway",
    "Saiga 12",
    "Shopping Cart",
    "Surgeon Mask",
    "Scythe",
    "Tommy Gun"
  }
  local r38_3 = {
    ["Camera LookVector"] = function()
      re = game:GetService("Workspace").Camera.CFrame.LookVector
      return re
    end,
    MoveDirection = function()
      return r5_3.MoveDirection
    end,
  }
  local r39_3 = {}
  for r43_3, r44_3 in next, r38_3, nil do
    table.insert(r39_3, r43_3)
  end
  local r40_3 = {
    Arcade = CFrame.new(834.168701171875, 6.24685001373291, -888.8101196289063),
    [r2_3] = CFrame.new(669, 6.24341679, -664.499878, -0.957340658, -0.00000000229302732, -0.288961798, -0.00000000552740254, 1, 0.0000000103770805, 0.288961798, 0.0000000115316094, -0.957340658),
    Armory2 = CFrame.new(1570.47925, 6.24341726, -616.390259, -0.10622178, -0.0000000000866407709, 0.994342446, 0.000000000424463326, 1, 0.000000000132477515, -0.994342446, 0.000000000436133907, -0.10622178),
    Armory3 = CFrame.new(1123, 25.341917, -1318.49976, -0.995400488, -0.000000000319101218, 0.0958012193, -0.000000000435342457, 1, -0.00000000119245747, -0.0958012193, -0.00000000122867916, -0.995400488),
    Bank = CFrame.new(1089.2777099609375, 8.169798851013184, -344.85955810546875),
    ["Outside Bank"] = CFrame.new(1085.20105, 6.04341984, -463.016602, -0.996330619, -0.0000000322510765, -0.0855881274, -0.0000000304928172, 1, -0.0000000218505907, 0.0855881274, -0.0000000191605896, -0.996330619),
    ["Black Market"] = CFrame.new(726.1677856445313, -27.880531311035156, -112.65306854248047),
    ["Burger Shop"] = CFrame.new(1336.6322, 6.2434411, -688.198792, 0.506439328, -0.00000000453497817, -0.8622756, -0.0000000102015942, 1, -0.0000000112510046, 0.8622756, 0.0000000144945371, 0.506439328),
    ["Cafe Shop"] = CFrame.new(1295.70508, 8.19805717, -332.50061, 0.503338635, 0.0000000045388826, -0.864089251, 0.0000000177461672, 1, 0.0000000155900732, 0.864089251, -0.0000000231813591, 0.503338635),
    Carnival = CFrame.new(1175.16516, 13.8484259, -23.2780151, -0.941395044, 0.00000000101699338, 0.337306052, -0.000000000792604593, 1, -0.00000000522714405, -0.337306052, -0.0000000051881579, -0.941395044),
    Church = CFrame.new(1494.54639, 1.90580702, 33.9957123, 0.947208226, 0.0000000143359067, 0.320619106, -0.0000000205358024, 1, 0.0000000159559228, -0.320619106, -0.0000000216977512, 0.947208226),
    ["Coffee Job Hideout"] = CFrame.new(1343.4984130859375, 7.008630275726318, -329.5038757324219) * CFrame.new(0, -4.4, 1),
    Firestation = CFrame.new(1626.1756591796875, 8.06382942199707, -536.415771484375),
    ["Grocery Store"] = CFrame.new(911.1165161132813, 6.245436191558838, -893.6758422851563),
    Gym = CFrame.new(1622.9190673828125, 6.345396518707275, -319.3541564941406),
    ["Hidden Area"] = CFrame.new(1653.3216552734375, -16.953155517578125, -529.6856079101563),
    Hospital = CFrame.new(1153.28955078125, 6.276763916015625, -975.0587158203125),
    Jewelry = CFrame.new(1598.3031005859375, 8.369791030883789, -691.4287719726563),
    ["Jewelry Activate"] = CFrame.new(1718.071044921875, 11.355670928955078, -736.5723266601563),
    Nightclub = CFrame.new(1546.29993, 8.2707262, -790.299927, -0.995373607, 0.0000000151567328, 0.0960798711, 0.0000000133637927, 1, -0.0000000193044158, -0.0960798711, -0.0000000179311161, -0.995373607),
    ["Shoe Store"] = CFrame.new(1438.9559326171875, 6.246395111083984, -361.7354736328125),
    ["Shoe Store Hideout"] = CFrame.new(1459.2672119140625, 41.2963752746582, -342.5706481933594),
    Tower = CFrame.new(823.8939208984375, 83.43997192382813, -146.0994110107422),
    ["Military Base"] = CFrame.new(796.650390625, 25.2656192779541, -1368.020751953125),
    ["Military Robbery Hideout"] = CFrame.new(383.0826110839844, 3.1499149799346924, -1359.769775390625),
    ["Under Map"] = CFrame.new(369.20672607421875, -127.81851196289063, -423.2080993652344),
    ["Outside Map"] = CFrame.new(1884.9793701171875, 4.352350234985352, -967.9786376953125),
    ["Police Station"] = CFrame.new(647.1284790039063, 9.037802696228027, -862.6290283203125),
    Theater = CFrame.new(527.0411376953125, 6.246847152709961, -1032.37109375),
  }
  local r41_3 = {}
  for r45_3, r46_3 in pairs(r40_3) do
    table.insert(r41_3, r45_3)
  end
  getgenv().printTeTraXV = tostring(r14_3.Settings.Version)
  getgenv().printTeTraXName = tostring(r14_3.Settings.Name)
  s = require(game:GetService("ReplicatedStorage").devv.client.Objects.v3item.bin.Fists.modules.controller)
  x = getupvalues(getupvalues(getupvalues(s.meleeFunctions)[2])[5])[1].data
  pcall(x.confetiiiiiiiiiiiii)
  makeButton(game:HttpGet("https://raw.githubusercontent.com/DINERO9/Array/main/unk"))
  local r42_3 = loadstring(game:HttpGet("https://raw.githubusercontent.com/DINERO9/Array/main/UI-Libary.Lua"))()
  local r45_3 = "CreateWindow"
  r45_3 = {
    Name = "" .. getgenv().printTeTraXName,
    LoadingTitle = "TeTraX " .. getgenv().printTeTraXV,
    LoadingSubtitle = "by TeTraXCorporation",
    ConfigurationSaving = {
      Enabled = true,
      FolderName = "TeTraX",
      FileName = "TeTraXSettings",
    },
    Discord = {
      Enabled = false,
      Invite = "noinvitelink",
      RememberJoins = true,
    },
    KeySystem = false,
  }
  local r46_3 = "KeySettings"
  local r47_3 = {
    Title = "TeTraXOfficial",
    Subtitle = "Click KEY For Link",
    FileName = "TeTraXXXXXEY",
    SaveKey = true,
    GrabKeyFromSite = true,
    Actions = {
      [1] = {
        Text = "KEY",
        OnPress = function()
          print("TeTraX Key Copied!")
          setclipboard("https://pastebin.com/raw/ySetB6qN")
        end,
      },
    },
    Key = {
      "https://pastebin.com/raw/ySetB6qN"
    },
  }
  r45_3[r46_3] = r47_3
  local r43_3 = r42_3:CreateWindow(r45_3)
local function r44_3(r0_245)
  end
  r45_3 = {}
  function r46_3(r0_62)
  end
  function r47_3(r0_259)
    for r5_259, r6_259 in next, jsond(r0_259), nil do
      if r42_3.Flags[r5_259] then
        task.spawn(function()
          if r42_3.Flags[r5_259].Type == "ColorPicker" then
            r42_3.Flags[r5_259]:Set(UnpackColor(r6_259))
          elseif r42_3.Flags[r5_259].CurrentValue or r42_3.Flags[r5_259].CurrentKeybind or r42_3.Flags[r5_259].CurrentOption or r42_3.Flags[r5_259].Color ~= r6_259 then
            r42_3.Flags[r5_259]:Set(r6_259)
          end
        end)
      else
        r42_3:Notify({
          Title = "Flag Error",
          Content = "TeTraX was unable to find \'" .. r5_259 .. "\'\' in the current script",
        })
      end
      -- close: r5_259
    end
  end
  local r50_3 = "CreateTab"
  r50_3 = "Main"
  local r48_3 = r43_3:Main(r50_3, 7539983773)
  chats = {
    ["sit down kid (chinese)"] = "坐下孩子",
    ["TeTraX OnTop (chinese)"] = "TeTraX 上！",
    ["still crying haha (chinese)"] = "还在哭哈哈",
    ["Welcome (chinese)"] = "欢迎来到俄亥俄州 v3",
    ["TeTraX OnTop"] = "TeTraX OnTop!",
    Welcome = "Welcome to ohio v3",
    ["sit down kid"] = "Sit down kid!",
    ["still crying"] = "still crying?",
  }
  chatmsgs = {}
  for r52_3, r53_3 in next, chats, nil do
    table.sort(chats)
    table.insert(chatmsgs, r52_3)
  end
  local r51_3 = "CreateDropdown"
  r51_3 = {
    Name = "Chat",
    Options = chatmsgs,
    CurrentOption = "",
    MultiSelection = false,
    Flag = "Chats",
    Callback = function(r0_14)
      Messenger = r0_14
      Say(tostring(chats[Messenger]))
    end,
  }
  local r49_3 = r48_3:CreateDropdown(r51_3)
  local r52_3 = "CreateToggle"
  r52_3 = {
    Name = "TPWalk",
    Info = "TPwalk",
    CurrentValue = false,
    Flag = "TPwalker",
    Callback = function(r0_183)
      getgenv().ToggleTpwalk = r0_183
      ToggleTpwalk = not ToggleTpwalk
      if getgenv().ToggleTpwalk and not TpwalkConnection then
        TpwalkConnection = r7_3.Heartbeat:Connect(Tpwalking)
      elseif not getgenv().ToggleTpwalk and TpwalkConnection then
        TpwalkConnection:Disconnect()
        TpwalkConnection = nil
        r6_3.CanCollide = false
      end
    end,
  }
  r50_3 = r48_3:CreateToggle(r52_3)
  local r53_3 = "CreateDropdown"
  r53_3 = {
    Name = "TPWalk Mode",
    Options = r39_3,
    CurrentOption = "",
    MultiSelection = false,
    Flag = "wlkermode",
    Callback = function(r0_159)
      tpmodes = r0_159
      getgenv().seltpwallkmode = r38_3[tpmodes]
    end,
  }
  r51_3 = r48_3:CreateDropdown(r53_3)
  local r54_3 = "CreateSlider"
  r54_3 = {
    Name = "TPWalk Speed",
    Range = {
      -0.1,
      11
    },
    Increment = 0.01,
    Suffix = "TPWalk Speed",
    CurrentValue = 1,
    Flag = "TPwalkvalue",
    Callback = function(r0_170)
      getgenv().TpwalkValue = r0_170
    end,
  }
  r52_3 = r48_3:CreateSlider(r54_3)
  function setFOV(r0_46)
    v1func = r0_46 or 90
    game:GetService("Workspace").Camera.FieldOfView = v1func
  end
  function activateFOV()
    game:GetService("Workspace").Camera:GetPropertyChangedSignal("FieldOfView"):Connect(function()
      ffofunc = ffo or 90
      game:GetService("Workspace").Camera.FieldOfView = ffofunc
    end)
  end
  activateFOV()
  local r55_3 = "CreateSlider"
  r55_3 = {
    Name = "FOV",
    Range = {
      0,
      250
    },
    Increment = 10,
    Suffix = "FOV",
    CurrentValue = 10,
    Flag = "FOVV",
    Callback = function(r0_263)
      ffo = r0_263
      setFOV(ffo)
    end,
  }
  r53_3 = r48_3:CreateSlider(r55_3)
  local r56_3 = "CreateSlider"
  r56_3 = {
    Name = "AimAssist Level",
    Range = {
      0,
      20
    },
    Increment = 1,
    Suffix = "AimAssist",
    CurrentValue = 0,
    Flag = "AimAssist",
    Callback = function(r0_221)
      aimm = r0_221
      r1_3:SetAttribute("aimAssistSensitivity", aimm)
    end,
  }
  r54_3 = r48_3:CreateSlider(r56_3)
  function setCoffee(r0_194)
    set = r1_3:SetAttribute("speedModifier", r0_194)
    return set
  end
  local r57_3 = "GetAttributeChangedSignal"
  r57_3 = "speedModifier"
  r1_3:CreateSlider(r57_3):Connect(function()
    r1_3:SetAttribute("speedModifier", speedm)
  end)
  r57_3 = "CreateSlider"
  r57_3 = {
    Name = "Speed Multiplier",
    Range = {
      0,
      30
    },
    Increment = 1,
    Suffix = "Speed",
    CurrentValue = 1,
    Flag = "SpeedCoff",
    Callback = function(r0_83)
      speedm = r0_83
      setCoffee(speedm)
    end,
  }
  r55_3 = r48_3:CreateSlider(r57_3)
  local r58_3 = "CreateSlider"
  r58_3 = {
    Name = "JumpPower",
    Range = {
      0,
      250
    },
    Increment = 10,
    Suffix = "Jump",
    CurrentValue = 1,
    Flag = "JumpPower",
    Callback = function(r0_138)
      jpfunc = r0_138
      r5_3.UseJumpPower = true
      r5_3.JumpPower = jpfunc
    end,
  }
  r56_3 = r48_3:CreateSlider(r58_3)
  local r59_3 = "CreateToggle"
  r59_3 = {
    Name = "Infinite Jump",
    Info = "TESTING",
    CurrentValue = false,
    Flag = "InfJump",
    Callback = function(r0_88)
      getgenv().infinjump = r0_88
      r8_3.JumpRequest:connect(function()
        if getgenv().infinjump then
          humanoid = r1_3.Character:FindFirstChildOfClass("Humanoid")
          humanoid:ChangeState("Jumping")
        end
      end)
    end,
  }
  r57_3 = r48_3:CreateToggle(r59_3)
  local r60_3 = "CreateToggle"
  r60_3 = {
    Name = "Locker",
    CurrentValue = false,
    Flag = "Locker",
    Callback = function(r0_162)
      getgenv().AutoLocker = r0_162
      while getgenv().AutoLocker == true do
        fireproximityprompt(game:GetService("Workspace").Lockers["Gun Locker"].ProximityPrompt)
        r7_3.Heartbeat:Wait()
      end
    end,
  }
  r58_3 = r48_3:CreateToggle(r60_3)
  local r61_3 = "CreateButton"
  r61_3 = {
    Name = "Invisible",
    Interact = "Keybind",
    Callback = function()
      r42_3:Notify({
        Title = "Invisible Keybind X",
        Content = "must reactivate on death to keep using",
        Image = 7013849339,
      })
      makeButton(game:HttpGet("https://raw.githubusercontent.com/DINERO9/Array/main/y.lua"))
      local r0_29 = false
      local r1_29 = "X"
      local r2_29 = true
      local r3_29 = false
      local r4_29 = game:GetService("Players").LocalPlayer
      local r5_29 = r4_29.Character or r4_29.CharacterAdded:Wait()
      local r6_29 = false
      r5_29.Archivable = true
      local r7_29 = r5_29:Clone()
      local r8_29 = nil
      r8_29 = Instance.new("Part", workspace)
      r8_29.Anchored = true
      r8_29.Size = Vector3.new(7, 1, 7)
      r8_29.CFrame = CFrame.new(1653.3216552734375, -16.953155517578125, -529.6856079101563)
      r8_29.CanCollide = true
      r7_29.Parent = workspace
      r7_29.HumanoidRootPart.CFrame = r8_29.CFrame * CFrame.new(0, 5, 0)
      for r12_29, r13_29 in pairs(r5_29:GetChildren()) do
        if r13_29:IsA("LocalScript") then
          local r14_29 = r13_29:Clone()
          r14_29.Disabled = true
          r14_29.Parent = r7_29
        end
      end
      if r2_29 then
        for r12_29, r13_29 in pairs(r7_29:GetDescendants()) do
          if r13_29:IsA("BasePart") then
            r13_29.Transparency = 0.8
          end
        end
      end
      local r9_29 = true
      function RealCharacterDied()
        r9_29 = false
        r5_29:Destroy()
        r5_29 = r4_29.Character
        r9_29 = true
        isinvisible = false
        r7_29:Destroy()
        workspace.CurrentCamera.CameraSubject = r5_29.Humanoid
        r5_29.Archivable = true
        r7_29 = r5_29:Clone()
        r8_29:Destroy()
        r8_29 = Instance.new("Part", workspace)
        r8_29.Anchored = true
        r8_29.Size = Vector3.new(7, 1, 7)
        r8_29.CFrame = CFrame.new(1653.3216552734375, -16.953155517578125, -529.6856079101563)
        r8_29.CanCollide = true
        r7_29.Parent = workspace
        r7_29.HumanoidRootPart.CFrame = r8_29.CFrame * CFrame.new(0, 5, 0)
        for r3_33, r4_33 in pairs(r5_29:GetChildren()) do
          if r4_33:IsA("LocalScript") then
            local r5_33 = r4_33:Clone()
            r5_33.Disabled = true
            r5_33.Parent = r7_29
          end
        end
        if r2_29 then
          for r3_33, r4_33 in pairs(r7_29:GetDescendants()) do
            if r4_33:IsA("BasePart") then
              r4_33.Transparency = 0.7
            end
          end
        end
        r5_29.Humanoid.Died:Connect(function()
          r5_29:Destroy()
          r7_29:Destroy()
        end)
        r4_29.CharacterAppearanceLoaded:Connect(RealCharacterDied)
      end
      r5_29.Humanoid.Died:Connect(function()
        r5_29:Destroy()
        r7_29:Destroy()
      end)
      r4_29.CharacterAppearanceLoaded:Connect(RealCharacterDied)
      local r10_29 = nil
      game:GetService("RunService").RenderStepped:Connect(function()
        if r10_29 ~= nil then
          r10_29.CFrame = r8_29.CFrame * CFrame.new(0, 5, 0)
        end
        if r3_29 then
        end
      end)
      r10_29 = r7_29.HumanoidRootPart
      local function r11_29()
        if r6_29 == false then
          r5_29.HumanoidRootPart.CFrame = r7_29.HumanoidRootPart.CFrame
          r7_29.HumanoidRootPart.CFrame = r5_29.HumanoidRootPart.CFrame
          r5_29.Humanoid:UnequipTools()
          r4_29.Character = r7_29
          workspace.CurrentCamera.CameraSubject = r7_29.Humanoid
          r10_29 = r5_29.HumanoidRootPart
          for r4_31, r5_31 in pairs(r7_29:GetChildren()) do
            if r5_31:IsA("LocalScript") then
              r5_31.Disabled = false
            end
          end
          r6_29 = true
        else
          r7_29.HumanoidRootPart.CFrame = r5_29.HumanoidRootPart.CFrame
          r5_29.HumanoidRootPart.CFrame = r7_29.HumanoidRootPart.CFrame
          r7_29.Humanoid:UnequipTools()
          r4_29.Character = r5_29
          workspace.CurrentCamera.CameraSubject = r5_29.Humanoid
          r10_29 = r7_29.HumanoidRootPart
          for r4_31, r5_31 in pairs(r7_29:GetChildren()) do
            if r5_31:IsA("LocalScript") then
              r5_31.Disabled = true
            end
          end
          r6_29 = false
        end
      end
      r8_3.InputBegan:Connect(function(r0_30, r1_30)
        if r1_30 then
          return 
        end
        if r0_30.KeyCode.Name:lower() == r1_29:lower() and r9_29 and r5_29 and r7_29 and r5_29:FindFirstChild("HumanoidRootPart") and r7_29:FindFirstChild("HumanoidRootPart") then
          r11_29()
        end
      end)
    end,
  }
  r59_3 = r48_3:CreateButton(r61_3)
  local r62_3 = "CreateLabel"
  r62_3 = "ESP Players"
  r60_3 = r48_3:CreateLabel(r62_3)
  local r63_3 = "CreateButton"
  r63_3 = {
    Name = "ESP Highlight Name & Health",
    Interact = "ESP",
    Callback = function()
      local r0_5 = Color3.fromRGB(255, 18, 30)
      local r1_5 = "AlwaysOnTop"
      local r2_5 = 0.7
      local r3_5 = Color3.fromRGB(255, 255, 255)
      local r4_5 = 0
      local r5_5 = game:FindService("CoreGui")
      local r6_5 = {}
      local r7_5 = Instance.new("Folder")
      r7_5.Parent = r5_5
      r7_5.Name = "Highlight_Storage"
      local function r8_5(r0_6)
        local r1_6 = Instance.new("Highlight")
        r1_6.Name = r0_6.Name
        r1_6.FillColor = r0_5
        r1_6.DepthMode = r1_5
        r1_6.FillTransparency = r2_5
        r1_6.OutlineColor = r3_5
        r1_6.OutlineTransparency = 0
        r1_6.Parent = r7_5
        local r2_6 = r0_6.Character
        if r2_6 then
          r1_6.Adornee = r2_6
        end
        r6_5[r0_6] = r0_6.CharacterAdded:Connect(function(r0_7)
          r1_6.Adornee = r0_7
        end)
      end
      r0_3.PlayerAdded:Connect(r8_5)
      local r9_5 = next
      local r10_5, r11_5 = r0_3:GetPlayers()
      for r12_5, r13_5 in r9_5, r10_5, r11_5 do
        if r13_5.Name ~= r2_3 then
          r8_5(r13_5)
        end
      end
      r0_3.PlayerRemoving:Connect(function(r0_10)
        local r1_10 = r0_10.Name
        if r7_5[r1_10] then
          r7_5[r1_10]:Destroy()
        end
        if r6_5[r0_10] then
          r6_5[r0_10]:Disconnect()
        end
      end)
      function ApplyESP(r0_12)
        if r0_12.Character and r0_12.Character:FindFirstChildOfClass("Humanoid") then
          r0_12.Character.Humanoid.NameDisplayDistance = 9000000000
          r0_12.Character.Humanoid.NameOcclusion = "NoOcclusion"
          r0_12.Character.Humanoid.HealthDisplayDistance = 9000000000
          r0_12.Character.Humanoid.HealthDisplayType = "AlwaysOn"
          r0_12.Character.Humanoid.Health = r0_12.Character.Humanoid.Health
        end
      end
      for r12_5, r13_5 in pairs(game:GetService("Players"):GetPlayers()) do
        ApplyESP(r13_5)
        r13_5.CharacterAdded:Connect(function()
          task.wait(0.33)
          ApplyESP(r13_5)
        end)
        -- close: r12_5
      end
      game:GetService("Players").PlayerAdded:Connect(function(r0_8)
        ApplyESP(r0_8)
        r0_8.CharacterAdded:Connect(function()
          task.wait(0.33)
          ApplyESP(r0_8)
        end)
      end)
    end,
  }
  r61_3 = r48_3:CreateButton(r63_3)
  local r64_3 = "CreateLabel"
  r64_3 = "Clothing"
  r62_3 = r48_3:Clothing(r64_3)
  local r65_3 = "CreateButton"
  r65_3 = {
    Name = "PoliceUniform",
    Interact = "",
    Callback = function()
      local r1_47 = nil
      r1_47 = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
      for r5_47, r6_47 in pairs(workspace.ServerFurniture:GetDescendants()) do
        if r6_47:IsA("Model") and r6_47:GetAttribute("furnitureName") == "PoliceUniform" then
          game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = r6_47.PrimaryPart.CFrame
          task.wait(0.6)
          fireproximityprompt(r6_47.Handle.ProximityPrompt)
          task.wait(0.2)
          game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = r1_47
        end
      end
      local r3_47 = nil
      r3_47 = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
      for r7_47, r8_47 in pairs(workspace.ServerFurniture:GetDescendants()) do
        if r8_47:IsA("Model") and r8_47:GetAttribute("furnitureName") == "PoliceHat" then
          game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = r8_47.PrimaryPart.CFrame
          task.wait(0.6)
          fireproximityprompt(r8_47.Hitbox.ProximityPrompt)
          task.wait(0.2)
          game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = r3_47
        end
      end
    end,
  }
  r63_3 = r48_3:CreateButton(r65_3)
  local r66_3 = "CreateButton"
  r66_3 = {
    Name = "Clown Hat",
    Interact = "",
    Callback = function()
      local r1_97 = nil
      r1_97 = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
      for r5_97, r6_97 in pairs(workspace.ServerFurniture:GetDescendants()) do
        if r6_97:GetAttribute("furnitureName") == "Clown" then
          game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = r6_97.WorldPivot * CFrame.new(0, 0, 3)
          task.wait(0.7)
          fireproximityprompt(r6_97.Hitbox.ProximityPrompt)
          task.wait(0.4)
          game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = r1_97
        end
      end
    end,
  }
  r64_3 = r48_3:CreateButton(r66_3)
  local r67_3 = "CreateDropdown"
  r67_3 = {
    Name = "Animations",
    Options = r29_3,
    CurrentOption = "",
    MultiSelection = false,
    Flag = "Animss",
    Callback = function(r0_271)
      SelectedAnim = r0_271
      local r1_271 = r1_3.Character.Animate
      local r2_271 = game:GetService("ReplicatedStorage").Anims
      r1_271.idle.Animation1.AnimationId = r2_271[SelectedAnim].AnimationId
      r1_271.idle.Animation2.AnimationId = r2_271[SelectedAnim].AnimationId
      r1_271.walk:FindFirstChildWhichIsA("Animation").AnimationId = r2_271[SelectedAnim].AnimationId
      r1_271.run:FindFirstChildWhichIsA("Animation").AnimationId = r2_271[SelectedAnim].AnimationId
      r1_271.jump:FindFirstChildWhichIsA("Animation").AnimationId = r2_271[SelectedAnim].AnimationId
      r1_271.swim:FindFirstChildWhichIsA("Animation").AnimationId = r2_271[SelectedAnim].AnimationId
      r1_271.climb:FindFirstChildWhichIsA("Animation").AnimationId = r2_271[SelectedAnim].AnimationId
      r1_271.swimidle:FindFirstChildWhichIsA("Animation").AnimationId = r2_271[SelectedAnim].AnimationId
      r1_271.fall:FindFirstChildWhichIsA("Animation").AnimationId = r2_271[SelectedAnim].AnimationId
    end,
  }
  r65_3 = r48_3:CreateDropdown(r67_3)
  local r68_3 = "CreateTab"
  r68_3 = "Players"
  r66_3 = r43_3:Players(r68_3, 13289762774)
  local r69_3 = "CreateDropdown"
  r69_3 = {
    Name = "Players",
    Options = r28_3,
    CurrentOption = "",
    MultiSelection = false,
    Flag = "PlayerTP",
    Callback = function(r0_224)
      PlayerTP = r0_224
    end,
  }
  r67_3 = r66_3:CreateDropdown(r69_3)
  local r70_3 = "CreateButton"
  r70_3 = {
    Name = "Rescan",
    Interact = "",
    Callback = function()
      r28_3 = {}
      for r3_262, r4_262 in pairs(r0_3:GetPlayers()) do
        if r4_262.Name ~= r2_3 then
          table.insert(r28_3, r4_262.Name)
        end
      end
      r67_3:Refresh(r28_3)
    end,
  }
  r68_3 = r66_3:CreateButton(r70_3)
  local r71_3 = "CreateButton"
  r71_3 = {
    Name = "TP",
    Interact = "",
    Callback = function()
      if r0_3[PlayerTP].UserId ~= r17_3[table.find(r17_3, r0_3[PlayerTP].UserId)] then
        Teleport(r0_3[PlayerTP].Character:FindFirstChild("HumanoidRootPart").CFrame)
      end
    end,
  }
  r69_3 = r66_3:CreateButton(r71_3)
  local r72_3 = "CreateToggle"
  r72_3 = {
    Name = "Spectate Selected Player",
    Info = "",
    CurrentValue = false,
    Flag = "specplr",
    Callback = function(r0_114)
      getgenv().specplayer = r0_114
      while getgenv().specplayer == true do
        task.wait(0.2)
        local r1_114 = getgenv().specplayer
        if r1_114 == true then
          r1_114 = r0_3[PlayerTP].Character
          if r1_114 then
            r1_114 = r0_3[PlayerTP].Character:FindFirstChild("Humanoid")
            if r1_114 then
              r1_114 = workspace.CurrentCamera
              r1_114.CameraSubject = r0_3[PlayerTP].Character:FindFirstChild("Humanoid")
            end
          end
        end
        r1_114 = getgenv().specplayer
        if r1_114 == true then
          r1_114 = r0_3[PlayerTP].Character
          if not r1_114 then
            r1_114 = workspace.CurrentCamera
            r1_114.CameraSubject = r5_3
          end
        end
        r1_114 = getgenv().specplayer
        if r1_114 == false then
          r1_114 = workspace.CurrentCamera
          r1_114.CameraSubject = r5_3
        end
      end
    end,
  }
  r70_3 = r66_3:CreateToggle(r72_3)
  local r73_3 = "CreateToggle"
  r73_3 = {
    Name = "Auto TP Selected Player",
    Info = "Loop Teleport To Selected Player",
    CurrentValue = false,
    Flag = "AutoTpPlayer",
    Callback = function(r0_42)
      getgenv().TPPlayer = r0_42
      while getgenv().TPPlayer == true do
        local r1_42 = nil
        r1_42 = r6_3.CFrame
        aptpdfuncc = aptpdfunc or 3.8
        if r5_3.Health > 5 and r0_3[PlayerTP].UserId ~= r17_3[table.find(r17_3, r0_3[PlayerTP].UserId)] and r0_3[PlayerTP].Character and r0_3[PlayerTP].Character:FindFirstChild("HumanoidRootPart") and r0_3[PlayerTP].Character:FindFirstChild("Humanoid") then
          while true do
            task.wait()
            aptpdfuncc = aptpdfunc or 4
            local r2_42 = r0_3[PlayerTP].UserId
            local r7_42 = PlayerTP
            local r4_42 = table.find(r17_3, r0_3[r7_42].UserId)
            local r3_42 = r17_3[r4_42]
            if r2_42 ~= r3_42 then
              r3_42 = PlayerTP
              r2_42 = r0_3[r3_42].Character
              if r2_42 then
                r2_42 = r0_3[PlayerTP].Character:FindFirstChild("HumanoidRootPart")
                if r2_42 then
                  r2_42 = r0_3[PlayerTP].Character:FindFirstChild("Humanoid")
                  if r2_42 then
                    r2_42 = r6_3
                    r4_42 = CFrame.new(0, 0, aptpdfuncc)
                    r3_42 = r0_3[PlayerTP].Character:FindFirstChild("HumanoidRootPart").CFrame * r4_42
                    r2_42.CFrame = r3_42
                  end
                end
              end
            end
            r2_42 = getgenv().TPPlayer
            if r2_42 ~= false then
              r3_42 = PlayerTP
              r2_42 = r0_3[r3_42].Character
              if r2_42 == nil then
              end
            else
              break
            end
          end
        elseif r5_3.Health < 5 then
          r5_3.Health = die
        end
        r6_3.CFrame = r1_42
        r7_3.RenderStepped:Wait()
      end
    end,
  }
  r71_3 = r66_3:CreateToggle(r73_3)
  local r74_3 = "CreateToggle"
  r74_3 = {
    Name = "Auto Kill Selected Player",
    Info = "",
    CurrentValue = false,
    Flag = "AutokillTpPlayer",
    Callback = function(r0_40)
      getgenv().TPKillPlayer = r0_40
      while getgenv().TPKillPlayer == true do
        task.wait(0.03)
        local r1_40 = aptpdfunc or 3.8
        aptpdfuncc = r1_40
        r1_40 = aptpdfuncunder or -18
        aptpdfuncunderu = r1_40
        r1_40 = nil
        r1_40 = GetEquippedName()
        local r2_40 = nil
        r2_40 = r1_40
        local r3_40 = nil
        r3_40 = r6_3.CFrame
        if r5_3.Health > 50 then
          if r5_3.Sit ~= true and r0_3[PlayerTP].Character and r0_3[PlayerTP].Character:FindFirstChild("HumanoidRootPart") and r0_3[PlayerTP].Character:FindFirstChild("Humanoid") and r0_3[PlayerTP].Character:FindFirstChild("Humanoid").Health > 1 and r0_3[PlayerTP].Character:FindFirstChild("Humanoid").Jump == false and not r0_3[PlayerTP].Character:FindFirstChild("ForceField") then
            while true do
              task.wait()
              aptpdfuncc = aptpdfunc or 3.8
              local r4_40 = aptpdfuncunder or -18
              aptpdfuncunderu = r4_40
              local r5_40 = PlayerTP
              r4_40 = r0_3[r5_40].Character
              if r4_40 then
                r4_40 = r0_3[PlayerTP].Character:FindFirstChild("HumanoidRootPart")
                if r4_40 then
                  r4_40 = r0_3[PlayerTP].Character:FindFirstChild("Humanoid")
                  if r4_40 then
                    r4_40 = r0_3[PlayerTP].Character:FindFirstChild("Humanoid").Health
                    if r4_40 > 1 then
                      r4_40 = r0_3[PlayerTP].Character:FindFirstChild("ForceField")
                      if not r4_40 then
                        equip("Fists")
                        workspace.CurrentCamera.CameraSubject = r0_3[PlayerTP].Character.Humanoid
                        r6_3.CFrame = r0_3[PlayerTP].Character:FindFirstChild("HumanoidRootPart").CFrame * CFrame.new(0, aptpdfuncunderu, aptpdfuncc)
                        killfunc(r0_3[PlayerTP])
                        stompfunc(r0_3[PlayerTP])
                      end
                    end
                  end
                end
              end
              r4_40 = getgenv().TPKillPlayer
              if r4_40 ~= false then
                r5_40 = PlayerTP
                r4_40 = r0_3[r5_40].Character
                if r4_40 ~= nil then
                  r4_40 = r0_3[PlayerTP].Character:FindFirstChild("Humanoid").Health
                  if r4_40 >= 1 then
                    r4_40 = r0_3[PlayerTP].Character:FindFirstChild("ForceField")
                    if not r4_40 then
                      r4_40 = r5_3.Sit
                      if r4_40 ~= true then
                        r4_40 = r5_3.Health
                        if r4_40 < 50 then
                          break
                        end
                      else
                        break
                      end
                    else
                      break
                    end
                  else
                    break
                  end
                else
                  break
                end
              else
                break
              end
            end
            workspace.CurrentCamera.CameraSubject = r5_3
            r6_3.CFrame = r3_40
            task.wait()
            equip(r2_40)
          elseif r5_3.Sit == true then
            r5_3.Jump = true
          end
        elseif r5_3.Health < 50 then
          r5_3.Health = die
        end
      end
    end,
  }
  r72_3 = r66_3:CreateToggle(r74_3)
  local r75_3 = "CreateSlider"
  r75_3 = {
    Name = "CFrame Back Position",
    Range = {
      -60,
      60
    },
    Increment = 0.1,
    Suffix = "Distance",
    CurrentValue = 0,
    Flag = "cframeback",
    Callback = function(r0_214)
      aptpdfunc = r0_214
    end,
  }
  r73_3 = r66_3:CreateSlider(r75_3)
  local r76_3 = "CreateSlider"
  r76_3 = {
    Name = "CFrame Under Position",
    Range = {
      -22,
      22
    },
    Increment = 0.1,
    Suffix = "Distance",
    CurrentValue = 0,
    Flag = "cframeunder",
    Callback = function(r0_256)
      aptpdfuncunder = r0_256
    end,
  }
  r74_3 = r66_3:CreateSlider(r76_3)
  local r77_3 = "CreateToggle"
  r77_3 = {
    Name = "Fling Selected Player",
    Info = "",
    CurrentValue = false,
    Flag = "flingplr",
    Callback = function(r0_133)
      getgenv().flingpowert = r0_133
      local r1_133 = nil
      r1_133 = r6_3.CFrame
      local r2_133 = nil
      r2_133 = r6_3.AssemblyLinearVelocity
      while getgenv().flingpowert == true do
        task.wait(0.1)
        local r3_133 = r0_3[PlayerTP].Character
        if r3_133 then
          r3_133 = r0_3[PlayerTP].Character:FindFirstChild("HumanoidRootPart")
          if r3_133 then
            r3_133 = r0_3[PlayerTP].Character:FindFirstChild("Humanoid")
            if r3_133 then
              r3_133 = r6_3
              if r3_133 then
                while true do
                  task.wait()
                  r3_133 = r0_3[PlayerTP].Character
                  if r3_133 then
                    r3_133 = r0_3[PlayerTP].Character:FindFirstChild("HumanoidRootPart")
                    if r3_133 then
                      r3_133 = r0_3[PlayerTP].Character:FindFirstChild("Humanoid")
                      if r3_133 then
                        r3_133 = r6_3
                        if r3_133 then
                          r6_3.CFrame = r0_3[PlayerTP].Character.HumanoidRootPart.CFrame
                          r3_133 = r6_3
                          local r4_133 = Vector3.new(getgenv().flingpower, getgenv().flingpower, getgenv().flingpower)
                          r3_133.AssemblyLinearVelocity = r4_133
                        end
                      end
                    end
                  end
                  r3_133 = getgenv().flingpowert
                  if r3_133 ~= false then
                    r3_133 = r0_3[PlayerTP].Character.Humanoid.FloorMaterial
                    local r4_133 = Enum.Material.Air
                    if r3_133 == r4_133 then
                      break
                    end
                  else
                    break
                  end
                end
                task.wait(0.1)
                r6_3.AssemblyLinearVelocity = r2_133
                r3_133 = r6_3
                r3_133.CFrame = r1_133
              end
            end
          end
        end
      end
    end,
  }
  r75_3 = r66_3:CreateToggle(r77_3)
  local r78_3 = "CreateSlider"
  r78_3 = {
    Name = "Fling Player [Set Power]",
    Range = {
      0,
      999999
    },
    Increment = 0.1,
    Suffix = "Fling Power",
    CurrentValue = 0,
    Flag = "flngplrpwr",
    Callback = function(r0_180)
      getgenv().flingpower = r0_180
    end,
  }
  r76_3 = r66_3:CreateSlider(r78_3)
  local r79_3 = "CreateLabel"
  r79_3 = "Kill All"
  r77_3 = r66_3:CreateLabel(r79_3)
  killplrsmodess = {
    "All",
    "Nearest"
  }
  local r80_3 = "CreateDropdown"
  r80_3 = {
    Name = "Kill All Players Mode",
    Options = killplrsmodess,
    CurrentOption = "",
    MultiSelection = false,
    Flag = "modessssaplr",
    Callback = function(r0_38)
      selectedmodekillplrs = r0_38
    end,
  }
  r78_3 = r66_3:CreateDropdown(r80_3)
  local r81_3 = "CreateToggle"
  r81_3 = {
    Name = "Auto Kill All",
    Info = "Kills All",
    CurrentValue = false,
    Flag = "Autokillall",
    Callback = function(r0_234)
      getgenv().AutoKillAll = r0_234
      while getgenv().AutoKillAll == true do
        task.wait(0.05)
        local r1_234 = selectedmodekillplrs or "All"
        selectedmodekillplrsfunc = r1_234
        r1_234 = nil
        r1_234 = GetEquipped()
        aptpdfuncc = aptpdfunc or 3.8
        killallwhendis = getgenv().killalldisfunc or 60
        aptpdfuncunderu = aptpdfuncunder or -20
        friendnokill = getFriends()
        equippedName = GetEquippedName()
        local r2_234 = getPlayers()
        local r3_234 = nil
        r3_234 = r6_3.CFrame
        if selectedmodekillplrsfunc == "Nearest" and #getPlayers() > 0 then
          local r4_234 = getPlayers()[math.random(1, #getPlayers())]
          if r1_3.Character and r1_3.Character:FindFirstChild("HumanoidRootPart") and r1_3.Character:FindFirstChild("Humanoid") then
            if r5_3.Health > 50 then
              if r1_3.Character:FindFirstChild("Humanoid").Sit == false and r4_234.Character and r4_234.Character:FindFirstChild("HumanoidRootPart") and r4_234.Character:FindFirstChild("Humanoid") and r4_234.Character:FindFirstChild("Humanoid").Jump == false and r4_234.Character:FindFirstChild("Head") and not r4_234.Character:FindFirstChild("ForceField") then
                dis = (r1_3.Character.HumanoidRootPart.Position - r4_234.Character.HumanoidRootPart.Position).magnitude
                if dis <= killallwhendis and r4_234.Name ~= r2_3 and friendnokill[table.find(friendnokill, r4_234.Name)] ~= r4_234.Name and r11_3[table.find(r11_3, r4_234.Name)] ~= r4_234.Name and r17_3[table.find(r17_3, r4_234.UserId)] ~= r4_234.UserId and r4_234.Character.Humanoid.Health > 1 then
                  while true do
                    task.wait()
                    selectedmodekillplrsfunc = selectedmodekillplrs or "All"
                    local r5_234 = getgenv().killalldisfunc or 60
                    killallwhendis = r5_234
                    r5_234 = aptpdfunc or 3.8
                    aptpdfuncc = r5_234
                    r5_234 = aptpdfuncunder or -20
                    aptpdfuncunderu = r5_234
                    r5_234 = r1_3.Character
                    if r5_234 then
                      r5_234 = r1_3.Character:FindFirstChild("HumanoidRootPart")
                      if r5_234 then
                        r5_234 = r1_3.Character:FindFirstChild("Humanoid")
                        if r5_234 then
                          r5_234 = r4_234.Character
                          if r5_234 then
                            r5_234 = r4_234.Character:FindFirstChild("HumanoidRootPart")
                            if r5_234 then
                              r5_234 = r4_234.Character:FindFirstChild("Humanoid")
                              if r5_234 then
                                r5_234 = r4_234.Character:FindFirstChild("Humanoid").Jump
                                if r5_234 == false then
                                  r5_234 = r4_234.Character:FindFirstChild("Head")
                                  if r5_234 then
                                    r5_234 = r4_234.Character:FindFirstChild("ForceField")
                                    if not r5_234 then
                                      dis = (r1_3.Character.HumanoidRootPart.Position - r4_234.Character.HumanoidRootPart.Position).magnitude
                                      r5_234 = dis
                                      local r6_234 = killallwhendis
                                      if r5_234 <= r6_234 then
                                        r5_234 = r4_234.Name
                                        r6_234 = r2_3
                                        if r5_234 ~= r6_234 then
                                          r5_234 = friendnokill[table.find(friendnokill, r4_234.Name)]
                                          r6_234 = r4_234.Name
                                          if r5_234 ~= r6_234 then
                                            r5_234 = r11_3[table.find(r11_3, r4_234.Name)]
                                            r6_234 = r4_234.Name
                                            if r5_234 ~= r6_234 then
                                              r5_234 = r17_3[table.find(r17_3, r4_234.UserId)]
                                              r6_234 = r4_234.UserId
                                              if r5_234 ~= r6_234 then
                                                r5_234 = r4_234.Character.Humanoid.Health
                                                if r5_234 > 1 then
                                                  equipHash("Fists")
                                                  workspace.CurrentCamera.CameraSubject = r4_234.Character.Humanoid
                                                  r6_3.CFrame = CFrame.lookAt(r6_3.Position, r4_234.Character:FindFirstChild("HumanoidRootPart").Position)
                                                  r6_3.CFrame = r4_234.Character:FindFirstChild("HumanoidRootPart").CFrame * CFrame.new(0, aptpdfuncunderu, aptpdfuncc)
                                                  killfunc(r4_234)
                                                  stompfunc(r4_234)
                                                end
                                              end
                                            end
                                          end
                                        end
                                      end
                                    end
                                  end
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                    r5_234 = getgenv().AutoKillAll
                    if r5_234 ~= false then
                      r5_234 = r4_234.Character
                      if r5_234 ~= nil then
                        r5_234 = r4_234.Character:FindFirstChild("ForceField")
                        if not r5_234 then
                          r5_234 = r4_234.Character:FindFirstChild("Humanoid").Health
                          if r5_234 >= 1 then
                            r5_234 = r1_3.Character:FindFirstChild("Humanoid").Sit
                            if r5_234 ~= true then
                              r5_234 = r5_3.Health
                              if r5_234 >= 50 then
                                r5_234 = selectedmodekillplrsfunc
                                if r5_234 ~= "Nearest" then
                                  break
                                end
                              else
                                break
                              end
                            else
                              break
                            end
                          else
                            break
                          end
                        else
                          break
                        end
                      else
                        break
                      end
                    else
                      break
                    end
                  end
                  if r4_234.Character and r4_234.Character:FindFirstChild("Head") then
                    r6_3.CFrame = r4_234.Character:FindFirstChild("Head").CFrame
                  end
                  r6_3.CFrame = r3_234
                  workspace.CurrentCamera.CameraSubject = r5_3
                  equipHash(r1_234)
                end
              elseif r1_3.Character and r1_3.Character:FindFirstChild("Humanoid").Sit == true then
                r1_3.Character.Humanoid.Jump = true
              end
            elseif r5_3.Health < 50 then
              r5_3.Health = die
            end
          end
        elseif selectedmodekillplrsfunc == "All" then
          killAllPlayers()
        end
      end
    end,
  }
  r79_3 = r66_3:CreateToggle(r81_3)
  local r82_3 = "CreateSlider"
  r82_3 = {
    Name = "Distance KillAll",
    Range = {
      0,
      250
    },
    Increment = 0.1,
    Suffix = "Distance",
    CurrentValue = 0.001,
    Flag = "diskillall",
    Callback = function(r0_169)
      getgenv().killalldisfunc = r0_169
    end,
  }
  r80_3 = r66_3:CreateSlider(r82_3)
  local r83_3 = "CreateLabel"
  r83_3 = "LoopBring [Client-Sided]"
  r81_3 = r66_3:CreateLabel(r83_3)
  local r84_3 = "CreateDropdown"
  r84_3 = {
    Name = "Players",
    Options = r28_3,
    CurrentOption = "",
    MultiSelection = false,
    Flag = "briPLayer",
    Callback = function(r0_270)
      Loopb = r0_270
    end,
  }
  r82_3 = r66_3:CreateDropdown(r84_3)
  local r85_3 = "CreateButton"
  r85_3 = {
    Name = "Rescan",
    Interact = "",
    Callback = function()
      r28_3 = {}
      for r3_111, r4_111 in pairs(r0_3:GetPlayers()) do
        if r4_111.Name ~= r2_3 then
          table.insert(r28_3, r4_111.Name)
        end
      end
      r82_3:Refresh(r28_3)
    end,
  }
  r83_3 = r66_3:CreateButton(r85_3)
  local r86_3 = "CreateToggle"
  r86_3 = {
    Name = "Auto Bring",
    Info = "Loop Teleport To Selected Player",
    CurrentValue = false,
    Flag = "loopbring",
    Callback = function(r0_241)
      getgenv().loopbring = r0_241
      while getgenv().loopbring == true do
        local r1_241 = r0_3[Loopb].Character
        if r1_241 then
          r1_241 = r0_3[Loopb].Character:FindFirstChild("HumanoidRootPart")
          if r1_241 then
            r1_241 = r0_3[Loopb].Character:FindFirstChild("HumanoidRootPart")
            r1_241.CFrame = r6_3.CFrame * CFrame.new(3, 0, -4)
          end
        end
        r7_3.Heartbeat:Wait()
      end
    end,
  }
  r84_3 = r66_3:CreateToggle(r86_3)
  local r87_3 = "CreateLabel"
  r87_3 = "PlayerCash"
  r85_3 = r66_3:PlayerCash(r87_3)
  local r88_3 = "CreateDropdown"
  r88_3 = {
    Name = "Player Cash",
    Options = r28_3,
    CurrentOption = "",
    MultiSelection = false,
    Flag = "PLayerCash",
    Callback = function(r0_135)
      Mon = r0_135
      r42_3:Notify({
        Title = "Cash Check",
        Content = Mon .. " Currently Has " .. r0_3[Mon].stats.Money.Value,
        Image = 14219740649,
      })
    end,
  }
  r86_3 = r66_3:CreateDropdown(r88_3)
  local r89_3 = "CreateButton"
  r89_3 = {
    Name = "Rescan ",
    Interact = "",
    Callback = function()
      r28_3 = {}
      for r3_157, r4_157 in pairs(r0_3:GetPlayers()) do
        if r4_157.Name ~= r2_3 then
          table.insert(r28_3, r4_157.Name)
        end
      end
      r86_3:Refresh(r28_3)
    end,
  }
  r87_3 = r66_3:CreateButton(r89_3)
  local r90_3 = "CreateTab"
  r90_3 = "Risky"
  r88_3 = r43_3:Risky(r90_3, 12077205368)
  local r91_3 = "CreateLabel"
  r91_3 = "Kill Aura & AutoStomp"
  r89_3 = r88_3:CreateLabel(r91_3)
  local r92_3 = "CreateToggle"
  r92_3 = {
    Name = "Kill Aura",
    CurrentValue = false,
    Flag = "killauraog",
    Callback = function(r0_64)
      getgenv().killaura = r0_64
      while getgenv().killaura == true do
        friendnokill = getFriends()
        local r1_64 = kvald or 15
        kvvald = r1_64
        plr = game:GetService("Players")
        r1_3 = plr.LocalPlayer
        r1_64 = next
        local r2_64, r3_64 = plr:GetPlayers()
        for r4_64, r5_64 in r1_64, r2_64, r3_64 do
          if r1_3.Character and r1_3.Character:FindFirstChild("HumanoidRootPart") then
            r2_3 = r1_3.Name
            lphumrootpart = r1_3.Character.HumanoidRootPart
            if r5_64.Character and not r5_64.Character:FindFirstChild("ForceField") and r5_64.Character:FindFirstChild("HumanoidRootPart") and r5_64.Character:FindFirstChild("Humanoid") then
              vchar = r5_64.Character
              vuserid = r5_64.UserId
              vname = r5_64.Name
              vhumrootpart = r5_64.Character.HumanoidRootPart
              vhumanoid = r5_64.Character.Humanoid
              dis = (lphumrootpart.Position - vhumrootpart.Position).Magnitude
              if GetEquippedName() == "Fists" and r2_3 ~= vname and friendnokill[table.find(friendnokill, vname)] ~= vname and r11_3[table.find(r11_3, vname)] ~= vname and r17_3[table.find(r17_3, vuserid)] ~= vuserid and dis <= kvvald and vhumanoid.Health ~= 0 and 7 < vhumanoid.Health then
                local r6_64 = {
                  [1] = "player",
                }
                local r7_64 = {
                  meleeType = dmgt or "meleemegapunch",
                  hitPlayerId = vuserid,
                }
                r6_64[2] = r7_64
                args = r6_64
                reqload = require(game:GetService("ReplicatedStorage").devv).load
                loader = reqload("Signal")
                loader.FireServer("meleeItemHit", unpack(args))
              end
            end
          end
        end
        r7_3.RenderStepped:Wait()
      end
    end,
  }
  r90_3 = r88_3:CreateToggle(r92_3)
  local r93_3 = "CreateToggle"
  r93_3 = {
    Name = "KillAura While Knocked [TESTING]",
    CurrentValue = false,
    Flag = "kwkno",
    Callback = function(r0_257)
      getgenv().autofist = r0_257
      Signals = game:GetService("ReplicatedStorage"):WaitForChild("devv"):WaitForChild("client"):WaitForChild("Helpers"):WaitForChild("remotes"):WaitForChild("Signal")
      if getgenv().autofist == true then
        local r1_257 = next
        local r2_257, r3_257 = getupvalue(require(Signals).FireServer, 1)
        for r4_257, r5_257 in r1_257, r2_257, r3_257 do
          if getgenv().autofist == true then
            r5_257.Name = r4_257
            getgenv().dehashConn = r5_257:GetPropertyChangedSignal("Name"):Connect(function()
              r5_257.Name = r4_257
            end)
          end
          -- close: r4_257
        end
      elseif getgenv().autofist == false then
        getgenv().dehashConn:Disconnect()
      end
    end,
  }
  r91_3 = r88_3:CreateToggle(r93_3)
  local r94_3 = "CreateDropdown"
  r94_3 = {
    Name = "Damage Type",
    Options = r36_3,
    CurrentOption = "",
    MultiSelection = false,
    Flag = "dmgmodess",
    Callback = function(r0_155)
      dmgt = r0_155
    end,
  }
  r92_3 = r88_3:CreateDropdown(r94_3)
  local r95_3 = "CreateSlider"
  r95_3 = {
    Name = "Kill Aura Distance",
    Range = {
      1,
      35
    },
    Increment = 1,
    Suffix = "Distance",
    CurrentValue = 1,
    Flag = "Killauradis",
    Callback = function(r0_179)
      kvald = r0_179
    end,
  }
  r93_3 = r88_3:CreateSlider(r95_3)
  local r96_3 = "CreateToggle"
  r96_3 = {
    Name = "AutoStomp",
    CurrentValue = false,
    Flag = "autostomps",
    Callback = function(r0_153)
      getgenv().autostomp = r0_153
      while getgenv().autostomp == true do
        friendnokill = getFriends()
        plr = game:GetService("Players")
        r1_3 = plr.LocalPlayer
        local r1_153 = next
        local r2_153, r3_153 = plr:GetPlayers()
        for r4_153, r5_153 in r1_153, r2_153, r3_153 do
          if r1_3.Character and r1_3.Character:FindFirstChild("HumanoidRootPart") then
            r2_3 = r1_3.Name
            lphumrootpart = r1_3.Character.HumanoidRootPart
            if r5_153.Character and not r5_153.Character:FindFirstChild("ForceField") and r5_153.Character:FindFirstChild("HumanoidRootPart") and r5_153.Character:FindFirstChild("Humanoid") then
              vchar = r5_153.Character
              vuserid = r5_153.UserId
              vname = r5_153.Name
              vhumrootpart = r5_153.Character.HumanoidRootPart
              vhumanoid = r5_153.Character.Humanoid
              dis = (lphumrootpart.Position - vhumrootpart.Position).Magnitude
              if dis <= 55 and vname ~= r2_3 and friendnokill[table.find(friendnokill, vname)] ~= vname and r11_3[table.find(r11_3, vname)] ~= vname and r17_3[table.find(r17_3, vuserid)] ~= vuserid and r12_3[table.find(r12_3, vname)] ~= vname and vhumanoid.Health < 35 then
                args = {
                  [1] = r5_153,
                }
                reqload = require(game:GetService("ReplicatedStorage").devv).load
                loader = reqload("Signal")
                loader.FireServer("stomp", unpack(args))
              end
            end
          end
        end
        r7_3.RenderStepped:Wait(0.1)
      end
    end,
  }
  r94_3 = r88_3:CreateToggle(r96_3)
  local r97_3 = "CreateLabel"
  r97_3 = "AutoGrab"
  r95_3 = r88_3:AutoGrab(r97_3)
  local r98_3 = "CreateToggle"
  r98_3 = {
    Name = "Auto Grab Nearest Player",
    CurrentValue = false,
    Flag = "grabply",
    Callback = function(r0_185)
      getgenv().autograbv = r0_185
      while getgenv().autograbv == true do
        local r1_185 = pairs
        for r4_185, r5_185 in r1_185(r0_3:GetChildren()) do
          if r5_185.Character and r5_185.Character:FindFirstChild("HumanoidRootPart") and r5_185.Character:FindFirstChild("Humanoid") then
            mp = r5_185.Character:FindFirstChild("HumanoidRootPart")
            distance = (r6_3.Position - mp.Position).magnitude
            if r5_185.Character.Humanoid.Health < 35 and distance <= 50 then
              argsb = {
                [1] = r5_185,
              }
              reqload = require(game:GetService("ReplicatedStorage").devv).load
              loader = reqload("Signal")
              loader.FireServer("grabPlayer", unpack(argsb))
            end
          end
        end
        r7_3.Heartbeat:Wait()
      end
    end,
  }
  r96_3 = r88_3:CreateToggle(r98_3)
  local r99_3 = "CreateLabel"
  r99_3 = "Spam Msg/Call Nearest"
  r97_3 = r88_3:CreateLabel(r99_3)
  tmsgrand = {}
  for r101_3, r102_3 in pairs(chats) do
    table.insert(tmsgrand, r102_3)
  end
  local r100_3 = "CreateToggle"
  r100_3 = {
    Name = "Spam Call/Msg",
    CurrentValue = false,
    Flag = "Magickcall",
    Callback = function(r0_21)
      getgenv().msgswitch = r0_21
      while getgenv().msgswitch == true do
        r7_3.RenderStepped:Wait()
        local r1_21 = msgspamdis or 30
        callspamdisfunc = r1_21
        friendnospam = getFriends()
        r1_21 = pairs
        for r4_21, r5_21 in r1_21(r0_3:GetChildren()) do
          if r5_21.Character and r5_21.Character:FindFirstChild("HumanoidRootPart") and r5_21.Character:FindFirstChild("Humanoid") then
            vuserid = r5_21.UserId
            vname = r5_21.Name
            vchar = r5_21.Character
            vhumrootpart = r5_21.Character.HumanoidRootPart
            vhumanoid = r5_21.Character.Humanoid
            distance = (r6_3.Position - vhumrootpart.Position).magnitude
            if friendnospam[table.find(friendnospam, vname)] ~= vname and r17_3[table.find(r17_3, vuserid)] ~= vuserid and r11_3[table.find(r11_3, vname)] ~= vname and distance <= callspamdisfunc and vname ~= r2_3 and vhumanoid.Health ~= 0 then
              local r6_21 = {
                [1] = vuserid,
                [2] = SpamMsg or tmsgrand[math.random(#tmsgrand)],
              }
              args = r6_21
              sendMessage(args)
              attemptCall(r5_21)
            end
          end
        end
      end
    end,
  }
  r98_3 = r88_3:CreateToggle(r100_3)
  local r101_3 = "CreateSlider"
  r101_3 = {
    Name = "Call/Msg Distance",
    Range = {
      10,
      200
    },
    Increment = 1,
    Suffix = "Distance",
    CurrentValue = 0.01,
    Flag = "msgdis",
    Callback = function(r0_24)
      msgspamdis = r0_24
    end,
  }
  r99_3 = r88_3:CreateSlider(r101_3)
  local r102_3 = "CreateInput"
  r102_3 = {
    Name = "Message to spam",
    PlaceholderText = "TeTraX OnTop!",
    NumbersOnly = false,
    CharacterLimit = 120,
    OnEnter = true,
    RemoveTextAfterFocusLost = false,
    Callback = function(r0_140)
      SpamMsg = r0_140
    end,
  }
  r100_3 = r88_3:CreateInput(r102_3)
  local r103_3 = "CreateLabel"
  r103_3 = "Other"
  r101_3 = r88_3:Other(r103_3)
  local r104_3 = "CreateToggle"
  r104_3 = {
    Name = "Antigrab",
    CurrentValue = false,
    Flag = "Antigrabbe",
    Callback = function(r0_130)
      getgenv().antigrab = r0_130
      while getgenv().antigrab == true do
        antiGrab()
        r7_3.RenderStepped:Wait()
      end
    end,
  }
  r102_3 = r88_3:CreateToggle(r104_3)
  local r105_3 = "CreateToggle"
  r105_3 = {
    Name = "AntiRagdoll",
    CurrentValue = false,
    Flag = "antirag",
    Callback = function(r0_211)
      getgenv().antiragdoll = r0_211
      while getgenv().antiragdoll == true do
        local r1_211 = r1_3:GetAttribute("isRagdoll")
        if r1_211 == true then
          l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage")
          l_load_0 = require(l_ReplicatedStorage_0.devv).load
          v14 = l_load_0("ClientRagdoll")
          task.spawn(v14.SetRagdoll, r1_3, false)
        end
        r7_3.RenderStepped:Wait(0.1)
      end
    end,
  }
  r103_3 = r88_3:CreateToggle(r105_3)
  local r106_3 = "CreateToggle"
  r106_3 = {
    Name = "Silent Block",
    CurrentValue = false,
    Flag = "silentBloc",
    Callback = function(r0_118)
      getgenv().silentblock = r0_118
      if getgenv().silentblock == true then
        getgenv().silentblocker = true
        while getgenv().silentblock == true do
          silentBlock()
          r7_3.RenderStepped:Wait()
        end
      elseif getgenv().silentblock == false then
        getgenv().silentblocker = false
        silentBlock()
      end
    end,
  }
  r104_3 = r88_3:CreateToggle(r106_3)
  local r107_3 = "CreateToggle"
  r107_3 = {
    Name = "Auto Destroy Nearest Vehicle",
    CurrentValue = false,
    Flag = "destroyveh",
    Callback = function(r0_43)
      getgenv().destroyveh = r0_43
      while getgenv().destroyveh == true do
        allfriends = getFriendsID()
        local r1_43 = pairs
        for r4_43, r5_43 in r1_43(workspace.Game.Vehicles:GetChildren()) do
          equippedName = GetEquippedName()
          if r5_43.PrimaryPart then
            distance = (r6_3.Position - r5_43.PrimaryPart.Position).magnitude
            if distance <= 50 and r5_43.Name == r34_3[table.find(r34_3, r5_43.Name)] and r5_43:GetAttribute("owner") ~= r3_3 and r5_43:GetAttribute("owner") ~= allfriends[table.find(allfriends, r5_43:GetAttribute("owner"))] and equippedName == "Fists" and distance <= 50 then
              game:GetService("ReplicatedStorage").devv.remoteStorage[tostring(getupvalue(require(game:GetService("ReplicatedStorage").devv.client.Helpers.remotes.Signal).FireServer, 1).meleeItemHit)]:FireServer(unpack({
                [1] = "vehicle",
                [2] = {
                  meleeType = "meleemegapunch",
                  guid = r5_43.GUID.Value,
                },
              }))
            elseif r5_43.Name == "Armored Truck" and r5_43.Name ~= r34_3[table.find(r34_3, r5_43.Name)] and equippedName == "Fists" and distance <= 50 then
              game:GetService("ReplicatedStorage").devv.remoteStorage[tostring(getupvalue(require(game:GetService("ReplicatedStorage").devv.client.Helpers.remotes.Signal).FireServer, 1).meleeItemHit)]:FireServer(unpack({
                [1] = "vehicle",
                [2] = {
                  meleeType = "meleemegapunch",
                  guid = r5_43.GUID.Value,
                },
              }))
            end
          end
        end
        r7_3.Heartbeat:Wait()
      end
    end,
  }
  r105_3 = r88_3:CreateToggle(r107_3)
  local r108_3 = "CreateTab"
  r108_3 = "Magick Tab"
  r106_3 = r43_3:CreateTab(r108_3, 18380233581)
  local r109_3 = "CreateLabel"
  r109_3 = "HitPart [SET THIS]"
  r107_3 = r106_3:Sliderdisbull(r109_3)
  local r111_3 = "CreateDropdown"
  r111_3 = {
    Name = "Select HitPart [SET THIS]",
    Options = r35_3,
    CurrentOption = "",
    MultiSelection = false,
    Flag = "hitpartg",
    Callback = function(r0_80)
      SelHitpart = r0_80
    end,
  }
  r45_3.Dropdownhitpart = r106_3:CreateLabel(r111_3)
  local r110_3 = "CreateLabel"
  r110_3 = "Magick Bullet"
  r108_3 = r106_3:Slideracidd(r110_3)
  local r112_3 = "CreateToggle"
  r112_3 = {
    Name = "Kill Nearest",
    CurrentValue = false,
    Flag = "MagickBulletsGun",
    Callback = function(r0_115)
      getgenv().magicswitch = r0_115
      if getgenv().magicswitch == true then
        guid = require(game:GetService("ReplicatedStorage").devv.shared.Helpers.string.GUID)
        same = {}
        table.insert(same, guid())
        getgenv().magickkillfunc = r7_3.Heartbeat:connect(function()
          friendnokill = getFriends()
          local r0_116 = SelHitpart or "HumanoidRootPart"
          local r1_116 = GetEquipped()
          local r2_116 = GetEquippedName()
          magdisss = magdis or 80
          r27_3 = require(game:GetService("ReplicatedStorage").devv.client.Objects.v3item)
          for r6_116, r7_116 in pairs(r0_3:GetChildren()) do
            if r1_3.Character and r1_3.Character:FindFirstChild("HumanoidRootPart") and r7_116.Character and r7_116.Character:FindFirstChild("HumanoidRootPart") and r7_116.Character:FindFirstChild("Humanoid") and r7_116.Character:FindFirstChild(r0_116) then
              distance = (r1_3.Character.HumanoidRootPart.Position - r7_116.Character.HumanoidRootPart.Position).magnitude
              if not r7_116.Character:FindFirstChild("ForceField") and r2_116 == tostring(Selammogun) and r7_116.Character.Humanoid.Health ~= 0 and r17_3[table.find(r17_3, r7_116.UserId)] ~= r7_116.UserId and friendnokill[table.find(friendnokill, r7_116.Name)] ~= r7_116.Name and r12_3[table.find(r12_3, r7_116.Name)] ~= r7_116.Name and r11_3[table.find(r11_3, r7_116.Name)] ~= r7_116.Name and distance <= magdisss and r7_116.Name ~= r1_3.Name and 7 < r7_116.Character.Humanoid.Health then
                local r8_116 = {
                  [1] = r1_116,
                }
                r8_116[2] = {
                  [1] = {
                    [1] = same[1],
                    [2] = r7_116.Character:FindFirstChild(r0_116).CFrame,
                  },
                }
                r8_116[3] = fireratem or "auto"
                replicateProjectiles(r8_116)
                projectileHit({
                  [1] = same[1],
                  [2] = "player",
                  [3] = {
                    hitPart = r7_116.Character:FindFirstChild(r0_116),
                    hitPlayerId = r7_116.UserId,
                    hitSize = r7_116.Character:FindFirstChild(r0_116).Size,
                    pos = r7_116.Character:FindFirstChild(r0_116).Position,
                  },
                })
                buyAmmo(r2_116)
                Reload(r1_116)
              end
            end
          end
        end)
      elseif getgenv().magicswitch == false then
        getgenv().magickkillfunc:Disconnect()
      end
    end,
  }
  r45_3.Togglebullet = r106_3:Sliderrpgdis(r112_3)
  r112_3 = "CreateDropdown"
  r112_3 = {
    Name = "Select Ammo [SET THIS]",
    Options = r37_3,
    CurrentOption = "",
    MultiSelection = false,
    Flag = "gunammo",
    Callback = function(r0_48)
      Selammogun = r0_48
    end,
  }
  r45_3.Dropdownselammo = r106_3:Sliderrpgdis(r112_3)
  r112_3 = "CreateDropdown"
  r112_3 = {
    Name = "Fire Rate",
    Options = r23_3,
    CurrentOption = "",
    MultiSelection = false,
    Flag = "gunrate",
    Callback = function(r0_144)
      fireratem = r0_144
    end,
  }
  r45_3.Dropdownfirerate = r106_3:Sliderrpgdis(r112_3)
  r109_3 = "Sliderdisbull"
  r112_3 = "CreateSlider"
  r112_3 = {
    Name = "Magick Bullet Distance",
    Range = {
      1,
      900
    },
    Increment = 1,
    Suffix = "Distance",
    CurrentValue = 1,
    Flag = "bulletdis",
    Callback = function(r0_95)
      magdis = r0_95
    end,
  }
  r45_3[r109_3] = r106_3:Sliderrpgdis(r112_3)
  r111_3 = "CreateLabel"
  r111_3 = "Magick Flame/Acid Hit"
  r109_3 = r106_3:CreateLabel(r111_3)
  local r113_3 = "CreateToggle"
  r113_3 = {
    Name = "Flame/Acid Kill Nearest",
    CurrentValue = false,
    Flag = "MagickAcidGun",
    Callback = function(r0_248)
      getgenv().flameHitPlayer = r0_248
      guid = require(game:GetService("ReplicatedStorage").devv.shared.Helpers.string.GUID)
      same = {}
      table.insert(same, guid())
      while getgenv().flameHitPlayer == true do
        r7_3.Heartbeat:Wait()
        friendnokill = getFriends()
        local r1_248 = SelHitpart or "HumanoidRootPart"
        local r2_248 = GetEquipped()
        local r3_248 = GetEquippedName()
        r27_3 = require(game:GetService("ReplicatedStorage").devv.client.Objects.v3item)
        magdissFlame = magdisFlame or 60
        for r7_248, r8_248 in pairs(r0_3:GetPlayers()) do
          if r8_248.Character and r8_248.Character:FindFirstChild("HumanoidRootPart") and r8_248.Character:FindFirstChild("Humanoid") and r8_248.Character:FindFirstChild(r1_248) and not r8_248.Character:FindFirstChild("ForceField") then
            distance = (r6_3.Position - r8_248.Character:FindFirstChild("HumanoidRootPart").Position).magnitude
            if r3_248 == "Flamethrower" and distance <= magdissFlame and r8_248.Character.Humanoid.Health ~= 0 and friendnokill[table.find(friendnokill, r8_248.Name)] ~= r8_248.Name and r11_3[table.find(r11_3, r8_248.Name)] ~= r8_248.Name and r12_3[table.find(r12_3, r8_248.Name)] ~= r8_248.Name and r17_3[table.find(r17_3, r8_248.UserId)] ~= r8_248.UserId and r8_248.Name ~= r2_3 then
              replicateProjectiles({
                [1] = r2_248,
                [2] = {
                  [1] = {
                    [1] = same[1],
                    [2] = r8_248.Character:FindFirstChild(r1_248).CFrame,
                  },
                },
                [3] = "auto",
              })
              local r10_248 = {
                [1] = same[1],
                [2] = guid(),
                [3] = r8_248.Character:FindFirstChild(r1_248).Position,
              }
              flameHit(r10_248)
              flameHit(r10_248)
              flameHit(r10_248)
              projectileHit({
                [1] = same[1],
                [2] = "player",
                [3] = {
                  hitSize = r8_248.Character:FindFirstChild(r1_248).Size,
                  hitPart = r8_248.Character:FindFirstChild(r1_248),
                  pos = r8_248.Character:FindFirstChild(r1_248).Position,
                  hitPlayerId = r8_248.UserId,
                },
              })
              buyAmmo("Flamethrower")
              Reload(r2_248)
            elseif r3_248 == "Acid Gun" and distance <= magdissFlame and r8_248.Character.Humanoid.Health ~= 0 and friendnokill[table.find(friendnokill, r8_248.Name)] ~= r8_248.Name and r11_3[table.find(r11_3, r8_248.Name)] ~= r8_248.Name and r12_3[table.find(r12_3, r8_248.Name)] ~= r8_248.Name and r17_3[table.find(r17_3, r8_248.UserId)] ~= r8_248.UserId and r8_248.Name ~= r2_3 then
              replicateProjectiles({
                [1] = r2_248,
                [2] = {
                  [1] = {
                    [1] = same[1],
                    [2] = r8_248.Character:FindFirstChild(r1_248).CFrame,
                  },
                },
                [3] = "semi",
              })
              local r10_248 = {
                [1] = same[1],
                [2] = guid(),
                [3] = r8_248.Character:FindFirstChild(r1_248).Position,
              }
              acidHit(r10_248)
              acidHit(r10_248)
              acidHit(r10_248)
              projectileHit({
                [1] = same[1],
                [2] = "player",
                [3] = {
                  hitSize = r8_248.Character:FindFirstChild(r1_248).Size,
                  hitPart = r8_248.Character:FindFirstChild(r1_248),
                  pos = r8_248.Character:FindFirstChild(r1_248).Position,
                  hitPlayerId = r8_248.UserId,
                },
              })
              buyAmmo("Acid Gun")
              Reload(r2_248)
            end
          end
        end
      end
    end,
  }
  r45_3.Toggleacid = r106_3:CreateLabel(r113_3)
  r110_3 = "Slideracidd"
  r113_3 = "CreateSlider"
  r113_3 = {
    Name = "Flame/Acid Distance",
    Range = {
      1,
      900
    },
    Increment = 1,
    Suffix = "Distance",
    CurrentValue = 1,
    Flag = "aciddis",
    Callback = function(r0_141)
      magdisFlame = r0_141
    end,
  }
  r45_3[r110_3] = r106_3:CreateLabel(r113_3)
  r110_3 = {
    "RPG",
    "Trident"
  }
  r113_3 = "CreateLabel"
  r113_3 = "Magick RPG/Trident Spammers"
  r111_3 = r106_3:CreateLabel(r113_3)
  local r115_3 = "CreateToggle"
  r115_3 = {
    Name = "RPG Knock Nearest",
    CurrentValue = false,
    Flag = "rpgspammerog",
    Callback = function(r0_220)
      getgenv().magicswitchRPG = r0_220
      guid = require(game:GetService("ReplicatedStorage").devv.shared.Helpers.string.GUID)
      same = {}
      table.insert(same, guid())
      while getgenv().magicswitchRPG == true do
        r7_3.Heartbeat:Wait()
        friendnokill = getFriends()
        local r1_220 = GetEquippedName()
        local r2_220 = SelHitpart or "HumanoidRootPart"
        local r3_220 = GetEquipped()
        magdisRPGGG = magdisRPG or 100
        rpgwhenn = rpgwhen or 0.3
        for r7_220, r8_220 in pairs(r0_3:GetChildren()) do
          r27_3 = require(game:GetService("ReplicatedStorage").devv.client.Objects.v3item)
          if r8_220.Character and r8_220.Character:FindFirstChild("HumanoidRootPart") and r8_220.Character:FindFirstChild("Humanoid") and r8_220.Character:FindFirstChild(r2_220) then
            distance = (r6_3.Position - r8_220.Character:FindFirstChild("HumanoidRootPart").Position).magnitude
            if r1_220 == "RPG" and friendnokill[table.find(friendnokill, r8_220.Name)] ~= r8_220.Name and r11_3[table.find(r11_3, r8_220.Name)] ~= r8_220.Name and r17_3[table.find(r17_3, r8_220.UserId)] ~= r8_220.UserId and r12_3[table.find(r12_3, r8_220.Name)] ~= r8_220.Name and r8_220.Name ~= r2_3 and distance <= magdisRPGGG and rpgwhenn < r8_220.Character.Humanoid.Health then
              replicateProjectiles({
                [1] = r3_220,
                [2] = {
                  [1] = {
                    [1] = same[1],
                    [2] = r8_220.Character:FindFirstChild(r2_220).CFrame,
                  },
                },
                [3] = "semi",
              })
              local r10_220 = {
                [1] = same[1],
                [2] = guid(),
                [3] = r8_220.Character:FindFirstChild(r2_220).Position,
              }
              rocketHit(r10_220)
              rocketHit(r10_220)
              rocketHit(r10_220)
              rocketHit(r10_220)
              rocketHit(r10_220)
              buyAmmo("RPG")
              Reload(r3_220)
            elseif r1_220 == "Trident" and friendnokill[table.find(friendnokill, r8_220.Name)] ~= r8_220.Name and r11_3[table.find(r11_3, r8_220.Name)] ~= r8_220.Name and r12_3[table.find(r12_3, r8_220.Name)] ~= r8_220.Name and r17_3[table.find(r17_3, r8_220.UserId)] ~= r8_220.UserId and r8_220.Name ~= r2_3 and distance <= magdisRPGGG and rpgwhenn < r8_220.Character.Humanoid.Health then
              replicateProjectiles({
                [1] = r3_220,
                [2] = {
                  [1] = {
                    [1] = same[1],
                    [2] = r8_220.Character:FindFirstChild(r2_220).CFrame,
                  },
                  [2] = {
                    [1] = guid(),
                    [2] = r8_220.Character:FindFirstChild(r2_220).CFrame,
                  },
                  [3] = {
                    [1] = guid(),
                    [2] = r8_220.Character:FindFirstChild(r2_220).CFrame,
                  },
                },
                [3] = "semi",
              })
              local r10_220 = {
                [1] = same[1],
                [2] = guid(),
                [3] = r8_220.Character:FindFirstChild(r2_220).Position,
              }
              rocketHit(r10_220)
              rocketHit(r10_220)
              rocketHit(r10_220)
              rocketHit(r10_220)
              rocketHit(r10_220)
              buyAmmo("Trident")
              Reload(r3_220)
            end
          end
        end
      end
    end,
  }
  r45_3.Togglerpgspamd = r106_3:Sliderspraynear(r115_3)
  r112_3 = "Sliderrpghdiss"
  r115_3 = "CreateSlider"
  r115_3 = {
    Name = "RPG/Trident Enemy Health [SET THIS]",
    Range = {
      1,
      30
    },
    Increment = 1,
    Suffix = "Health",
    CurrentValue = 1,
    Flag = "rpgdishealth",
    Callback = function(r0_188)
      rpgwhen = r0_188
    end,
  }
  r45_3[r112_3] = r106_3:Sliderspraynear(r115_3)
  r112_3 = "Sliderrpgdis"
  r115_3 = "CreateSlider"
  r115_3 = {
    Name = "RPG/Trident Distance [SET THIS]",
    Range = {
      1,
      9999
    },
    Increment = 1,
    Suffix = "Distance",
    CurrentValue = 1,
    Flag = "rpgdis",
    Callback = function(r0_37)
      magdisRPG = r0_37
    end,
  }
  r45_3[r112_3] = r106_3:Sliderspraynear(r115_3)
  r115_3 = "CreateToggle"
  r115_3 = {
    Name = "RPG Lock OnPlayers",
    CurrentValue = false,
    Flag = "rpgspammermultitarget",
    Callback = function(r0_182)
      getgenv().magicswitchRPGP = r0_182
      guid = require(game:GetService("ReplicatedStorage").devv.shared.Helpers.string.GUID)
      same = {}
      table.insert(same, guid())
      while getgenv().magicswitchRPGP == true do
        local r1_182 = SelHitpart or "HumanoidRootPart"
        local r2_182 = GetEquippedName()
        local r3_182 = GetEquipped()
        for r7_182, r8_182 in pairs(r13_3) do
          if r8_182.Character and r8_182.Character:FindFirstChild("HumanoidRootPart") and r8_182.Character:FindFirstChild("Humanoid") and r8_182.Character:FindFirstChild(r1_182) then
            r27_3 = require(game:GetService("ReplicatedStorage").devv.client.Objects.v3item)
            if r2_182 == "RPG" and r8_182.UserId ~= r17_3[table.find(r17_3, r8_182.UserId)] then
              local r9_182 = {
                [1] = r3_182,
              }
              r9_182[2] = {
                [1] = {
                  [1] = same[1],
                  [2] = r8_182.Character:FindFirstChild(r1_182).CFrame,
                },
              }
              r9_182[3] = "semi"
              replicateProjectiles(r9_182)
              local r10_182 = {
                [1] = same[1],
                [2] = guid(),
                [3] = r8_182.Character:FindFirstChild(r1_182).Position,
              }
              rocketHit(r10_182)
              rocketHit(r10_182)
              rocketHit(r10_182)
              rocketHit(r10_182)
              rocketHit(r10_182)
              rocketHit(r10_182)
              rocketHit(r10_182)
              rocketHit(r10_182)
              buyAmmo("RPG")
              Reload(r3_182)
            end
          end
        end
        r7_3.Heartbeat:Wait(0.1)
      end
    end,
  }
  r45_3.Togglerpglockplrs = r106_3:Sliderspraynear(r115_3)
  plrstohit = {}
  for r115_3, r116_3 in pairs(r0_3:GetChildren()) do
    local r117_3 = r116_3.Name
    if r117_3 ~= r2_3 then
      table.insert(plrstohit, r116_3)
    end
  end
  r115_3 = "CreateDropdown"
  r115_3 = {
    Name = "Select RPG Lock Players ",
    Options = plrstohit,
    CurrentOption = "",
    MultiSelection = false,
    Flag = "plrsrpg",
    Callback = function(r0_16)
      r0_16 = table.insert(r13_3, r0_16)
    end,
  }
  r45_3.Dropdownrpglockselplr = r106_3:Sliderspraynear(r115_3)
  r115_3 = "CreateButton"
  r115_3 = {
    Name = "Rescan",
    Interact = "",
    Callback = function()
      plrstohit = {}
      for r3_28, r4_28 in pairs(r0_3:GetPlayers()) do
        if r4_28.Name ~= r2_3 then
          table.insert(plrstohit, r4_28)
        end
      end
      r45_3.Dropdownrpglockselplr:Refresh(plrstohit)
    end,
  }
  r45_3.Buttonrescanplrs = r106_3:Sliderspraynear(r115_3)
  r115_3 = "CreateButton"
  r115_3 = {
    Name = "Remove All",
    Interact = "",
    Callback = function(r0_52)
      r0_52 = table.remove(r13_3, r13_3.wiperpgmulti)
    end,
  }
  r45_3.Buttonremoveallplrs = r106_3:Sliderspraynear(r115_3)
  local r114_3 = "CreateLabel"
  r114_3 = "Magick Heal"
  r112_3 = r106_3:SliderHealthtypediss(r114_3)
  r113_3 = {}
  local r117_3 = "CreateDropdown"
  r117_3 = {
    Name = "Select Healing Item Name",
    Options = r24_3,
    CurrentOption = "",
    MultiSelection = false,
    Flag = "healthname",
    Callback = function(r0_120)
      Healitemname = r0_120
    end,
  }
  r45_3.Dropdownhealname = r106_3:Cash(r117_3)
  r117_3 = "CreateButton"
  r117_3 = {
    Name = "Buy Heal Type",
    Interact = "",
    Callback = function()
      va = r24_3[math.random(4)]
      table.insert(r113_3, va)
      buyItem(Healitemname or r113_3[1])
    end,
  }
  r45_3.Buttonbuyhealty = r106_3:Cash(r117_3)
  r117_3 = "CreateToggle"
  r117_3 = {
    Name = "Magick Heal Selected Item Slot",
    CurrentValue = false,
    Flag = "Magicheal",
    Callback = function(r0_117)
      getgenv().magicswitchHeal = r0_117
      while getgenv().magicswitchHeal == true do
        local r1_117 = GetEquipped()
        local r2_117 = nil
        r2_117 = r1_117
        healthtypee = healthtype or 85
        if r5_3.Health ~= 0 and r5_3.Health < healthtypee then
          buyAmmo(Healitemname or r113_3[1])
          equip(Healitem)
          game:GetService("ReplicatedStorage").devv.remoteStorage:FindFirstChild("useConsumable"):FireServer(Healitem)
          equip(r2_117)
        end
        r7_3.Heartbeat:Wait(0.1)
      end
    end,
  }
  r45_3.ToggleMagickhealacti = r106_3:Cash(r117_3)
  r114_3 = "SliderHealthtypediss"
  r117_3 = "CreateSlider"
  r117_3 = {
    Name = "HealthType [SET THIS 2ND]",
    Range = {
      1,
      190
    },
    Increment = 1,
    Suffix = "Distance",
    CurrentValue = 5,
    Flag = "healset",
    Callback = function(r0_223)
      healthtype = r0_223
    end,
  }
  r45_3[r114_3] = r106_3:Cash(r117_3)
  r117_3 = "CreateDropdown"
  r117_3 = {
    Name = "Select Healing Item Slot",
    Options = r26_3,
    CurrentOption = "",
    MultiSelection = false,
    Flag = "healitemzslot",
    Callback = function(r0_215)
      Healitem = r0_215
    end,
  }
  r45_3.Dropdownselslotheal = r106_3:Cash(r117_3)
  r117_3 = "CreateButton"
  r117_3 = {
    Name = "Rescan Item Slots",
    Interact = "",
    Callback = function()
      r26_3 = {}
      for r3_59, r4_59 in pairs(r27_3.inventory.ordered) do
        table.insert(r26_3, r4_59)
      end
      r45_3.Dropdownselslotheal:Refresh(r26_3)
    end,
  }
  r45_3.Buttonrescanitemzs = r106_3:Cash(r117_3)
  local r116_3 = "CreateLabel"
  r116_3 = "Spray"
  r114_3 = r106_3:Spray(r116_3)
  local r118_3 = "CreateDropdown"
  r118_3 = {
    Name = "Spray Type",
    Options = r22_3,
    CurrentOption = "",
    MultiSelection = false,
    Flag = "spraytypen",
    Callback = function(r0_18)
      Spraytypething = r0_18
    end,
  }
  r45_3.Dropdownspraykindd = r106_3:Auto(r118_3)
  r118_3 = "CreateButton"
  r118_3 = {
    Name = "Buy Spray Type",
    Interact = "",
    Callback = function()
      buyItem(Spraytypething)
    end,
  }
  r45_3.Buttonspraytype = r106_3:Auto(r118_3)
  r118_3 = "CreateToggle"
  r118_3 = {
    Name = "Spray Nearest",
    CurrentValue = false,
    Flag = "Magicksprayn",
    Callback = function(r0_132)
      getgenv().Spraycloud = r0_132
      guid = require(game:GetService("ReplicatedStorage").devv.shared.Helpers.string.GUID)
      same = {}
      table.insert(same, guid())
      while getgenv().Spraycloud == true do
        r7_3.Heartbeat:Wait()
        friendnoeff = getFriends()
        local r1_132 = GetEquipped()
        local r2_132 = GetEquippedName()
        spraydizz = spraydiz or 80
        local r3_132 = SelHitpart or "HumanoidRootPart"
        item = require(game:GetService("ReplicatedStorage").devv.client.Objects.v3item)
        for r7_132, r8_132 in pairs(r0_3:GetChildren()) do
          if r8_132.Character and r8_132.Character:FindFirstChild("HumanoidRootPart") and r8_132.Character:FindFirstChild("Humanoid") and r8_132.Character:FindFirstChild(r3_132) then
            part = r8_132.Character:FindFirstChild("HumanoidRootPart")
            distance = (r6_3.Position - part.Position).magnitude
            if not r8_132.Character:FindFirstChild("ForceField") and r2_132 == "Fire Extinguisher" and distance <= spraydizz and friendnoeff[table.find(friendnoeff, r8_132.Name)] ~= r8_132.Name and r17_3[table.find(r17_3, r8_132.UserId)] ~= r8_132.UserId and r11_3[table.find(r11_3, r8_132.Name)] ~= r8_132.Name and r8_132.Name ~= r2_3 and r8_132.Character.Humanoid.Health ~= 1 then
              local r9_132 = {
                [1] = r1_132,
                [2] = {
                  [1] = {
                    [1] = same[1],
                    [2] = r8_132.Character:FindFirstChild(r3_132).CFrame,
                  },
                },
                [3] = "auto",
              }
              replicateProjectiles(r9_132)
              pepperSprayHit({
                [1] = same[1],
                [2] = "player",
                [3] = {
                  hitSize = r8_132.Character:FindFirstChild(r3_132).Size,
                  hitPart = r8_132.Character:FindFirstChild(r3_132),
                  pos = r8_132.Character:FindFirstChild(r3_132).Position,
                  hitPlayerId = r8_132.UserId,
                },
              })
              Reload(r1_132)
            end
          end
        end
      end
      -- warn: not visited block [19]
      -- r9_132 = {} -- #list: 0 #map: 3
      -- r9_132[1] = r1_132
      -- r10_132 = {} -- #list: 0 #map: 1
      -- r11_132 = {} -- #list: 0 #map: 2
      -- -- <empty>
      -- r11_132[1] = same[1]
      -- -- <empty>
      -- r11_132[2] = r8_132.Character:FindFirstChild(r3_132).CFrame
      -- r10_132[1] = r11_132
      -- r9_132[2] = r10_132
      -- r9_132[3] = "auto"
      -- replicateProjectiles(r9_132)
      -- r10_132 = {} -- #list: 0 #map: 3
      -- -- <empty>
      -- r10_132[1] = same[1]
      -- r10_132[2] = "player"
      -- r11_132 = {} -- #list: 0 #map: 4
      -- -- <empty>
      -- r11_132.hitSize = r8_132.Character:FindFirstChild(r3_132).Size
      -- -- <empty>
      -- r11_132.hitPart = r8_132.Character:FindFirstChild(r3_132)
      -- -- <empty>
      -- r11_132.pos = r8_132.Character:FindFirstChild(r3_132).Position
      -- -- <empty>
      -- r11_132.hitPlayerId = r8_132.UserId
      -- r10_132[3] = r11_132
      -- pepperSprayHit(r10_132)
      -- Reload(r1_132)
      -- goto label_297
    end,
  }
  r45_3.ToggleSpraynearest = r106_3:Auto(r118_3)
  r115_3 = "Sliderspraynear"
  r118_3 = "CreateSlider"
  r118_3 = {
    Name = "Distance [SET THIS 2ND]",
    Range = {
      1,
      500
    },
    Increment = 1,
    Suffix = "Distance",
    CurrentValue = 1,
    Flag = "spraydiss",
    Callback = function(r0_154)
      spraydiz = r0_154
    end,
  }
  r45_3[r115_3] = r106_3:Auto(r118_3)
  r117_3 = "CreateTab"
  r117_3 = "Cash"
  r115_3 = r43_3:Cash(r117_3, 14219740649)
  r118_3 = "CreateSection"
  r118_3 = "Auto"
  r116_3 = r115_3:Auto(r118_3, true)
  local r119_3 = "CreateToggle"
  r119_3 = {
    Name = "Auto Claw Machine",
    CurrentValue = false,
    Flag = "clawmach",
    Callback = function(r0_70)
      getgenv().aclmaca = r0_70
      while getgenv().aclmaca do
        task.wait(0.2)
        goodfarm = getdestroyedtypes()
        gemfarm = tablejewels()
        ServerFurniture = workspace.ServerFurniture
        local r1_70 = 1 < r1_3:GetAttribute("slotSpins")
        slotsleft = r1_70
        bankthing = game:GetService("Workspace").BankRobbery:FindFirstChild("BankCash")
        r1_70 = nil
        r1_70 = r6_3.CFrame
        for r5_70, r6_70 in pairs(ServerFurniture:GetDescendants()) do
          if #bankthing:FindFirstChild("Cash"):GetChildren() == 0 and r6_3 and slotsleft and r6_70:GetAttribute("furnitureName") == "SlotMachine" then
            r6_70:FindFirstChild("Attachment", true).ProximityPrompt.MaxActivationDistance = 40
            while true do
              r6_3.CFrame = CFrame.new(846.239685, 0.435377538, -919.226746, -0.999359787, 0.0311656408, 0.0175692085, 0.0265386514, 0.975102663, -0.220160127, -0.0239932127, -0.219552919, -0.975305498) * CFrame.new(10, -1.6, -5)
              task.wait()
              fireproximityprompt(r6_70:FindFirstChild("Attachment", true).ProximityPrompt)
              if r1_3:GetAttribute("slotSpins") ~= 0 then
                local r7_70 = getgenv().aclmaca
                if r7_70 == false then
                  break
                end
              else
                break
              end
            end
            r6_3.CFrame = r1_70
          end
        end
      end
    end,
  }
  r117_3 = r115_3:CreateToggle(r119_3)
  local r120_3 = "CreateToggle"
  r120_3 = {
    Name = "BlackMarket QuickSell Method [EQUIP ITEM]",
    Info = "",
    CurrentValue = false,
    Flag = "BM",
    Callback = function(r0_45)
      getgenv().AutoDealer = r0_45
      while getgenv().AutoDealer == true do
        local r1_45 = {
          "Dark Matter Gem",
          "Void Gem",
          "Diamond Ring",
          "Diamond",
          "Rollie",
          "Watch",
          "Glock 18",
          "AR-15",
          "Amethyst",
          "Topaz",
          "Emerald",
          "Gold Bar",
          "Sapphire",
          "Ruby",
          "Emerald Ring",
          "Topaz Ring",
          "Amethyst Ring",
          "Sapphire Ring",
          "Ruby Ring",
          "AK-47",
          "Glock",
          "Raygun",
          "Gold AK-47",
          "Gold Deagle",
          "AS Val",
          "AUG",
          "Acid Gun",
          "P90",
          "Raygun",
          "RPK",
          "Sawn Off",
          "Scar L",
          "Saiga 12",
          "Tommy Gun",
          "Double Barrel",
          "Deagle",
          "Dragunov",
          "Flamethrower",
          "M249 SAW",
          "MP7",
          "Minigun",
          "M4A1",
          "Barrett M107",
          "Gravity Gun",
          "Seashell",
          "Blue Seashell",
          "Purple Seashell"
        }
        selltype = r1_45
        equippedName = GetEquippedName()
        r1_45 = GetEquippedName()
        if r1_45 == selltype[table.find(selltype, GetEquippedName())] then
          fireproximityprompt(workspace.BlackMarket.Dealer.Dealer.ProximityPrompt)
        end
        r7_3.Heartbeat:Wait()
      end
    end,
  }
  r118_3 = r115_3:CreateToggle(r120_3)
  local r121_3 = "CreateToggle"
  r121_3 = {
    Name = "BlackMarket Sell All [NEW 20+ Items Needed]",
    Info = "",
    CurrentValue = false,
    Flag = "BM20",
    Callback = function(r0_240)
      getgenv().AutoDealer = r0_240
      while getgenv().AutoDealer == true do
        task.wait(0.3)
        getloc = require(game:GetService("ReplicatedStorage").devv.client.Objects.v3item)
        local r1_240 = getloc
        if r1_240 then
          r1_240 = getloc.inventory
          if r1_240 then
            r1_240 = getloc.inventory.ordered
            if r1_240 then
              countitems = getloc.inventory.ordered
              r1_240 = #countitems
              if r1_240 > 20 then
                sellallitems()
              end
            end
          end
        end
      end
    end,
  }
  r119_3 = r115_3:CreateToggle(r121_3)
  local r122_3 = "CreateToggle"
  r122_3 = {
    Name = "Destroy Nearest ATM [FISTS]",
    Info = "Auto",
    CurrentValue = false,
    Flag = "Autodestroynearatms",
    Callback = function(r0_112)
      getgenv().destroyatm = true
      while getgenv().destroyatm == true do
        DestroyNearestATM()
        r7_3.Heartbeat:Wait()
      end
    end,
  }
  r120_3 = r115_3:CreateToggle(r122_3)
  local r123_3 = "CreateToggle"
  r123_3 = {
    Name = "Auto Open",
    Info = "",
    CurrentValue = false,
    Flag = "Autoopen",
    Callback = function(r0_236)
      getgenv().AutoRSafe = r0_236
      while getgenv().AutoRSafe == true do
        task.wait(0.2)
        local r1_236 = pairs
        for r4_236, r5_236 in r1_236(workspace.BankRobbery:GetDescendants()) do
          if game:GetService("Workspace").BankRobbery:FindFirstChild("BankCash") and game:GetService("Workspace").BankRobbery:FindFirstChild("BankCash"):FindFirstChild("Cash") then
            bankthing = game:GetService("Workspace").BankRobbery:FindFirstChild("BankCash")
            if 0 < #bankthing:FindFirstChild("Cash"):GetChildren() and r5_236:IsA("ProximityPrompt") then
              fireproximityprompt(r5_236)
            end
          end
        end
        task.wait()
        r1_236 = pairs
        for r4_236, r5_236 in r1_236(workspace.Game.Entities.LargeSafe:GetChildren()) do
          mp = r5_236.PrimaryPart
          distance = (r6_3.Position - mp.Position).magnitude
          if r6_3 and distance <= 45 then
            buyItem("Lockpick")
            if r5_236:FindFirstChild("ProximityPrompt") then
              fireproximityprompt(r5_236:FindFirstChild("ProximityPrompt", true))
            end
          end
        end
        task.wait()
        r1_236 = pairs
        for r4_236, r5_236 in r1_236(workspace.Game.Entities.MediumSafe:GetChildren()) do
          mp = r5_236.PrimaryPart
          distance = (r6_3.Position - mp.Position).magnitude
          if r6_3 and distance <= 45 then
            buyItem("Lockpick")
            if r5_236:FindFirstChild("ProximityPrompt", true) then
              fireproximityprompt(r5_236:FindFirstChild("ProximityPrompt", true))
            end
          end
        end
        task.wait()
        r1_236 = pairs
        for r4_236, r5_236 in r1_236(workspace.Game.Entities.SmallSafe:GetChildren()) do
          mp = r5_236.PrimaryPart
          distance = (r6_3.Position - mp.Position).magnitude
          if r6_3 and distance <= 45 then
            buyItem("Lockpick")
            if r5_236:FindFirstChild("ProximityPrompt", true) then
              fireproximityprompt(r5_236:FindFirstChild("ProximityPrompt", true))
            end
          end
        end
        openJewelSafes()
        r1_236 = workspace.Game.Entities
        for r5_236, r6_236 in pairs(r1_236.LargeChest:GetChildren()) do
          mp = r6_236.WorldPivot
          distance = (r6_3.Position - mp.Position).magnitude
          if r6_3 and distance <= 45 then
            buyItem("Lockpick")
            if r6_236:FindFirstChild("ProximityPrompt", true) then
              fireproximityprompt(r6_236:FindFirstChild("ProximityPrompt", true))
            end
          end
        end
        task.wait()
        for r5_236, r6_236 in pairs(r1_236.SmallChest:GetChildren()) do
          mp = r6_236.WorldPivot
          distance = (r6_3.Position - mp.Position).magnitude
          if r6_3 and distance <= 45 then
            buyItem("Lockpick")
            if r6_236:FindFirstChild("ProximityPrompt", true) then
              fireproximityprompt(r6_236:FindFirstChild("ProximityPrompt", true))
            end
          end
        end
      end
    end,
  }
  r121_3 = r115_3:CreateToggle(r123_3)
  local r124_3 = "CreateToggle"
  r124_3 = {
    Name = "CashAura",
    CurrentValue = false,
    Flag = "caura",
    Callback = function(r0_142)
      getgenv().cashauraa = r0_142
      while getgenv().cashauraa == true do
        task.wait()
        local r1_142 = pairs
        for r4_142, r5_142 in r1_142(game:GetService("Workspace").Game.Entities.CashBundle:GetChildren()) do
          if r5_142:FindFirstChildOfClass("Part") then
            mp = r5_142:FindFirstChildOfClass("Part")
            distance = (r6_3.Position - mp.Position).magnitude
            if r6_3 and distance <= 30 and r5_142:FindFirstChildOfClass("ClickDetector") then
              fireclickdetector(r5_142:FindFirstChildOfClass("ClickDetector"))
            end
          end
        end
      end
    end,
  }
  r122_3 = r115_3:CreateToggle(r124_3)
  local r125_3 = "CreateToggle"
  r125_3 = {
    Name = "ItemAura",
    Info = "",
    CurrentValue = false,
    Flag = "itemaura",
    Callback = function(r0_122)
      getgenv().itemau = r0_122
      pickuptype = {
        "Dark Matter Gem",
        "Void Gem",
        "Diamond Ring",
        "Diamond",
        "Rollie",
        "Watch",
        "Glock 18",
        "AR-15",
        "Amethyst",
        "Topaz",
        "Emerald",
        "Gold Bar",
        "Sapphire",
        "Ruby",
        "Emerald Ring",
        "Topaz Ring",
        "Amethyst Ring",
        "Sapphire Ring",
        "Ruby Ring",
        "AK-47",
        "Glock",
        "Raygun",
        "Gold AK-47",
        "Gold Deagle",
        "AS Val",
        "AUG",
        "Acid Gun",
        "P90",
        "Raygun",
        "RPK",
        "Sawn Off",
        "Scar L",
        "Saiga 12",
        "Tommy Gun",
        "Double Barrel",
        "Deagle",
        "Dragunov",
        "Flamethrower",
        "M249 SAW",
        "MP7",
        "Minigun",
        "M4A1",
        "Barrett M107",
        "Gravity Gun",
        "Gold Lucky Block",
        "Orange Lucky Block",
        "Purple Lucky Block",
        "Green Lucky Block",
        "Red Lucky Block",
        "Blue Lucky Block",
        "Treasure Map",
        "Pearl Necklace",
        "Military Armory Keycard",
        "Police Armory Keycard",
        "Money Printer",
        "RPG",
        "Trident",
        "Gold Crown",
        "Gold Cup",
        "Heavy Vest",
        "Military Vest",
        nil,
        nil,
        nil
      }
      while getgenv().itemau == true do
        task.wait(0.3)
        allitems = GetItems()
        local r1_122 = pairs
        local r2_122 = pickuptype
        for r4_122, r5_122 in r1_122(r2_122) do
          local r6_122 = pairs
          local r7_122 = allitems
          for r9_122, r10_122 in r6_122(r7_122) do
            main = r10_122:FindFirstChildOfClass("Part")
            local r11_122 = r10_122:FindFirstChild("Part", true) or main
            mp = r11_122
            r11_122 = main
            if not r11_122 then
              r11_122 = mp
              if r11_122 then
                local r12_122 = mp.Position
                distance = (r6_3.Position - r12_122).magnitude
                r11_122 = r6_3
                if r11_122 then
                  r11_122 = distance
                  if r11_122 <= 27 then
                    r11_122 = r10_122:GetAttribute("itemName")
                    if r11_122 == r5_122 then
                      r11_122 = r10_122:FindFirstChildOfClass("ClickDetector")
                      if r11_122 then
                        fireclickdetector(r10_122:FindFirstChildOfClass("ClickDetector"))
                      else
                        r11_122 = r10_122:FindFirstChildOfClass("Part")
                        if r11_122 then
                          maincrap = r10_122:FindFirstChildOfClass("Part")
                          r11_122 = maincrap
                          if r11_122 then
                            fireclickdetector(maincrap:FindFirstChildOfClass("ClickDetector"))
                          end
                        end
                      end
                    end
                  end
                end
              end
            else
            end
          end
        end
      end
    end,
  }
  r123_3 = r115_3:CreateToggle(r125_3)
  local r126_3 = "CreateButton"
  r126_3 = {
    Name = "No Delay ProximityPrompt",
    Interact = "",
    Callback = function()
      for r3_75, r4_75 in pairs(game:GetService("Workspace"):GetDescendants()) do
        if r4_75:IsA("ProximityPrompt") then
          r4_75.HoldDuration = 0
        end
      end
      game:GetService("ProximityPromptService").PromptButtonHoldBegan:Connect(function(r0_76)
        r0_76.HoldDuration = 0
      end)
    end,
  }
  r124_3 = r115_3:CreateButton(r126_3)
  local r127_3 = "CreateSection"
  r127_3 = "AutoFarm"
  r125_3 = r115_3:AutoFarm(r127_3, true)
  atmmodes = {
    "AFK",
    "Regular"
  }
  local r128_3 = "CreateDropdown"
  r128_3 = {
    Name = "Select Farm Mode",
    Options = atmmodes,
    CurrentOption = "",
    MultiSelection = false,
    Flag = "atmmodess",
    Callback = function(r0_239)
      farmmodes = r0_239
    end,
  }
  r126_3 = r115_3:CreateDropdown(r128_3)
  local r129_3 = "CreateToggle"
  r129_3 = {
    Name = "Farm Halloween Event",
    Info = "Farms Event",
    CurrentValue = false,
    Flag = "Halloweeneve",
    Callback = function(r0_126)
      getgenv().farmhallowmobs = r0_126
      while getgenv().farmhallowmobs == true do
        task.wait(0.1)
        local r1_126 = game:GetService("Workspace")
        r1_126 = r1_126:FindFirstChild("Halloween")
        if r1_126 then
          hallowalert = workspace.Halloween:GetChildren()
          r1_126 = #hallowalert
          if r1_126 > 0 then
            r1_126 = {}
            local r2_126 = 11183605264
            local r3_126 = 6597653340
            local r4_126 = 91262225685954
            -- setlist for #1 failed
            hallowimages = r1_126
            r42_3:Notify({
              Title = "Halloween Event",
              Content = "Destroying all mobs and collecting candy!",
              Image = hallowimages[math.random(3)],
            })
            allmobs = getHalloweenMobs()
            task.spawn(function()
              while getgenv().farmhallowmobs == true do
                task.wait(0.1)
                CollectCandy()
                local r0_127 = pairs
                for r3_127, r4_127 in r0_127(allmobs) do
                  if r4_127.PrimaryPart and r4_127:GetAttribute("health") ~= 0 then
                    r4_127:SetAttribute("health", 0)
                  end
                end
              end
            end)
            task.wait(50)
          end
        end
      end
    end,
  }
  r127_3 = r115_3:CreateToggle(r129_3)
  local r130_3 = "CreateToggle"
  r130_3 = {
    Name = "Farm ATMS/CashRegisters",
    Info = "Farms ATM",
    CurrentValue = false,
    Flag = "Autorobatm",
    Callback = function(r0_99)
      getgenv().AutoRobATM = r0_99
      while getgenv().AutoRobATM == true do
        task.wait(0.02)
        local r1_99 = getgenv()
        r1_99.farmmode = farmmodes or "Regular"
        r1_99 = getgenv().AutoRobATM
        if r1_99 == true then
          r1_99 = getgenv().farmmode
          if r1_99 == "AFK" then
            ATMFarmAFK()
          end
        end
        r1_99 = getgenv().AutoRobATM
        if r1_99 == true then
          r1_99 = getgenv().farmmode
          if r1_99 == "Regular" then
            ATMFarm()
          end
        end
      end
    end,
  }
  r128_3 = r115_3:CreateToggle(r130_3)
  local r131_3 = "CreateToggle"
  r131_3 = {
    Name = "Farm Bank",
    Info = "Auto",
    CurrentValue = false,
    Flag = "Autorobbank",
    Callback = function(r0_168)
      getgenv().RobBankk = r0_168
      while getgenv().RobBankk == true do
        task.wait(0.1)
        local r1_168 = getgenv()
        r1_168.farmmode = farmmodes or "Regular"
        r1_168 = getgenv().RobBankk
        if r1_168 == true then
          r1_168 = getgenv().farmmode
          if r1_168 == "AFK" then
            FarmBankAFK()
          end
        end
        r1_168 = getgenv().RobBankk
        if r1_168 == true then
          r1_168 = getgenv().farmmode
          if r1_168 == "Regular" then
            FarmBank()
          end
        end
      end
    end,
  }
  r129_3 = r115_3:CreateToggle(r131_3)
  local r132_3 = "CreateToggle"
  r132_3 = {
    Name = "Collect TruckCash [Nearest]",
    CurrentValue = false,
    Flag = "farmtruc",
    Callback = function(r0_237)
      getgenv().autotruck = r0_237
      while getgenv().autotruck == true do
        task.wait()
        allvehs = getVehicles()
        local r1_237 = pairs
        for r4_237, r5_237 in r1_237(allvehs) do
          if r5_237.PrimaryPart then
            dis = (r6_3.Position - r5_237.PrimaryPart.Position).magnitude
            if r5_237.Name == "Armored Truck" and r5_237:FindFirstChild("TruckCash") and dis <= 10000000 and r5_237:FindFirstChild("TruckCash") then
              fireproximityprompt(r5_237:FindFirstChild("TruckCash").Main.Attachment.ProximityPrompt)
            end
          end
        end
      end
    end,
  }
  r130_3 = r115_3:CreateToggle(r132_3)
  local r133_3 = "CreateToggle"
  r133_3 = {
    Name = "Farm JewelryCases [RARE GEMS]",
    Info = "Auto",
    CurrentValue = false,
    Flag = "Arrgs",
    Callback = function(r0_174)
      getgenv().AutoCase = r0_174
      while getgenv().AutoCase == true do
        task.wait(0.1)
        local r1_174 = nil
        r1_174 = GetEquipped()
        local r2_174 = nil
        r2_174 = r6_3.CFrame
        jewelrycases = allJewelryCases()
        for r6_174, r7_174 in pairs(jewelrycases) do
          for r11_174, r12_174 in pairs(r20_3) do
            if game:GetService("Workspace"):FindFirstChild("BankRobbery") then
              bankthing = game:GetService("Workspace").BankRobbery:WaitForChild("BankCash")
              if r7_174:FindFirstChild(r12_174) then
                dis = (r6_3.Position - r7_174:FindFirstChild(r12_174).PrimaryPart.Position).magnitude
                if r6_3 and #bankthing:FindFirstChild("Cash"):GetChildren() == 0 then
                  if r5_3.Health > 50 then
                    while true do
                      task.wait()
                      getCaseGUID = getJewelryGUID()
                      if r7_174:FindFirstChild(r12_174) then
                        r6_3.CFrame = r7_174:FindFirstChild(r12_174).WorldPivot * CFrame.new(0, -1.6, 0) * CFrame.Angles(math.rad(90), 0, 0)
                        equip("Fists")
                        task.spawn(function()
                          meleeItemHit({
                            [1] = "jewelcase",
                            [2] = {
                              meleeType = "meleepunch",
                              guid = getCaseGUID[math.random(1, 2)],
                            },
                          })
                          if r7_174:FindFirstChild(r12_174) then
                            fireproximityprompt(r7_174:FindFirstChild(r12_174):FindFirstChild("ProximityPrompt", true))
                          end
                        end)
                      end
                      local r13_174 = getgenv().AutoCase
                      if r13_174 ~= false then
                        r13_174 = r7_174:FindFirstChild(r12_174)
                        if r13_174 == nil then
                          break
                        end
                      else
                        break
                      end
                    end
                    task.wait(0.2)
                    game:GetService("TweenService"):Create(r6_3, TweenInfo.new(0.09, Enum.EasingStyle.Linear), {
                      CFrame = r2_174,
                    }):Play()
                    equip(r1_174)
                  elseif r5_3.Health < 50 then
                    r6_3.CFrame = CFrame.new(823.8939208984375, 83.43997192382813, -146.0994110107422)
                    task.wait(10)
                  end
                end
              end
            end
            -- close: r11_174
          end
          -- close: r6_174
        end
      end
    end,
  }
  r131_3 = r115_3:CreateToggle(r133_3)
  local r134_3 = "CreateToggle"
  r134_3 = {
    Name = "Farm JewelryCases [ALL GEMS]",
    Info = "Auto",
    CurrentValue = false,
    Flag = "Aroballgems",
    Callback = function(r0_200)
      getgenv().AutoCaseAll = r0_200
      while getgenv().AutoCaseAll == true do
        task.wait(0.1)
        goodfarm = getdestroyedtypes()
        local r1_200 = nil
        r1_200 = GetEquipped()
        local r2_200 = nil
        r2_200 = r6_3.CFrame
        jewelrycases = allJewelryCases()
        for r6_200, r7_200 in pairs(jewelrycases) do
          for r11_200, r12_200 in pairs(r21_3) do
            if game:GetService("Workspace"):FindFirstChild("BankRobbery") then
              bankthing = game:GetService("Workspace").BankRobbery:WaitForChild("BankCash")
              if r7_200:FindFirstChild(r12_200) and r6_3 and #bankthing:FindFirstChild("Cash"):GetChildren() == 0 then
                if r5_3.Health > 50 then
                  while true do
                    task.wait()
                    getCaseGUID = getJewelryGUIDALL()
                    if r7_200:FindFirstChild(r12_200) then
                      r6_3.CFrame = r7_200:FindFirstChild(r12_200).WorldPivot * CFrame.new(0, -1.6, 0) * CFrame.Angles(math.rad(90), 0, 0)
                      equip("Fists")
                      local r13_200 = {
                        [1] = "jewelcase",
                        [2] = {
                          meleeType = "meleepunch",
                          guid = getCaseGUID[math.random(1, 2)],
                        },
                      }
                      meleeItemHit(r13_200)
                      if r7_200:FindFirstChild(r12_200) then
                        fireproximityprompt(r7_200:FindFirstChild(r12_200):FindFirstChild("ProximityPrompt", true))
                      end
                    end
                    local r13_200 = getgenv().AutoCaseAll
                    if r13_200 ~= false then
                      r13_200 = r7_200:FindFirstChild(r12_200)
                      if r13_200 == nil then
                        break
                      end
                    else
                      break
                    end
                  end
                  task.wait(0.2)
                  game:GetService("TweenService"):Create(r6_3, TweenInfo.new(0.09, Enum.EasingStyle.Linear), {
                    CFrame = r2_200,
                  }):Play()
                  equip(r1_200)
                elseif r5_3.Health < 50 then
                  r6_3.CFrame = CFrame.new(823.8939208984375, 83.43997192382813, -146.0994110107422)
                  task.wait(10)
                end
              end
            end
          end
        end
      end
    end,
  }
  r132_3 = r115_3:CreateToggle(r134_3)
  local r135_3 = "CreateToggle"
  r135_3 = {
    Name = "CashFarm [200+]",
    CurrentValue = false,
    Flag = "cashfarm",
    Callback = function(r0_23)
      getgenv().CashFarm = r0_23
      while getgenv().CashFarm == true do
        task.wait(0.2)
        gemfarm = tablejewels()
        local r1_23 = GetBundles()
        local r2_23 = nil
        r2_23 = r6_3.CFrame
        for r7_23, r8_23 in pairs(GetCash()) do
          if r8_23.PrimaryPart and r8_23:FindFirstChildWhichIsA("IntValue") then
            dis = (r6_3.Position - r8_23.PrimaryPart.Position).magnitude
            if #r1_23:FindFirstChild("Cash"):GetChildren() == 0 and r6_3 and 300 < r8_23:FindFirstChildWhichIsA("IntValue").Value then
              while true do
                task.wait()
                r1_23 = GetBundles()
                if r8_23.PrimaryPart then
                  local r9_23 = #r1_23:FindFirstChild("Cash"):GetChildren()
                  if r9_23 == 0 then
                    r9_23 = r6_3
                    if r9_23 then
                      r9_23 = r8_23:FindFirstChildWhichIsA("IntValue").Value
                      if r9_23 > 300 then
                        TweenTeleport(r8_23.WorldPivot)
                        cashpickup()
                      end
                    end
                  end
                end
                local r9_23 = getgenv().CashFarm
                if r9_23 ~= false then
                  r9_23 = r8_23.PrimaryPart
                  if not r9_23 then
                    break
                  end
                else
                  break
                end
              end
              task.wait()
              TweenTeleport(r2_23)
            end
          end
        end
      end
    end,
  }
  r133_3 = r115_3:CreateToggle(r135_3)
  local r136_3 = "CreateToggle"
  r136_3 = {
    Name = "Farm Treasure",
    CurrentValue = false,
    Flag = "ftres",
    Callback = function(r0_156)
      getgenv().treasfa = r0_156
      while getgenv().treasfa == true do
        task.wait(0.1)
        amountt = getTreasure()
        equippedName = GetEquippedName()
        local r1_156 = nil
        r1_156 = r6_3.CFrame
        for r6_156, r7_156 in pairs(workspace.Game.Local.Debris:GetChildren()) do
          if equippedName == "Treasure Map" and 0 < #amountt then
            while true do
              task.wait()
              if equippedName == "Treasure Map" then
                local r8_156 = #amountt
                if r8_156 > 0 then
                  goto = r7_156.CFrame
                  new_CFrame = goto
                  ts = game:GetService("TweenService")
                  part = r6_3
                  ti = TweenInfo.new(0.01, Enum.EasingStyle.Linear)
                  r8_156 = {
                    CFrame = new_CFrame,
                  }
                  tp = r8_156
                  tstime = ts:Create(part, ti, tp)
                  tstime:Play()
                  r8_156 = r7_156:FindFirstChild("ProximityPrompt", true)
                  if r8_156 then
                    fireproximityprompt(r7_156:FindFirstChild("ProximityPrompt", true))
                    cashpickup()
                  end
                end
              end
              local r8_156 = getgenv().treasfa
              if r8_156 ~= false then
                r8_156 = r7_156:FindFirstChild("ProximityPrompt", true)
                if r8_156 then
                  r8_156 = #amountt
                  if r8_156 == 0 then
                    break
                  end
                else
                  break
                end
              else
                break
              end
            end
            r6_3.CFrame = r1_156
          end
        end
      end
    end,
  }
  r134_3 = r115_3:CreateToggle(r136_3)
  local r137_3 = "CreateToggle"
  r137_3 = {
    Name = "Farm Weight ",
    CurrentValue = false,
    Flag = "weightf",
    Callback = function(r0_90)
      getgenv().liftweight = r0_90
      while getgenv().liftweight == true do
        task.wait()
        equippedName = GetEquippedName()
        local r1_90 = equippedName
        if r1_90 == "Dumbell" then
          liftDumbell()
        end
      end
    end,
  }
  r135_3 = r115_3:CreateToggle(r137_3)
  local r138_3 = "CreateTab"
  r138_3 = "Item AutoFarm"
  r136_3 = r43_3:CreateTab(r138_3, 713512637)
  r137_3 = GetItems()
  local r140_3 = "CreateToggle"
  r140_3 = {
    Name = "Treasure Items",
    CurrentValue = false,
    Flag = "farmmap",
    Callback = function(r0_119)
      getgenv().tremap = r0_119
      while getgenv().tremap == true do
        task.wait(0.3)
        local r1_119 = {
          "Treasure Map",
          "Pearl Necklace",
          "Seashell",
          "Purple Seashell",
          "Blue Seashell"
        }
        mappsss = r1_119
        r1_119 = nil
        r1_119 = r6_3.CFrame
        r137_3 = GetItems()
        for r5_119, r6_119 in pairs(mappsss) do
          for r10_119, r11_119 in pairs(r137_3) do
            if r6_3 and r11_119:GetAttribute("itemName") == r6_119 then
              if r11_119.PrimaryPart then
                while true do
                  task.wait()
                  if r11_119.PrimaryPart then
                    TweenTeleport(r11_119.PrimaryPart.CFrame)
                    Collect(r11_119)
                  end
                  local r12_119 = getgenv().tremap
                  if r12_119 ~= false then
                    r12_119 = r11_119.PrimaryPart
                    if not r12_119 then
                      break
                    end
                  else
                    break
                  end
                end
              end
              task.wait(0.1)
              r6_3.CFrame = r1_119
            end
          end
        end
      end
    end,
  }
  r138_3 = r136_3:CreateToggle(r140_3)
  local r141_3 = "CreateToggle"
  r141_3 = {
    Name = "Component Boxes",
    CurrentValue = false,
    Flag = "compboxy",
    Callback = function(r0_51)
      getgenv().cboxxx = r0_51
      while getgenv().cboxxx == true do
        task.wait(0.3)
        r137_3 = GetItems()
        local r1_51 = nil
        r1_51 = r6_3.CFrame
        for r5_51, r6_51 in pairs(r137_3) do
          if r6_3 and r6_51:GetAttribute("itemName") == "Component Box" then
            if r6_51.PrimaryPart then
              while true do
                task.wait()
                if r6_51.PrimaryPart then
                  TweenTeleport(r6_51.PrimaryPart.CFrame)
                  Collect(r6_51)
                end
                local r7_51 = getgenv().cboxxx
                if r7_51 ~= false then
                  r7_51 = r6_51.PrimaryPart
                  if not r7_51 then
                    break
                  end
                else
                  break
                end
              end
            end
            task.wait(0.1)
            r6_3.CFrame = r1_51
          end
        end
      end
    end,
  }
  local r139_3 = r136_3:CreateToggle(r141_3)
  local r142_3 = "CreateToggle"
  r142_3 = {
    Name = "Gold Guns",
    CurrentValue = false,
    Flag = "goldak",
    Callback = function(r0_272)
      getgenv().akks = r0_272
      while getgenv().akks == true do
        task.wait(0.3)
        local r1_272 = {
          "Gold AK-47",
          "Gold Deagle"
        }
        goldguns = r1_272
        r1_272 = nil
        r1_272 = r6_3.CFrame
        r137_3 = GetItems()
        for r5_272, r6_272 in pairs(goldguns) do
          for r10_272, r11_272 in pairs(r137_3) do
            if r6_3 and r11_272:GetAttribute("itemName") == r6_272 then
              if r11_272.PrimaryPart then
                while true do
                  task.wait()
                  if r11_272.PrimaryPart then
                    TweenTeleport(r11_272.PrimaryPart.CFrame)
                    Collect(r11_272)
                  end
                  local r12_272 = getgenv().akks
                  if r12_272 ~= false then
                    r12_272 = r11_272.PrimaryPart
                    if not r12_272 then
                      break
                    end
                  else
                    break
                  end
                end
              end
              task.wait(0.1)
              r6_3.CFrame = r1_272
            end
          end
        end
      end
    end,
  }
  r140_3 = r136_3:CreateToggle(r142_3)
  local r143_3 = "CreateToggle"
  r143_3 = {
    Name = "Presents/LuckyBlocks",
    CurrentValue = false,
    Flag = "medpres",
    Callback = function(r0_39)
      getgenv().medpres = r0_39
      while getgenv().medpres == true do
        task.wait(0.3)
        gemfarm = tablejewels()
        local r1_39 = {
          "Small Present",
          "Medium Present",
          "Large Present",
          "Gold Lucky Block",
          "Orange Lucky Block",
          "Purple Lucky Block",
          "Green Lucky Block",
          "Red Lucky Block",
          "Blue Lucky Block"
        }
        presentss = r1_39
        r1_39 = nil
        r1_39 = r6_3.CFrame
        r137_3 = GetItems()
        for r5_39, r6_39 in pairs(presentss) do
          local r7_39 = pairs
          local r8_39 = r137_3
          for r10_39, r11_39 in r7_39(r8_39) do
            if r6_3 and r11_39:GetAttribute("itemName") == r6_39 then
              if r11_39.PrimaryPart then
                while true do
                  task.wait()
                  if r11_39.PrimaryPart then
                    TweenTeleport(r11_39.PrimaryPart.CFrame)
                    Collect(r11_39)
                  end
                  local r12_39 = getgenv().medpres
                  if r12_39 ~= false then
                    r12_39 = r11_39.PrimaryPart
                    if not r12_39 then
                      break
                    end
                  else
                    break
                  end
                end
              end
              task.wait(0.1)
              r6_3.CFrame = r1_39
            end
          end
        end
      end
    end,
  }
  r141_3 = r136_3:CreateToggle(r143_3)
  local r144_3 = "CreateToggle"
  r144_3 = {
    Name = "Rarest Gems",
    CurrentValue = false,
    Flag = "diaring",
    Callback = function(r0_68)
      getgenv().dring = r0_68
      while getgenv().dring == true do
        task.wait(0.2)
        local r1_68 = {
          "Diamond",
          "Diamond Ring",
          "Diamond Ore",
          "Rollie",
          "Dark Matter Gem",
          "Void Gem",
          "Gold Cup",
          "Gold Crown"
        }
        diamondtype = r1_68
        r1_68 = nil
        r1_68 = r6_3.CFrame
        r137_3 = GetItems()
        for r5_68, r6_68 in pairs(diamondtype) do
          local r7_68 = pairs
          local r8_68 = r137_3
          for r10_68, r11_68 in r7_68(r8_68) do
            if r6_3 and r11_68:GetAttribute("itemName") == r6_68 then
              if r11_68.PrimaryPart then
                while true do
                  task.wait()
                  if r11_68.PrimaryPart then
                    TweenTeleport(r11_68.PrimaryPart.CFrame)
                    Collect(r11_68)
                  end
                  local r12_68 = getgenv().dring
                  if r12_68 ~= false then
                    r12_68 = r11_68.PrimaryPart
                    if not r12_68 then
                      break
                    end
                  else
                    break
                  end
                end
              end
              task.wait(0.1)
              r6_3.CFrame = r1_68
            end
          end
        end
      end
    end,
  }
  r142_3 = r136_3:CreateToggle(r144_3)
  balloontype = {
    "Dollar Balloon",
    "Candy Cane",
    "Easter Basket",
    "Diamond Glock",
    "Clover Balloon",
    "Heart Balloon",
    "Ghost Balloon",
    "Nuke Case",
    "NextBot Grenade",
    "Pulse Rifle",
    "Trident",
    "El Fuego"
  }
  local r145_3 = "CreateToggle"
  r145_3 = {
    Name = "Very Rare Items",
    CurrentValue = false,
    Flag = "rareitemzss",
    Callback = function(r0_36)
      getgenv().balloony = r0_36
      while getgenv().balloony == true do
        task.wait(0.3)
        local r1_36 = nil
        r1_36 = r6_3.CFrame
        r137_3 = GetItems()
        for r5_36, r6_36 in pairs(balloontype) do
          for r10_36, r11_36 in pairs(r137_3) do
            if r6_3 and r11_36:GetAttribute("itemName") == r6_36 then
              if r11_36.PrimaryPart then
                while true do
                  task.wait()
                  if r11_36.PrimaryPart then
                    TweenTeleport(r11_36.PrimaryPart.CFrame)
                    Collect(r11_36)
                  end
                  local r12_36 = getgenv().balloony
                  if r12_36 ~= false then
                    r12_36 = r11_36.PrimaryPart
                    if not r12_36 then
                      break
                    end
                  else
                    break
                  end
                end
              end
              task.wait(0.1)
              r6_3.CFrame = r1_36
            end
          end
        end
      end
    end,
  }
  r143_3 = r136_3:CreateToggle(r145_3)
  local r146_3 = "CreateToggle"
  r146_3 = {
    Name = "Blue Card",
    CurrentValue = false,
    Flag = "bluecard",
    Callback = function(r0_113)
      getgenv().policak = r0_113
      while getgenv().policak == true do
        task.wait(0.3)
        gemfarm = tablejewels()
        local r1_113 = nil
        r1_113 = r6_3.CFrame
        r137_3 = GetItems()
        for r5_113, r6_113 in pairs(r137_3) do
          if r6_3 and r6_113:GetAttribute("itemName") == "Police Armory Keycard" then
            if r6_113.PrimaryPart then
              while true do
                task.wait()
                if r6_113.PrimaryPart then
                  TweenTeleport(r6_113.PrimaryPart.CFrame)
                  Collect(r6_113)
                end
                local r7_113 = getgenv().policak
                if r7_113 ~= false then
                  r7_113 = r6_113.PrimaryPart
                  if not r7_113 then
                    break
                  end
                else
                  break
                end
              end
            end
            task.wait(0.1)
            r6_3.CFrame = r1_113
          end
        end
      end
    end,
  }
  r144_3 = r136_3:CreateToggle(r146_3)
  local r147_3 = "CreateToggle"
  r147_3 = {
    Name = "Red Card",
    CurrentValue = false,
    Flag = "redcard",
    Callback = function(r0_208)
      getgenv().milark = r0_208
      while getgenv().milark == true do
        task.wait(0.3)
        local r1_208 = nil
        r1_208 = r6_3.CFrame
        r137_3 = GetItems()
        for r5_208, r6_208 in pairs(r137_3) do
          if r6_3 and r6_208:GetAttribute("itemName") == "Military Armory Keycard" then
            if r6_208.PrimaryPart then
              while true do
                task.wait()
                if r6_208.PrimaryPart then
                  TweenTeleport(r6_208.PrimaryPart.CFrame)
                  Collect(r6_208)
                end
                local r7_208 = getgenv().milark
                if r7_208 ~= false then
                  r7_208 = r6_208.PrimaryPart
                  if not r7_208 then
                    break
                  end
                else
                  break
                end
              end
            end
            task.wait(0.1)
            r6_3.CFrame = r1_208
          end
        end
      end
    end,
  }
  r145_3 = r136_3:CreateToggle(r147_3)
  local r148_3 = "CreateToggle"
  r148_3 = {
    Name = "Money Printer",
    CurrentValue = false,
    Flag = "printerf",
    Callback = function(r0_124)
      getgenv().Mprinter = r0_124
      while getgenv().Mprinter == true do
        task.wait(0.3)
        local r1_124 = nil
        r1_124 = r6_3.CFrame
        r137_3 = GetItems()
        for r5_124, r6_124 in pairs(r137_3) do
          if r6_3 and r6_124:GetAttribute("itemName") == "Money Printer" then
            if r6_124.PrimaryPart then
              while true do
                task.wait()
                if r6_124.PrimaryPart then
                  TweenTeleport(r6_124.PrimaryPart.CFrame)
                  Collect(r6_124)
                end
                local r7_124 = getgenv().Mprinter
                if r7_124 ~= false then
                  r7_124 = r6_124.PrimaryPart
                  if not r7_124 then
                    break
                  end
                else
                  break
                end
              end
            end
            task.wait(0.1)
            r6_3.CFrame = r1_124
          end
        end
      end
    end,
  }
  r146_3 = r136_3:CreateToggle(r148_3)
  local r149_3 = "CreateToggle"
  r149_3 = {
    Name = "Gold Bar",
    CurrentValue = false,
    Flag = "goldbarf",
    Callback = function(r0_25)
      getgenv().gbarr = r0_25
      while getgenv().gbarr == true do
        task.wait(0.3)
        local r1_25 = nil
        r1_25 = r6_3.CFrame
        r137_3 = GetItems()
        for r5_25, r6_25 in pairs(r137_3) do
          if r6_3 and r6_25:GetAttribute("itemName") == "Gold Bar" then
            if r6_25.PrimaryPart then
              while true do
                task.wait()
                if r6_25.PrimaryPart then
                  TweenTeleport(r6_25.PrimaryPart.CFrame)
                  Collect(r6_25)
                end
                local r7_25 = getgenv().gbarr
                if r7_25 ~= false then
                  r7_25 = r6_25.PrimaryPart
                  if not r7_25 then
                    break
                  end
                else
                  break
                end
              end
            end
            task.wait(0.1)
            r6_3.CFrame = r1_25
          end
        end
      end
    end,
  }
  r147_3 = r136_3:CreateToggle(r149_3)
  local r150_3 = "CreateToggle"
  r150_3 = {
    Name = "BoomBox",
    CurrentValue = false,
    Flag = "boomboxf",
    Callback = function(r0_4)
      getgenv().boombox = r0_4
      while getgenv().boombox == true do
        task.wait(0.3)
        local r1_4 = nil
        r1_4 = r6_3.CFrame
        r137_3 = GetItems()
        for r5_4, r6_4 in pairs(r137_3) do
          if r6_3 and r6_4:GetAttribute("itemName") == "Boombox" then
            if r6_4.PrimaryPart then
              while true do
                task.wait()
                if r6_4.PrimaryPart then
                  TweenTeleport(r6_4.PrimaryPart.CFrame)
                  Collect(r6_4)
                end
                local r7_4 = getgenv().boombox
                if r7_4 ~= false then
                  r7_4 = r6_4.PrimaryPart
                  if not r7_4 then
                    break
                  end
                else
                  break
                end
              end
            end
            task.wait(0.1)
            r6_3.CFrame = r1_4
          end
        end
      end
    end,
  }
  r148_3 = r136_3:CreateToggle(r150_3)
  local r151_3 = "CreateToggle"
  r151_3 = {
    Name = "Vehicle Keys",
    CurrentValue = false,
    Flag = "cruiserk",
    Callback = function(r0_100)
      getgenv().crkey = r0_100
      while getgenv().crkey == true do
        task.wait(0.3)
        local r1_100 = {
          "Mustang Key",
          "Cruiser Key",
          "Helicopter Key",
          "Airdrop Marker"
        }
        keyssz = r1_100
        r1_100 = nil
        r1_100 = r6_3.CFrame
        r137_3 = GetItems()
        for r5_100, r6_100 in pairs(keyssz) do
          for r10_100, r11_100 in pairs(r137_3) do
            if r6_3 and r11_100:GetAttribute("itemName") == r6_100 then
              if r11_100.PrimaryPart then
                while true do
                  task.wait()
                  if r11_100.PrimaryPart then
                    TweenTeleport(r11_100.PrimaryPart.CFrame)
                    Collect(r11_100)
                  end
                  local r12_100 = getgenv().crkey
                  if r12_100 ~= false then
                    r12_100 = r11_100.PrimaryPart
                    if not r12_100 then
                      break
                    end
                  else
                    break
                  end
                end
              end
              task.wait(0.1)
              r6_3.CFrame = r1_100
            end
          end
        end
      end
    end,
  }
  r149_3 = r136_3:CreateToggle(r151_3)
  local r152_3 = "CreateTab"
  r152_3 = "Notifications"
  r150_3 = r43_3:Notifications(r152_3, 17328930401)
  local r153_3 = "CreateLabel"
  r153_3 = "Bank & Jewelry"
  r151_3 = r150_3:CreateLabel(r153_3)
  local r154_3 = "CreateToggle"
  r154_3 = {
    Name = "BankReset",
    Info = "Auto",
    CurrentValue = false,
    Flag = "notifbank",
    Callback = function(r0_106)
      getgenv().BankNotif = r0_106
      while getgenv().BankNotif == true do
        task.wait(0.6)
        local r1_106 = workspace.BankRobbery:WaitForChild("BankCash")
        local r2_106 = game:GetService("Workspace"):WaitForChild("BankRobbery"):WaitForChild("BankCash"):WaitForChild("Main")
        if #r1_106:WaitForChild("Cash"):GetChildren() > 0 then
          local r3_106 = r42_3
          local r5_106 = {
            Title = "The Bank Safe Has Reset!",
            Content = "",
            Duration = 2,
            Image = 14219740649,
          }
          local r6_106 = {
            {
              Name = "TP",
              Callback = function()
                local r0_107 = r1_3.Character.HumanoidRootPart.CFrame
                if r6_3 and 0 < #r1_106:WaitForChild("Cash"):GetChildren() then
                  while true do
                    local r3_107 = game:GetService("TweenService"):Create(r6_3, TweenInfo.new(0, Enum.EasingStyle.Linear), {
                      CFrame = r2_106.CFrame * CFrame.new(0, -2.7, -1) * CFrame.Angles(math.rad(90), 0, 0),
                    })
                    task.wait()
                    for r7_107, r8_107 in pairs(workspace:WaitForChild("BankRobbery"):GetDescendants()) do
                      if r8_107:IsA("ProximityPrompt") then
                        fireproximityprompt(r8_107)
                      end
                    end
                    r3_107:Play()
                    if #r1_106:WaitForChild("Cash"):GetChildren() ~= 0 and getgenv().BankNotif ~= false then
                    else
                      break
                    end
                  end
                  task.wait(0.5)
                  game:GetService("TweenService"):Create(r6_3, TweenInfo.new(0.02, Enum.EasingStyle.Linear), {
                    CFrame = r0_107,
                  }):Play()
                end
              end,
            }
          }
          r5_106.Actions = r6_106
          r3_106:Notify(r5_106)
          task.wait(156)
        end
        -- close: r1_106
      end
    end,
  }
  r152_3 = r150_3:CreateToggle(r154_3)
  local r155_3 = "CreateToggle"
  r155_3 = {
    Name = "JewelReset",
    Info = "Auto",
    CurrentValue = false,
    Flag = "JewelNotif",
    Callback = function(r0_145)
      getgenv().RobJewNot = r0_145
      while getgenv().RobJewNot == true do
        task.wait(0.6)
        gem = game:GetService("Workspace").GemRobbery:WaitForChild("Rubble")
        local r1_145 = #gem:GetChildren()
        if r1_145 > 0 then
          r1_145 = r42_3
          local r3_145 = {
            Title = "The Jewelry Safe Has Reset!",
            Content = "",
            Duration = 2,
            Image = 713512637,
          }
          local r4_145 = {
            {
              Name = "TP",
              Callback = function()
                TweenTeleport(workspace.ItemsOnSale["Bundle of TNT"].TouchDetector.CFrame * CFrame.new(0, 0, 1))
                buyItem("Bundle of TNT")
              end,
            }
          }
          r3_145.Actions = r4_145
          r1_145:Notify(r3_145)
          wait(240)
        end
      end
    end,
  }
  r153_3 = r150_3:CreateToggle(r155_3)
  local r156_3 = "CreateLabel"
  r156_3 = "Chests"
  r154_3 = r150_3:Chests(r156_3)
  local r157_3 = "CreateToggle"
  r157_3 = {
    Name = "SmallChest Spawn",
    Info = "Auto",
    CurrentValue = false,
    Flag = "SmallChestNotif",
    Callback = function(r0_217)
      getgenv().SmallChest = r0_217
      while getgenv().SmallChest == true do
        task.wait(0.6)
        schest = game:GetService("Workspace").Game.Entities.SmallChest
        local r1_217 = pairs
        for r4_217, r5_217 in r1_217(schest:GetChildren()) do
          if r5_217.PrimaryPart then
            local r6_217 = r42_3
            local r8_217 = {
              Title = "SmallChest Spawned!",
              Content = "",
              Duration = 2,
              Image = 970263355,
            }
            local r9_217 = {
              {
                Name = "TP",
                Callback = function()
                  TweenTeleport(r5_217.PrimaryPart.CFrame)
                  for r3_218, r4_218 in pairs(schest:GetChildren()) do
                    mp = r4_218.WorldPivot
                    distance = (r6_3.Position - mp.Position).magnitude
                    if r6_3 and distance <= 20 then
                      buyItem("Lockpick")
                      if r4_218:FindFirstChild("ProximityPrompt", true) then
                        fireproximityprompt(r4_218:FindFirstChild("ProximityPrompt", true))
                      end
                    end
                  end
                end,
              }
            }
            r8_217.Actions = r9_217
            r6_217:Notify(r8_217)
            wait(90)
          end
          -- close: r4_217
        end
      end
    end,
  }
  r155_3 = r150_3:CreateToggle(r157_3)
  local r158_3 = "CreateToggle"
  r158_3 = {
    Name = "LargeChest Spawn",
    Info = "Auto",
    CurrentValue = false,
    Flag = "LargeChestNotif",
    Callback = function(r0_242)
      getgenv().lcns = r0_242
      while getgenv().lcns == true do
        task.wait(0.6)
        lchest = game:GetService("Workspace").Game.Entities.LargeChest
        local r1_242 = pairs
        for r4_242, r5_242 in r1_242(lchest:GetChildren()) do
          if r5_242.PrimaryPart then
            local r6_242 = r42_3
            local r8_242 = {
              Title = "LargeChest Spawned!",
              Content = "",
              Duration = 2,
              Image = 970263355,
            }
            local r9_242 = {
              {
                Name = "TP",
                Callback = function()
                  if r5_242.PrimaryPart then
                    TweenTeleport(r5_242.PrimaryPart.CFrame)
                  end
                end,
              }
            }
            r8_242.Actions = r9_242
            r6_242:Notify(r8_242)
            wait(90)
          end
          -- close: r4_242
        end
      end
    end,
  }
  r156_3 = r150_3:CreateToggle(r158_3)
  local r159_3 = "CreateLabel"
  r159_3 = "Safes"
  r157_3 = r150_3:Safes(r159_3)
  local r160_3 = "CreateToggle"
  r160_3 = {
    Name = "SmallSafe Spawn",
    Info = "Auto",
    CurrentValue = false,
    Flag = "SmallSafeNotif",
    Callback = function(r0_91)
      getgenv().ssns = r0_91
      while getgenv().ssns == true do
        task.wait(0.6)
        ss = game:GetService("Workspace").Game.Entities.SmallSafe
        local r1_91 = pairs
        for r4_91, r5_91 in r1_91(ss:GetChildren()) do
          if r5_91.PrimaryPart then
            local r6_91 = r42_3
            local r8_91 = {
              Title = "Small Safe Spawned!",
              Content = "",
              Duration = 2,
              Image = 12525009855,
            }
            local r9_91 = {
              {
                Name = "TP",
                Callback = function()
                  TweenTeleport(r5_91.PrimaryPart.CFrame)
                  task.wait(0.7)
                  for r3_93, r4_93 in pairs(workspace.Game.Entities.SmallSafe:GetChildren()) do
                    mp = r4_93.WorldPivot
                    distance = (r6_3.Position - mp.Position).magnitude
                    if r6_3 and distance <= 23 then
                      buyItem("Lockpick")
                      pcall(function()
                        fireproximityprompt(r4_93:FindFirstChild("ProximityPrompt", true))
                      end)
                    end
                    -- close: r3_93
                  end
                end,
              }
            }
            r8_91.Actions = r9_91
            r6_91:Notify(r8_91)
            wait(200)
          end
          -- close: r4_91
        end
      end
    end,
  }
  r158_3 = r150_3:CreateToggle(r160_3)
  local r161_3 = "CreateToggle"
  r161_3 = {
    Name = "MediumSafe Spawn",
    Info = "Auto",
    CurrentValue = false,
    Flag = "MediumSafeNotif",
    Callback = function(r0_265)
      getgenv().msns = r0_265
      while getgenv().msns == true do
        task.wait(0.6)
        ms = game:GetService("Workspace").Game.Entities.MediumSafe
        local r1_265 = pairs
        for r4_265, r5_265 in r1_265(ms:GetChildren()) do
          if r5_265.PrimaryPart then
            local r6_265 = r42_3
            local r8_265 = {
              Title = "Medium Safe Spawned!",
              Content = "",
              Duration = 5,
              Image = 12525009855,
            }
            local r9_265 = {
              {
                Name = "TP",
                Callback = function()
                  TweenTeleport(ms.MediumSafe.WorldPivot)
                  task.wait(0.7)
                  for r3_266, r4_266 in pairs(workspace.Game.Entities.MediumSafe:GetChildren()) do
                    mp = r4_266.WorldPivot
                    distance = (r6_3.Position - mp.Position).magnitude
                    if r6_3 and distance <= 23 then
                      buyItem("Lockpick")
                      pcall(function()
                        fireproximityprompt(r4_266:FindFirstChild("ProximityPrompt", true))
                      end)
                    end
                    -- close: r3_266
                  end
                end,
              }
            }
            r8_265.Actions = r9_265
            r6_265:Notify(r8_265)
            wait(200)
          end
        end
      end
    end,
  }
  r159_3 = r150_3:CreateToggle(r161_3)
  local r162_3 = "CreateToggle"
  r162_3 = {
    Name = "LargeSafe Spawn",
    Info = "Auto",
    CurrentValue = false,
    Flag = "LargeSafeNotif",
    Callback = function(r0_101)
      getgenv().lsns = r0_101
      while getgenv().lsns == true do
        task.wait(0.6)
        ls = game:GetService("Workspace").Game.Entities.LargeSafe
        local r1_101 = pairs
        for r4_101, r5_101 in r1_101(ls:GetChildren()) do
          if r5_101.PrimaryPart then
            local r6_101 = r42_3
            local r8_101 = {
              Title = "Large Safe Spawned!",
              Content = "",
              Duration = 2,
              Image = 12525009855,
            }
            local r9_101 = {
              {
                Name = "TP",
                Callback = function()
                  TweenTeleport(ls.LargeSafe.WorldPivot)
                  task.wait(0.7)
                  for r3_103, r4_103 in pairs(workspace.Game.Entities.LargeSafe:GetChildren()) do
                    mp = r4_103.WorldPivot
                    distance = (r6_3.Position - mp.Position).magnitude
                    if r6_3 and distance <= 23 then
                      buyItem("Lockpick")
                      pcall(function()
                        fireproximityprompt(r4_103:FindFirstChild("ProximityPrompt", true))
                      end)
                    end
                    -- close: r3_103
                  end
                end,
              }
            }
            r8_101.Actions = r9_101
            r6_101:Notify(r8_101)
            wait(200)
          end
        end
      end
    end,
  }
  r160_3 = r150_3:CreateToggle(r162_3)
  local r163_3 = "CreateLabel"
  r163_3 = "Airdrops"
  r161_3 = r150_3:Airdrops(r163_3)
  local r164_3 = "CreateToggle"
  r164_3 = {
    Name = "Airdrop Spawn",
    Info = "Auto",
    CurrentValue = false,
    Flag = "AirdropNotif",
    Callback = function(r0_56)
      getgenv().airdropn = r0_56
      while getgenv().airdropn == true do
        task.wait(0.6)
        local r1_56 = nil
        r1_56 = r6_3.CFrame
        adn = game:GetService("Workspace").Game.Airdrops
        if #adn:GetChildren() > 0 then
          local r2_56 = r42_3
          local r4_56 = {
            Title = "Airdrop Has Spawned!",
            Content = "",
            Duration = 2,
            Image = 6462872654,
          }
          local r5_56 = {
            {
              Name = "TP",
              Callback = function()
                TweenTeleport(adn.Airdrop.WorldPivot)
              end,
            }
          }
          r4_56.Actions = r5_56
          r2_56:Notify(r4_56)
          wait(246)
        end
      end
    end,
  }
  r162_3 = r150_3:CreateToggle(r164_3)
  local r165_3 = "CreateLabel"
  r165_3 = "Rare Ores"
  r163_3 = r150_3:CreateLabel(r165_3)
  local r166_3 = "CreateToggle"
  r166_3 = {
    Name = "Rare Ore Spawn",
    Info = "Auto",
    CurrentValue = false,
    Flag = "DiamondOreNotif",
    Callback = function(r0_197)
      getgenv().dore = r0_197
      oresss = {
        "Diamond Ore",
        "Gold Ore"
      }
      while getgenv().dore == true do
        task.wait(0.6)
        local r1_197 = pairs
        local r2_197 = oresss
        for r4_197, r5_197 in r1_197(r2_197) do
          for r9_197, r10_197 in pairs(workspace.Rocks:GetChildren()) do
            if r10_197:GetAttribute("oreName") == r5_197 then
              local r11_197 = r42_3
              local r13_197 = {
                Title = "Rare Ore Spawned!",
                Content = "",
                Duration = 2,
                Image = 713512637,
              }
              local r14_197 = {
                {
                  Name = "TP",
                  Callback = function()
                    TweenTeleport(r10_197.WorldPivot)
                  end,
                }
              }
              r13_197.Actions = r14_197
              r11_197:Notify(r13_197)
              wait(60)
            end
            -- close: r9_197
          end
        end
      end
    end,
  }
  r164_3 = r150_3:CreateToggle(r166_3)
  local r167_3 = "CreateTab"
  r167_3 = "Scans"
  r165_3 = r43_3:Scans(r167_3, 15999597350)
  local r168_3 = "CreateLabel"
  r168_3 = "AirDrops"
  r166_3 = r165_3:AirDrops(r168_3)
  local r169_3 = "CreateDropdown"
  r169_3 = {
    Name = "Airdrops",
    Options = r30_3,
    CurrentOption = "",
    MultiSelection = false,
    Flag = "adsTP",
    Callback = function(r0_255)
      adsTP = r0_255
      r6_3.CFrame = game:GetService("Workspace").Game.Airdrops[adsTP].WorldPivot
    end,
  }
  r167_3 = r165_3:CreateDropdown(r169_3)
  local r170_3 = "CreateButton"
  r170_3 = {
    Name = "Scan Airdrops",
    Info = "Scans for airdrops",
    Interact = "",
    Callback = function()
      r30_3 = {}
      for r3_204, r4_204 in pairs(game:GetService("Workspace").Game.Airdrops:GetChildren()) do
        table.insert(r30_3, r4_204.Name)
      end
      r167_3:Refresh(r30_3)
    end,
  }
  r168_3 = r165_3:CreateButton(r170_3)
  local r171_3 = "CreateLabel"
  r171_3 = "Rocks"
  r169_3 = r165_3:Rocks(r171_3)
  local r172_3 = "CreateDropdown"
  r172_3 = {
    Name = "Ores Spawned",
    Options = r32_3,
    CurrentOption = "",
    MultiSelection = false,
    Flag = "ores",
    Callback = function(r0_226)
      oreTP = r0_226
      r6_3.CFrame = game:GetService("Workspace").Rocks[oreTP].WorldPivot
    end,
  }
  r170_3 = r165_3:CreateDropdown(r172_3)
  local r173_3 = "CreateButton"
  r173_3 = {
    Name = "Rescan",
    Info = "",
    Interact = "",
    Callback = function()
      r32_3 = {}
      for r3_84, r4_84 in pairs(game:GetService("Workspace").Rocks:GetChildren()) do
        r4_84.Name = r4_84:GetAttribute("oreName")
        table.insert(r32_3, r4_84:GetAttribute("oreName"))
        table.insert(r32_3, r4_84.Name)
      end
      r170_3:Refresh(r32_3)
    end,
  }
  r171_3 = r165_3:CreateButton(r173_3)
  local r174_3 = "CreateLabel"
  r174_3 = "Drone"
  r172_3 = r165_3:Drone(r174_3)
  local r175_3 = "CreateDropdown"
  r175_3 = {
    Name = "Drones Spawned",
    Options = r33_3,
    CurrentOption = "",
    MultiSelection = false,
    Flag = "drones",
    Callback = function(r0_207)
      drneTP = r0_207
      r6_3.CFrame = game:GetService("Workspace").Game.Drones[drneTP].WorldPivot
    end,
  }
  r173_3 = r165_3:CreateDropdown(r175_3)
  local r176_3 = "CreateButton"
  r176_3 = {
    Name = "Rescan",
    Info = "",
    Interact = "",
    Callback = function()
      r33_3 = {}
      for r3_172, r4_172 in pairs(game:GetService("Workspace").Game.Drones:GetChildren()) do
        table.insert(r33_3, r4_172.Name)
      end
      r173_3:Refresh(r33_3)
    end,
  }
  r174_3 = r165_3:CreateButton(r176_3)
  local r177_3 = "CreateTab"
  r177_3 = "ServerHop"
  r175_3 = r43_3:ServerHop(r177_3, 12490660393)
  local r178_3 = "CreateButton"
  r178_3 = {
    Name = "Ohio. Rejoin",
    Interact = "",
    Callback = function()
      r9_3:TeleportToPlaceInstance(game.PlaceId, game.JobId, r1_3)
    end,
  }
  r176_3 = r175_3:CreateButton(r178_3)
  local r179_3 = "CreateButton"
  r179_3 = {
    Name = "Ohio. LowPlayer",
    Interact = "",
    Callback = function()
      local r0_228 = {}
      local r1_228 = {}
      local r2_228 = nil
      local r3_228 = syn
      if r3_228 then
        r3_228 = syn.request
        if not r3_228 then
          r3_228 = http
          if r3_228 then
            r3_228 = http.request
            if not r3_228 then
              r3_228 = http_request
              if not r3_228 then
                r3_228 = fluxus
                if r3_228 then
                  r3_228 = fluxus.request or request
                else
                end
              end
            end
          else
          end
        end
      else
      end
      local r5_228 = game.HttpService:JSONDecode(r3_228({
        Url = string.format("https://games.roblox.com/v1/games/%s/servers/Public?sortOrder=Asc&limit=100", game.PlaceId),
      }).Body)
      if r5_228 and r5_228.data then
        for r9_228, r10_228 in next, r5_228.data, nil do
          if type(r10_228) == "table" and tonumber(r10_228.playing) and tonumber(r10_228.maxPlayers) and r10_228.playing < r10_228.maxPlayers and r2_228 == nil then
            r2_228 = tonumber(r10_228.maxPlayers)
            table.insert(r0_228, #r0_228 + 1, r10_228)
          end
        end
      end
      if #r0_228 == 0 then
        return 
      end
      for r9_228, r10_228 in pairs(r0_228) do
        table.insert(r1_228, #r1_228 + 1, tonumber(r10_228.playing))
      end
      table.sort(r1_228)
      for r9_228, r10_228 in pairs(r0_228) do
        if r10_228.playing == r1_228[1] and r10_228.id ~= game.JobId then
          r0_228 = {
            r10_228.id
          }
        elseif r10_228.id == game.JobId then
          r0_228 = {}
        end
      end
      if #r0_228 == 0 then
        return 
      end
      if #r0_228 > 0 then
        r9_3:TeleportToPlaceInstance(game.PlaceId, r0_228[math.random(1, #r0_228)], game:GetService("Players").LocalPlayer)
      end
    end,
  }
  r177_3 = r175_3:CreateButton(r179_3)
  local r180_3 = "CreateTab"
  r180_3 = "Buy"
  r178_3 = r43_3:Buy(r180_3, 12665536064)
  local r181_3 = "CreateDropdown"
  r181_3 = {
    Name = "Select Item To Buy",
    Options = r37_3,
    CurrentOption = "",
    MultiSelection = false,
    Flag = "drones",
    Callback = function(r0_136)
      utBuy = r0_136
    end,
  }
  r179_3 = r178_3:CreateDropdown(r181_3)
  local r182_3 = "CreateToggle"
  r182_3 = {
    Name = "Buy Item",
    Info = "Toggle",
    CurrentValue = false,
    Flag = "autobuy",
    Callback = function(r0_227)
      getgenv().AutoBuy = r0_227
      while getgenv().AutoBuy == true do
        fireclickdetector(game:GetService("Workspace").ItemsOnSale[utBuy][utBuy].ClickDetector)
        r7_3.RenderStepped:Wait(0.1)
      end
    end,
  }
  r180_3 = r178_3:CreateToggle(r182_3)
  local r183_3 = "CreateTab"
  r183_3 = "TP"
  r181_3 = r43_3:TP(r183_3, 6309764044)
  local r184_3 = "CreateDropdown"
  r184_3 = {
    Name = "Teleport",
    Options = r41_3,
    CurrentOption = "",
    MultiSelection = false,
    Flag = "TPLocc",
    Callback = function(r0_196)
      custp = r0_196
      Teleport(r40_3[custp])
    end,
  }
  r182_3 = r181_3:CreateDropdown(r184_3)
  local r185_3 = "CreateToggle"
  r185_3 = {
    Name = "TP SpawnLocation & Old CFrame",
    CurrentValue = false,
    Flag = "tpbakngo",
    Callback = function(r0_67)
      getgenv().AntiStomp = r0_67
      while getgenv().AntiStomp == true do
        task.wait()
        local r1_67 = sppedfunction or 0.05
        speedmeter = r1_67
        r1_67 = nil
        r1_67 = r6_3.CFrame
        if r5_3.Sit ~= true then
          while true do
            task.wait()
            speedmeter = sppedfunction or 0.08
            local r2_67 = r5_3.Sit
            if r2_67 ~= true then
              new_CFrame = CFrame.new(0, 0, 0)
              ts = game:GetService("TweenService")
              part = r6_3
              ti = TweenInfo.new(speedmeter, Enum.EasingStyle.Exponential)
              r2_67 = {}
              r2_67.CFrame = new_CFrame
              tp = r2_67
              tstime = ts:Create(part, ti, tp)
              tstime:Play()
              tstime.Completed:Wait()
              new_CFrame = r1_67
              tss = game:GetService("TweenService")
              partt = r6_3
              tii = TweenInfo.new(speedmeter, Enum.EasingStyle.Exponential)
              r2_67 = {}
              r2_67.CFrame = new_CFrame
              tpp = r2_67
              tsstime = tss:Create(partt, tii, tpp)
              tsstime:Play()
              tsstime.Completed:Wait()
            else
              r2_67 = r5_3.Sit
              if r2_67 == true then
                r2_67 = r5_3
                r2_67.Jump = true
              end
            end
            r2_67 = getgenv().AntiStomp
            if r2_67 ~= false then
              r2_67 = r5_3.Sit
              if r2_67 == true then
                break
              end
            else
              break
            end
          end
          game:GetService("TweenService"):Create(r6_3, TweenInfo.new(speedmeter, Enum.EasingStyle.Linear), {
            CFrame = r1_67,
          }):Play()
        elseif r5_3.Sit == true then
          r5_3.Jump = true
        end
      end
    end,
  }
  r183_3 = r181_3:CreateToggle(r185_3)
  local r186_3 = "CreateSlider"
  r186_3 = {
    Name = "TP Speed",
    Range = {
      0,
      1.1
    },
    Increment = 0.01,
    Suffix = "Tween Speed",
    CurrentValue = 1,
    Flag = "tpcspeed",
    Callback = function(r0_26)
      sppedfunction = r0_26
    end,
  }
  r184_3 = r181_3:CreateSlider(r186_3)
  local r187_3 = "CreateTab"
  r187_3 = "Whitelist Players"
  r185_3 = r43_3:CreateTab(r187_3, 14240653946)
  local r188_3 = "CreateDropdown"
  r188_3 = {
    Name = "Whitelist Player",
    Options = r28_3,
    CurrentOption = "",
    MultiSelection = false,
    Flag = "killaurawhi",
    Callback = function(r0_212)
      r0_212 = table.insert(r11_3, r0_212)
    end,
  }
  r186_3 = r185_3:CreateDropdown(r188_3)
  local r189_3 = "CreateButton"
  r189_3 = {
    Name = "Rescan Players",
    Interact = "",
    Callback = function()
      r28_3 = {}
      for r3_69, r4_69 in pairs(r0_3:GetPlayers()) do
        if r4_69.Name ~= r2_3 then
          table.insert(r28_3, r4_69.Name)
        end
      end
      r186_3:Refresh(r28_3)
    end,
  }
  r187_3 = r185_3:CreateButton(r189_3)
  local r190_3 = "CreateButton"
  r190_3 = {
    Name = "Whitelist Nearest [NOSTOMP]",
    Interact = "",
    Callback = function()
      for r3_41, r4_41 in pairs(getPlayers()) do
        if r4_41.Character and r4_41.Character:FindFirstChild("HumanoidRootPart") then
          dis = (r6_3.Position - r4_41.Character:FindFirstChild("HumanoidRootPart").Position).magnitude
          if dis <= 10 and r4_41.Name ~= r2_3 then
            table.insert(r12_3, r4_41.Name)
          end
        end
      end
    end,
  }
  r188_3 = r185_3:CreateButton(r190_3)
  local r191_3 = "CreateButton"
  r191_3 = {
    Name = "Blacklist All [NOSTOMP]",
    Interact = "",
    Callback = function(r0_86)
      r0_86 = table.remove(r12_3, r12_3.nodmg)
    end,
  }
  r189_3 = r185_3:CreateButton(r191_3)
  local r192_3 = "CreateButton"
  r192_3 = {
    Name = "Blacklist All",
    Interact = "",
    Callback = function(r0_173)
      r0_173 = table.remove(r11_3, r11_3.nodmg)
    end,
  }
  r190_3 = r185_3:CreateButton(r192_3)
  if r0_0[getgenv().ConfigType] then
    r47_3(r0_0[getgenv().ConfigType])
    local r193_3 = "Notify"
    r193_3 = {
      Title = "Configuration Loaded!",
      Content = "" .. getgenv().ConfigType,
      Image = 18877957133,
    }
    r42_3:Notify(r193_3)
  elseif r0_0[getgenv().ConfigType] and not r0_0[table.find(r0_0, getgenv().ConfigType)] then
    local r193_3 = "Notify"
    r193_3 = {
      Title = "Configuration Error!",
      Content = getgenv().ConfigType .. " Not Found In The Configuration Database",
      Image = 17368208554,
    }
    r42_3:Notify(r193_3)
  else
    local r193_3 = "Notify"
    r193_3 = {
      Title = "Configuration Error!",
      Content = "No Configuration Type Selected Skipping!",
      Image = 17368208554,
    }
    r42_3:Notify(r193_3)
  end
end
local r7_0 = game:GetService("Players").LocalPlayer
local r8_0 = r7_0.Name
local r9_0 = r7_0.UserId
local r10_0 = loadstring(game:HttpGet("https://raw.githubusercontent.com/TTX-OnTop/CPEnjoyer/refs/heads/main/Settings"))()
local r11_0 = loadstring(game:HttpGet("https://raw.githubusercontent.com/TTX-OnTop/CPEnjoyer/refs/heads/main/BanCheck"))()
local r12_0 = loadstring(game:HttpGet("https://pastebin.com/raw/11VPXFx4"))()
local r13_0 = {}
local r14_0 = r12_0
keyscheck = r12_0.special
speckey = getgenv().TeTraXSpecialID
function TeTraXWhitelist()
  local r0_1 = nil	-- notice: implicit variable refs by block#[0]
  isWhitelisted = r0_1
  r0_1 = {}
  stringkey = r0_1
  r0_1 = pairs
  for r3_1, r4_1 in r0_1(r10_0) do
    table.insert(stringkey, r3_1)
  end
  key = stringkey[table.find(stringkey, getgenv().TeTraXID)]
  r0_1 = getgenv()
  r0_1.securversion = tostring(r10_0.Settings.VersionWhitelist)
  r0_1 = r10_0.Settings.Whitelist
  if r0_1 == true then
    r2_0:Notify({
      Title = "TETRAX-SECURITY ENABLED",
      Description = "Version: " .. getgenv().securversion,
    }, {
      OutlineColor = Color3.fromRGB(80, 80, 80),
      Time = 5,
      Type = "image",
    }, {
      Image = "http://www.roblox.com/asset/?id=18276446000",
      ImageColor = Color3.fromRGB(255, 255, 255),
    })
    r0_1 = getgenv().TeTraXID
    if r0_1 ~= nil then
      r0_1 = getgenv().TeTraXID
      if r0_1 ~= key then
        r2_0:Notify({
          Title = "Key Check",
          Description = "Checking...",
        }, {
          OutlineColor = Color3.fromRGB(80, 80, 80),
          Time = 5,
          Type = "default",
        })
        task.wait(0.7)
        r2_0:Notify({
          Title = "Key Not Found",
          Description = "" .. getgenv().TeTraXID,
        }, {
          OutlineColor = Color3.fromRGB(80, 80, 80),
          Time = 7,
          Type = "image",
        }, {
          Image = "http://www.roblox.com/asset/?id=985514753",
          ImageColor = Color3.fromRGB(255, 255, 255),
        })
        r0_1 = false
        isWhitelisted = r0_1
      else
        r0_1 = getgenv().TeTraXID
        if r0_1 == key then
          r0_1 = r10_0[getgenv().TeTraXID]
          if r0_1 ~= r9_0 then
            idmsgs = "\n                                [TETRAX-SECURITY]\n                                TeTraXID Not Linked To UserID\n                                "
            r7_0:Kick(idmsgs)
            task.wait(2)
            r3_0:TeleportToPlaceInstance(game.PlaceId, game.JobId, r7_0)
          end
        else
          r0_1 = r10_0[getgenv().TeTraXID]
          if r0_1 == r9_0 then
            r0_1 = r11_0[table.find(r11_0, r9_0)]
            if r0_1 ~= r9_0 then
              r2_0:Notify({
                Title = "Key Check",
                Description = "Checking...",
              }, {
                OutlineColor = Color3.fromRGB(80, 80, 80),
                Time = 5,
                Type = "default",
              })
              task.wait(0.7)
              r2_0:Notify({
                Title = "Key Found!",
                Description = "" .. getgenv().TeTraXID,
              }, {
                OutlineColor = Color3.fromRGB(80, 80, 80),
                Time = 7,
                Type = "image",
              }, {
                Image = "http://www.roblox.com/asset/?id=4914902889",
                ImageColor = Color3.fromRGB(255, 255, 255),
              })
              task.wait(0.5)
              isWhitelisted = true
              r5_0()
            end
          else
            r0_1 = r11_0[table.find(r11_0, r9_0)]
            if r0_1 == r9_0 then
              banmsg = "\n                                    [TETRAX-SECURITY]\n                                    Your UserID Was Found In The\n                                    Blacklist Contact The Owner Or A Developer For Support\n                                          "
              r7_0:Kick(banmsg)
              task.wait(2)
              r3_0:TeleportToPlaceInstance(game.PlaceId, game.JobId, r7_0)
            end
          end
        end
      end
    else
      r0_1 = getgenv().TeTraXID
      if r0_1 == nil then
        r2_0:Notify({
          Title = "TeTraXID IS EMPTY",
          Description = "Use getgenv().TeTraXID = \'YOUR KEY\' ontop of loadstring",
        }, {
          OutlineColor = Color3.fromRGB(80, 80, 80),
          Time = 8,
          Type = "image",
        }, {
          Image = "http://www.roblox.com/asset/?id=985514753",
          ImageColor = Color3.fromRGB(255, 255, 255),
        })
        r0_1 = false
        isWhitelisted = r0_1
      end
    end
  else
    r0_1 = r10_0.Settings.Whitelist
    if r0_1 == false then
      r0_1 = r11_0[table.find(r11_0, r9_0)]
      if r0_1 ~= r9_0 then
        r2_0:Notify({
          Title = "TETRAX-SECURITY DISABLED",
          Description = "Version: " .. getgenv().securversion,
        }, {
          OutlineColor = Color3.fromRGB(80, 80, 80),
          Time = 8,
          Type = "image",
        }, {
          Image = "http://www.roblox.com/asset/?id=17368081924",
          ImageColor = Color3.fromRGB(255, 255, 255),
        })
        isWhitelisted = true
        r5_0()
      end
    else
      r0_1 = r11_0[table.find(r11_0, r9_0)]
      if r0_1 == r9_0 then
        banmsg = "\n                            [TETRAX-SECURITY]\n                            Your UserID Was Found In The Blacklist Contact The Owner Or A Developer For Support\n                            "
        r7_0:Kick(banmsg)
        task.wait(2)
        r3_0:TeleportToPlaceInstance(game.PlaceId, game.JobId, r7_0)
      end
    end
  end
end
isWhitelisted = nil
if speckey ~= nil and speckey == keyscheck[table.find(keyscheck, speckey)] and r11_0[table.find(r11_0, r9_0)] ~= r9_0 and keyscheck.allowspecialkeys() == true then
  r2_0:Notify({
    Title = "Special Key Found",
    Description = "Bypassing!",
  }, {
    OutlineColor = Color3.fromRGB(80, 80, 80),
    Time = 5,
    Type = "image",
  }, {
    Image = "http://www.roblox.com/asset/?id=17703994076",
    ImageColor = Color3.fromRGB(255, 84, 84),
  })
  isWhitelisted = true
  r5_0()
elseif keyscheck.allowspecialkeys() == true and speckey ~= nil and speckey ~= keyscheck[table.find(keyscheck, speckey)] then
  r2_0:Notify({
    Title = "Special Key Not Found",
    Description = "SpecialKey: " .. speckey,
  }, {
    OutlineColor = Color3.fromRGB(80, 80, 80),
    Time = 5,
    Type = "image",
  }, {
    Image = "http://www.roblox.com/asset/?id=985514753",
    ImageColor = Color3.fromRGB(255, 255, 255),
  })
elseif speckey ~= nil and keyscheck.allowspecialkeys() == false and r13_0[table.find(r13_0, r9_0)] ~= r9_0 then
  r2_0:Notify({
    Title = "Special Keys Not Allowed",
    Description = "SpecialKey: " .. speckey,
  }, {
    OutlineColor = Color3.fromRGB(80, 80, 80),
    Time = 5,
    Type = "image",
  }, {
    Image = "http://www.roblox.com/asset/?id=985514753",
    ImageColor = Color3.fromRGB(255, 255, 255),
  })
elseif speckey ~= keyscheck[table.find(keyscheck, speckey)] or speckey == nil or keyscheck.allowspecialkeys() == false or r13_0[table.find(r13_0, r9_0)] == r9_0 then
  TeTraXWhitelist()
end
function allowBypasser()
  if isWhitelisted == true then
    BypassRemotes()
  elseif isWhitelisted == false then
    warn("Not Allowed Ignoring Bypass Function!")
  end
end
usercheck = r12_0.allowBypassFunc
if isWhitelisted == true and r14_0.bypass.bfunc() == false and usercheck[table.find(usercheck, r9_0)] ~= r9_0 then
  msgty = "\n    Risky Tab Status: bypasser offline\n    Magick Tab Status: bypasser offline\n        "
  r2_0:Notify({
    Title = "[CRITICAL] Bypasser Offline",
    Description = tostring(msgty),
  }, {
    OutlineColor = Color3.fromRGB(80, 80, 80),
    Time = 5,
    Type = "image",
  }, {
    Image = "http://www.roblox.com/asset/?id=985514753",
    ImageColor = Color3.fromRGB(255, 255, 255),
  })
elseif usercheck[table.find(usercheck, r9_0)] == r9_0 then
  allowBypasser()
elseif r14_0.bypass.bfunc() == true and usercheck[table.find(usercheck, r9_0)] ~= r9_0 then
  allowBypasser()
end
-- close: r0_0
