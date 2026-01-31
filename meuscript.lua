--=====================================================
-- VINGAR HUB ∞ | FINAL ABSOLUTO
--=====================================================

-- SERVICES
local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local TextChatService = game:GetService("TextChatService")

local player = Players.LocalPlayer
local cam = workspace.CurrentCamera
local char = player.Character or player.CharacterAdded:Wait()
local hum = char:WaitForChild("Humanoid")

player.CharacterAdded:Connect(function(c)
	char = c
	hum = c:WaitForChild("Humanoid")
end)

--=====================================================
-- GUI ROOT
--=====================================================
local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "VingarHubInfinity"
gui.ResetOnSpawn = false

--=====================================================
-- MAIN FRAME
--=====================================================
local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0,860,0,480)
main.Position = UDim2.new(0.22,0,0.2,0)
main.BackgroundColor3 = Color3.fromRGB(8,8,14)
main.Active = true
main.Draggable = true
Instance.new("UICorner",main).CornerRadius = UDim.new(0,20)

--=====================================================
-- TITLE
--=====================================================
local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1,0,0,55)
title.BackgroundTransparency = 1
title.Text = "💜 VINGAR HUB ∞"
title.Font = Enum.Font.GothamBlack
title.TextSize = 28

RunService.RenderStepped:Connect(function()
	title.TextColor3 = Color3.fromHSV((tick()*0.12)%1,1,1)
end)

--=====================================================
-- SIDEBAR
--=====================================================
local sidebar = Instance.new("Frame", main)
sidebar.Position = UDim2.new(0,0,0,55)
sidebar.Size = UDim2.new(0,210,1,-55)
sidebar.BackgroundColor3 = Color3.fromRGB(14,14,22)

--=====================================================
-- CONTENT
--=====================================================
local content = Instance.new("ScrollingFrame", main)
content.Position = UDim2.new(0,220,0,70)
content.Size = UDim2.new(1,-240,1,-95)
content.ScrollBarThickness = 6
content.BackgroundTransparency = 1

local layout = Instance.new("UIListLayout", content)
layout.Padding = UDim.new(0,12)

layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
	content.CanvasSize = UDim2.new(0,0,0,layout.AbsoluteContentSize.Y + 20)
end)

local function clear()
	for _,v in ipairs(content:GetChildren()) do
		if v:IsA("GuiObject") then v:Destroy() end
	end
	layout.Parent = content
end

--=====================================================
-- BUTTON
--=====================================================
local function button(text, callback)
	local b = Instance.new("TextButton", content)
	b.Size = UDim2.new(1,0,0,46)
	b.Text = text
	b.Font = Enum.Font.GothamBold
	b.TextSize = 15
	b.TextColor3 = Color3.new(1,1,1)
	b.BackgroundColor3 = Color3.fromRGB(28,28,38)
	b.AutoButtonColor = false
	Instance.new("UICorner",b).CornerRadius = UDim.new(0,12)

	b.MouseEnter:Connect(function()
		TweenService:Create(b,TweenInfo.new(0.15),{BackgroundColor3=Color3.fromRGB(80,30,130)}):Play()
	end)
	b.MouseLeave:Connect(function()
		TweenService:Create(b,TweenInfo.new(0.15),{BackgroundColor3=Color3.fromRGB(28,28,38)}):Play()
	end)

	b.MouseButton1Click:Connect(callback)
end

--=====================================================
-- MUSIC IDS (TODOS OS SEUS)
--=====================================================
local musicIds = {
"135738534706063","88667071098147","140383430074415","112448027542021",
"137879308393608","78414661292761","77712236704085","106866829236727",
"109794531843693","79409780351863","113077324050977","128512104863934",
"113778917971610","118064225618413","100584804963794","123171793186294",
"70791355308103","131847084942844","136893418307185","128771129962214",
"135903820233276","137828639403630","90617634718635","84773737820526",
"1427189017","85056357341685","100755435179302","104026572705664",
"88667633095864","70535546082862","101453332349961","106160266114222",
"104767744632555","111814302789203","84193648374486","78352220341424",
"100349603632112","111723070296038"
}

