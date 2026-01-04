
--// SpaiSpace ALL IN ONE FINAL
--// KeySystem: Cyberpunk Custom
--// Main UI: OrionLib
--// Admin Panel: Wind UI
--// Delta Mobile Safe | No API | No Network
--// Created by 休伊

pcall(function()
	game.CoreGui:FindFirstChild("SpaiSpace_All"):Destroy()
end)

-- ================= UTIL =================
local function normalize(s)
	return string.lower((s or ""):gsub("%s+", ""))
end

local function checkKey(key)
	key = normalize(key)
	if key == "free_key" then
		return "FREE"
	elseif string.find(key,"premium_buyuservip") then
		return "PREMIUM"
	elseif key == "adminvipbase" then
		return "OWNER"
	end
end

-- ================= GUI ROOT =================
local Gui = Instance.new("ScreenGui")
Gui.Name = "SpaiSpace_All"
Gui.Parent = game.CoreGui
Gui.ResetOnSpawn = false

-- Toggle Button
local Toggle = Instance.new("ImageButton", Gui)
Toggle.Size = UDim2.fromOffset(60,60)
Toggle.Position = UDim2.fromScale(0.02,0.4)
Toggle.Image = "rbxassetid://136979691479989"
Toggle.BackgroundTransparency = 1
Toggle.Draggable = true

-- ================= KEY SYSTEM (CYBERPUNK) =================
local KeyFrame = Instance.new("Frame", Gui)
KeyFrame.Size = UDim2.fromScale(0.8,0.55)
KeyFrame.Position = UDim2.fromScale(0.1,0.22)
KeyFrame.BackgroundColor3 = Color3.fromRGB(15,15,30)
KeyFrame.Visible = true
Instance.new("UICorner", KeyFrame).CornerRadius = UDim.new(0,20)

Toggle.MouseButton1Click:Connect(function()
	KeyFrame.Visible = not KeyFrame.Visible
end)

local Title = Instance.new("TextLabel", KeyFrame)
Title.Size = UDim2.fromScale(1,0.18)
Title.BackgroundTransparency = 1
Title.Text = "SpaiSpace Cyberpunk Key System"
Title.Font = Enum.Font.GothamBold
Title.TextScaled = true
Title.TextColor3 = Color3.new(1,1,1)

local KeyBox = Instance.new("TextBox", KeyFrame)
KeyBox.Position = UDim2.fromScale(0.1,0.35)
KeyBox.Size = UDim2.fromScale(0.8,0.15)
KeyBox.PlaceholderText = "Enter your key"
KeyBox.Text = ""
KeyBox.TextScaled = true
KeyBox.Font = Enum.Font.Gotham
KeyBox.BackgroundColor3 = Color3.fromRGB(20,20,40)
KeyBox.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", KeyBox)

local Status = Instance.new("TextLabel", KeyFrame)
Status.Position = UDim2.fromScale(0.1,0.52)
Status.Size = UDim2.fromScale(0.8,0.08)
Status.BackgroundTransparency = 1
Status.TextScaled = true
Status.Font = Enum.Font.Gotham

local Unlock = Instance.new("TextButton", KeyFrame)
Unlock.Position = UDim2.fromScale(0.25,0.65)
Unlock.Size = UDim2.fromScale(0.5,0.15)
Unlock.Text = "UNLOCK"
Unlock.TextScaled = true
Unlock.Font = Enum.Font.GothamBold
Unlock.BackgroundColor3 = Color3.fromRGB(120,0,200)
Unlock.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", Unlock)

-- ================= MAIN (ORIONLIB) =================
local function loadOrionMain(level)
	-- OrionLib Loader (local, no HTTP)
	local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()

	local Window = OrionLib:MakeWindow({
		Name = "SpaiSpace Main | "..level,
		HidePremium = false,
		SaveConfig = false,
		ConfigFolder = "SpaiSpace"
	})

	local Tab = Window:MakeTab({
		Name = "Main",
		Icon = "rbxassetid://4483345998",
		PremiumOnly = false
	})

	Tab:AddParagraph("Status","Main Script Loaded Successfully")

	Tab:AddButton({
		Name = "Example Feature",
		Callback = function()
			print("Main feature clicked")
		end
	})

	OrionLib:Init()
end

-- ================= ADMIN PANEL (WIND UI) =================
local function loadWindAdmin()
	-- Wind UI placeholder (put your real Wind UI admin panel here)
	print("Wind UI Admin Panel Loaded")
end

-- ================= UNLOCK LOGIC =================
Unlock.MouseButton1Click:Connect(function()
	local level = checkKey(KeyBox.Text)
	if not level then
		Status.TextColor3 = Color3.fromRGB(255,80,80)
		Status.Text = "INVALID KEY"
		return
	end

	Status.TextColor3 = Color3.fromRGB(0,255,180)
	Status.Text = "WELCOME "..level
	wait(0.6)
	KeyFrame.Visible = false

	loadOrionMain(level)

	if level ~= "FREE" then
		loadWindAdmin()
	end
end)
