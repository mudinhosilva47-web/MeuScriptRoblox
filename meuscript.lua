-- =========================================
-- Hub-VortexLord-FmlyAplixOlfSeven
-- LocalScript pronto para execução
-- =========================================

-- Referências
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer

-- =======================
-- GUI Principal
-- =======================
local gui = Instance.new("ScreenGui")
gui.Name = "HubVortexLordFmlyAplixOlfSeven"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- Frame Principal
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 500, 0, 500)
frame.Position = UDim2.new(0.25, 0, 0.2, 0)
frame.BackgroundColor3 = Color3.fromRGB(20, 40, 80)
frame.BackgroundTransparency = 0.1
frame.BorderSizePixel = 0
frame.Active = true
frame.Parent = gui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 16)
corner.Parent = frame

-- Stroke rainbow na borda
local stroke = Instance.new("UIStroke")
stroke.Thickness = 4
stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
stroke.Parent = frame

-- =======================
-- Título/Branding
-- =======================
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -40, 0, 50)
title.Position = UDim2.new(0, 20, 0, 10)
title.BackgroundColor3 = Color3.fromRGB(30, 60, 120)
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Text = "🌌 Hub-VortexLord-FmlyAplixOlfSeven"
title.Font = Enum.Font.GothamBold
title.TextSize = 24
title.Parent = frame

local titleStroke = Instance.new("UIStroke")
titleStroke.Thickness = 2
titleStroke.Parent = title

-- Loop rainbow otimizado (usa Heartbeat para não travar)
local steps = 100
spawn(function()
    local i = 0
    while true do
        i = (i + 1) % steps
        local hue = i/steps
        stroke.Color = Color3.fromHSV(hue,1,1)
        titleStroke.Color = Color3.fromHSV(hue,1,1)
        game:GetService("RunService").Heartbeat:Wait()
    end
end)

-- Botão Fechar
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 35, 0, 35)
closeBtn.Position = UDim2.new(1, -45, 0, 10)
closeBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.Text = "✖"
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 18
closeBtn.Parent = frame
closeBtn.MouseButton1Click:Connect(function()
    frame.Visible = false
end)

-- =======================
-- Menu Lateral e Conteúdo
-- =======================
local menu = Instance.new("Frame")
menu.Size = UDim2.new(0, 140, 1, -70)
menu.Position = UDim2.new(0, 0, 0, 60)
menu.BackgroundColor3 = Color3.fromRGB(35, 35, 65)
menu.Parent = frame

local content = Instance.new("Frame")
content.Size = UDim2.new(1, -140, 1, -60)
content.Position = UDim2.new(0, 140, 0, 60)
content.BackgroundColor3 = Color3.fromRGB(45, 45, 80)
content.Parent = frame

-- ScrollingFrame
local scroll = Instance.new("ScrollingFrame")
scroll.Size = UDim2.new(1, -10, 1, -10)
scroll.Position = UDim2.new(0, 5, 0, 5)
scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
scroll.ScrollBarThickness = 6
scroll.BackgroundColor3 = Color3.fromRGB(50, 50, 90)
scroll.Parent = content

-- Função limpar conteúdo
local function clearContent()
    for _, child in pairs(scroll:GetChildren()) do
        if child:IsA("TextButton") or child:IsA("TextLabel") then
            child:Destroy()
        end
    end
end

