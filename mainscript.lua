
-- Symest's script thing uh yeah --
-- with cool comments so you can comprehend this --
-- powered by lots of um uhhh uhmmm uhhhhhhhh --

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
MsgBox("Patch notes:\nUhhhhh show Names randomly broke\nWARNING: ALWAYS HIT WILL TRADE BAN YOU!")

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Symest Hub",
   LoadingTitle = "Symest Hub (Free)",
   LoadingSubtitle = "Making BP Accessible to All",
   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil, 
      FileName = "Piss Hub"
   },
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

Window.ModifyTheme("AmberGlow")

local PvPFarmingTab = Window:CreateTab("PvP & Farming", nil)
local PvPFarmingSection = PvPFarmingTab:CreateSection("Get more with Symest Hub Platinum")

local CosmeticTradingTab = Window:CreateTab("Cosmetic & Trading", nil) -- Title, Image
local CosmeticTradingSection = CosmeticTradingTab:CreateSection("Get even more OP scripts with Symest Hub Platinum")

local MiscTab = Window:CreateTab("Miscellaneous", nil) -- Title, Image
local MiscSection = MiscTab:CreateSection("Get game breaking scripts with Symest Hub Platinum")

local SillyTab = Window:CreateTab("Silly & Trolling", nil) -- Title, Image

local SillySection = SillyTab:CreateSection("Purchase Symest Hub Platinum #ad #shamelessplug #gonnakms")

local CustomScriptsTab = Window:CreateTab("Skin Importation", nil) -- Title, Image

local CustomScriptsSection = CustomScriptsTab:CreateSection("DO THIS FIRST")

local OtherHubsTab = Window:CreateTab("Other Hubs & Such", nil) -- Title, Image
local OtherHubsSection = OtherHubsTab:CreateSection("Recommended")


