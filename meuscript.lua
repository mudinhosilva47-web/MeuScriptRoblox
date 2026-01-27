--====================================
-- SERVICES
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
-- MAIN FRAME
--====================================
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 300, 0, 360)
frame.Position = UDim2.new(0.5, -150, 0.5, -180)
frame.BackgroundColor3 = Color3.fromRGB(25,0,0)
frame.BorderSizePixel = 0
frame.Active = true
frame.Selectable = true
Instance.new("UICorner", frame).CornerRadius = UDim.new(0,8)

--====================================
-- TITLE BAR
--====================================
local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, -10, 0, 30)
title.Position = UDim2.new(0, 5, 0, 0)
title.Text = "🎧 Music ID Hub"
title.Font = Enum.Font.SourceSansBold
title.TextSize = 16
title.TextColor3 = Color3.fromRGB(255,80,80)
title.BackgroundTransparency = 1
title.TextXAlignment = Enum.TextXAlignment.Left

--====================================
-- TABS
--====================================
local tabs = Instance.new("Frame", frame)
tabs.Size = UDim2.new(1, 0, 0, 30)
tabs.Position = UDim2.new(0, 0, 0, 32)
tabs.BackgroundTransparency = 1

local function createTabButton(text, xPos)
	local btn = Instance.new("TextButton", tabs)
	btn.Size = UDim2.new(0.5, -5, 1, 0)
	btn.Position = UDim2.new(xPos, 5, 0, 0)
	btn.Text = text
	btn.BackgroundColor3 = Color3.fromRGB(90,20,20)
	btn.TextColor3 = Color3.new(1,1,1)
	btn.Font = Enum.Font.SourceSansBold
	btn.TextSize = 14
	Instance.new("UICorner", btn)
	return btn
end

local musicTabBtn = createTabButton("🎵 Music IDs", 0)
local utilTabBtn  = createTabButton("🛠 Util", 0.5)

--====================================
-- CONTENT FRAMES
--====================================
local function createContent()
	local sf = Instance.new("ScrollingFrame", frame)
	sf.Size = UDim2.new(1, -10, 1, -75)
	sf.Position = UDim2.new(0, 5, 0, 65)
	sf.ScrollBarThickness = 4
	sf.BackgroundColor3 = Color3.fromRGB(40,0,0)
	sf.AutomaticCanvasSize = Enum.AutomaticSize.Y
	sf.CanvasSize = UDim2.new(0,0,0,0)
	sf.Visible = false
	Instance.new("UICorner", sf)
	
	local layout = Instance.new("UIListLayout", sf)
	layout.Padding = UDim.new(0,6)
	layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	
	return sf
end

local musicContent = createContent()
local utilContent  = createContent()
musicContent.Visible = true

--====================================
-- TAB SWITCH
--====================================
musicTabBtn.MouseButton1Click:Connect(function()
	musicContent.Visible = true
	utilContent.Visible = false
end)

utilTabBtn.MouseButton1Click:Connect(function()
	musicContent.Visible = false
	utilContent.Visible = true
end)

--====================================
-- BUTTON CREATOR
--====================================
local function addButton(parent, text, callback)
	local btn = Instance.new("TextButton", parent)
	btn.Size = UDim2.new(1, -10, 0, 32)
	btn.Text = text
	btn.BackgroundColor3 = Color3.fromRGB(90,20,20)
	btn.TextColor3 = Color3.new(1,1,1)
	btn.Font = Enum.Font.SourceSans
	btn.TextSize = 14
	Instance.new("UICorner", btn)

	btn.MouseButton1Click:Connect(function()
		callback(btn)
	end)
end

--====================================
-- MUSIC IDS
--====================================
local musicIds = {
"135738534706063","88667071098147","140383430074415",
"112448027542021","137879308393608",
"rbxassetid://101453332349961"
}

for i,id in ipairs(musicIds) do
	addButton(musicContent, "📋 Copiar Music ID "..i, function(btn)
		local finalId = tostring(id):find("rbxassetid://") and id or "rbxassetid://"..id
		if setclipboard then setclipboard(finalId) end

		local old = btn.Text
		btn.Text = "✅ Copiado!"
		task.delay(1, function()
			if btn then btn.Text = old end
		end)
	end)
end

--====================================
-- UTIL TAB
--====================================
addButton(utilContent, "🧹 Limpar Clipboard", function()
	if setclipboard then setclipboard("") end
end)

--====================================
-- DRAG (FUNCIONANDO)
--====================================
local dragging, dragStart, startPos

frame.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startPos = frame.Position
	end
end)

frame.InputEnded:Connect(function(input)
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

print("✅ Hub carregado sem bugs (abas + drag)")
