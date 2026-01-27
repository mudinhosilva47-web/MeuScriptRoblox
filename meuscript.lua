--==================================================
-- SERVICES / PLAYER
--==================================================
local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer

--==================================================
-- DELTA GUI FIX
--==================================================
local parentGui = gethui and gethui() or LocalPlayer:WaitForChild("PlayerGui")
pcall(function() parentGui.KeylessHubPro:Destroy() end)

--==================================================
-- GUI
--==================================================
local gui = Instance.new("ScreenGui", parentGui)
gui.Name = "KeylessHubPro"
gui.ResetOnSpawn = false

--==================================================
-- FRAME
--==================================================
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 500, 0, 540)
frame.Position = UDim2.new(0.5, -250, 0.5, -270)
frame.BackgroundColor3 = Color3.fromRGB(25,35,70)
frame.BorderSizePixel = 0
frame.Active = true
Instance.new("UICorner", frame).CornerRadius = UDim.new(0,14)

--==================================================
-- TITLE
--==================================================
local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1,-90,0,45)
title.Position = UDim2.new(0,10,0,0)
title.Text = "🎛️ Keyless Conqueror Hub (FREE)"
title.Font = Enum.Font.SourceSansBold
title.TextSize = 22
title.TextColor3 = Color3.new(1,1,1)
title.BackgroundTransparency = 1
title.TextXAlignment = Enum.TextXAlignment.Left

--==================================================
-- PANIC / MINIMIZE
--==================================================
local panic = Instance.new("TextButton", frame)
panic.Size = UDim2.new(0,40,0,40)
panic.Position = UDim2.new(1,-45,0,3)
panic.Text = "🛑"
panic.TextSize = 22
panic.BackgroundColor3 = Color3.fromRGB(200,60,60)
panic.TextColor3 = Color3.new(1,1,1)
panic.Font = Enum.Font.SourceSansBold
Instance.new("UICorner", panic)

panic.MouseButton1Click:Connect(function()
	gui:Destroy()
end)

local minimized = false
title.InputBegan:Connect(function(i)
	if i.UserInputType == Enum.UserInputType.MouseButton1 then
		minimized = not minimized
		frame.Size = minimized and UDim2.new(0,500,0,45) or UDim2.new(0,500,0,540)
	end
end)

--==================================================
-- MENU (MOBILE)
--==================================================
local menu = Instance.new("ScrollingFrame", frame)
menu.Size = UDim2.new(0,160,1,-45)
menu.Position = UDim2.new(0,0,0,45)
menu.ScrollBarThickness = 6
menu.CanvasSize = UDim2.new(0,0,0,0)
menu.BackgroundColor3 = Color3.fromRGB(35,35,60)

--==================================================
-- CONTENT
--==================================================
local content = Instance.new("ScrollingFrame", frame)
content.Size = UDim2.new(1,-160,1,-45)
content.Position = UDim2.new(0,160,0,45)
content.ScrollBarThickness = 6
content.CanvasSize = UDim2.new(0,0,0,0)
content.BackgroundColor3 = Color3.fromRGB(45,45,80)

local function clearContent()
	for _,v in pairs(content:GetChildren()) do
		if v:IsA("TextButton") or v:IsA("TextLabel") then
			v:Destroy()
		end
	end
end

--==================================================
-- SOUND SYSTEM
--==================================================
local sound = Instance.new("Sound", parentGui)
sound.Volume = 1
local looping = false

--==================================================
-- MUSIC IDS (SEUS)
--==================================================
local musicList = {
"135738534706063","88667071098147","140383430074415","112448027542021",
"137879308393608","78414661292761","77712236704085","106866829236727",
"109794531843693","79409780351863","113077324050977","128512104863934",
"113778917971610","118064225618413","100584804963794","123171793186294",
"70791355308103","131847084942844","136893418307185","128771129962214",
"135903820233276","137828639403630","90617634718635","84773737820526",
"1427189017","85056357341685","100755435179302","104026572705664",
"88667633095864","70535546082862",
"rbxassetid://101453332349961","rbxassetid://106160266114222"
}

