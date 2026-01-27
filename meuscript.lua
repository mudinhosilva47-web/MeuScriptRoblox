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
Instance.new("UICorner", frame).CornerRadius = UDim.new(0,8)

--====================================
-- TITLE BAR
--====================================
local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, -40, 0, 30)
title.Position = UDim2.new(0, 8, 0, 0)
title.Text = "🎧 Music ID Hub"
title.Font = Enum.Font.SourceSansBold
title.TextSize = 16
title.TextColor3 = Color3.fromRGB(255,80,80)
title.BackgroundTransparency = 1
title.TextXAlignment = Left

local close = Instance.new("TextButton", frame)
close.Size = UDim2.new(0, 25, 0, 25)
close.Position = UDim2.new(1, -30, 0, 3)
close.Text = "X"
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
content.BackgroundColor3 = Color3.fromRGB(40,0,0)
Instance.new("UICorner", content).CornerRadius = UDim.new(0,6)

--====================================
-- MUSIC IDS
--====================================
local musicIds = {
"135738534706063","88667071098147","140383430074415","112448027542021",
"137879308393608","78414661292761","77712236704085","106866829236727",
"109794531843693","79409780351863","113077324050977","128512104863934",
"113778917971610","118064225618413","100584804963794","123171793186294",
"70791355308103","131847084942844","136893418307185","128771129962214",
"rbxassetid://101453332349961","rbxassetid://106160266114222"
}

--====================================
-- STORAGE
--====================================
local savedIds = {}
local lastCopied = nil

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
	btn.BackgroundColor3 = Color3.fromRGB(90,20,20)
	btn.TextColor3 = Color3.new(1,1,1)
	Instance.new("UICorner", btn).CornerRadius = UDim.new(0,4)

	btn.MouseButton1Click:Connect(function()
		callback(btn)
	end)

	y += 36
	content.CanvasSize = UDim2.new(0,0,0,y)
end

--====================================
-- MUSIC BUTTONS (COPIAR + SALVAR)
--====================================
for i,id in ipairs(musicIds) do
	addButton("📋 Copiar Music ID "..i, function(btn)
		local finalId = tostring(id):find("rbxassetid://") and id or "rbxassetid://"..id
		
		if setclipboard then
			setclipboard(finalId)
		end
		
		lastCopied = finalId
		table.insert(savedIds, finalId)

		local old = btn.Text
		btn.Text = "✅ Copiado!"
		task.delay(1, function()
			if btn then btn.Text = old end
		end)
	end)
end

--====================================
-- UTIL BUTTONS
--====================================
addButton("📥 Colar último ID", function()
	if lastCopied and setclipboard then
		setclipboard(lastCopied)
	end
end)

addButton("💾 Mostrar IDs salvos", function()
	print("==== IDs SALVOS ====")
	for i,v in ipairs(savedIds) do
		print(i, v)
	end
end)

addButton("🧹 Limpar IDs salvos", function()
	table.clear(savedIds)
	print("IDs salvos limpos")
end)

--====================================
-- DRAG (MOBILE + PC)
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

print("✅ Music ID Hub carregado (copiar + salvar)")
