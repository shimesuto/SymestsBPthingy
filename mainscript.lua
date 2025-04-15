
-- Symest's script thing uh yeah ---
-- powered by lots of um uhhh uhmmm uhhhhhhhh --


function GetMsgBoxFunc()
    for i, v in pairs(getgc(true)) do
        if type(v) == "function" and debug.getinfo(v).name == "fancymsgbox" then
            MsgBox = v
        end
    end
end


GetMsgBoxFunc()


MsgBox("WARNING: LEGACY ALWAYS HIT WILL TRADE BAN YOU!")

local noclipEnabled = false


local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Symest Hub",
   LoadingTitle = "Symest Hub",
   LoadingSubtitle = "April 30th: The Heat Death of BP",
   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil, 
      FileName = "Piss Hub"
   },
   
   DisableRayfieldPrompts = true,
   
   Discord = {
      Enabled = true,
      Invite = "JuEuNCmvqK", 
      RememberJoins = true
   },
   KeySystem = false,
   KeySettings = {
      Title = "i hate",
      Subtitle = "key",
      Note = "systems",
      FileName = "NotEvenAKey", 
      SaveKey = false, 
      GrabKeyFromSite = true, 
      Key = {"https://pastebin.com/raw/AtgzSPWK"} 
   }
})

local light = game.Workspace.light
local interlights = game.Workspace.lights
local pointlight = light.PointLight

Window.ModifyTheme("Ocean")

local PvPFarmingTab = Window:CreateTab("PvP & Farming", nil)
local PvPFarmingSection = PvPFarmingTab:CreateSection("Check the Combat tab for more advanced/legit options")

local CombatTab = Window:CreateTab("Combat", nil) -- Title, Image
local CombatSection = CombatTab:CreateSection("COMING SOON")

local CosmeticTradingTab = Window:CreateTab("Cosmetic & Trading", nil) -- Title, Image
local CosmeticTradingSection = CosmeticTradingTab:CreateSection("For Trade Unban check Miscellaneous")

local VisualTab = Window:CreateTab("Visual", nil) -- Title, Image

local MiscTab = Window:CreateTab("Miscellaneous", nil) -- Title, Image

local CustomScriptsTab = Window:CreateTab("Skin Importation", nil) -- Title, Image

local CustomScriptsSection = CustomScriptsTab:CreateSection("DO THIS FIRST")

local OtherHubsTab = Window:CreateTab("Other Hubs & Such", nil) -- Title, Image
local OtherHubsSection = OtherHubsTab:CreateSection("Recommended")


Rayfield:Notify({
   Title = "Symest Hub Loaded",
   Content = "Powered by Rayfield UI!!",
   Duration = 3,
   Image = 13047715178,
   Actions = { -- Notification Buttons
      Ignore = {
         Name = ":3",
         Callback = function()
         print("The user tapped Okay!")
      end
   },
},
})





-- VISUALS

local VisualSection = VisualTab:CreateSection("Sight Enhancement")




local FbButton = VisualTab:CreateButton({
    Name = "Fullbright",
    Callback = function()
        local Lighting = game:GetService("Lighting")

        Lighting.Ambient = Color3.fromRGB(255, 255, 255)
        Lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
        Lighting.Brightness = 2
        Lighting.ShadowSoftness = 0
        Lighting.GlobalShadows = false
    end,
})

