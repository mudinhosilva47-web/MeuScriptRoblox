--==============================
-- SERVIÇOS / PLAYER
--==============================
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer

--==============================
-- PARENT CORRETO (DELTA FIX)
--==============================
local parentGui = gethui and gethui() or LocalPlayer:WaitForChild("PlayerGui")

-- Remove GUI antiga se existir
pcall(function()
    parentGui.KeylessHubPro:Destroy()
end)

--==============================
-- GUI
--==============================
local gui = Instance.new("ScreenGui")
gui.Name = "KeylessHubPro"
gui.ResetOnSpawn = false
gui.Parent = parentGui

--==============================
-- FRAME PRINCIPAL
--==============================
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 420, 0, 460)
frame.Position = UDim2.new(0.5, -210, 0.5, -230)
frame.BackgroundColor3 = Color3.fromRGB(20, 40, 80)
frame.BackgroundTransparency = 0.1
frame.BorderSizePixel = 0
frame.Active = true

Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 12)

local stroke = Instance.new("UIStroke", frame)
stroke.Thickness = 2
stroke.Color = Color3.fromRGB(0,170,255)

--==============================
-- TÍTULO
--==============================
local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, -40, 0, 40)
title.Position = UDim2.new(0, 10, 0, 0)
title.BackgroundTransparency = 1
title.Text = "🎛️ Keyless Conqueror Hub (Delta)"
title.TextColor3 = Color3.new(1,1,1)
title.Font = Enum.Font.SourceSansBold
title.TextSize = 20
title.TextXAlignment = Enum.TextXAlignment.Left

-- Botão fechar
local close = Instance.new("TextButton", frame)
close.Size = UDim2.new(0, 30, 0, 30)
close.Position = UDim2.new(1, -35, 0, 5)
close.Text = "✖"
close.BackgroundColor3 = Color3.fromRGB(200,60,60)
close.TextColor3 = Color3.new(1,1,1)
close.Font = Enum.Font.SourceSansBold
close.TextSize = 18
Instance.new("UICorner", close)

close.MouseButton1Click:Connect(function()
    gui:Destroy()
end)

--==============================
-- MENU
--==============================
local menu = Instance.new("Frame", frame)
menu.Size = UDim2.new(0, 120, 1, -40)
menu.Position = UDim2.new(0, 0, 0, 40)
menu.BackgroundColor3 = Color3.fromRGB(35,35,60)

--==============================
-- CONTEÚDO
--==============================
local content = Instance.new("Frame", frame)
content.Size = UDim2.new(1, -120, 1, -40)
content.Position = UDim2.new(0, 120, 0, 40)
content.BackgroundColor3 = Color3.fromRGB(45,45,70)

local scroll = Instance.new("ScrollingFrame", content)
scroll.Size = UDim2.new(1, -10, 1, -10)
scroll.Position = UDim2.new(0,5,0,5)
scroll.CanvasSize = UDim2.new(0,0,0,0)
scroll.ScrollBarThickness = 5
scroll.BackgroundTransparency = 1

--==============================
-- FUNÇÕES
--==============================
local function clear()
    for _,v in pairs(scroll:GetChildren()) do
        if v:IsA("TextButton") then
            v:Destroy()
        end
    end
end

--==============================
-- SOUND ÚNICO (ANTI-LAG)
--==============================
local sound = Instance.new("Sound", parentGui)

--==============================
-- MUSIC LIST (SEUS IDS)
--==============================
local musicList = {
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

--==============================
-- ABA MÚSICAS
--==============================
local function openMusic()
    clear()
    local y = 0

    for i,id in ipairs(musicList) do
        local btn = Instance.new("TextButton", scroll)
        btn.Size = UDim2.new(1,-10,0,30)
        btn.Position = UDim2.new(0,5,0,y)
        btn.BackgroundColor3 = Color3.fromRGB(70,70,100)
        btn.TextColor3 = Color3.new(1,1,1)
        btn.Font = Enum.Font.SourceSans
        btn.TextSize = 14
        btn.Text = "Music "..i.." | "..id

        btn.MouseButton1Click:Connect(function()
            sound:Stop()
            if tostring(id):find("rbxassetid://") then
                sound.SoundId = id
            else
                sound.SoundId = "rbxassetid://"..id
            end
            sound:Play()
            if setclipboard then setclipboard(id) end
        end)

        y += 35
    end

    scroll.CanvasSize = UDim2.new(0,0,0,y)
end

--==============================
-- BOTÃO MENU
--==============================
local musicBtn = Instance.new("TextButton", menu)
musicBtn.Size = UDim2.new(1,0,0,40)
musicBtn.Position = UDim2.new(0,0,0,0)
musicBtn.Text = "🎵 Músicas"
musicBtn.Font = Enum.Font.SourceSansBold
musicBtn.TextSize = 16
musicBtn.TextColor3 = Color3.new(1,1,1)
musicBtn.BackgroundColor3 = Color3.fromRGB(80,80,120)

musicBtn.MouseButton1Click:Connect(openMusic)

-- Abre direto
openMusic()

--==============================
-- DRAG (DELTA SAFE)
--==============================
local dragging, dragStart, startPos

title.InputBegan:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = i.Position
        startPos = frame.Position
    end
end)

title.InputEnded:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

UserInputService.InputChanged:Connect(function(i)
    if dragging and i.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = i.Position - dragStart
        frame.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
    end
end)

print("✅ Keyless Conqueror Hub carregado no Delta")
