local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
	Name = "AreoVolt DOORS",
	Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
	LoadingTitle = "AreoVolt DOORS Loading",
	LoadingSubtitle = "Give us a sec..",
	Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes
	

	DisableRayfieldPrompts = true,
	DisableBuildWarnings = true, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

	ConfigurationSaving = {
		Enabled = true,
		FolderName = "AreoVoltDOORS", -- Create a custom folder for your hub/game
		FileName = "DOORSCONFIG"
	},

	Discord = {
		Enabled = true, -- Prompt the user to join your Discord server if their executor supports it
		Invite = "MUzWVaPj", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
		RememberJoins = true -- Set this to false to make them join the discord every time they load it up
	},

	KeySystem = false, -- Set this to true to use our key system
	KeySettings = {
		Title = "Untitled",
		Subtitle = "Key System",
		Note = "No method of obtaining the key is provided", -- Use this to tell the user how to get a key
		FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
		SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
		GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
		Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
	}
})

local function delete(item)
	item:Destroy()
end

local Tab = Window:CreateTab("Entities", 4483362458) -- Title, Image

local antiEntity = Tab:CreateSection("Anti Entity")

local antiScreech = Tab:CreateToggle({
	Name = "Anti-Screech",
	CurrentValue = false,
	Flag = "AntiScreech", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		if Value == true then
			local camera = game.Workspace:WaitForChild("Camera")
			
			camera.ChildAdded:Connect(function(child)
				if child.Name == "Screech" then
					delete(camera:FindFirstChild("Screech"))
				end
			end)
		elseif Value == false then
			return
		end
	end,
})





Rayfield:LoadConfiguration()