local EspButton = VisualTab:CreateButton({
    Name = "ESP + Nametags",
    Callback = function()
      _G.FriendColor = Color3.fromRGB(0, 0, 255)
_G.EnemyColor = Color3.fromRGB(255, 0, 0)
_G.UseTeamColor = true

--------------------------------------------------------------------
local Holder = Instance.new("Folder", game.CoreGui)
Holder.Name = "ESP"

local Box = Instance.new("BoxHandleAdornment")
Box.Name = "nilBox"
Box.Size = Vector3.new(1, 2, 1)
Box.Color3 = Color3.new(100 / 255, 100 / 255, 100 / 255)
Box.Transparency = 0.7
Box.ZIndex = 0
Box.AlwaysOnTop = false
Box.Visible = false

local NameTag = Instance.new("BillboardGui")
NameTag.Name = "nilNameTag"
NameTag.Enabled = false
NameTag.Size = UDim2.new(0, 200, 0, 50)
NameTag.AlwaysOnTop = true
NameTag.StudsOffset = Vector3.new(0, 1.8, 0)
local Tag = Instance.new("TextLabel", NameTag)
Tag.Name = "Tag"
Tag.BackgroundTransparency = 1
Tag.Position = UDim2.new(0, -50, 0, 0)
Tag.Size = UDim2.new(0, 300, 0, 20)
Tag.TextSize = 15
Tag.TextColor3 = Color3.new(100 / 255, 100 / 255, 100 / 255)
Tag.TextStrokeColor3 = Color3.new(0 / 255, 0 / 255, 0 / 255)
Tag.TextStrokeTransparency = 0.4
Tag.Text = "nil"
Tag.Font = Enum.Font.SourceSansBold
Tag.TextScaled = false

local LoadCharacter = function(v)
	repeat wait() until v.Character ~= nil
	v.Character:WaitForChild("Humanoid")
	local vHolder = Holder:FindFirstChild(v.Name)
	vHolder:ClearAllChildren()
	local b = Box:Clone()
	b.Name = v.Name .. "Box"
	b.Adornee = v.Character
	b.Parent = vHolder
	local t = NameTag:Clone()
	t.Name = v.Name .. "NameTag"
	t.Enabled = true
	t.Parent = vHolder
	t.Adornee = v.Character:WaitForChild("Head", 5)
	if not t.Adornee then
		return UnloadCharacter(v)
	end
	t.Tag.Text = v.Name
	b.Color3 = Color3.new(v.TeamColor.r, v.TeamColor.g, v.TeamColor.b)
	t.Tag.TextColor3 = Color3.new(v.TeamColor.r, v.TeamColor.g, v.TeamColor.b)
	local Update
	local UpdateNameTag = function()
		if not pcall(function()
			v.Character.Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
			local maxh = math.floor(v.Character.Humanoid.MaxHealth)
			local h = math.floor(v.Character.Humanoid.Health)
		end) then
			Update:Disconnect()
		end
	end
	UpdateNameTag()
	Update = v.Character.Humanoid.Changed:Connect(UpdateNameTag)
end

local UnloadCharacter = function(v)
	local vHolder = Holder:FindFirstChild(v.Name)
	if vHolder and (vHolder:FindFirstChild(v.Name .. "Box") ~= nil or vHolder:FindFirstChild(v.Name .. "NameTag") ~= nil) then
		vHolder:ClearAllChildren()
	end
end

local LoadPlayer = function(v)
	local vHolder = Instance.new("Folder", Holder)
	vHolder.Name = v.Name
	v.CharacterAdded:Connect(function()
		pcall(LoadCharacter, v)
	end)
	v.CharacterRemoving:Connect(function()
		pcall(UnloadCharacter, v)
	end)
	v.Changed:Connect(function(prop)
		if prop == "TeamColor" then
			UnloadCharacter(v)
			wait()
			LoadCharacter(v)
		end
	end)
	LoadCharacter(v)
end

local UnloadPlayer = function(v)
	UnloadCharacter(v)
	local vHolder = Holder:FindFirstChild(v.Name)
	if vHolder then
		vHolder:Destroy()
	end
end

for i,v in pairs(game:GetService("Players"):GetPlayers()) do
	spawn(function() pcall(LoadPlayer, v) end)
end

game:GetService("Players").PlayerAdded:Connect(function(v)
	pcall(LoadPlayer, v)
end)

game:GetService("Players").PlayerRemoving:Connect(function(v)
	pcall(UnloadPlayer, v)
end)

game:GetService("Players").LocalPlayer.NameDisplayDistance = 0

if _G.Reantheajfdfjdgs then
    return
end

_G.Reantheajfdfjdgs = ":suifayhgvsdghfsfkajewfrhk321rk213kjrgkhj432rj34f67df"

local players = game:GetService("Players")
local plr = players.LocalPlayer

function esp(target, color)
    if target.Character then
        if not target.Character:FindFirstChild("GetReal") then
            local highlight = Instance.new("Highlight")
            highlight.RobloxLocked = true
            highlight.Name = "GetReal"
            highlight.Adornee = target.Character
            highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            highlight.FillColor = color
            highlight.Parent = target.Character
        else
            target.Character.GetReal.FillColor = color
        end
    end
end

while task.wait() do
    for i, v in pairs(players:GetPlayers()) do
        if v ~= plr then
            esp(v, _G.UseTeamColor and v.TeamColor.Color or ((plr.TeamColor == v.TeamColor) and _G.FriendColor or _G.EnemyColor))
        end
    end
end
    end,
})






local HideBloodToggle = VisualTab:CreateToggle({
    Name = "Hide Blood",
    CurrentValue = false, -- Initially off
    Flag = "HideBloodToggle", -- Unique flag for saving
    Callback = function(Value)
        -- Update the visibility of the FullScreenFrame based on the toggle's state
        game:GetService("CoreGui"):WaitForChild("TopBarApp", 15):FindFirstChild("FullScreenFrame").Visible = not Value
    end,
})




local VisualSection2 = VisualTab:CreateSection("Lights")


local function updateLightColors(r, g, b)
    light.Color = Color3.fromRGB(r, g, b)

    for _, l in ipairs(interlights:GetChildren()) do
        if l:IsA("SpotLight") then
            l.Color = Color3.fromRGB(r, g, b)
            l.SpotLight.Color = Color3.fromRGB(r, g, b)
        end
    end

    pointlight.Color = Color3.fromRGB(r, g, b)
end

local R = 255
local G = 255
local B = 255

local function toggleRave(value)
    isRaveActive = value
    while isRaveActive do
        -- Your existing rave color cycle logic here
        -- Example rainbow effect:
        for hue = 0, 1, 0.01 do
            if not isRaveActive then break end
            local color = Color3.fromHSV(hue, 1, 1)
            
            -- Update both variables and color picker
            R = math.floor(color.R * 255)
            G = math.floor(color.G * 255)
            B = math.floor(color.B * 255)
            
            updateLightColors(R, G, B)
            ColorPicker:Set(color)  -- Update color picker UI
            
            wait(0.1)
        end
    end
end

-- Create color picker (modified to store in shared variable)
ColorPicker = VisualTab:CreateColorPicker({
    Name = "Light Color",
    Color = Color3.fromRGB(R, G, B),
    Flag = "LightColorPicker",
    Callback = function(SelectedColor)
        if not isRaveActive then  -- Only allow manual changes when rave is off
            R = math.floor(SelectedColor.R * 255 + 0.5)
            G = math.floor(SelectedColor.G * 255 + 0.5)
            B = math.floor(SelectedColor.B * 255 + 0.5)
            updateLightColors(R, G, B)
        else
            -- Optional: Revert to rave color if changed during active rave
            ColorPicker:Set(Color3.fromRGB(R, G, B))
        end
    end
})

