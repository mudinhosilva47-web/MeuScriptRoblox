-- ======================================================
-- VORTEX BROOKHAVEN HUB | COMBO REAL (SEM FAKE)
-- ======================================================

-- Services
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()

-- ======================================================
-- GUI BASE
-- ======================================================
local gui = Instance.new("ScreenGui")
gui.Name = "VortexBrookhavenCombo"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 560, 0, 540)
frame.Position = UDim2.new(0.25, 0, 0.2, 0)
frame.BackgroundColor3 = Color3.fromRGB(20, 30, 60)
frame.BackgroundTransparency = 0.15
frame.BorderSizePixel = 0
frame.Active = true

Instance.new("UICorner", frame).CornerRadius = UDim.new(0,16)

local stroke = Instance.new("UIStroke", frame)
stroke.Thickness = 3

task.spawn(function()
    local h = 0
    while true do
        h = (h + 1) % 360
        stroke.Color = Color3.fromHSV(h/360,1,1)
        RunService.Heartbeat:Wait()
    end
end)

-- Title
local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1,-50,0,45)
title.Position = UDim2.new(0,10,0,10)
title.BackgroundColor3 = Color3.fromRGB(30,50,100)
title.BackgroundTransparency = 0.1
title.Text = "🌆 Vortex Brookhaven | Combo"
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

-- Menu / Content
local menu = Instance.new("Frame", frame)
menu.Size = UDim2.new(0,160,1,-70)
menu.Position = UDim2.new(0,0,0,60)
menu.BackgroundColor3 = Color3.fromRGB(25,25,50)
menu.BackgroundTransparency = 0.1

local content = Instance.new("Frame", frame)
content.Size = UDim2.new(1,-160,1,-70)
content.Position = UDim2.new(0,160,0,60)
content.BackgroundColor3 = Color3.fromRGB(40,40,80)
content.BackgroundTransparency = 0.1

local scroll = Instance.new("ScrollingFrame", content)
scroll.Size = UDim2.new(1,-10,1,-10)
scroll.Position = UDim2.new(0,5,0,5)
scroll.ScrollBarThickness = 6
scroll.CanvasSize = UDim2.new(0,0,0,0)
scroll.BackgroundTransparency = 1

local function clear()
    for _,v in pairs(scroll:GetChildren()) do
        if v:IsA("TextButton") or v:IsA("TextLabel") then
            v:Destroy()
        end
    end
end

