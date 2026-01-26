-- Gui principal
local gui = Instance.new("ScreenGui")
gui.Name = "KeylessHub"
gui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Frame principal
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 340, 0, 380)
frame.Position = UDim2.new(0.35, 0, 0.3, 0)
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
frame.BorderSizePixel = 0
frame.Active = true
frame.Parent = gui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 8)
UICorner.Parent = frame

-- Título
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -40, 0, 40)
title.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Text = "🎛️ Keyless Hub"
title.Font = Enum.Font.SourceSansBold
title.TextSize = 20
title.Parent = frame

-- Botão fechar
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 40, 0, 40)
closeBtn.Position = UDim2.new(1, -40, 0, 0)
closeBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.Text = "X"
closeBtn.Font = Enum.Font.SourceSansBold
closeBtn.TextSize = 20
closeBtn.Parent = frame
closeBtn.MouseButton1Click:Connect(function()
    frame.Visible = false
end)

-- Menu lateral
local menu = Instance.new("Frame")
menu.Size = UDim2.new(0, 100, 1, -40)
menu.Position = UDim2.new(0, 0, 0, 40)
menu.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
menu.Parent = frame

-- Área principal
local content = Instance.new("Frame")
content.Size = UDim2.new(1, -100, 1, -40)
content.Position = UDim2.new(0, 100, 0, 40)
content.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
content.Parent = frame

-- ScrollingFrame
local scroll = Instance.new("ScrollingFrame")
scroll.Size = UDim2.new(1, -10, 1, -10)
scroll.Position = UDim2.new(0, 5, 0, 5)
scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
scroll.ScrollBarThickness = 6
scroll.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
scroll.Parent = content

-- Função limpar conteúdo
local function clearContent()
    for _,child in pairs(scroll:GetChildren()) do
        if child:IsA("TextButton") or child:IsA("TextLabel") then
            child:Destroy()
        end
    end
end

-- Função notificação
local function notify(msg)
    local n = Instance.new("TextLabel")
    n.Size = UDim2.new(0, 220, 0, 40)
    n.Position = UDim2.new(0.5, -110, 0, 10)
    n.BackgroundColor3 = Color3.fromRGB(30,30,30)
    n.TextColor3 = Color3.fromRGB(255,255,255)
    n.Text = msg
    n.Font = Enum.Font.SourceSansBold
    n.TextSize = 18
    n.Parent = gui
    game:GetService("Debris"):AddItem(n, 3)
end

-------------------------------------------------
-- Lista de abas
-------------------------------------------------
local tabs = {
    {
        name = "🎵 Músicas",
        callback = function()
            clearContent()
            local ids = {
                -- IDs antigos
                "135738534706063","88667071098147","140383430074415","112448027542021",
                "137879308393608","78414661292761","77712236704085","106866829236727",
                "109794531843693","79409780351863","113077324050977","128512104863934",
                "113778917971610","118064225618413","100584804963794","123171793186294",
                "70791355308103","131847084942844","136893418307185","128771129962214",
                "135903820233276","137828639403630","90617634718635","84773737820526",
                "1427189017",
                -- IDs novos
                "85056357341685", -- Novinha da Glock
                "100755435179302", -- Rock
                "104026572705664", -- Rock Funk
                "88667633095864",
                "70535546082862",
                "rbxassetid://101453332349961",
                "rbxassetid://106160266114222"
            }
            local y = 0
            for _,id in ipairs(ids) do
                local btn = Instance.new("TextButton")
                btn.Size = UDim2.new(1, -10, 0, 30)
                btn.Position = UDim2.new(0, 5, 0, y)
                btn.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
                btn.TextColor3 = Color3.fromRGB(255, 255, 255)
                btn.Text = id
                btn.Font = Enum.Font.SourceSans
                btn.TextSize = 16
                btn.Parent = scroll

                btn.MouseButton1Click:Connect(function()
                    if setclipboard then
                        setclipboard(id)
                        notify("Copiado: "..id)
                    end
                end)
                y = y + 35
            end
            scroll.CanvasSize = UDim2.new(0, 0, 0, y)
        end
    },
    {
        name = "⚡ Infinity Yield",
        callback = function()
            clearContent()
            local runBtn = Instance.new("TextButton")
            runBtn.Size = UDim2.new(1, -10, 0, 40)
            runBtn.Position = UDim2.new(0, 5, 0, 5)
            runBtn.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
            runBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
            runBtn.Text = "Executar Infinity Yield"
            runBtn.Parent = scroll
            runBtn.MouseButton1Click:Connect(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
                notify("Infinity Yield carregado!")
            end)
        end
    },
    {
        name = "🎶 AJ Music Hub",
        callback = function()
            clearContent()
            local runBtn = Instance.new("TextButton")
            runBtn.Size = UDim2.new(1, -10, 0, 40)
            runBtn.Position = UDim2.new(0, 5, 0, 5)
            runBtn.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
            runBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
            runBtn.Text = "Executar AJ Music Hub"
            runBtn.Parent = scroll
            runBtn.MouseButton1Click:Connect(function()
                loadstring(game:HttpGet("https://pastebin.com/raw/zLspNekY"))()
                notify("AJ Music Hub carregado!")
            end)
        end
    },
    {
        name = "💃 Gaze Emotes",
        callback = function()
            clearContent()
            local runBtn = Instance.new("TextButton")
            runBtn.Size = UDim2.new(1, -10, 0, 40)
            runBtn.Position = UDim2.new(0, 5, 0, 5)
            runBtn.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
            runBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
            runBtn.Text = "Executar Gaze Emotes"
            runBtn.Parent = scroll
            runBtn.MouseButton1Click:Connect(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/Gazer-Ha/Gaze-stuff/refs/heads/main/Gaze%20emote"))()
                notify("Gaze Emotes carregado!")
            end)
        end
    }
}

-- Criar botões de menu dinamicamente
for i,tab in ipairs(tabs) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 40)
    btn.Position = UDim2.new