task.spawn(function()
while true do
    wait(0.01) -- Adjust the wait time as needed
    if not isRaveActive then
        pointlight.Color = Color3.fromRGB(R, G, B) -- Only update if not in rave mode
    end
end
end)

local RaveToggle = VisualTab:CreateToggle({
    Name = "Rave",
    CurrentValue = false,
    Flag = "RaveToggleFlag",
    Callback = function(value)
        toggleRave(value)
    end,
})






















-- PVP & FARMING












local Button = PvPFarmingTab:CreateButton({
    Name = "Kill Everyone (gun modes)",
    Callback = function()
        print("soskdkjjfifiwjwlslvkkbslalsldmfk")
        while wait() do
            game:GetService("ReplicatedStorage").RemoteEvent:FireServer(16, "secret")
            wait()
            for i, v in pairs(game.Players:GetPlayers()) do
                if v.Name ~= game.Players.LocalPlayer.Name then
                    game:GetService("ReplicatedStorage").RemoteEvent:FireServer(30, v)
                end
            end
        end
    end,
})


local Button = PvPFarmingTab:CreateButton({
    Name = "Hitbox Expander",
    Callback = function()
        _G.HeadSize = 3
        _G.Disabled = true
        game:GetService('RunService').RenderStepped:connect(function()
            if _G.Disabled then
                for i, v in next, game:GetService('Players'):GetPlayers() do
                    if v.Name ~= game:GetService('Players').LocalPlayer.Name then
                        pcall(function()
                            v.Character.Head.Size = Vector3.new(_G.HeadSize, _G.HeadSize, _G.HeadSize)
                            v.Character.Head.Transparency = 1
                            v.Character.Head.BrickColor = BrickColor.new("Really blue")
                            v.Character.Head.Material = "Neon"
                            v.Character.Head.CanCollide = false
                        end)
                    end
                end
            end
        end)

        _G.HumanoidRootPartSize = 5
        _G.Disabled = true
        game:GetService('RunService').RenderStepped:connect(function()
            if _G.Disabled then
                for i, v in next, game:GetService('Players'):GetPlayers() do
                    if v.Name ~= game:GetService('Players').LocalPlayer.Name then
                        pcall(function()
                            v.Character.HumanoidRootPart.Size = Vector3.new(_G.HumanoidRootPartSize, _G.HumanoidRootPartSize, _G.HumanoidRootPartSize)
                            v.Character.HumanoidRootPart.Transparency = 1
                            v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really blue")
                            v.Character.HumanoidRootPart.Material = "Neon"
                            v.Character.HumanoidRootPart.CanCollide = false
                        end)
                    end
                end
            end
        end)
        Rayfield:Notify({
   Title = "Hitbox Expander Activated",
   Content = "Head Size: 3  //  Torso Size: 5",
   Duration = 3,
   Image = 13047715178,
   Actions = { -- Notification Buttons
      Ignore = {
         Name = ":3",
         Callback = function()
         print("The user tapped Okay!")
      end
   },
},
})

    end,
})


local Button = PvPFarmingTab:CreateButton({
    Name = "AutoFarm",
    Callback = function()
        getgenv().AutoFarm = true 
        getgenv().ServerHop = false 
        loadstring(game:HttpGet('https://raw.githubusercontent.com/2vsh/breakingpoint/main/mainscript.lua'))()
    end,
})


local AntiHitButton = PvPFarmingTab:CreateButton({
    Name = "Anti-Hit",
    Callback = function()
        getgenv().AutoFarm = true 
        getgenv().ServerHop = false 
        while wait() do
getgenv().farmer = true
while wait(0.4) do
    if getgenv().farmer == true then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-44.7331047, 16.5328293, -183.937393, 0.808937192, 0.101593107, -0.579050601, 0, 0.984955668, 0.1728082, 0.587895155, -0.139790982, 0.796767175)
    end

    wait(0.4) 
    if getgenv().farmer == true then 
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-15.1462975, 18.2789803, -181.310211, 0.851396799, -0.0996602774, 0.514967442, 0, 0.981783748, 0.190001965, -0.524522364, -0.161767066, 0.835887372)
    end

    wait(0.4)
    if getgenv().farmer == true then 
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-15.2029905, 20.2077026, -238.855881, -0.717146337, -0.177188456, 0.67402178, 7.45057971e-09, 0.967140079, 0.254244089, -0.6969226, 0.182330221, -0.693580985)
    end
end
end
    end,
})


local Button = PvPFarmingTab:CreateButton({
    Name = "Legacy Auto-Throw",
    Callback = function()
        local plrs = game:service "Players"
local lp = plrs.LocalPlayer
local bind = lp.PlayerScripts.Event
local ThrowKnifeFunc
local KillFunc
local MsgBox
function GetSkid()
    for _, plr in pairs(plrs:GetPlayers()) do
        if plr ~= lp and plr.Character and plr.Character:FindFirstChild("Blade") and plr.Character.Humanoid.Health > 0 then
            return plr
        end
    end
    return nil
end

function GetKillFunc()
    for i, v in pairs(getgc(false)) do
        if type(v) == "function" and tostring(getfenv(v).script) == game.Players.LocalPlayer.PlayerScripts:GetChildren()[1].Name then
            local constants = debug.getconstants(v)
            for _, b in pairs(constants) do
                if tostring(b) == "IIlIla" then
                    KillFunc = v
                end
            end
        end
    end
end

function GetThrowKnifeFunc()
    for i, v in pairs(getgc(true)) do
        if type(v) == "function" and debug.getinfo(v).name == "throw" then
            ThrowKnifeFunc = v
        end
    end
end

function GetMsgBoxFunc()
    for i, v in pairs(getgc(true)) do
        if type(v) == "function" and debug.getinfo(v).name == "fancymsgbox" then
            MsgBox = v
        end
    end
end



GetKillFunc()
GetThrowKnifeFunc()
GetMsgBoxFunc()

debug.setconstant(ThrowKnifeFunc, 46, 1)

MsgBox("Legacy Auto-Throw loaded! :3 (ripped from H4R7N, deobfuscated by Symest)")
while wait(0.5) do
    local ptr = GetSkid()
    if ptr ~= nil and lp.Character:FindFirstChild("Blade") then
        bind:Fire("t", ptr.Character.HumanoidRootPart.CFrame)
        KillFunc(ptr.Character.HumanoidRootPart, true, ptr.Character.HumanoidRootPart.Position)
        ThrowKnifeFunc(ptr.Character.HumanoidRootPart.CFrame)
    end
end
end,
})

