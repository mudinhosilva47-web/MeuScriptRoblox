-- Menu Boombox Profissional (Delta)
-- Autor: Copilot

-- Criar GUI principal
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")

-- Botão redondo para abrir menu
local OpenButton = Instance.new("ImageButton")
OpenButton.Size = UDim2.new(0, 80, 0, 80)
OpenButton.Position = UDim2.new(0.05, 0, 0.8, 0)
OpenButton.Image = "rbxassetid://1234567890" -- coloque aqui o ID da imagem
OpenButton.Parent = ScreenGui

-- Deixar botão circular
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(1, 0)
UICorner.Parent = OpenButton

-- Frame do menu
local MenuFrame = Instance.new("Frame")
MenuFrame.Size = UDim2.new(0, 300, 0, 400)
MenuFrame.Position = UDim2.new(0.1, 0, 0.3, 0)
MenuFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MenuFrame.Visible = false
MenuFrame.Parent = ScreenGui

-- Abrir/fechar menu
OpenButton.MouseButton1Click:Connect(function()
    MenuFrame.Visible = not MenuFrame.Visible
end)

-- Categorias
local categorias = {
    {nome = "Favoritos", ids = {"123456789", "987654321"}},
    {nome = "Clássicos", ids = {"555555555", "444444444"}},
    {nome = "Novos", ids = {"333333333", "222222222"}}
}

-- Criar botões de categorias
for i, cat in ipairs(categorias) do
    local catBtn = Instance.new("TextButton")
    catBtn.Size = UDim2.new(1, -20, 0, 40)
    catBtn.Position = UDim2.new(0, 10, 0, (i-1)*45 + 10)
    catBtn.Text = cat.nome
    catBtn.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    catBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    catBtn.Parent = MenuFrame

    catBtn.MouseButton1Click:Connect(function()
        -- Limpar lista anterior
        for _, child in ipairs(MenuFrame:GetChildren()) do
            if child:IsA("TextButton") and child ~= catBtn then
                child:Destroy()
            end
        end

        -- Criar lista de IDs
        for j, musicaId in ipairs(cat.ids) do
            local musicaBtn = Instance.new("TextButton")
            musicaBtn.Size = UDim2.new(1, -20, 0, 40)
            musicaBtn.Position = UDim2.new(0, 10, 0, (j-1)*45 + 60)
            musicaBtn.Text = "ID: "..musicaId
            musicaBtn.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
            musicaBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
            musicaBtn.Parent = MenuFrame

            musicaBtn.MouseButton1Click:Connect(function()
                local sound = Instance.new("Sound")
                sound.SoundId = "rbxassetid://"..musicaId
                sound.Parent = game.Players.LocalPlayer.Character:FindFirstChild("Boombox") or game.Players.LocalPlayer.Character
                sound:Play()
            end)
        end
    end)
end