-- =======================
-- MUSIC IDS (NÚMEROS)
-- =======================
local musicIds = {

    -- IDs antigos (mantidos)
    "135738534706063","88667071098147","140383430074415","112448027542021",
    "137879308393608","78414661292761","77712236704085","106866829236727",
    "109794531843693","79409780351863","113077324050977","128512104863934",
    "113778917971610","118064225618413","100584804963794","123171793186294",
    "70791355308103","131847084942844","136893418307185","128771129962214",
    "135903820233276","137828639403630","90617634718635","84773737820526",
    "1427189017","85056357341685","100755435179302","104026572705664",
    "88667633095864","70535546082862",
    "101453332349961","106160266114222",

    -- NOVOS IDs (já limpos, sem rbxassetid://)
    "104767744632555",
    "111814302789203",
    "84193648374486",
    "78352220341424",
    "100349603632112",
    "111723070296038"
}

while #musicIds < 100 do
    for i = 1, #musicIds do
        table.insert(musicIds, musicIds[i])
        if #musicIds >= 100 then break end
    end
end

-- ======================================================
-- RGB Tool
-- ======================================================
local rgbEnabled = false
local function applyRGB(item)
    if not item:IsA("Tool") then return end
    for _,part in pairs(item:GetDescendants()) do
        if part:IsA("BasePart") then
            task.spawn(function()
                local h = 0
                while rgbEnabled and part.Parent do
                    h = (h + 1) % 360
                    part.Color = Color3.fromHSV(h/360,1,1)
                    RunService.Heartbeat:Wait()
                end
            end)
        end
    end
end

-- ======================================================
-- MUSIC RADAR
-- ======================================================
local function scanSounds()
    clear()
    local y = 5
    local found = {}

    for _,d in pairs(workspace:GetDescendants()) do
        if d:IsA("Sound") and d.SoundId ~= "" then
            if not found[d.SoundId] then
                found[d.SoundId] = true
                local btn = Instance.new("TextButton", scroll)
                btn.Size = UDim2.new(1,-10,0,36)
                btn.Position = UDim2.new(0,5,0,y)
                btn.BackgroundColor3 = Color3.fromRGB(80,80,130)
                btn.TextColor3 = Color3.new(1,1,1)
                btn.Font = Enum.Font.Gotham
                btn.TextSize = 14
                btn.Text = d.SoundId
                btn.MouseButton1Click:Connect(function()
                    if setclipboard then setclipboard(d.SoundId) end
                end)
                y += 41
            end
        end
    end

    if y == 5 then
        local lbl = Instance.new("TextLabel", scroll)
        lbl.Size = UDim2.new(1,-10,0,40)
        lbl.Position = UDim2.new(0,5,0,5)
        lbl.Text = "Nenhum Sound acessível encontrado."
        lbl.TextColor3 = Color3.new(1,1,1)
        lbl.BackgroundTransparency = 1
        lbl.Font = Enum.Font.Gotham
        lbl.TextSize = 14
        y = 50
    end

    scroll.CanvasSize = UDim2.new(0,0,0,y)
end

-- ======================================================
-- ABAS
-- ======================================================
local tabs = {

{
name = "🎵 Music IDs",
callback = function()
    clear()
    local y = 0
    for _,id in ipairs(musicIds) do
        local btn = Instance.new("TextButton", scroll)
        btn.Size = UDim2.new(1,-10,0,36)
        btn.Position = UDim2.new(0,5,0,y)
        btn.BackgroundColor3 = Color3.fromRGB(70,70,120)
        btn.TextColor3 = Color3.new(1,1,1)
        btn.Font = Enum.Font.Gotham
        btn.TextSize = 15
        btn.Text = id  -- mostra apenas o ID
        btn.MouseButton1Click:Connect(function()
            if setclipboard then setclipboard(id) end
        end)
        y += 41
    end
    scroll.CanvasSize = UDim2.new(0,0,0,y)
end},

{
name = "🎶 AJ Music Hub",
callback = function()
    clear()
    local btn = Instance.new("TextButton", scroll)
    btn.Size = UDim2.new(1,-10,0,45)
    btn.Position = UDim2.new(0,5,0,5)
    btn.BackgroundColor3 = Color3.fromRGB(100,100,160)
    btn.Text = "Executar AJ Music Hub"
    btn.TextColor3 = Color3.new(1,1,1)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 18
    btn.MouseButton1Click:Connect(function()
        loadstring(game:HttpGet("https://pastebin.com/raw/zLspNekY"))()
    end)
end},

{
name = "🌈 RGB Tool",
callback = function()
    clear()
    local btn = Instance.new("TextButton", scroll)
    btn.Size = UDim2.new(1,-10,0,45)
    btn.Position = UDim2.new(0,5,0,5)
    btn.BackgroundColor3 = Color3.fromRGB(120,80,160)
    btn.TextColor3 = Color3.new(1,1,1)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 18
    btn.Text = "Ativar RGB no item da mão"
    btn.MouseButton1Click:Connect(function()
        rgbEnabled = not rgbEnabled
        btn.Text = rgbEnabled and "Desativar RGB" or "Ativar RGB no item da mão"
        local tool = char:FindFirstChildOfClass("Tool")
        if tool and rgbEnabled then
            applyRGB(tool)
        end
    end)
end},

{
name = "📡 Music Radar",
callback = function()
    scanSounds()
end},

{
name = "⚙️ Settings",
callback = function()
    clear()
    local btn = Instance.new("TextButton", scroll)
    btn.Size = UDim2.new(1,-10,0,45)
    btn.Position = UDim2.new(0,5,0,5)
    btn.BackgroundColor3 = Color3.fromRGB(160,80,80)
    btn.Text = "Destroy Hub"
    btn.TextColor3 = Color3.new(1,1,1)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 18
    btn.MouseButton1Click:Connect(function()
        gui:Destroy()
    end)
end}

}

-- Criar menu
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

-- Drag
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
