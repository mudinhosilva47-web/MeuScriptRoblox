-- Gui principal
local gui = Instance.new("ScreenGui")
gui.Name = "BoomboxTest"
gui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Frame
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 250, 0, 120)
frame.Position = UDim2.new(0.4, 0, 0.4, 0)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 60)
frame.Active = true
frame.Parent = gui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = frame

-- Campo de texto para ID
local input = Instance.new("TextBox")
input.Size = UDim2.new(1, -20, 0, 40)
input.Position = UDim2.new(0, 10, 0, 10)
input.BackgroundColor3 = Color3.fromRGB(50, 50, 100)
input.TextColor3 = Color3.fromRGB(255, 255, 255)
input.PlaceholderText = "Digite o ID da música"
input.Font = Enum.Font.SourceSansBold
input.TextSize = 18
input.Parent = frame

-- Botão tocar
local playBtn = Instance.new("TextButton")
playBtn.Size = UDim2.new(1, -20, 0, 40)
playBtn.Position = UDim2.new(0, 10, 0, 60)
playBtn.BackgroundColor3 = Color3.fromRGB(80, 80, 150)
playBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
playBtn.Text = "Tocar no Boombox"
playBtn.Font = Enum.Font.SourceSansBold
playBtn.TextSize = 18
playBtn.Parent = frame

-- Função do botão
playBtn.MouseButton1Click:Connect(function()
    local id = input.Text
    if id ~= "" then
        local remote = game.ReplicatedStorage:FindFirstChild("ClientMusic")
        if remote then
            if remote:IsA("RemoteEvent") then
                remote:FireServer(id)
                print("Tentando tocar música ID:", id)
            elseif remote:IsA("RemoteFunction") then
                remote:InvokeServer(id)
                print("Tentando tocar música ID:", id)
            end
        else
            warn("Remote ClientMusic não encontrado!")
        end
    end
end)
