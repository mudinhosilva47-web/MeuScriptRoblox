local gui = Instance.new("ScreenGui")
gui.Name = "IDsHub"
gui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Frame principal
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 200, 0, 250)
frame.Position = UDim2.new(0.7, 0, 0.3, 0)
frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
frame.Active = true
frame.Parent = gui

-- Área de arraste (título + parte inferior)
local dragArea = Instance.new("Frame")
dragArea.Size = UDim2.new(1, 0, 0, 100) -- cobre título e label
dragArea.Position = UDim2.new(0, 0, 0, 0)
dragArea.BackgroundTransparency = 1 -- invisível
dragArea.Parent = frame

-- Título
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -30, 0, 30)
title.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Text = "Meus IDs"
title.Parent = frame

-- Botão Fechar (lado esquerdo)
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(0, 0, 0, 0)
closeBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.Text = "X"
closeBtn.Parent = frame

closeBtn.MouseButton1Click:Connect(function()
    frame.Visible = false
end)

-- ScrollingFrame para lista
local scroll = Instance.new("ScrollingFrame")
scroll.Size = UDim2.new(1, 0, 0, 120)
scroll.Position = UDim2.new(0, 0, 0, 30)
scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
scroll.ScrollBarThickness = 6
scroll.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
scroll.Parent = frame

-- Label para mostrar ID selecionado
local idLabel = Instance.new("TextLabel")
idLabel.Size = UDim2.new(1, 0, 0, 100)
idLabel.Position = UDim2.new(0, 0, 0, 150)
idLabel.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
idLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
idLabel.Text = "ID selecionado: Nenhum"
idLabel.TextWrapped = true
idLabel.Parent = frame

-- IDs
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

-- Criar botões
local y = 0
for _,id in ipairs(ids) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -10, 0, 25)
    btn.Position = UDim2.new(0, 5, 0, y)
    btn.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Text = id
    btn.Parent = scroll

    btn.MouseButton1Click:Connect(function()
        idLabel.Text = "ID selecionado: "..id
        if setclipboard then
            setclipboard(id)
        end
    end)

    y = y + 30
end

scroll.CanvasSize = UDim2.new(0, 0, 0, y)

-- Sistema de arrastar pelo dragArea (fora da lista)
local UserInputService = game:GetService("UserInputService")
local dragging = false
local dragStart, startPos

dragArea.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = frame.Position
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

dragArea.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)