local Button = PvPFarmingTab:CreateButton({
    Name = "Legacy Kill Aura + Always Hit",
    Callback = function()
        -- Safely load and execute the script
        local success, err = pcall(function()
            loadstring(game:HttpGet('https://raw.githubusercontent.com/shimesuto/SymestsBPthingy/refs/heads/main/thekillaura.lua'))()
        end)

        -- Handle any errors that occur during loading
        if not success then
            print("Error loading Kill Aura script: " .. err)
         
        else
            print("Kill Aura script loaded successfully!")
        end
    end,
})













-- MISC





local MiscBPSection = MiscTab:CreateSection("Breaking Point Related")


local ArcadeWinna = MiscTab:CreateButton({
   Name = "Auto-Win Arcade Game",
   Callback = function()
 local arcade = workspace.arcade
 if not arcade then return end
 
 if not arcade.screen.SurfaceGui.label.Text == "PRESS RED TO START        (10 CREDITS)" then
       Rayfield:Notify({
   Title = "Oopsies..",
   Content = "The Arcade Machine is already in use!",
   Duration = 3,
   Image = 13047715178,
   Actions = { -- Notification Buttons
      Ignore = {
         Name = "!",
         Callback = function()
         print("The user tapped Okay!")
      end
   },
},
})
       return
 end

 local credits,success
 repeat
       credits, success = game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer(36) -- credits
       if success then
	  break
       end
       task.wait(5)
 until success

 if credits < 10 then
       Rayfield:Notify({
   Title = "Too Broke!",
   Content = "You need at least 10 Credits!",
   Duration = 3,
   Image = 13047715178,
   Actions = { -- Notification Buttons
      Ignore = {
         Name = "!",
         Callback = function()
         print("The user tapped Okay!")
      end
   },
},
})
       return
 end
 
 local redbutton = arcade.button1
 local purplebutton = arcade.button2

 -- Try to start the game
 fireclickdetector(redbutton.ClickDetector, 1)
 task.wait(0.3)
 if arcade.screen.SurfaceGui.label.Text == "TRY AGAIN LATER" then
       Rayfield:Notify({
   Title = "Oopsies..",
   Content = "The Arcade Machine is on Cooldown!",
   Duration = 3,
   Image = 13047715178,
   Actions = { -- Notification Buttons
      Ignore = {
         Name = "!",
         Callback = function()
         print("The user tapped Okay!")
      end
   },
},
})
 end

 task.wait(1)

 fireclickdetector(purplebutton.ClickDetector, 1)
 local xPositionToWin = arcade.screen.SurfaceGui.stacker:WaitForChild("stacked").Position.X

 while true do task.wait(1)
 repeat task.wait() until arcade.screen.SurfaceGui.stacker.box.Position.X == xPositionToWin
 fireclickdetector(purplebutton.ClickDetector, 1)
 end
end,

})

local RespawnButton = MiscTab:CreateButton({
    Name = "Respawn (even if restricted)",
    Callback = function()
        local player = game.Players.LocalPlayer
        if player and player.Character then
            player.Character:BreakJoints()
        end
    end,
})


local SpamSoundToggle = MiscTab:CreateToggle({
    Name = "Spam Vote Out Noise",
    CurrentValue = false, -- Initially off
    Flag = "SpamSoundToggle", -- Unique flag for saving
    Callback = function(Value)
        -- Start or stop the sound based on the toggle's state
        local Path = game:GetService("ReplicatedStorage").model.Sound
        if Value then
            -- Start the sound
            task.spawn(function()
                repeat
                    Path.Playing = true
                    Path.TimePosition = math.random(10, 75) / 100
                    wait(0.5)
                until not Value -- Stop when the toggle is turned off
            end)
        else
            -- Stop the sound immediately
            Path.Playing = false 
        end
    end,
})

local Button = MiscTab:CreateButton({
    Name = "Lag Server (TRADE UNBAN)",
    Callback = function()
        while wait() do
            local args = {
                [1] = 42,
                [2] = true
            }

            game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))
        end
    end,
})


local SoLikeSoloDuoButton = MiscTab:CreateButton({
    Name = "Solo Duo",
    Callback = function()
        local args = {[1] = 39, [2] = game:GetService("Players").LocalPlayer}
game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))
    end
})



local EndOfTheWorld = MiscTab:CreateButton({
   Name = "Spam Team Invites (works in all servers)",
   Callback = function()
while wait() do
   game:GetService("ReplicatedStorage").RemoteEvent:FireServer(16, "public")
   wait()
   for i,v in pairs(game.Players:GetPlayers()) do
       if v.Name == game.Players.LocalPlayer.Name then
           else
           game:GetService("ReplicatedStorage").RemoteEvent:FireServer(39, v)
       end
   end
end
   end,
})


