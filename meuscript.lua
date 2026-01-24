local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Window = Rayfield:CreateWindow({
   Name = "Brookhaven Multi-Tool",
   LoadingTitle = "Rayfield UI",
   LoadingSubtitle = "Copiar IDs",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil,
      FileName = "BrookhavenIDs"
   }
})

-------------------------------------------------
-- Aba Meus IDs
-------------------------------------------------
local IDsTab = Window:CreateTab("Meus IDs", 4483362458)

-- Label para mostrar o ID selecionado
local idLabel = IDsTab:CreateLabel("ID selecionado: Nenhum")

-- Seus IDs
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
   "128512104863934",
   "113778917971610",
   "118064225618413",
   "100584804963794",
   "123171793186294"
}

-- Criar botões para cada ID
for _,id in ipairs(ids) do
   IDsTab:CreateButton({
      Name = "Copiar ID "..id,
      Callback = function()
         idLabel:Set("ID selecionado: "..id)
         setclipboard(id) -- agora o ID vai direto para o clipboard
      end
   })
end
