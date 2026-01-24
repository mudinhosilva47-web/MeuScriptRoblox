local gui = Instance.new("ScreenGui")
gui.Name = "ScriptHub"
gui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Container principal
local main = Instance.new("Frame")
main.Size = UDim2.new(0, 250, 0, 300)
main.Position = UDim2.new(0.5, -125, 0.5, -150)
main.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
main.BorderSizePixel = 0
main.Active = true
main.Parent = gui

-- Título
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 40)
title.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Text = "🎵 Script Hub - Músicas"
title.Font = Enum.Font.SourceSansBold
title.TextSize = 20
title.Parent = main

-- Campo de ID selecionado
local selectedID = Instance.new("TextLabel")
selectedID.Size = UDim2.new(1, -20, 0, 40)
selectedID.Position = UDim2.new(0, 10, 0, 250)
selectedID.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
selectedID.TextColor3 = Color3.fromRGB(255, 255, 255)
selectedID.Text = "ID selecionado: Nenhum"
selectedID.TextWrapped = true
selectedID.Font = Enum.Font.SourceSans
selectedID.TextSize = 16
selectedID.Parent = main

-- ScrollingFrame para botões
local scroll = Instance.new("ScrollingFrame")
scroll.Size = UDim2.new(1, -20, 0, 200)
scroll.Position = UDim2.new(0, 10, 0, 40)
scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
scroll.ScrollBarThickness = 6
scroll.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
scroll.BorderSizePixel = 0
scroll.Parent = main

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
   "128512104863934",
   "113778917971610",
   "118064225618413",
   "100584804963794",
   "123171793186294"
}

-- Criar botões
local y = 0
for _,id in ipairs(ids) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 30)
    btn.Position = UDim2.new(0, 0, 0, y)
    btn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Text = "Copiar ID: "..id
    btn.Font = Enum.Font.SourceSans
    btn.TextSize = 16
    btn.Parent = scroll

    btn.MouseButton1Click:Connect(function()
        selectedID.Text = "ID selecionado: "..id
        if setclipboard then
            setclipboard(id)
        end
    end)

    y = y + 35
end

scroll.CanvasSize = UDim2.new(0, 0, 0, y)
