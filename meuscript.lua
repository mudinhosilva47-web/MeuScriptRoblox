-- Nome e biografia desejados
local novoNome = "FmlyAplixOlfSeven"
local novaBio = "Welcome.!"
local corNome = Color3.fromRGB(255, 0, 0) -- vermelho
local corBio = Color3.fromRGB(255, 255, 255) -- branco

-- Função para atualizar NameGUI de jogadores
local function atualizarNomeRP()
    -- Percorrer todos os jogadores
    for _, player in pairs(game.Players:GetPlayers()) do
        -- Ignorar se for você mesmo (opcional)
        if player ~= game.Players.LocalPlayer then
            local character = player.Character
            if character then
                -- Procurar por BillboardGui na cabeça
                local head = character:FindFirstChild("Head")
                if head then
                    for _, gui in pairs(head:GetChildren()) do
                        if gui:IsA("BillboardGui") then
                            for _, txtLabel in pairs(gui:GetChildren()) do
                                if txtLabel:IsA("TextLabel") then
                                    local textLower = txtLabel.Text:lower()
                                    -- Nome RP
                                    if textLower:find("rp") or textLower:find("name") then
                                        txtLabel.Text = novoNome
                                        txtLabel.TextColor3 = corNome
                                    end
                                    -- Biografia (às vezes chamada de "bio")
                                    if textLower:find("bio") then
                                        txtLabel.Text = novaBio
                                        txtLabel.TextColor3 = corBio
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end

-- Atualiza imediatamente
atualizarNomeRP()

-- Atualiza continuamente a cada 2 segundos (para novos jogadores ou mudanças)
task.spawn(function()
    while true do
        atualizarNomeRP()
        task.wait(2)
    end
end)
