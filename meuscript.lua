-- =========================================
-- Vortex RP Hub | Brookhaven Edition
-- LocalScript
-- =========================================

-- Serviços
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer

-- =======================
-- GUI
-- =======================
local gui = Instance.new("ScreenGui")
gui.Name = "VortexBrookhavenHub"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 520, 0, 520)
frame.Position = UDim2.new(0.25, 0, 0.2, 0)
frame.BackgroundColor3 = Color3.fromRGB(20, 30, 60)
frame.BorderSizePixel = 0
frame.Active = true
frame.Parent = gui

local corner = Instance.new("UICorner", frame)
corner.CornerRadius = UDim.new(0,16)

local stroke = Instance.new("UIStroke", frame)
stroke.Thickness = 3

-- Rainbow Stroke
task.spawn(function()
    local h = 0
    while true do
        h = (h + 1) % 360
        stroke.Color = Color3.fromHSV(h/360,1,1)
        RunService.Heartbeat:Wait()
    end
end)

-- =======================
-- Título
-- =======================
local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1,-50,0,45)
title.Position = UDim2.new(0,10,0,10)
title.BackgroundColor3 = Color3.fromRGB(30,50,100)
title.Text = "🌆 Vortex RP Hub | Brookhaven"
title.Font = Enum.Font.GothamBold
title.TextSize = 22
title.TextColor3 = Color3.new(1,1,1)

local close = Instance.new("TextButton", frame)
close.Size = UDim2.new(0,35,0,35)
close.Position = UDim2.new(1,-45,0,10)
close.Text = "✖"
close.Font = Enum.Font.GothamBold
close.TextSize = 18
close.BackgroundColor3 = Color3.fromRGB(180,60,60)
close.TextColor3 = Color3.new(1,1,1)
close.MouseButton1Click:Connect(function()
    gui:Destroy()
end)

-- =======================
-- Menu / Content
-- =======================
local menu = Instance.new("Frame", frame)
menu.Size = UDim2.new(0,150,1,-70)
menu.Position = UDim2.new(0,0,0,60)
menu.BackgroundColor3 = Color3.fromRGB(25,25,50)

local content = Instance.new("Frame", frame)
content.Size = UDim2.new(1,-150,1,-70)
content.Position = UDim2.new(0,150,0,60)
content.BackgroundColor3 = Color3.fromRGB(40,40,80)

local scroll = Instance.new("ScrollingFrame", content)
scroll.Size = UDim2.new(1,-10,1,-10)
scroll.Position = UDim2.new(0,5,0,5)
scroll.ScrollBarThickness = 6
scroll.CanvasSize = UDim2.new(0,0,0,0)
scroll.BackgroundColor3 = Color3.fromRGB(45,45,90)

local function clear()
    for _,v in pairs(scroll:GetChildren()) do
        if v:IsA("TextButton") or v:IsA("TextLabel") then
            v:Destroy()
        end
    end
end

-- =======================
-- 🔥 SEUS IDS (MANTIDOS)
-- =======================
local musicIds = {
    "135738534706063","88667071098147","140383430074415","112448027542021",
    "137879308393608","78414661292761","77712236704085","106866829236727",
    "109794531843693","79409780351863","113077324050977","128512104863934",
    "113778917971610","118064225618413","100584804963794","123171793186294",
    "70791355308103","131847084942844","136893418307185","128771129962214",
    "135903820233276","137828639403630","90617634718635","84773737820526",
    "1427189017","85056357341685","100755435179302","104026572705664",
    "88667633095864","70535546082862",
    "rbxassetid://101453332349961",
    "rbxassetid://106160266114222"
}

-- =======================
-- Abas
-- =======================
local tabs = {

-- 🎵 MUSIC (IDS)
{
name = "🎵 Music",
callback = function()
    clear()
    local y = 0
    for i,id in ipairs(musicIds) do
        local btn = Instance.new("TextButton", scroll)
        btn.Size = UDim2.new(1,-10,0,38)
        btn.Position = UDim2.new(0,5,0,y)
        btn.BackgroundColor3 = Color3.fromRGB(70,70,120)
        btn.TextColor3 = Color3.new(1,1,1)
        btn.Font = Enum.Font.Gotham
        btn.TextSize = 16
        btn.Text = " " -- 👈 VOCÊ COLOCA O TÍTULO AQUI
        btn.MouseButton1Click:Connect(function()
            if setclipboard then
                setclipboard(id)
            end
        end)
        y += 43
    end
    scroll.CanvasSize = UDim2.new(0,0,0,y)
end},

-- 🎶 AJ MUSIC HUB (MANTIDO)
{
name = "🎶 AJ Music Hub",
callback = function()
    clear()
    local btn = Instance.new("TextButton", scroll)
    btn.Size = UDim2.new(1,-10,0,45)
    btn.Position = UDim2.new(0,5,0,5)
    btn.BackgroundColor3 = Color3.fromRGB(100,100,160)
    btn.TextColor3 = Color3.new(1,1,1)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 18
    btn.Text = "Executar AJ Music Hub"
    btn.MouseButton1Click:Connect(function()
        loadstring(game:HttpGet("https://pastebin.com/raw/zLspNekY"))()
    end)
end},

-- 🚶 Movement
{
name = "🚶 Movement",
callback = function()
    clear()
    local y = 5

    local function makeBtn(text, func)
        local b = Instance.new("TextButton", scroll)
        b.Size = UDim2.new(1,-10,0,40)
        b.Position = UDim2.new(0,5,0,y)
        b.BackgroundColor3 = Color3.fromRGB(90,90,150)
        b.TextColor3 = Color3.new(1,1,1)
        b.Font = Enum.Font.GothamBold
        b.TextSize = 16
        b.Text = text
        b.MouseButton1Click:Connect(func)
        y += 45
    end

    makeBtn("Speed Boost", function()
        player.Character.Humanoid.WalkSpeed = 30
    end)

    makeBtn("Jump Boost", function()
        player.Character.Humanoid.JumpPower = 80
    end)

    makeBtn("Infinite Jump", function()
        UserInputService.JumpRequest:Connect(function()
            player.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end)
    end)

    scroll.CanvasSize = UDim2.new(0,0,0,y)
end},

-- ⚙️ Settings
{
name = "⚙️ Settings",
callback = function()
    clear()
    local btn = Instance.new("TextButton", scroll)
    btn.Size = UDim2.new(1,-10,0,45)
    btn.Position = UDim2.new(0,5,0,5)
    btn.BackgroundColor3 = Color3.fromRGB(160,80,80)
    btn.Text = "Destroy Hub"
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 18
    btn.TextColor3 = Color3.new(1,1,1)
    btn.MouseButton1Click:Connect(function()
        gui:Destroy()
    end)
end}

}

-- =======================
-- Criar Menu
-- =======================
for i,tab in ipairs(tabs) do
    local btn = Instance.new("TextButton", menu)
    btn.Size = UDim2.new(1,0,0,50)
    btn.Position = UDim2.new(0,0,0,(i-1)*55)
    btn.BackgroundColor3 = Color3.fromRGB(60,60,120)
    btn.TextColor3 = Color3.new(1,1,1)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 16
    btn.Text = tab.name
    btn.MouseButton1Click:Connect(tab.callback)
end

-- =======================
-- Drag System
-- =======================
local dragging, dragStart, startPos

title.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = frame.Position
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

UserInputService.InputEnded:Connect(function()
    dragging = false
end)
