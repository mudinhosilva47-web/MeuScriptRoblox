-- Carregar a biblioteca Rayfield
local Rayfield = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Rayfield/main/source"))()

-- Criar a janela principal
local Window = Rayfield:CreateWindow({
    Name = "Meu Script Rayfield",
    LoadingTitle = "Carregando...",
    LoadingSubtitle = "Interface simples",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "MeuScriptConfig",
        FileName = "Config"
    }
})

-- Criar uma aba
local Tab = Window:CreateTab("Principal", 4483362458)

-- Botão que carrega seu script do GitHub
Tab:CreateButton({
    Name = "Rodar meu script",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/mudinhosilva47-web/MeuScriptRoblox/main/meuscript.lua"))()
    end
})


