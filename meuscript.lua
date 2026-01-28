-- LocalScript de teste para alterar Nome de RP e Biografia

local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Espera pela GUI
local nameGui = playerGui:FindFirstChild("NameGUI") -- altere se o nome da GUI for diferente

if nameGui then
    -- Procura os TextLabels dentro da GUI
    local rpNameLabel = nameGui:FindFirstChild("RPName") or nameGui:FindFirstChildWhichIsA("TextLabel")
    local bioLabel = nameGui:FindFirstChild("RPBio") or nameGui:FindFirstChildWhichIsA("TextLabel")

    -- Muda o Nome de RP
    if rpNameLabel then
        rpNameLabel.Text = "FmlyAplixOlfSeven"
        rpNameLabel.TextColor3 = Color3.fromRGB(255,0,0) -- vermelho
        print("Nome de RP alterado com sucesso!")
    else
        print("Não encontrei o TextLabel do Nome de RP.")
    end

    -- Muda a Biografia
    if bioLabel then
        bioLabel.Text = "Welcome.!"
        bioLabel.TextColor3 = Color3.fromRGB(255,255,255)
        print("Biografia alterada com sucesso!")
    else
        print("Não encontrei o TextLabel da Biografia.")
    end
else
    print("Não encontrei a GUI NameGUI!")
end
