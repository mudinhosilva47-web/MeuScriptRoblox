local Players = game:GetService("Players")
local LP = Players.LocalPlayer

-- GUI principal
local ScreenGui = Instance.new("ScreenGui", LP:WaitForChild("PlayerGui"))
ScreenGui.Name = "VersionHub"
ScreenGui.ResetOnSpawn = false

-- Frame principal
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 600, 0, 400)
MainFrame.Position = UDim2.new(0.5, -300, 0.5, -200)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 40)
MainFrame.BorderSizePixel = 0

-- Sidebar
local Sidebar = Instance.new("Frame", MainFrame)
Sidebar.Size = UDim2.new(0, 150, 1, 0)
Sidebar.BackgroundColor3 = Color3.fromRGB(30, 30, 60)

-- Título
local Title = Instance.new("TextLabel", Sidebar)
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Text = "VERSION HUB"
Title.TextColor3 = Color3.fromRGB(0, 170, 255)
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 20
Title.BackgroundTransparency = 1

-- Categorias
local categories = {
    "Script/Fe", "Games", "Hubs", "Admin script",
    "Animation", "Tools script", "Settings", "Update"
}

local CategoryButtons = {}
local SelectedCategory = nil

for i, name in ipairs(categories) do
    local btn = Instance.new("TextButton", Sidebar)
    btn.Size = UDim2.new(1, -10, 0, 30)
    btn.Position = UDim2.new(0, 5, 0, 40 + (i - 1) * 35)
    btn.Text = name
    btn.TextColor3 = Color3.fromRGB(200, 200, 255)
    btn.BackgroundColor3 = Color3.fromRGB(40, 40, 80)
    btn.Font = Enum.Font.SourceSans
    btn.TextSize = 16
    CategoryButtons[name] = btn
end

-- Área de scripts
local ScriptArea = Instance.new("Frame", MainFrame)
ScriptArea.Size = UDim2.new(1, -150, 1, 0)
ScriptArea.Position = UDim2.new(0, 150, 0, 0)
ScriptArea.BackgroundColor3 = Color3.fromRGB(25, 25, 50)

local ScriptList = Instance.new("ScrollingFrame", ScriptArea)
ScriptList.Size = UDim2.new(1, -20, 1, -20)
ScriptList.Position = UDim2.new(0, 10, 0, 10)
ScriptList.CanvasSize = UDim2.new(0, 0, 0, 0)
ScriptList.ScrollBarThickness = 6
ScriptList.BackgroundTransparency = 1

local UIList = Instance.new("UIListLayout", ScriptList)
UIList.Padding = UDim.new(0, 5)

-- Scripts por categoria
local scriptsByCategory = {
    ["Script/Fe"] = {"Fe orbit hat", "Fe anti fling", "SYNAPSE X", "KRNL UI", "NoCom executor gui", "vfly"},
    ["Games"] = {"Brookhaven Audio", "Da Hood Fly", "Arsenal ESP"},
    ["Hubs"] = {"Infinite Yield", "DarkHub", "OwlHub"},
    ["Admin script"] = {"Reviz Admin", "Fate Admin"},
    ["Animation"] = {"Dance Pack", "Emote Loader"},
    ["Tools script"] = {"Tool Stealer", "Tool Visualizer"},
    ["Settings"] = {"Theme Switcher", "Reset GUI"},
    ["Update"] = {"Check for Updates", "Patch Notes"}
}

-- Função para atualizar scripts
local function updateScripts(category)
    ScriptList:ClearAllChildren()
    local list = scriptsByCategory[category] or {}
    for _, scriptName in ipairs(list) do
        local btn = Instance.new("TextButton", ScriptList)
        btn.Size = UDim2.new(1, -10, 0, 30)
        btn.Text = scriptName
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        btn.BackgroundColor3 = Color3.fromRGB(50, 50, 100)
        btn.Font = Enum.Font.SourceSans
        btn.TextSize = 16
        btn.MouseButton1Click:Connect(function()
            print("Executando script:", scriptName)
            -- Aqui você pode colocar loadstring ou lógica de execução
        end)
    end
    ScriptList.CanvasSize = UDim2.new(0, 0, 0, #list * 35)
end

-- Conectar botões
for name, btn in pairs(CategoryButtons) do
    btn.MouseButton1Click:Connect(function()
        SelectedCategory = name
        updateScripts(name)
        for _, b in pairs(CategoryButtons) do
            b.BackgroundColor3 = Color3.fromRGB(40, 40, 80)
        end
        btn.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
    end)
end

-- Inicializar com Script/Fe
updateScripts("Script/Fe")
CategoryButtons["Script/Fe"].BackgroundColor3 = Color3.fromRGB(0, 120, 255)
SelectedCategory = "Script/Fe"
