-- Gui principal
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer

local gui = Instance.new("ScreenGui")
gui.Name = "KeylessHubPro"
gui.Parent = LocalPlayer:WaitForChild("PlayerGui")

-- Frame principal
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 420, 0, 460)
frame.Position = UDim2.new(0.3, 0, 0.25, 0)
frame.BackgroundColor3 = Color3.fromRGB(20, 40, 80)
frame.BackgroundTransparency = 0.15
frame.BorderSizePixel = 0
frame.Active = true
frame.Parent = gui

local UICorner = Instance.new("UICorner", frame)
UICorner.CornerRadius = UDim.new(0, 12)

local stroke = Instance.new("UIStroke", frame)
stroke.Thickness = 3
task.spawn(function()
	while true do
		for i = 0, 255 do
			stroke.Color = Color3.fromHSV(i / 255, 1, 1)
			task.wait(0.03)
		end
	end
end)

-- Título
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -30, 0, 40)
title.BackgroundColor3 = Color3.fromRGB(30, 60, 120)
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Text = "🎛️ Keyless Conqueror Hub"
title.Font = Enum.Font.SourceSansBold
title.TextSize = 22
title.Parent = frame

local titleStroke = Instance.new("UIStroke", title)
titleStroke.Thickness = 2
task.spawn(function()
	while true do
		for i = 0, 255 do
			titleStroke.Color = Color3.fromHSV(i / 255, 1, 1)
			task.wait(0.03)
		end
	end
end)

-- Botão fechar
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(1, -35, 0, 5)
closeBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.Text = "✖"
closeBtn.Font = Enum.Font.SourceSansBold
closeBtn.TextSize = 18
closeBtn.Parent = frame
closeBtn.MouseButton1Click:Connect(function()
	frame.Visible = false
end)

-- Menu lateral
local menu = Instance.new("Frame")
menu.Size = UDim2.new(0, 120, 1, -40)
menu.Position = UDim2.new(0, 0, 0, 40)
menu.BackgroundColor3 = Color3.fromRGB(35, 35, 60)
menu.Parent = frame

-- Conteúdo
local content = Instance.new("Frame")
content.Size = UDim2.new(1, -120, 1, -40)
content.Position = UDim2.new(0, 120, 0, 40)
content.BackgroundColor3 = Color3.fromRGB(45, 45, 70)
content.Parent = frame

local scroll = Instance.new("ScrollingFrame")
scroll.Size = UDim2.new(1, -10, 1, -10)
scroll.Position = UDim2.new(0, 5, 0, 5)
scroll.ScrollBarThickness = 6
scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
scroll.BackgroundColor3 = Color3.fromRGB(50, 50, 80)
scroll.Parent = content

local function clearContent()
	for _, v in pairs(scroll:GetChildren()) do
		if v:IsA("TextButton") or v:IsA("TextLabel") then
			v:Destroy()
		end
	end
end

-- Sound único (anti-lag)
local sound = Instance.new("Sound")
sound.Parent = LocalPlayer.PlayerGui

-------------------------------------------------
-- Lista de músicas (SEUS IDS)
-------------------------------------------------
local musicList = {
	{name="Music 1", id="135738534706063"},
	{name="Music 2", id="88667071098147"},
	{name="Music 3", id="140383430074415"},
	{name="Music 4", id="112448027542021"},
	{name="Music 5", id="137879308393608"},
	{name="Music 6", id="78414661292761"},
	{name="Music 7", id="77712236704085"},
	{name="Music 8", id="106866829236727"},
	{name="Music 9", id="109794531843693"},
	{name="Music 10", id="79409780351863"},
	{name="Music 11", id="113077324050977"},
	{name="Music 12", id="128512104863934"},
	{name="Music 13", id="113778917971610"},
	{name="Music 14", id="118064225618413"},
	{name="Music 15", id="100584804963794"},
	{name="Music 16", id="123171793186294"},
	{name="Music 17", id="70791355308103"},
	{name="Music 18", id="131847084942844"},
	{name="Music 19", id="136893418307185"},
	{name="Music 20", id="128771129962214"},
	{name="Music 21", id="135903820233276"},
	{name="Music 22", id="137828639403630"},
	{name="Music 23", id="90617634718635"},
	{name="Music 24", id="84773737820526"},
	{name="Music 25", id="1427189017"},
	{name="Music 26", id="85056357341685"},
	{name="Music 27", id="100755435179302"},
	{name="Music 28", id="104026572705664"},
	{name="Music 29", id="88667633095864"},
	{name="Music 30", id="70535546082862"},
	{name="Music 31", id="rbxassetid://101453332349961"},
	{name="Music 32", id="rbxassetid://106160266114222"},
}

-- Aba músicas
local function musicTab()
	clearContent()
	local y = 0

	for _, music in ipairs(musicList) do
		local btn = Instance.new("TextButton")
		btn.Size = UDim2.new(1, -10, 0, 30)
		btn.Position = UDim2.new(0, 5, 0, y)
		btn.BackgroundColor3 = Color3.fromRGB(70, 70, 100)
		btn.TextColor3 = Color3.fromRGB(255, 255, 255)
		btn.Text = music.name .. " - " .. music.id
		btn.Font = Enum.Font.SourceSans
		btn.TextSize = 16
		btn.Parent = scroll

		btn.MouseButton1Click:Connect(function()
			if setclipboard then setclipboard(music.id) end
			sound:Stop()
			if tostring(music.id):find("rbxassetid://") then
				sound.SoundId = music.id
			else
				sound.SoundId = "rbxassetid://" .. music.id
			end
			sound:Play()
		end)

		y += 35
	end

	scroll.CanvasSize = UDim2.new(0, 0, 0, y)
end

musicTab()

-------------------------------------------------
-- Drag pelo título
-------------------------------------------------
local dragging = false
local dragStart, startPos

title.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = true
		dragStart = input.Position
		startPos = frame.Position
	end
end)

title.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = false
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
		local delta = input.Position - dragStart
		frame.Position = UDim2.new(
			startPos.X.Scale,
			startPos.X.Offset + delta.X,
			startPos.Y.Scale,
			startPos.Y.Offset + delta.Y
		)
	end
end)
