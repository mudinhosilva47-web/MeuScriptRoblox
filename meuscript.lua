--====================================
-- SERVICES / DELTA FIX
--====================================
local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer

local parentGui = gethui and gethui() or LocalPlayer:WaitForChild("PlayerGui")
pcall(function() parentGui.KeylessHubPro:Destroy() end)

--====================================
-- GUI
--====================================
local gui = Instance.new("ScreenGui", parentGui)
gui.Name = "KeylessHubPro"
gui.ResetOnSpawn = false

--====================================
-- MAIN FRAME (COMPACT + RED)
--====================================
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 290, 0, 340)
frame.Position = UDim2.new(0.5, -145, 0.5, -170)
frame.BackgroundColor3 = Color3.fromRGB(25, 0, 0)
frame.BorderSizePixel = 0
frame.Active = true
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)

--====================================
-- TITLE BAR (DRAG)
--====================================
local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, -35, 0, 30)
title.Position = UDim2.new(0, 5, 0, 0)
title.Text = "Script Hub"
title.Font = Enum.Font.SourceSansBold
title.TextSize = 16
title.TextColor3 = Color3.fromRGB(255,80,80)
title.BackgroundTransparency = 1
title.TextXAlignment = Enum.TextXAlignment.Left

local close = Instance.new("TextButton", frame)
close.Size = UDim2.new(0, 25, 0, 25)
close.Position = UDim2.new(1, -28, 0, 3)
close.Text = "X"
close.TextSize = 14
close.BackgroundColor3 = Color3.fromRGB(180,40,40)
close.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", close)

close.MouseButton1Click:Connect(function()
	gui:Destroy()
end)

--====================================
-- CONTENT
--====================================
local content = Instance.new("ScrollingFrame", frame)
content.Size = UDim2.new(1, -10, 1, -40)
content.Position = UDim2.new(0, 5, 0, 35)
content.CanvasSize = UDim2.new(0,0,0,0)
content.ScrollBarThickness = 4
content.BackgroundColor3 = Color3.fromRGB(40, 0, 0)
Instance.new("UICorner", content).CornerRadius = UDim.new(0,6)

--====================================
-- SOUND
--====================================
local sound = Instance.new("Sound", parentGui)

--====================================
-- MUSIC IDS (SEUS)
--====================================
local musicIds = {
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

--====================================
-- BUTTON CREATOR
--====================================
local y = 5
local function addButton(text, callback)
	local btn = Instance.new("TextButton", content)
	btn.Size = UDim2.new(1, -10, 0, 32)
	btn.Position = UDim2.new(0, 5, 0, y)
	btn.Text = text
	btn.Font = Enum.Font.SourceSans
	btn.TextSize = 14
	btn.BackgroundColor3 = Color3.fromRGB(90, 20, 20)
	btn.TextColor3 = Color3.new(1,1,1)
	Instance.new("UICorner", btn).CornerRadius = UDim.new(0,4)

	btn.MouseButton1Click:Connect(callback)

	y += 36
	content.CanvasSize = UDim2.new(0,0,0,y)
end

--====================================
-- MUSIC BUTTONS
--====================================
for i,id in ipairs(musicIds) do
	addButton("🎵 Music "..i, function()
		sound:Stop()
		sound.SoundId = tostring(id):find("rbxassetid://") and id or "rbxassetid://"..id
		sound:Play()
		if setclipboard then setclipboard(id) end
	end)
end

--====================================
-- LOADS
--====================================
addButton("⚡ Infinity Yield", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end)

addButton("🎶 AJ Music Hub", function()
	loadstring(game:HttpGet("https://pastebin.com/raw/zLspNekY"))()
end)

addButton("💃 Gaze Emotes", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Gazer-Ha/Gaze-stuff/refs/heads/main/Gaze%20emote"))()
end)

addButton("🌀 Fly", function()
	loadstring(game:HttpGet("https://pastebin.com/raw/7t3QdQjz"))()
end)

addButton("🛡️ Anti-AFK", function()
	local vu = game:GetService("VirtualUser")
	LocalPlayer.Idled:Connect(function()
		vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
		task.wait(1)
		vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
	end)
end)

--====================================
-- DRAG (MOBILE)
--====================================
local dragging, dragStart, startPos

title.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startPos = frame.Position
	end
end)

title.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = false
	end
end)

UIS.InputChanged:Connect(function(input)
	if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
		local delta = input.Position - dragStart
		frame.Position = UDim2.new(
			startPos.X.Scale,
			startPos.X.Offset + delta.X,
			startPos.Y.Scale,
			startPos.Y.Offset + delta.Y
		)
	end
end)

print("✅ Hub vermelho compacto carregado (mobile)")
