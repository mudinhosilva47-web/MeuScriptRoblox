--// SERVIÇOS
local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local StarterGui = game:GetService("StarterGui")
local Player = Players.LocalPlayer

--// NOTIFY
local function Notify(msg)
	pcall(function()
		StarterGui:SetCore("SendNotification", {
			Title = "🎵 Keyless Hub Pro",
			Text = msg,
			Duration = 3
		})
	end)
end

--// BOOMBOX GLOBAL
local function PlayBrookhavenBoombox(id)
	local char = Player.Character
	if not char then return false end

	for _,tool in pairs(char:GetChildren()) do
		if tool:IsA("Tool") then
			for _,v in pairs(tool:GetDescendants()) do
				if v:IsA("RemoteEvent") then
					local ok = pcall(function()
						v:FireServer(id)
					end)
					if ok then
						return true
					end
				end
			end
		end
	end
	return false
end

--// GUI
local Gui = Instance.new("ScreenGui", Player.PlayerGui)
Gui.Name = "KeylessHubPro_Premium"

--// MAIN
local Main = Instance.new("Frame", Gui)
Main.Size = UDim2.new(0, 560, 0, 380)
Main.Position = UDim2.new(0.3, 0, 0.3, 0)
Main.BackgroundColor3 = Color3.fromRGB(18,18,25)
Main.Active = true
Main.Draggable = true
Instance.new("UICorner", Main).CornerRadius = UDim.new(0,14)

--// BORDA PREMIUM
local Stroke = Instance.new("UIStroke", Main)
Stroke.Thickness = 2
task.spawn(function()
	while true do
		for i=0,255 do
			Stroke.Color = Color3.fromHSV(i/255,1,1)
			task.wait(0.02)
		end
	end
end)

--// TOPO
local Top = Instance.new("Frame", Main)
Top.Size = UDim2.new(1,0,0,42)
Top.BackgroundColor3 = Color3.fromRGB(24,24,35)

local Title = Instance.new("TextLabel", Top)
Title.Size = UDim2.new(1,0,1,0)
Title.BackgroundTransparency = 1
Title.Text = "💎 Keyless Hub Pro (Premium)"
Title.Font = Enum.Font.GothamBold
Title.TextSize = 18
Title.TextColor3 = Color3.new(1,1,1)

--// MENU
local Menu = Instance.new("Frame", Main)
Menu.Position = UDim2.new(0,0,0,42)
Menu.Size = UDim2.new(0,150,1,-42)
Menu.BackgroundColor3 = Color3.fromRGB(22,22,32)

--// CONTENT
local Content = Instance.new("Frame", Main)
Content.Position = UDim2.new(0,150,0,42)
Content.Size = UDim2.new(1,-150,1,-42)
Content.BackgroundColor3 = Color3.fromRGB(32,32,45)

--// SCROLL
local Scroll = Instance.new("ScrollingFrame", Content)
Scroll.Size = UDim2.new(1,-12,1,-12)
Scroll.Position = UDim2.new(0,6,0,6)
Scroll.CanvasSize = UDim2.new(0,0,0,0)
Scroll.ScrollBarThickness = 6
Scroll.BackgroundTransparency = 1

local Layout = Instance.new("UIListLayout", Scroll)
Layout.Padding = UDim.new(0,8)

--// CLEAR
local function Clear()
	for _,v in pairs(Scroll:GetChildren()) do
		if v:IsA("TextButton") then
			v:Destroy()
		end
	end
end

--// BOTÃO PADRÃO
local function CreateButton(text, callback)
	local B = Instance.new("TextButton", Scroll)
	B.Size = UDim2.new(1,0,0,38)
	B.BackgroundColor3 = Color3.fromRGB(60,60,90)
	B.Text = text
	B.Font = Enum.Font.Gotham
	B.TextSize = 14
	B.TextColor3 = Color3.new(1,1,1)
	Instance.new("UICorner", B).CornerRadius = UDim.new(0,10)
	B.MouseButton1Click:Connect(callback)
end

--// IDS (SEUS)
local MusicIDs = {
"135738534706063","88667071098147","140383430074415","112448027542021",
"137879308393608","78414661292761","77712236704085","106866829236727",
"109794531843693","79409780351863","113077324050977","128512104863934",
"113778917971610","118064225618413","100584804963794","123171793186294",
"70791355308103","131847084942844","136893418307185","128771129962214",
"135903820233276","137828639403630","90617634718635","84773737820526",
"1427189017","85056357341685","100755435179302","104026572705664",
"88667633095864","70535546082862","rbxassetid://101453332349961",
"rbxassetid://106160266114222"
}

--// ABAS
local Tabs = {
	["🎵 Músicas"] = function()
		Clear()
		for _,id in ipairs(MusicIDs) do
			CreateButton("🎵 "..id, function()
				local ok = PlayBrookhavenBoombox(id)
				if ok then
					Notify("Música tocando no Boombox 🔊")
				else
					if setclipboard then setclipboard(id) end
					Notify("ID copiado 📋 Cole no Boombox")
				end
			end)
		end
	end,

	["⚡ Infinity Yield"] = function()
		Clear()
		CreateButton("Executar Infinity Yield", function()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
		end)
	end,

	["🎶 AJ Music Hub"] = function()
		Clear()
		CreateButton("Executar AJ Music Hub", function()
			loadstring(game:HttpGet("https://pastebin.com/raw/zLspNekY"))()
		end)
	end,

	["💃 Gaze Emotes"] = function()
		Clear()
		CreateButton("Executar Gaze Emotes", function()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/Gazer-Ha/Gaze-stuff/main/Gaze%20emote"))()
		end)
	end,

	["📜 Meu Script"] = function()
		Clear()
		CreateButton("Executar Meu Script", function()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/mudinhosilva47-web/MeuScriptRoblox/main/meuscript.lua"))()
		end)
	end
}

--// MENU BUTTONS
local y = 12
for name,func in pairs(Tabs) do
	local Btn = Instance.new("TextButton", Menu)
	Btn.Size = UDim2.new(1,-10,0,38)
	Btn.Position = UDim2.new(0,5,0,y)
	Btn.BackgroundColor3 = Color3.fromRGB(55,55,85)
	Btn.Text = name
	Btn.Font = Enum.Font.GothamBold
	Btn.TextSize = 14
	Btn.TextColor3 = Color3.new(1,1,1)
	Instance.new("UICorner", Btn).CornerRadius = UDim.new(0,10)

	Btn.MouseButton1Click:Connect(func)
	y += 46
end