--==================================================
-- MUSIC TAB (FULL)
--==================================================
local function tabMusic()
	clearContent()
	local y = 10

	for i,id in ipairs(musicList) do
		local b = Instance.new("TextButton", content)
		b.Size = UDim2.new(1,-20,0,40)
		b.Position = UDim2.new(0,10,0,y)
		b.Text = "🎵 Música "..i
		b.Font = Enum.Font.SourceSansBold
		b.TextSize = 18
		b.BackgroundColor3 = Color3.fromRGB(80,80,120)
		b.TextColor3 = Color3.new(1,1,1)
		Instance.new("UICorner", b)

		b.MouseButton1Click:Connect(function()
			sound:Stop()
			sound.SoundId = tostring(id):find("rbxassetid://") and id or "rbxassetid://"..id
			sound.Looped = looping
			sound:Play()
			if setclipboard then setclipboard(id) end
		end)

		y += 45
	end

	-- Controls
	local stop = Instance.new("TextButton", content)
	stop.Size = UDim2.new(0.45,0,0,40)
	stop.Position = UDim2.new(0.05,0,0,y)
	stop.Text = "⏹ STOP"
	stop.TextSize = 18
	stop.BackgroundColor3 = Color3.fromRGB(150,70,70)
	stop.TextColor3 = Color3.new(1,1,1)
	Instance.new("UICorner", stop)
	stop.MouseButton1Click:Connect(function() sound:Stop() end)

	local loop = Instance.new("TextButton", content)
	loop.Size = UDim2.new(0.45,0,0,40)
	loop.Position = UDim2.new(0.5,0,0,y)
	loop.Text = "🔁 LOOP"
	loop.TextSize = 18
	loop.BackgroundColor3 = Color3.fromRGB(70,150,120)
	loop.TextColor3 = Color3.new(1,1,1)
	Instance.new("UICorner", loop)
	loop.MouseButton1Click:Connect(function()
		looping = not looping
		sound.Looped = looping
	end)

	content.CanvasSize = UDim2.new(0,0,0,y+60)
end

--==================================================
-- LOAD TAB HELPER
--==================================================
local function loadTab(name,url)
	clearContent()
	local b = Instance.new("TextButton", content)
	b.Size = UDim2.new(1,-20,0,60)
	b.Position = UDim2.new(0,10,0,30)
	b.Text = "▶ "..name
	b.Font = Enum.Font.SourceSansBold
	b.TextSize = 22
	b.BackgroundColor3 = Color3.fromRGB(100,100,150)
	b.TextColor3 = Color3.new(1,1,1)
	Instance.new("UICorner", b)
	b.MouseButton1Click:Connect(function()
		loadstring(game:HttpGet(url))()
	end)
end

--==================================================
-- PLAYER TAB
--==================================================
local function tabPlayer()
	clearContent()
	local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")

	local speed = Instance.new("TextButton", content)
	speed.Size = UDim2.new(1,-20,0,50)
	speed.Position = UDim2.new(0,10,0,20)
	speed.Text = "⚡ SPEED 50"
	speed.TextSize = 20
	speed.BackgroundColor3 = Color3.fromRGB(90,140,90)
	speed.TextColor3 = Color3.new(1,1,1)
	Instance.new("UICorner", speed)
	speed.MouseButton1Click:Connect(function()
		if hum then hum.WalkSpeed = 50 end
	end)
end

--==================================================
-- TABS
--==================================================
local tabs = {
{"🎵 Músicas", tabMusic},
{"⚡ Infinity Yield", function()
	loadTab("Infinity Yield","https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source")
end},
{"🎶 AJ Music Hub", function()
	loadTab("AJ Music Hub","https://pastebin.com/raw/zLspNekY")
end},
{"💃 Gaze Emotes", function()
	loadTab("Gaze Emotes","https://raw.githubusercontent.com/Gazer-Ha/Gaze-stuff/refs/heads/main/Gaze%20emote")
end},
{"🌀 Fly", function()
	loadTab("Fly","https://pastebin.com/raw/7t3QdQjz")
end},
{"👤 Player", tabPlayer},
}

--==================================================
-- MENU BUTTONS
--==================================================
local yMenu = 0
for _,t in ipairs(tabs) do
	local b = Instance.new("TextButton", menu)
	b.Size = UDim2.new(1,0,0,45)
	b.Position = UDim2.new(0,0,0,yMenu)
	b.Text = t[1]
	b.Font = Enum.Font.SourceSansBold
	b.TextSize = 18
	b.BackgroundColor3 = Color3.fromRGB(70,70,110)
	b.TextColor3 = Color3.new(1,1,1)
	Instance.new("UICorner", b)
	b.MouseButton1Click:Connect(t[2])
	yMenu += 50
end

menu.CanvasSize = UDim2.new(0,0,0,yMenu)
tabMusic()

print("✅ Keyless Conqueror Hub v3 FREE carregado")