--=====================================================
-- TABS
--=====================================================
local function tabPlayer()
	clear()
	button("⚡ Speed +",function() hum.WalkSpeed = 45 end)
	button("🦘 Jump +",function() hum.JumpPower = 120 end)
	button("♻ Reset",function()
		hum.WalkSpeed = 16
		hum.JumpPower = 50
	end)
end

local function tabVisual()
	clear()
	button("💡 FullBright",function()
		Lighting.Brightness = 3
		Lighting.ClockTime = 12
		Lighting.FogEnd = 1e6
	end)
	button("🌑 Reset Visual",function()
		Lighting.Brightness = 1
		Lighting.ClockTime = 14
	end)
end

local function tabMusic()
	clear()
	for _,id in ipairs(musicIds) do
		button("🎵 "..id,function()
			if setclipboard then setclipboard(id) end
		end)
	end
end

local function tabRadar()
	clear()
	for _,s in ipairs(workspace:GetDescendants()) do
		if s:IsA("Sound") and s.SoundId ~= "" then
			button("📡 "..s.SoundId,function()
				if setclipboard then setclipboard(s.SoundId) end
			end)
		end
	end
end

local rgb=false
local function tabRGB()
	clear()
	button("🌈 RGB Tool",function()
		rgb = not rgb
		local tool = char:FindFirstChildOfClass("Tool")
		if tool then
			for _,p in ipairs(tool:GetDescendants()) do
				if p:IsA("BasePart") then
					task.spawn(function()
						while rgb and p.Parent do
							p.Color = Color3.fromHSV(tick()%1,1,1)
							RunService.Heartbeat:Wait()
						end
					end)
				end
			end
		end
	end)
end

local function tabGazes()
	clear()
	button("🎭 Load Gazes Emotes",function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Gazer-Ha/Gaze-stuff/refs/heads/main/Gaze%20emote"))()
	end)
end

local function tabAJ()
	clear()
	button("🎶 Load AJ Music Hub",function()
		loadstring(game:HttpGet("https://pastebin.com/raw/zLspNekY"))()
	end)
end

local function tabSettings()
	clear()
	button("❌ Destroy Hub",function() gui:Destroy() end)
end

--=====================================================
-- SIDEBAR BUTTONS
--=====================================================
local function sideBtn(text,order,cb)
	local b=Instance.new("TextButton",sidebar)
	b.Size=UDim2.new(1,-12,0,48)
	b.Position=UDim2.new(0,6,0,10+(order-1)*54)
	b.Text=text
	b.Font=Enum.Font.GothamBold
	b.TextSize=14
	b.TextColor3=Color3.new(1,1,1)
	b.BackgroundColor3=Color3.fromRGB(22,22,30)
	Instance.new("UICorner",b).CornerRadius=UDim.new(0,10)
	b.MouseButton1Click:Connect(cb)
end

sideBtn("👤 Player",1,tabPlayer)
sideBtn("🎨 Visual",2,tabVisual)
sideBtn("🎵 Music IDs",3,tabMusic)
sideBtn("📡 Radar",4,tabRadar)
sideBtn("🌈 RGB",5,tabRGB)
sideBtn("🎭 Gazes",6,tabGazes)
sideBtn("🎶 AJ Music",7,tabAJ)
sideBtn("⚙️ Settings",8,tabSettings)

tabPlayer()

--=====================================================
-- FLOAT BUTTON + M
--=====================================================
local open=true
local float=Instance.new("TextButton",gui)
float.Size=UDim2.new(0,64,0,64)
float.Position=UDim2.new(0,20,0.45,0)
float.Text="💜"
float.Font=Enum.Font.GothamBlack
float.TextSize=26
float.BackgroundColor3=Color3.fromRGB(18,10,30)
float.Active=true
float.Draggable=true
Instance.new("UICorner",float).CornerRadius=UDim.new(0,14)

RunService.RenderStepped:Connect(function()
	float.TextColor3=Color3.fromHSV((tick()*0.25)%1,1,1)
end)

local function toggle()
	open=not open
	TweenService:Create(main,TweenInfo.new(0.35),{
		Position=open and UDim2.new(0.22,0,0.2,0) or UDim2.new(0.22,0,1.4,0)
	}):Play()
end

float.MouseButton1Click:Connect(toggle)
UIS.InputBegan:Connect(function(i,g)
	if not g and i.KeyCode==Enum.KeyCode.M then
		toggle()
	end
end)