-- =======================
-- Lista de IDs de músicas
-- =======================
local ids = {
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

-- =======================
-- Abas do Hub
-- =======================
local tabs = {
    {name="🎵 Músicas", callback=function()
        clearContent()
        local y = 0
        for _, id in ipairs(ids) do
            local btn = Instance.new("TextButton")
            btn.Size = UDim2.new(1, -10, 0, 35)
            btn.Position = UDim2.new(0, 5, 0, y)
            btn.BackgroundColor3 = Color3.fromRGB(70, 70, 110)
            btn.TextColor3 = Color3.fromRGB(255, 255, 255)
            btn.Text = id
            btn.Font = Enum.Font.Gotham
            btn.TextSize = 16
            btn.Parent = scroll
            btn.MouseButton1Click:Connect(function()
                if setclipboard then setclipboard(id) end
            end)
            y = y + 40
        end
        scroll.CanvasSize = UDim2.new(0,0,0,y)
    end},

    {name="⚡ Infinity Yield", callback=function()
        clearContent()
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(1, -10, 0, 45)
        btn.Position = UDim2.new(0,5,0,5)
        btn.BackgroundColor3 = Color3.fromRGB(100,100,160)
        btn.TextColor3 = Color3.fromRGB(255,255,255)
        btn.Text = "Executar Infinity Yield"
        btn.Font = Enum.Font.GothamBold
        btn.TextSize = 18
        btn.Parent = scroll
        btn.MouseButton1Click:Connect(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
        end)
    end},

    {name="🎶 AJ Music Hub", callback=function()
        clearContent()
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(1, -10, 0, 45)
        btn.Position = UDim2.new(0,5,0,5)
        btn.BackgroundColor3 = Color3.fromRGB(100,100,160)
        btn.TextColor3 = Color3.fromRGB(255,255,255)
        btn.Text = "Executar AJ Music Hub"
        btn.Font = Enum.Font.GothamBold
        btn.TextSize = 18
        btn.Parent = scroll
        btn.MouseButton1Click:Connect(function()
            loadstring(game:HttpGet("https://pastebin.com/raw/zLspNekY"))()
        end)
    end},

    {name="💃 Gaze Emotes", callback=function()
        clearContent()
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(1, -10, 0, 45)
        btn.Position = UDim2.new(0,5,0,5)
        btn.BackgroundColor3 = Color3.fromRGB(100,100,160)
        btn.TextColor3 = Color3.fromRGB(255,255,255)
        btn.Text = "Executar Gaze Emotes"
        btn.Font = Enum.Font.GothamBold
        btn.TextSize = 18
        btn.Parent = scroll
        btn.MouseButton1Click:Connect(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Gazer-Ha/Gaze-stuff/refs/heads/main/Gaze%20emote"))()
        end)
    end},

    {name="📜 Meu Script", callback=function()
        clearContent()
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(1, -10, 0, 45)
        btn.Position = UDim2.new(0,5,0,5)
        btn.BackgroundColor3 = Color3.fromRGB(100,100,160)
        btn.TextColor3 = Color3.fromRGB(255,255,255)
        btn.Text = "Executar Meu Script"
        btn.Font = Enum.Font.GothamBold
        btn.TextSize = 18
        btn.Parent = scroll
        btn.MouseButton1Click:Connect(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/mudinhosilva47-web/MeuScriptRoblox/main/meuscript.lua"))()
        end)
    end}
}

-- =======================
-- Criar botões de menu
-- =======================
for i, tab in ipairs(tabs) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1,0,0,50)
    btn.Position = UDim2.new(0,0,0,(i-1)*55)
    btn.BackgroundColor3 = Color3.fromRGB(80,80,140)
    btn.TextColor3 = Color3.fromRGB(255,255,255)
    btn.Text = tab.name
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 16
    btn.Parent = menu

    -- Stroke rainbow botão
    local btnStroke = Instance.new("UIStroke")
    btnStroke.Thickness = 2
    btnStroke.Parent = btn
    spawn(function()
        local j = 0
        while true do
            j = (j+1)%steps
            btnStroke.Color = Color3.fromHSV(j/steps,1,1)
            game:GetService("RunService").Heartbeat:Wait()
        end
    end)

    btn.MouseButton1Click:Connect(function()
        clearContent()
        tab.callback()
    end)
end

-- =======================
-- Sistema de arrastar GUI
-- =======================
local dragging = false
local dragStart, startPos

local function startDrag(input)
    dragging = true
    dragStart = input.Position
    startPos = frame.Position
end

local function endDrag()
    dragging = false
end

local function updateDrag(input)
    if dragging and (input.UserInputType==Enum.UserInputType.MouseMovement or input.UserInputType==Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        frame.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
    end
end

title.InputBegan:Connect(function(input)
    if input.UserInputType==Enum.UserInputType.MouseButton1 or input.UserInputType==Enum.UserInputType.Touch then
        startDrag(input)
    end
end)

title.InputEnded:Connect(function(input)
    if input.UserInputType==Enum.UserInputType.MouseButton1 or input.UserInputType==Enum.UserInputType.Touch then
        endDrag()
    end
end)

UserInputService.InputChanged:Connect(updateDrag)
