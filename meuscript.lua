-- Carregar Rayfield (link oficial)
local Rayfield = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Rayfield/main/source"))()

-- Criar Janela
local Window = Rayfield:CreateWindow({
   Name = "Catálogo de IDs de Música",
   LoadingTitle = "Rayfield Music IDs",
   LoadingSubtitle = "Feito por você",
   ConfigurationSaving = {
      Enabled = false -- desativado para evitar erro
   }
})

-- Criar Aba
local Tab = Window:CreateTab("Músicas", 4483362458)

-- Criar Seção
Tab:CreateSection("IDs de Música")

-- Função para copiar ID
local function copiarID(id)
    setclipboard(tostring(id))
    Rayfield:Notify({
        Title = "Copiado!",
        Content = "O ID " .. id .. " foi copiado para a área de transferência.",
        Duration = 3
    })
end

-- Lista de IDs (somente números)
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
    Tab:CreateButton({
        Name = "🎵 Música " .. i .. " (ID: " .. id .. ")",
        Callback = function()
            copiarID(id)
        end,
    })
end