local TradeBanCheckerooni = CosmeticTradingTab:CreateButton({
    Name = "List Tradebanned Players (check console)",
    Callback = function()
        for _, player in pairs(game.Players:GetPlayers()) do
    local tradebanned = player.tradebanned
    if tradebanned then
        if tradebanned.Value then
            print(player.Name .. " is tradebanned! ")
        end
    end
end
    end,
})


-- OTHER MISC

local MiscBPSection = MiscTab:CreateSection("Other")

local ZoomLimitButton = MiscTab:CreateButton({
    Name = "Disable Camera Zoom Limit",
    Callback = function()
        game.Loaded:Wait()
game:GetService("Players").LocalPlayer.CameraMaxZoomDistance = 4000
    end,
})

local killDatHoe = MiscTab:CreateButton({
    Name = "KILL UI",
    Callback = function()
        Rayfield:Destroy()
    end,
})

local AntiAFKButton = MiscTab:CreateButton({
    Name = "Anti-AFK",
    Callback = function()
        -- Start the Anti-AFK function
        task.spawn(function()
            while true do
                -- Move the player's character slightly
                if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
                    local humanoid = game.Players.LocalPlayer.Character.Humanoid
                    humanoid:Move(Vector3.new(0, 0, 0)) -- You can adjust the movement if needed
                end
                wait(5) -- Wait for 5 seconds before the next action
            end
        end)

        print("Anti-AFK activated! You will not be flagged as AFK.")
    end,
})


local NoClipToggle = MiscTab:CreateToggle({
    Name = "NoClip",
    CurrentValue = false, -- Initial state
    Callback = function(value)
        noclipEnabled = value -- Update the NoClip state based on the toggle

        if noclipEnabled then
            print("NoClip activated! You can now walk through walls.")
        else
            print("NoClip deactivated! You will collide with walls again.")
        end

        -- Function to enable or disable NoClip
        local function toggleNoClip()
            local character = game.Players.LocalPlayer.Character
            if character then
                for _, part in ipairs(character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = not noclipEnabled -- Toggle collision
                    end
                end
            end
        end

        -- Connect to the RenderStepped event to continuously check NoClip state
        game:GetService("RunService").RenderStepped:Connect(function()
            if noclipEnabled then
                toggleNoClip()
            else
                toggleNoClip() -- Restore collision when NoClip is off
            end
        end)
    end,
})

local JerkingMyShit = MiscTab:CreateButton({
   Name = "Jerk Off",
   Callback = function()
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-jerk-off-25958"))()
   end,
})

local HopButton = MiscTab:CreateButton({
    Name = "Server Hop",
    Callback = function()
        local Player = game.Players.LocalPlayer    
        local Http = game:GetService("HttpService")
        local TPS = game:GetService("TeleportService")
        local Api = "https://games.roblox.com/v1/games/"

        local _place, _id = game.PlaceId, game.JobId
        -- Asc for lowest player count, Desc for highest player count
        local _servers = Api.._place.."/servers/Public?sortOrder=Desc&limit=10"

        function ListServers(cursor)
            local Raw = game:HttpGet(_servers .. ((cursor and "&cursor="..cursor) or ""))
            return Http:JSONDecode(Raw)
        end

        local time_to_wait = 1

        while wait(time_to_wait) do
            -- Freeze player before teleporting to prevent crash
            if Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
                Player.Character.HumanoidRootPart.Anchored = true
                local Servers = ListServers()
                if #Servers.data > 0 then
                    local Server = Servers.data[math.random(1, #Servers.data)]
                    TPS:TeleportToPlaceInstance(_place, Server.id, Player)
                else
                    print("No available servers found.")
                end
            end
        end
    end,
})


local RejoinButton = MiscTab:CreateButton({
    Name = "Rejoin Server",
    Callback = function()
        local ts = game:GetService("TeleportService")
        local p = game:GetService("Players").LocalPlayer

        -- Teleport the player to the same place instance
        ts:TeleportToPlaceInstance(game.PlaceId, game.JobId, p)
    end,
})












-- COSMETIC + TRADING







local VipKnifeButton = CosmeticTradingTab:CreateButton({
    Name = "Vip Knife Display",
    Callback = function()
        local args = {
            [1] = 53,
            [2] = "Display Knife 2",
            [3] = true
        }

        game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer(unpack(args))
    end,
})






local StellarChairButton = CosmeticTradingTab:CreateButton({
    Name = "Equip Stellar VIP Chair (unequip current)",
    Callback = function()
        print("Equipping Stellar VIP Chair...")

        local args = {
            [1] = 55,
            [2] = "Chair Skins",
            [3] = "Space",
            [4] = "Stellar"
        }

        game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))
    end,
})


local BlueGalaxyChairButton = CosmeticTradingTab:CreateButton({
    Name = "Equip Blue Galaxy VIP Chair (unequip current)",
    Callback = function()
        print("Equipping Blue Galaxy VIP Chair...")

        local args = {
            [1] = 55,
            [2] = "Chair Skins",
            [3] = "Space",
            [4] = "Blue Galaxy"
        }

        game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))
    end,
})


