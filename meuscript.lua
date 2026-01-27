-- Gui principal
local gui = Instance.new("ScreenGui")
gui.Name = "KeylessHubPro"
gui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Frame principal
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 420, 0, 460)
frame.Position = UDim2.new(0.3, 0, 0.25, 0)
frame.BackgroundColor3 = Color3.fromRGB(20, 40, 80)
frame.BackgroundTransparency = 0.15
frame.BorderSizePixel = 0
frame.Active = true
frame.Parent = gui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = frame

local stroke = Instance.new("UIStroke")
stroke.Thickness = 3
stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
stroke.Parent = frame
task.spawn(function()
    while true do
        for i = 0, 255 do
            stroke.Color = Color3.fromHSV(i/255,1,1)
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

local titleStroke = Instance.new("UIStroke")
titleStroke.Thickness = 2
titleStroke.Parent = title
task.spawn(function()
    while true do
        for i = 0, 255 do
            titleStroke.Color = Color3.fromHSV(i/255,1,1)
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

-- Área principal
local content = Instance.new("Frame")
content.Size = UDim2.new(1, -120, 1, -40)
content.Position = UDim2.new(0, 120, 0, 40)
content.BackgroundColor3 = Color3.fromRGB(45, 45, 70)
content.Parent = frame

local scroll = Instance.new("ScrollingFrame")
scroll.Size = UDim2.new(1, -10, 1, -10)
scroll.Position = UDim2.new(0, 5, 0, 5)
scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
scroll.ScrollBarThickness = 6
scroll.BackgroundColor3 = Color3.fromRGB(50, 50, 80)
scroll.Parent = content

local function clearContent()
    for _,child in pairs(scroll:GetChildren()) do
        if child:IsA("TextButton") or child:IsA("TextLabel") then
            child:Destroy()
        end
    end
end

-------------------------------------------------
-- Lista de músicas (seus IDs originais)
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

-------------------------------------------------
-- Abas
-------------------------------------------------
local tabs = {
    {name="🎵 Músicas", callback=function()
        clearContent()
        local y=0
        for _,music in ipairs(musicList) do
            local btn = Instance.new("TextButton")
            btn.Size = UDim2.new(1,-10,0,30)
            btn.Position = UDim2.new(0,5,0,y)
            btn.BackgroundColor3 = Color3.fromRGB(70,70,100)
            btn.TextColor3 = Color3.fromRGB(255,255,255)
            btn.Text = music.name.." - "..music.id
            btn.Font = Enum.Font.SourceSans
            btn.TextSize = 16
            btn.Parent = scroll
            btn.MouseButton1Click:Connect(function()
                if setclipboard then setclipboard(music.id) end
                local sound = Instance.new("Sound", game.Players.LocalPlayer:WaitForChild("PlayerGui"))
                sound.SoundId = tostring(music.id)
                sound:Play()
            end)
            y=y+35
        end
        scroll.CanvasSize = UDim2.new(0,0,0,y)
    end},

    {name="👥 Copiar Jogador", callback=function()
        clearContent()
        local y=0
        for _,player in ipairs(game.Players:GetPlayers()) do
            if player ~= game.Players.LocalPlayer then
                local btn = Instance.new("TextButton")
                btn.Size = UDim2.new(1,-10,0,30)
                btn.Position = UDim2.new(0,5,0,y)
                btn.BackgroundColor3 = Color3.fromRGB(70,100,120)
                btn.TextColor3 = Color3.fromRGB(255,255,255)
                btn.Text = player.Name
                btn.Font = Enum.Font.SourceSansBold
                btn.TextSize = 16
                btn.Parent = scroll
                btn.MouseButton1Click:Connect(function()
                    if setclipboard then setclipboard(player.Name) end
                end)
                y=y+35
            end
        end
        scroll.CanvasSize = UDim2.new(0,0,0,y)
    end},

    {name="⚡ Infinity Yield", callback=function()
        clearContent()
        local runBtn = Instance.new("TextButton")
        runBtn.Size = UDim2        runBtn.Size = UDim2.new(1,-10,0,40)
        runBtn.Position = UDim2.new(0,5,0,5)
        runBtn.BackgroundColor3 = Color3.fromRGB(100,100,150)
        runBtn.TextColor3 = Color3.fromRGB(255,255,255)
        runBtn.Text = "Executar Infinity Yield"
        runBtn.Font = Enum.Font.SourceSansBold
        runBtn.TextSize = 18
        runBtn.Parent = scroll
        runBtn.MouseButton1Click:Connect(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
        end)
    end},

    {name="🎶 AJ Music Hub", callback=function()
        clearContent()
        local runBtn = Instance.new("TextButton")
        runBtn.Size = UDim2.new(1,-10,0,40)
        runBtn.Position = UDim2.new(0,5,0,5)
        runBtn.BackgroundColor3 = Color3.fromRGB(100,100,150)
        runBtn.TextColor3 = Color3.fromRGB(255,255,255)
        runBtn.Text = "Executar AJ Music Hub"
        runBtn.Font = Enum.Font.SourceSansBold
        runBtn.TextSize = 18
        runBtn.Parent = scroll
        runBtn.MouseButton1Click:Connect(function()
            loadstring(game:HttpGet("https://pastebin.com/raw/zLspNekY"))()
        end)
    end},

    {name="💃 Gaze Emotes", callback=function()
        clearContent()
        local runBtn = Instance.new("TextButton")
        runBtn.Size = UDim2.new(1,-10,0,40)
        runBtn.Position = UDim2.new(0,5,0,5)
        runBtn.BackgroundColor3 = Color3.fromRGB(100,100,150)
        runBtn.TextColor3 = Color3.fromRGB(255,255,255)
        runBtn.Text = "Executar Gaze Emotes"
        runBtn.Font = Enum.Font.SourceSansBold
        runBtn.TextSize = 18
        runBtn.Parent = scroll
        runBtn.MouseButton1Click:Connect(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Gazer-Ha/Gaze-stuff/refs/heads/main/Gaze%20emote"))()
        end)
    end},

    {name="📜 Meu Script", callback=function()
        clearContent()
        local runBtn = Instance.new("TextButton")
        runBtn.Size = UDim2.new(1,-10,0,40)
        runBtn.Position = UDim2.new(0,5,0,5)
        runBtn.BackgroundColor3 = Color3.fromRGB(100,100,150)
        runBtn.TextColor3 = Color3.fromRGB(255,255,255)
        runBtn.Text = "Executar Meu Script"
        runBtn.Font = Enum.Font.SourceSansBold
        runBtn.TextSize = 18
        runBtn.Parent = scroll
        runBtn.MouseButton1Click:Connect(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/mudinhosilva47-web/MeuScriptRoblox/main/meuscript.lua"))()
        end)
    end},

    {name="🛡️ Anti-AFK", callback=function()
        clearContent()
        local runBtn = Instance.new("TextButton")
        runBtn.Size = UDim2.new(1,-10,0,40)
        runBtn.Position = UDim2.new(0,5,0,5)
        runBtn.BackgroundColor3 = Color3.fromRGB(100,100,150)
        runBtn.TextColor3 = Color3.fromRGB(255,255,255)
        runBtn.Text = "Ativar Anti-AFK"
        runBtn.Font = Enum.Font.SourceSansBold
        runBtn.TextSize = 18
        runBtn.Parent = scroll
        runBtn.MouseButton1Click:Connect(function()
            local VirtualUser = game:GetService("VirtualUser")
            game:GetService("Players").LocalPlayer.Idled:Connect(function()
                VirtualUser:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
                task.wait(1)
                VirtualUser:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
            end)
        end)
    end},

    {name="🚀 Speed Hack", callback=function()
        clearContent()
        local runBtn = Instance.new("TextButton")
        runBtn.Size = UDim2.new(1,-10,0,40)
        runBtn.Position = UDim2.new(0,5,0,5)
        runBtn.BackgroundColor3 = Color3.fromRGB(100,100,150)
        runBtn.TextColor3 = Color3.fromRGB(255,255,255)
        runBtn.Text = "Ativar Speed Hack"
        runBtn.Font = Enum.Font.SourceSansBold
        runBtn.TextSize = 18
        runBtn.Parent = scroll
        runBtn.MouseButton1Click:Connect(function()
            local player = game.Players.LocalPlayer
            local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid.WalkSpeed = 50
            end
        end)
    end},

    {name="🌀 Fly", callback=function()
        clearContent()
        local runBtn = Instance.new("TextButton")
        runBtn.Size = UDim2.new(1,-10,0,40)
        runBtn.Position = UDim2.new(0,5,0,5)
        runBtn.BackgroundColor3 = Color3.fromRGB(100,100,150)
        runBtn.TextColor3 = Color3.fromRGB(255,255,255)
        runBtn.Text = "Ativar Fly"
        runBtn.Font = Enum.Font.SourceSansBold
        runBtn.TextSize = 18
        runBtn.Parent = scroll
        runBtn.MouseButton1Click:Connect(function()
            loadstring(game:HttpGet("https://pastebin.com/raw/7t3QdQjz"))()
        end)
    end},

    {name="👑 God Mode", callback=function()
        clearContent()
        local runBtn = Instance.new("TextButton")
        runBtn.Size = UDim2.new(1,-10,0,40)
        runBtn.Position = UDim2.new(0,5,0,5)
        runBtn.BackgroundColor3 = Color3.fromRGB(100,100,150)
        runBtn.TextColor3 = Color3.fromRGB(255,255,255)
        runBtn.Text = "Ativar God Mode"
        runBtn.Font = Enum.Font.SourceSansBold
        runBtn.TextSize = 18
        runBtn.Parent = scroll
        runBtn.MouseButton1Click:Connect(function()
            local player = game.Players.LocalPlayer
            local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid.Health = math.huge
                humanoid.MaxHealth = math.huge
            end
        end)
    end}
}

-- Criar botões de menu dinamicamente
for i,tab in ipairs(tabs) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 40)
    btn.Position = UDim2.new(0, 0, 0, (i-1)*45)
    btn.BackgroundColor3 = Color3.fromRGB(80, 80, 120)
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Text = tab.name
    btn.Font = Enum.Font.SourceSansBold
    btn.TextSize = 16
    btn.Parent = menu

    local btnStroke = Instance.new("UIStroke")
    btnStroke.Thickness = 2
    btnStroke.Parent = btn
    task.spawn(function()
        while true do
            for j = 0, 255 do
                btnStroke.Color = Color3.fromHSV(j/255,1,1)
                task.wait(0.03)
            end
        end
    end)

    btn.MouseButton1Click:Connect(function()
        clearContent()
        tab.callback()
    end)
end

-------------------------------------------------
-- Sistema de arrastar pelo título
-------------------------------------------------
local UserInputService = game:GetService("UserInputService")
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
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
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
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        startDrag(input)
    end
end)

title.InputEnded:Connect(functiontitle.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        endDrag()
    end
end)

UserInputService.InputChanged:Connect(updateDrag)
