-- Hub Brookhaven Mudinho Edition
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local TweenService = game:GetService("TweenService")

-- GUI principal
local ScreenGui = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
ScreenGui.Name = "MudinhoHub"
ScreenGui.ResetOnSpawn = false

-- Frame principal menor
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 500, 0, 300)
MainFrame.Position = UDim2.new(0.5, -250, 0.5, -150)
MainFrame.BackgroundColor3 = Color3.fromRGB(0, 50, 100)
MainFrame.BackgroundTransparency = 0.3
MainFrame.BorderSizePixel = 4
MainFrame.BorderColor3 = Color3.fromRGB(0, 120, 255)
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 8)

-- Dragify + Resize
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.ClipsDescendants = false
MainFrame.AutomaticSize = Enum.AutomaticSize.None

-- Sidebar categorias
local Sidebar = Instance.new("Frame", MainFrame)
Sidebar.Size = UDim2.new(0, 150, 1, 0)
Sidebar.BackgroundColor3 = Color3.fromRGB(0,0,0)
Sidebar.BackgroundTransparency = 0.5

local categories = {"Jogadores","IDs Musicas","Brookhaven Hubs"}
local TabFrames = {}
local SelectedCategory = nil

-- Animação Blue/Black nos nomes
local function animateText(label)
    local on = true
    while label.Parent do
        TweenService:Create(label,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),
            {TextColor3 = on and Color3.fromRGB(0,120,255) or Color3.fromRGB(0,0,0)}):Play()
        on = not on
        wait(1)
    end
end

for i,name in ipairs(categories) do
    local btn = Instance.new("TextButton", Sidebar)
    btn.Size = UDim2.new(1,-10,0,30)
    btn.Position = UDim2.new(0,5,0,40+(i-1)*35)
    btn.Text = name
    btn.BackgroundTransparency = 1
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 16
    btn.TextColor3 = Color3.fromRGB(0,120,255)
    spawn(function() animateText(btn) end)

    local TabFrame = Instance.new("Frame", MainFrame)
    TabFrame.Size = UDim2.new(1,-150,1,0)
    TabFrame.Position = UDim2.new(0,150,0,0)
    TabFrame.BackgroundColor3 = Color3.fromRGB(20,20,40)
    TabFrame.BackgroundTransparency = 0.4
    TabFrame.Visible = false
    TabFrames[name] = TabFrame

    btn.MouseButton1Click:Connect(function()
        if SelectedCategory then TabFrames[SelectedCategory].Visible = false end
        SelectedCategory = name
        TabFrame.Visible = true
    end)
end

-- Categoria 1: Lista de Jogadores
local PlayerList = Instance.new("ScrollingFrame", TabFrames["Jogadores"])
PlayerList.Size = UDim2.new(1,-20,1,-20)
PlayerList.Position = UDim2.new(0,10,0,10)
PlayerList.CanvasSize = UDim2.new(0,0,0,0)
local UIList = Instance.new("UIListLayout", PlayerList)
UIList.Padding = UDim.new(0,5)

local function updatePlayers()
    PlayerList:ClearAllChildren()
    for _,plr in ipairs(Players:GetPlayers()) do
        local btn = Instance.new("TextButton", PlayerList)
        btn.Size = UDim2.new(1,0,0,30)
        btn.Text = "Teleportar: "..plr.Name
        btn.BackgroundColor3 = Color3.fromRGB(0,80,160)
        btn.TextColor3 = Color3.new(1,1,1)
        btn.MouseButton1Click:Connect(function()
            LocalPlayer.Character.HumanoidRootPart.CFrame = plr.Character.HumanoidRootPart.CFrame + Vector3.new(2,0,2)
        end)
    end
    PlayerList.CanvasSize = UDim2.new(0,0,0,#Players:GetPlayers()*35)
end
Players.PlayerAdded:Connect(updatePlayers)
Players.PlayerRemoving:Connect(updatePlayers)
updatePlayers()

-- Categoria 2: IDs Musicas
local MusicFrame = TabFrames["IDs Musicas"]
local ids = {"1234567890","9876543210","1122334455"}
for i,id in ipairs(ids) do
    local btn = Instance.new("TextButton", MusicFrame)
    btn.Size = UDim2.new(0,200,0,30)
    btn.Position = UDim2.new(0,20,0,40*i)
    btn.Text = id
    btn.BackgroundColor3 = Color3.fromRGB(0,80,160)
    btn.TextColor3 = Color3.new(1,1,1)
    btn.MouseButton1Click:Connect(function()
        setclipboard(id)
    end)
end

-- Categoria 3: Brookhaven Hubs
local HubFrame = TabFrames["Brookhaven Hubs"]
local hubs = {
    {name="89 Hub",url="https://raw.githubusercontent.com/..."},
    {name="Coquette Hub",url="https://raw.githubusercontent.com/..."}
}
for i,h in ipairs(hubs) do
    local btn = Instance.new("TextButton", HubFrame)
    btn.Size = UDim2.new(0,200,0,30)
    btn.Position = UDim2.new(0,20,0,40*i)
    btn.Text = h.name
    btn.BackgroundColor3 = Color3.fromRGB(0,80,160)
    btn.TextColor3 = Color3.new(1,1,1)
    btn.MouseButton1Click:Connect(function()
        loadstring(game:HttpGet(h.url))()
    end)
end