Rayfield:Notify({
   Title = "Symest Hub Loaded",
   Content = "Join The Discord!!",
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

local Button = PvPFarmingTab:CreateButton({
    Name = "Kill Everyone (gun modes)",
    Callback = function()
        print("Button clicked!")  -- Debugging output
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

-- Create the button for the head and HumanoidRootPart script
local Button = PvPFarmingTab:CreateButton({
    Name = "Semi/Hitbox Expander (recommended if you can aim alright)",
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
    end,
})

-- Create the button for the AutoFarm script
local Button = PvPFarmingTab:CreateButton({
    Name = "AutoFarm",
    Callback = function()
        getgenv().AutoFarm = true -- enables / disables AutoFarm
        getgenv().ServerHop = false -- enables / disables server hop, add to autoexec if you enable this.
        loadstring(game:HttpGet('https://raw.githubusercontent.com/2vsh/breakingpoint/main/mainscript.lua'))()
    end,
})

local Button = MiscTab:CreateButton({
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

-- Create the button for instant respawn
local killDatHoe = MiscTab:CreateButton({
    Name = "KILL UI",
    Callback = function()
        Rayfield:Destroy()
    end,
})

local Button = MiscTab:CreateButton({
    Name = "Easy Instant Respawn",
    Callback = function()
        local player = game.Players.LocalPlayer
        if player and player.Character then
            player.Character:BreakJoints() -- This will cause the character to respawn instantly
        end
    end,
})

-- Create the button for server hopping
local Button = MiscTab:CreateButton({
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

-- Create the button for teleporting to the same place instance
local Button = MiscTab:CreateButton({
    Name = "Rejoin",
    Callback = function()
        local ts = game:GetService("TeleportService")
        local p = game:GetService("Players").LocalPlayer

        -- Teleport the player to the same place instance
        ts:TeleportToPlaceInstance(game.PlaceId, game.JobId, p)
    end,
})

-- Create the button for firing the remote event
local Button = CosmeticTradingTab:CreateButton({
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

-- Create the button for invoking the remote function
local Button = CosmeticTradingTab:CreateButton({
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

-- Assuming MiscTab is your existing Rayfield tab

local HideBloodToggle = MiscTab:CreateToggle({
    Name = "Hide Blood",
    CurrentValue = false, -- Initially off
    Flag = "HideBloodToggle", -- Unique flag for saving
    Callback = function(Value)
        -- Update the visibility of the FullScreenFrame based on the toggle's state
        game:GetService("CoreGui"):WaitForChild("TopBarApp", 15):FindFirstChild("FullScreenFrame").Visible = not Value
    end,
})

-- Assuming MiscTab is your existing Rayfield tab

local SpamSoundToggle = SillyTab:CreateToggle({
    Name = "Spam Noise (toggle broken)",
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


-- Create a button for Equipping Stellar VIP Chair
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

-- Create a button for Equipping Blue Galaxy VIP Chair
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

-- Create a button for Equipping Pink Cosmic
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


-- Assuming MiscTabis your existing Rayfield tab

local HiddenNamesToggle = MiscTab:CreateToggle({
    Name = "Hidden Names",
    CurrentValue = false, -- Initially off
    Flag = "HiddenNamesToggle", -- Unique flag for saving
    Callback = function(Value)
        for _, Player in pairs(game.Players:GetPlayers()) do
            if Player.Character ~= nil and Player.Character:FindFirstChildOfClass("Humanoid") then
                local Humanoid = Player.Character:FindFirstChildOfClass("Humanoid")
                if Value then
                    -- Show hidden names
                    if Humanoid.DisplayDistanceType == Enum.HumanoidDisplayDistanceType.None and not Humanoid:GetAttribute("hidename2") == true then
                        Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.Subject
                        Humanoid.NameDisplayDistance = 100
                        Humanoid:SetAttribute("hidename", true)
                    elseif Humanoid.Sit == true then
                        Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.Subject
                        Humanoid.NameDisplayDistance = 100
                        Humanoid:SetAttribute("hidename2", true)
                    end
                else
                    -- Hide names
                    if Humanoid:GetAttribute("hidename") == true then
                        Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
                    elseif Humanoid:GetAttribute("hidename2") == true and game.Players.LocalPlayer.Character ~= nil and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Sit == true then
                        Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
                    end
                end
            end
        end
    end,
})

-- Create the button for h4r7n rip
local Button = PvPFarmingTab:CreateButton({
    Name = "Cheap Auto-Throw",
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

function empty() end
function GetNightVision()
    for i, v in pairs(getgc(true)) do
         if type(v) == "table" and rawget(v, "serverkeycomp") then
            v.listens.nightvision()
             v.listens.nightvision = empty
        end
    end
end

GetKillFunc()
GetThrowKnifeFunc()
GetMsgBoxFunc()
GetNightVision()

debug.setconstant(ThrowKnifeFunc, 46, 1)

MsgBox("Auto-Throw loaded! :3 (ripped from H4R7N, deobfuscated by Symest)")
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
    Name = "Kill Aura & Always Hit",
    Callback = function()
        -- Safely load and execute the script
        local success, err = pcall(function()
            loadstring(game:HttpGet('https://raw.githubusercontent.com/shimesuto/SymestsBPthingy/refs/heads/main/thekillaura.lua'))()
        end)

        -- Handle any errors that occur during loading
        if not success then
            print("Error loading Kill Aura script: " .. err)
            -- Optionally, you could display an error message to the user if needed.
        else
            print("Kill Aura script loaded successfully!")
        end
    end,
})

-- Assuming you have a GUI setup with a MainTab already created


-- Create the Anti-AFK button under MiscTab
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

-- Variable to track NoClip state
local noclipEnabled = false

-- Create the NoClip toggle under MiscTab
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


-- Create a button for Exclusive Animations
local ExclusiveButton = 
CosmeticTradingTab:CreateButton({
    Name = "Unbox /e rain (3 Credits)",
    Callback = function()
        local success, message = pcall(function()
            return game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer(66, "Animations", "Exclusive")
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

-- Assuming you have the light object and interlights defined
local light = game.Workspace.light
local interlights = game.Workspace.lights
local pointlight = light.PointLight

-- Variable to manage rave state
local isRaveActive = false

-- Function to update the light colors
local function updateLightColors(r, g, b)
    -- Update the main light color
    light.Color = Color3.fromRGB(r, g, b)

    -- Update all interlights
    for _, l in ipairs(interlights:GetChildren()) do
        if l:IsA("SpotLight") then
            l.Color = Color3.fromRGB(r, g, b)
            l.SpotLight.Color = Color3.fromRGB(r, g, b)
        end
    end

    -- Continuously update the point light color
    pointlight.Color = Color3.fromRGB(r, g, b)
end

-- Initialize RGB values
local R = 255
local G = 255
local B = 255

-- Create sliders for Red, Green, and Blue
local RedColorSlider = MiscTab:CreateSlider({
    Name = "Light Red Color Slider",
    Range = {0, 255},
    Increment = 1,
    Suffix = "Red",
    CurrentValue = R,
    Flag = "sliderLightColorR",
    Callback = function(Value)
        if not isRaveActive then -- Only update if rave is not active
            R = Value
            updateLightColors(R, G, B)
        end
    end,
})

local GreenColorSlider = MiscTab:CreateSlider({
    Name = "Light Green Color Slider",
    Range = {0, 255},
    Increment = 1,
    Suffix = "Green",
    CurrentValue = G,
    Flag = "sliderLightColorG",
    Callback = function(Value)
        if not isRaveActive then -- Only update if rave is not active
            G = Value
            updateLightColors(R, G, B)
        end
    end,
})

local BlueColorSlider = MiscTab:CreateSlider({
    Name = "Light Blue Color Slider",
    Range = {0, 255},
    Increment = 1,
    Suffix = "Blue",
    CurrentValue = B,
    Flag = "sliderLightColorB",
    Callback = function(Value)
        if not isRaveActive then -- Only update if rave is not active
            B = Value
            updateLightColors(R, G, B)
        end
    end,
})

-- Function to handle rave toggle
local function toggleRave(value)
    if value then -- If the toggle is on
        isRaveActive = true
        print("Rave started!")

        -- Disable sliders by setting a flag
        RedColorSlider.Callback = function(Value) end
        GreenColorSlider.Callback = function(Value) end
        BlueColorSlider.Callback = function(Value) end

        -- Play the sound with error handling
        local sound = Instance.new("Sound")
        sound.SoundId = "rbxassetid://71730946440672" -- Replace with your sound ID
        sound.Parent = game.Workspace
        sound.Volume = 1 -- Set volume to full (adjust as needed)

        -- Try to play the sound and catch errors
        local success, err = pcall(function()
            sound:Play()
        end)

        if not success then
            print("Error playing sound: " .. err) -- Log the error if sound fails to play
        end

        -- Start the rainbow flashing effect
        while isRaveActive do
            for _, color in ipairs({
                Color3.fromRGB(255, 0, 0),     -- Red
                Color3.fromRGB(255, 127, 0),   -- Orange
                Color3.fromRGB(255, 255, 0),   -- Yellow
                Color3.fromRGB(0, 255, 0),     -- Green
                Color3.fromRGB(0, 0, 255),     -- Blue
                Color3.fromRGB(75, 0, 130),    -- Indigo
                Color3.fromRGB(148, 0, 211)     -- Violet
            }) do
                pointlight.Color = color
                wait(0.5) -- Adjust the wait time for speed of flashing
            end
        end

        -- Cleanup the sound when rave stops
        sound:Stop()
        sound:Destroy()
    else -- If the toggle is off
        isRaveActive = false
        pointlight.Color = Color3.fromRGB(255, 255, 255) -- Reset to white or original color

        -- Re-enable sliders by restoring their callbacks
        RedColorSlider.Callback = function(Value)
            R = Value
            updateLightColors(R, G, B)
        end

        GreenColorSlider.Callback = function(Value)
            G = Value
            updateLightColors(R, G, B)
        end

        BlueColorSlider.Callback = function(Value)
            B = Value
            updateLightColors(R, G, B)
        end

        print("Rave stopped.")
    end
end

-- Create the Rave Toggle in the "Silly" tab
local RaveToggle = SillyTab:CreateToggle({
    Name = "Rave",
    CurrentValue = false, -- Initial state of the toggle
    Flag = "RaveToggleFlag", -- Unique flag for configuration saving
    Callback = function(value)
        toggleRave(value) -- Call the toggle function with the current value
    end,
})


task.spawn(function()
while true do
    wait(0.05) -- Adjust the wait time as needed
    if not isRaveActive then
        pointlight.Color = Color3.fromRGB(R, G, B) -- Only update if not in rave mode
    end
end
end)


local SoLikeSoloDuoButton = PvPFarmingTab:CreateButton({
    Name = "Solo Duo",
    Callback = function()
        local args = {[1] = 39, [2] = game:GetService("Players").LocalPlayer}
game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))
    end
})


local BlackProfileButton = CosmeticTradingTab:CreateButton({
    Name = "Black Profile",
    Callback = function()
        local args = {
    [1] = 62,
    [2] = -1
}

game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))

    end,
})

local ZoomLimitButton = MiscTab:CreateButton({
    Name = "Disable Camera Zoom Limit",
    Callback = function()
        game.Loaded:Wait()
game:GetService("Players").LocalPlayer.CameraMaxZoomDistance = 4000
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

-- Create the Rayfield toggle
local AutoMovementToggle = PvPFarmingTab:CreateToggle({
    Name = "Auto Movement",
    CurrentValue = false,
    Flag = "AutoMovementToggle",
    Callback = function(Value)
        _G.on = Value
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

-- BELOW HERE IS THE IMPORTING SHIT --


-- THIS PART IS HUGE SO I GOTTA SEPERARE IT LMFAO --


-- CREDITS TO NAIKO --



local BreakingPlusHub = CustomScriptsTab:CreateButton({
   Name = "(USE FIRST) Execute Breaking Plus",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/NaikoScript/Breaking-Plus/main/Script"))()
   end,
})

local JerkingMyShit = SillyTab:CreateButton({
   Name = "Jerk Off",
   Callback = function()
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-jerk-off-25958"))()
   end,
})



-- WOO BIG SPACE WOAHHHH--




-- importing begins here --


local Section = CustomScriptsTab:CreateSection("Chairs")


-- CHAIRS --



local UhhhVibrant = CustomScriptsTab:CreateButton({
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
