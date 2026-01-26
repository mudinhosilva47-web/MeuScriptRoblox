-- Gui simples para testar ClientMusic
local gui = Instance.new("ScreenGui")
gui.Name = "BoomboxTester"
gui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 300, 0, 200)
frame.Position = UDim2.new(0.35, 0, 0.35, 0)
frame.BackgroundColor3 = Color3.fromRGB(30,30,60)
frame.Parent = gui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0,10)
UICorner.Parent = frame

local input = Instance.new("TextBox")
input.Size = UDim2.new(1,-20,0,40)
input.Position = UDim2.new(0,10,0,10)
input.BackgroundColor3 = Color3.fromRGB(50,50,100)
input.TextColor3 = Color3.fromRGB(255,255,255)
input.PlaceholderText = "Digite o ID da música"
input.Font = Enum.Font.SourceSansBold
input.TextSize = 18
input.Parent = frame

local playBtn = Instance.new("TextButton")
playBtn.Size = UDim2.new(1,-20,0,40)
playBtn.Position = UDim2.new(0,10,0,60)
playBtn.BackgroundColor3 = Color3.fromRGB(80,80,150)
playBtn.TextColor3 = Color3.fromRGB(255,255,255)
playBtn.Text = "Testar ClientMusic"
playBtn.Font = Enum.Font.SourceSansBold
playBtn.TextSize = 18
playBtn.Parent = frame

local output = Instance.new("TextLabel")
output.Size = UDim2.new(1,-20,0,40)
output.Position = UDim2.new(0,10,0,110)
output.BackgroundColor3 = Color3.fromRGB(40,40,80)
output.TextColor3 = Color3.fromRGB(255,255,255)
output.Text = "Resultado aparecerá aqui"
output.Font = Enum.Font.SourceSansBold
output.TextSize = 16
output.Parent = frame

playBtn.MouseButton1Click:Connect(function()
    local id = input.Text
    local remote = game.ReplicatedStorage:FindFirstChild("ClientMusic")
    if not remote then
        output.Text = "Remote ClientMusic não encontrado!"
        return
    end

    -- Teste 1: só ID
    pcall(function()
        remote:FireServer(id)
        output.Text = "Tentando FireServer(ID)"
    end)

    -- Teste 2: ID + true
    pcall(function()
        remote:FireServer(id, true)
        output.Text = "Tentando FireServer(ID, true)"
    end)

    -- Teste 3: ID + Player
    pcall(function()
        remote:FireServer(id, game.Players.LocalPlayer)
        output.Text = "Tentando FireServer(ID, Player)"
    end)

    -- Teste 4: RemoteFunction
    if remote:IsA("RemoteFunction") then
        pcall(function()
            remote:InvokeServer(id)
            output.Text = "Tentando InvokeServer(ID)"
        end)
    end
end)