local EquipPinkCosmicButton = CosmeticTradingTab:CreateButton({
    Name = "Equip Pink Cosmic (unequip current)", -- Button name
    Callback = function()
        print("Equipping Pink Cosmic...")

        local data = {
            4523844958, 4523845006, 4523845049, 4523845088, 4523845123,
            4523845163, 4523845196, 4523845229, 4523845264, 4523845299,
            4523845335, 4523845368, 4523845403, 4523845434, 4523845466,
            4523845506, 4523845541, 4523845565, 4523845593, 4523845623,
            4523845658, 4523845690, 4523845725, 4523845753
        }

        -- Start a coroutine to avoid blocking the UI
        coroutine.wrap(function()
            while true do
                for _, id in ipairs(data) do
                    pcall(function()
                        game.Players.LocalPlayer.Character["display_blade"].Mesh.TextureId = "rbxassetid://" .. id
                    end)
                    pcall(function()
                        game.Players.LocalPlayer.Character.Blade.Handle.Mesh.TextureId = "rbxassetid://" .. id
                    end)
                    wait(0.04) -- Wait for a short duration before changing the texture
                end
            end
        end)()
    end,
})





local BlackProfileButton = CosmeticTradingTab:CreateButton({
    Name = "Black Profile Color",
    Callback = function()
        local args = {
    [1] = 62,
    [2] = -1
}

game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))

    end,
})






local ErainButton = 
CosmeticTradingTab:CreateButton({
    Name = "Unbox /e rain (3 Credits)",
    Callback = function()
        local success, message = pcall(function()
            return game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer(66, "Animations", "Exclusive")
        end)

        if success then
            print("Successfully invoked server for Limited Unbox!")

            
            function GetMsgBoxFunc()
                for i, v in pairs(getgc(true)) do
                    if type(v) == "function" and debug.getinfo(v).name == "fancymsgbox" then
                        MsgBox = v
                    end
                end
            end

            -- Call the function to set MsgBox
            GetMsgBoxFunc()

            -- Show the message box
            MsgBox("Rejoin to claim :3")

        else
            print("Error invoking server for Unbox: " .. message)
        end
    end,
})


-- Create a button for Knife Skins - Winter Gift
local KnifeGiftButton = CosmeticTradingTab:CreateButton({
    Name = "Unbox Candy Crown (10K Credits)",
    Callback = function()
        local success, message = pcall(function()
            return game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer(66, "Knife Skins", "Winter Gift")
        end)

        if success then
            print("Successfully invoked server for Limited Unbox!")

            -- Function to get message box function
            function GetMsgBoxFunc()
                for i, v in pairs(getgc(true)) do
                    if type(v) == "function" and debug.getinfo(v).name == "fancymsgbox" then
                        MsgBox = v
                    end
                end
            end

            -- Call the function to set MsgBox
            GetMsgBoxFunc()

            -- Show the message box
            MsgBox("Rejoin to claim :3")

        else
            print("Error invoking server for Unbox: " .. message)
        end
    end,
})


-- Create a button for Chair Skins - Winter
local ChairButton = CosmeticTradingTab:CreateButton({
    Name = "Unbox Royal Red (10K Credits)",
    Callback = function()
        local success, message = pcall(function()
            return game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer(66, "Chair Skins", "Winter")
        end)

        if success then
            print("Successfully invoked server for Limited Unbox!")

            -- Function to get message box function
            function GetMsgBoxFunc()
                for i, v in pairs(getgc(true)) do
                    if type(v) == "function" and debug.getinfo(v).name == "fancymsgbox" then
                        MsgBox = v
                    end
                end
            end

            -- Call the function to set MsgBox
            GetMsgBoxFunc()

            -- Show the message box
            MsgBox("Rejoin to claim :3")

        else
            print("Error invoking server for Unbox: " .. message)
        end
    end,
})


-- Create a button for Accessories - Knife Antlers
local AccessoriesButton = CosmeticTradingTab:CreateButton({
    Name = "Unbox Knife Antler Case (10K Credits)",
    Callback = function()
        local success, message = pcall(function()
            return game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer(66, "Accessories", "Knife Antlers")
        end)

        if success then
            print("Successfully invoked server for Limited Unbox!")

            -- Function to get message box function
            function GetMsgBoxFunc()
                for i, v in pairs(getgc(true)) do
                    if type(v) == "function" and debug.getinfo(v).name == "fancymsgbox" then
                        MsgBox = v
                    end
                end
            end

            -- Call the function to set MsgBox
            GetMsgBoxFunc()

            -- Show the message box
            MsgBox("Rejoin to claim :3")

        else
            print("Error invoking server for Unbox: " .. message)
        end
    end,
})














local lst = {0x57, 0x41, 0x53, 0x44}
-- 0x57 = W, 0x41 = A, 0x53 = S, 0x44 = D

_G.on = false -- Shared state variable

