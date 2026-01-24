local gui = Instance.new("ScreenGui")
gui.Name = "CustomHub"
gui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Frame principal
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 300, 0, 350)
frame.Position = UDim2.new(0.3, 0, 0.3, 0)
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
frame.BorderSizePixel = 0
frame.Active = true
frame.Parent = gui

-- Título (arrastável)
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 40)
title.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Text = "⚙️ Script Hub"
title.Font = Enum.Font.SourceSansBold
title.TextSize = 20
title.Parent = frame

-- Botão fechar
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 40, 0, 40)
closeBtn.Position = UDim2.new(0, 0, 0, 0)
closeBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.Text = "X"
closeBtn.Parent = frame
closeBtn.MouseButton1Click:Connect(function()
    frame.Visible = false
end)

-- Menu lateral
local menu = Instance.new("Frame")
menu.Size = UDim2.new(0, 80, 1, -40)
menu.Position = UDim2.new(0, 0, 0, 40)
menu.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
menu.Parent = frame

-- Área principal
local content = Instance.new("Frame")
content.Size = UDim2.new(1, -80, 1, -40)
content.Position = UDim2.new(0, 80, 0, 40)
content.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
content.Parent = frame

-- ScrollingFrame para conteúdo
local scroll = Instance.new("ScrollingFrame")
scroll.Size = UDim2.new(1, -10, 1, -10)
scroll.Position = UDim2.new(0, 5, 0, 5)
scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
scroll.ScrollBarThickness = 6
scroll.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
scroll.Parent = content

-- Função para limpar conteúdo
local function clearContent()
    for _,child in pairs(scroll:GetChildren()) do
        if child:IsA("TextButton") or child:IsA("TextLabel") then
            child:Destroy()
        end
    end
end

-- Aba Músicas
local musicBtn = Instance.new("TextButton")
musicBtn.Size = UDim2.new(1, 0, 0, 40)
musicBtn.Position = UDim2.new(0, 0, 0, 0)
musicBtn.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
musicBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
musicBtn.Text = "Músicas"
musicBtn.Parent = menu

local ids = {
   "135738534706063",
   "88667071098147",
   "140383430074415",
   "112448027542021",
   "137879308393608",
   "78414661292761",
   "77712236704085",
   "106866829236727",
   "109794531843693",
   "79409780351863",
   "113077324050977",
   "128512104863934",
   "113778917971610",
   "118064225618413",
   "100584804963794",
   "123171793186294"
}

musicBtn.MouseButton1Click:Connect(function()
    clearContent()
    local y = 0
    for _,id in ipairs(ids) do
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(1, -10, 0, 30)
        btn.Position = UDim2.new(0, 5, 0, y)
        btn.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        btn.Text = id
        btn.Parent = scroll

        btn.MouseButton1Click:Connect(function()
            if setclipboard then
                setclipboard(id)
            end
        end)

        y = y + 35
    end
    scroll.CanvasSize = UDim2.new(0, 0, 0, y)
end)

-- Aba Infinity Yield
local iyBtn = Instance.new("TextButton")
iyBtn.Size = UDim2.new(1, 0, 0, 40)
iyBtn.Position = UDim2.new(0, 0, 0, 40)
iyBtn.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
iyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
iyBtn.Text = "Infinity Yield"
iyBtn.Parent = menu

iyBtn.MouseButton1Click:Connect(function()
    clearContent()
    local runBtn = Instance.new("TextButton")
    runBtn.Size = UDim2.new(1, -10, 0, 40)
    runBtn.Position = UDim2.new(0, 5, 0, 5)
    runBtn.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
    runBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    runBtn.Text = "Executar Infinity Yield"
    runBtn.Parent = scroll

    runBtn.MouseButton1Click:Connect(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
    end)
end)

-- Aba AJ Music Hub
local ajBtn = Instance.new("TextButton")
ajBtn.Size = UDim2.new(1, 0, 0, 40)
ajBtn.Position = UDim2.new(0, 0, 0, 80)
ajBtn.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
ajBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ajBtn.Text = "AJ Music Hub"
ajBtn.Parent = menu

ajBtn.MouseButton1Click:Connect(function()
    clearContent()
    local runBtn = Instance.new("TextButton")
    runBtn.Size = UDim2.new(1, -10, 0, 40)
    runBtn.Position = UDim2.new(0, 5, 0, 5)
    runBtn.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
    runBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    runBtn.Text = "Executar AJ Music Hub"
    runBtn.Parent = scroll

    runBtn.MouseButton1Click:Connect(function()
        loadstring(game:HttpGet("https://pastebin.com/raw/zLspNekY"))()
    end)
end)

-- Aba Gaze Emotes
local gazeBtn = Instance.new("TextButton")
gazeBtn.Size = UDim2.new(1, 0, 0, 40)
gazeBtn.Position = UDim2.new(0, 0, 0, 120)
gazeBtn.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
gazeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
gazeBtn.Text = "Gaze Emotes"
gazeBtn.Parent = menu

gazeBtn.MouseButton1Click:Connect(function()
    clearContent()
    local runBtn = Instance.new("TextButton")
    runBtn.Size = UDim2.new(1, -10, 0, 40)
    runBtn.Position = UDim2.new(0, 5, 0, 5)
    runBtn.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
    runBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    runBtn.Text = "Executar Gaze Emotes"
    runBtn.Parent = scroll

    runBtn.MouseButton1Click:Connect(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Gazer-Ha/Gaze-stuff/refs/heads/main/Gaze%20emote"))()
    end)
end)

-- Sistema de arrastar pelo título
local UserInputService = game:GetService("UserInputService")
local dragging = false
local dragStart, startPos

