-- Criar GUI principal
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")

-- Criar Frame (menu)
local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 200, 0, 250) -- tamanho pequeno
Frame.Position = UDim2.new(0.1, 0, 0.1, 0) -- posição inicial
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame.Active = true
Frame.Draggable = true -- permite arrastar
Frame.Parent = ScreenGui

-- Criar título
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 30)
Title.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Title.Text = "🎵 Menu de IDs"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 20
Title.Parent = Frame

-- Função para criar botões
local function criarBotao(nome, id, ordem)
    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(1, -10, 0, 25)
    Button.Position = UDim2.new(0, 5, 0, 35 + (ordem * 30))
    Button.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button.Font = Enum.Font.SourceSans
    Button.TextSize = 18
    Button.Text = nome .. " (ID: " .. id .. ")"
    Button.Parent = Frame

    Button.MouseButton1Click:Connect(function()
        setclipboard(tostring(id))
        print("Copiado ID:", id)
    end)
end

-- Lista de IDs
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
    "128512104863934"
}

-- Criar botões automaticamente
for i, id in ipairs(ids) do
    criarBotao("Música " .. i, id, i)
end