task.spawn(function()
            while task.wait() do
                if _G.on == true then
                local key = lst[math.random(1, #lst)]

                -- Jump action
                keypress(0x20)  -- Space key
                task.wait(0.1)
                keyrelease(0x20)

                -- Movement action
                keypress(key)
                task.wait(0.4)
                keyrelease(key)

                -- Cooldown
                task.wait(0.5)
                end
            end
            end)

local AutoMovementToggle = PvPFarmingTab:CreateToggle({
    Name = "Auto Movement",
    CurrentValue = false,
    Flag = "AutoMovementToggle",
    Callback = function(Value)
        _G.on = Value
    end,
})



local PenisButton = PvPFarmingTab:CreateButton({
   Name = "Force All Players to Shoot in Secret",
   Callback = function()
       --SECRET
       while true do
           game:GetService("ReplicatedStorage").RemoteEvent:FireServer(16, "secret")
           wait()
       end
   end,
})

local PenisButtonPtTwo = PvPFarmingTab:CreateButton({
   Name = "Force All Players to Shoot in Public",
   Callback = function()
--PUBLIC
while true do
  game:GetService("ReplicatedStorage").RemoteEvent:FireServer(16, "public")
  wait()
  end
   end,
})

local BreakingPlusHub = OtherHubsTab:CreateButton({
   Name = "Breaking Plus (RECOMMENDED)",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/NaikoScript/Breaking-Plus/main/Script"))()
   end,
})

local FuchsiaXHub = OtherHubsTab:CreateButton({
   Name = "Fuchsia X (RECOMMENDED)",
   Callback = function()
loadstring(game:HttpGet("https://fuchsiax.latealways.dev/script"))()
   end,
})

local PenispooSection = OtherHubsTab:CreateSection("Other")

local H4R7NMENU = OtherHubsTab:CreateButton({
   Name = "H4R7N",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/H4R7NHacks/Obfuscated/master/Breaking%20Point%20H4R7N%20Hack%20v1.2.lua"))()
   end,
})

local BUSTERRRRRRRRRR = OtherHubsTab:CreateButton({
   Name = "Buster",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ColdStep2/Breaking-Point-Funny-Squid-Hax/main/Breaking%20Point%20Funny%20Squid%20Hax",true))();
   end,
})














-- Combat

local ComingSoonCombatParagraph = CombatTab:CreateParagraph({
    Title = "Coming Soom Features:", Content = "adjustable kill aura, proximity auto-stab, advanced auto-throw (see server announcements), silent aim, adjustable hitbox expander, always hit with adjustable headshot ratio (doesn't tradeban), anti-legacy aimbot"
})









-- BELOW HERE IS THE IMPORTING SHIT --


-- THIS PART IS HUGE SO I GOTTA SEPERARE IT LMFAO --


-- CREDITS TO NAIKO --



local BreakingPlusHub = CustomScriptsTab:CreateButton({
   Name = "(USE FIRST) Execute Breaking Plus",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/NaikoScript/Breaking-Plus/main/Script"))()
   end,
})














-- WOO BIG SPACE WOAHHHH--




-- importing begins here --


local Section = CustomScriptsTab:CreateSection("Chairs")


-- CHAIRS --



local Uhhh1 = CustomScriptsTab:CreateButton({
   Name = "Vibrant",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/NaikoScript/Breaking-Point-Porting/refs/heads/main/BreakingPointItems/Chairs/Vibrant.lua"))()
   end,
})

local Uhhh2 = CustomScriptsTab:CreateButton({
   Name = "Aquarious",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/NaikoScript/Breaking-Point-Porting/refs/heads/main/PortedItems/Chairs/Aquarious.lua"))()
   end,
})

local Uhhh3 = CustomScriptsTab:CreateButton({
   Name = "RGB Devil",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/NaikoScript/Breaking-Point-Porting/refs/heads/main/PortedItems/Chairs/RGB%20Devil.lua"))()
   end,
})

local Uhhh4 = CustomScriptsTab:CreateButton({
   Name = "Sakura",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/NaikoScript/Breaking-Point-Porting/refs/heads/main/PortedItems/Chairs/Sakura.lua"))()
   end,
})

local Uhhh5 = CustomScriptsTab:CreateButton({
   Name = "Swamp",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/NaikoScript/Breaking-Point-Porting/refs/heads/main/PortedItems/Chairs/Swamp.lua"))()
   end,
})










-- KNIVES HERE --



local Section = CustomScriptsTab:CreateSection("Knives")




-- WOAHH KNIVES -- 



local erm1 = CustomScriptsTab:CreateButton({
   Name = "Arctic",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/NaikoScript/Breaking-Point-Porting/refs/heads/main/BreakingPointItems/Knifes/Arctic.lua"))()
   end,
})

local erm2 = CustomScriptsTab:CreateButton({
   Name = "Aureus",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/NaikoScript/Breaking-Point-Porting/refs/heads/main/BreakingPointItems/Knifes/Aureus.lua"))()
   end,
})

local erm3 = CustomScriptsTab:CreateButton({
   Name = "Azure",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/NaikoScript/Breaking-Point-Porting/refs/heads/main/BreakingPointItems/Knifes/Azure.lua"))()
   end,
})

local erm4 = CustomScriptsTab:CreateButton({
   Name = "Fracture",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/NaikoScript/Breaking-Point-Porting/refs/heads/main/BreakingPointItems/Knifes/Aureus.lua"))()
   end,
})

local erm5 = CustomScriptsTab:CreateButton({
   Name = "Infinite",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/NaikoScript/Breaking-Point-Porting/refs/heads/main/BreakingPointItems/Knifes/Infinite.lua"))()
   end,
})

local erm7 = CustomScriptsTab:CreateButton({
   Name = "Jade",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/NaikoScript/Breaking-Point-Porting/refs/heads/main/BreakingPointItems/Knifes/Jade.lua"))()
   end,
})


local erm8 = CustomScriptsTab:CreateButton({
   Name = "Mellow",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/NaikoScript/Breaking-Point-Porting/refs/heads/main/BreakingPointItems/Knifes/Mellow.lua"))()
   end,
})

local erm9 = CustomScriptsTab:CreateButton({
   Name = "Phantom",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/NaikoScript/Breaking-Point-Porting/refs/heads/main/BreakingPointItems/Knifes/Phantom.lua"))()
   end,
})

local erm10 = CustomScriptsTab:CreateButton({
   Name = "Radiant",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/NaikoScript/Breaking-Point-Porting/refs/heads/main/BreakingPointItems/Knifes/Radiant.lua"))()
   end,
})

local erm11 = CustomScriptsTab:CreateButton({
   Name = "PINK COSMIC",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/NaikoScript/Breaking-Point-Porting/refs/heads/main/BreakingPointItems/Knifes/Pink%20Cosmic.lua"))()
   end,
})

local erm12 = CustomScriptsTab:CreateButton({
   Name = "Absolute",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/NaikoScript/Breaking-Point-Porting/refs/heads/main/PortedItems/Knifes/Absolute.lua"))()
   end,
})

local erm13 = CustomScriptsTab:CreateButton({
   Name = "Blood Radiant",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/NaikoScript/Breaking-Point-Porting/refs/heads/main/PortedItems/Knifes/Blood%20Radiant.lua"))()
   end,
})

local erm14 = CustomScriptsTab:CreateButton({
   Name = "Charged",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/NaikoScript/Breaking-Point-Porting/refs/heads/main/PortedItems/Knifes/Charged.lua"))()
   end,
})

local erm15 = CustomScriptsTab:CreateButton({
   Name = "Chromatic",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/NaikoScript/Breaking-Point-Porting/refs/heads/main/PortedItems/Knifes/Chromatic.lua"))()
   end,
})

local erm16 = CustomScriptsTab:CreateButton({
   Name = "Crimson",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/NaikoScript/Breaking-Point-Porting/refs/heads/main/PortedItems/Knifes/Crimson.lua"))()
   end,
})

local erm18 = CustomScriptsTab:CreateButton({
   Name = "Fogish",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/NaikoScript/Breaking-Point-Porting/refs/heads/main/PortedItems/Knifes/Fogish.lua"))()
   end,
})

local erm19 = CustomScriptsTab:CreateButton({
   Name = "Lavatic",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/NaikoScript/Breaking-Point-Porting/refs/heads/main/PortedItems/Knifes/Lavatic.lua"))()
   end,
})

local erm20 = CustomScriptsTab:CreateButton({
   Name = "Liquecy",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/NaikoScript/Breaking-Point-Porting/refs/heads/main/PortedItems/Knifes/Liquecy.lua"))()
   end,
})

local erm21 = CustomScriptsTab:CreateButton({
   Name = "Poseidon",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/NaikoScript/Breaking-Point-Porting/refs/heads/main/PortedItems/Knifes/Poseidon.lua"))()
   end,
})

local erm22 = CustomScriptsTab:CreateButton({
   Name = "RGB Eternal",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/NaikoScript/Breaking-Point-Porting/refs/heads/main/PortedItems/Knifes/RGB%20Eternal.lua"))()
   end,
})



local erm24 = CustomScriptsTab:CreateButton({
   Name = "Red Hole",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/NaikoScript/Breaking-Point-Porting/refs/heads/main/PortedItems/Knifes/Red%20hole.lua"))()
   end,
})

local erm25 = CustomScriptsTab:CreateButton({
   Name = "Sagrance",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/NaikoScript/Breaking-Point-Porting/refs/heads/main/PortedItems/Knifes/Sagrance.lua"))()
   end,
})

local erm26 = CustomScriptsTab:CreateButton({
   Name = "Skylight",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/NaikoScript/Breaking-Point-Porting/refs/heads/main/PortedItems/Knifes/Skylight.lua"))()
   end,
})

local erm27 = CustomScriptsTab:CreateButton({
   Name = "Sparkly",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/NaikoScript/Breaking-Point-Porting/refs/heads/main/PortedItems/Knifes/Sparkly.lua"))()
   end,
})

local erm28 = CustomScriptsTab:CreateButton({
   Name = "Wivey",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/NaikoScript/Breaking-Point-Porting/refs/heads/main/PortedItems/Knifes/Wivey.lua"))()
   end,
})












-- guns begin here --


local Section = CustomScriptsTab:CreateSection("Guns")


-- oooo guns --


local ehm1 = CustomScriptsTab:CreateButton({
   Name = "Peak",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/NaikoScript/Breaking-Point-Porting/refs/heads/main/BreakingPointItems/Guns/Peak.lua"))()
   end,
})


local ehm2 = CustomScriptsTab:CreateButton({
   Name = "Retro",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/NaikoScript/Breaking-Point-Porting/refs/heads/main/BreakingPointItems/Guns/Retro.lua"))()
   end,
})

local ehm3 = CustomScriptsTab:CreateButton({
   Name = "Ruby",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/NaikoScript/Breaking-Point-Porting/refs/heads/main/BreakingPointItems/Guns/Ruby.lua"))()
   end,
})

local ehm4 = CustomScriptsTab:CreateButton({
   Name = "Skyline",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/NaikoScript/Breaking-Point-Porting/refs/heads/main/BreakingPointItems/Guns/Skyline.lua"))()
   end,
})

local erm5 = CustomScriptsTab:CreateButton({
   Name = "Webs",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/NaikoScript/Breaking-Point-Porting/refs/heads/main/BreakingPointItems/Guns/Webs.lua"))()
   end,
})

local erm6 = CustomScriptsTab:CreateButton({
   Name = "Zebra",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/NaikoScript/Breaking-Point-Porting/refs/heads/main/BreakingPointItems/Guns/Zebra.lua"))()
   end,
})

local erm7 = CustomScriptsTab:CreateButton({
   Name = "Flare",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/NaikoScript/Breaking-Point-Porting/refs/heads/main/PortedItems/Guns/Flare.lua"))()
   end,
})
