-- Criar ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Criar Frame (menu)
local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 200, 0, 150)
Frame.Position = UDim2.new(0.5, -100, 0.5, -75)
Frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Frame.Visible = true
Frame.Parent = ScreenGui

-- Botão Fechar
local CloseButton = Instance.new("TextButton")
CloseButton.Size = UDim2.new(0, 80, 0, 30)
CloseButton.Position = UDim2.new(0, 10, 0, 10)
CloseButton.Text = "Fechar"
CloseButton.Parent = Frame

-- Botão Abrir
local OpenButton = Instance.new("TextButton")
OpenButton.Size = UDim2.new(0, 80, 0, 30)
OpenButton.Position = UDim2.new(0, 100, 0, 10)
OpenButton.Text = "Abrir"
OpenButton.Parent = Frame

-- Funções dos botões
CloseButton.MouseButton1Click:Connect(function()
    Frame.Visible = false
end)

OpenButton.MouseButton1Click:Connect(function()
    Frame.Visible = true
end)
