--- Carregar a biblioteca Rayfield
local Rayfield = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Rayfield/main/source"))()

-- Criar a janela principal
local Window = Rayfield:CreateWindow({
    Name = "Meu Script com Key System",
    LoadingTitle = "Carregando...",
    LoadingSubtitle = "By Você",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "MeuScriptConfig", -- pasta onde salva configs
        FileName = "KeySystem"
    }
})

-- Criar aba para Key System
local Tab = Window:CreateTab("Key System", 4483362458)

-- Caixa de texto para digitar a chave
local KeyBox = Tab:CreateInput({
    Name = "Digite sua chave",
    PlaceholderText = "Insira aqui...",
    RemoveTextAfterFocus = false,
    Callback = function(Text)
        if Text == "MINHA_CHAVE_SECRETA" then
            Rayfield:Notify({
                Title = "Sucesso!",
                Content = "Chave válida. Script liberado.",
                Duration = 5,
                Image = 4483362458
            })
            
            -- Script principal
            loadstring(game:HttpGet("https://raw.githubusercontent.com/mudinhosilva47-web/MeuScriptRoblox/main/meuscript.lua"))()
        else
            Rayfield:Notify({
                Title = "Erro!",
                Content = "Chave inválida. Tente novamente.",
                Duration = 5,
                Image = 4483362458
            })
        end
    end
})
