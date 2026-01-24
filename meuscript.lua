-- Copilot Menu Hub Brookhaven Edition
-- by Mudinho

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local InsertService = game:GetService("InsertService")

-- GUI principal
local ScreenGui = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
ScreenGui.Name = "MudinhoHub"
ScreenGui.ResetOnSpawn = false

-- Botão externo para abrir
local OpenBtn = Instance.new("TextButton", ScreenGui)
OpenBtn.Size = UDim2.new(0,40,0,40)
OpenBtn.Position = UDim2.new(0,10,0.5,-20)
OpenBtn.Text = "≡"
OpenBtn.BackgroundColor3 = Color3.fromRGB(0,120,255)
OpenBtn.TextColor3 = Color3.new(1,1,1)
OpenBtn.Font = Enum.Font.GothamBold
OpenBtn.TextSize = 20
OpenBtn.Visible = false
Instance.new("UICorner",OpenBtn).CornerRadius = UDim.new(0,6)

-- Frame principal
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0,600,0,400)
MainFrame.Position = UDim2.new(0.5,-300,0.5,-200)
MainFrame.BackgroundColor3 = Color3.fromRGB(20,20,40)
Instance.new("UICorner",MainFrame).CornerRadius = UDim.new(0,8)

-- Dragify suave
local dragging, dragInput, dragStart, startPos
MainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.Touch then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then dragging = false end
        end)
    end
end)
MainFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)
game:GetService("UserInputService").InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        local goal = UDim2.new(startPos.X.Scale,startPos.X.Offset+delta.X,startPos.Y.Scale,startPos.Y.Offset+delta.Y)
        TweenService:Create(MainFrame,TweenInfo.new(0.1),{Position=goal}):Play()
    end
end)

-- Botão fechar
local CloseBtn = Instance.new("TextButton", MainFrame)
CloseBtn.Size = UDim2.new(0,30,0,30)
CloseBtn.Position = UDim2.new(1,-35,0,5)
CloseBtn.Text = "X"
CloseBtn.BackgroundColor3 = Color3.fromRGB(255,0,0)
CloseBtn.TextColor3 = Color3.new(1,1,1)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 16
Instance.new("UICorner",CloseBtn).CornerRadius = UDim.new(0,6)
CloseBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
    OpenBtn.Visible = true
end)
OpenBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = true
    OpenBtn.Visible = false
end)

-- Sidebar categorias
local Sidebar = Instance.new("Frame", MainFrame)
Sidebar.Size = UDim2.new(0,150,1,0)
Sidebar.BackgroundColor3 = Color3.fromRGB(30,30,60)

local categories = {"Logger","Decoder","Anti-Logger","Scripts","Visualizer","Avatar Copier"}
local TabFrames = {}
local SelectedCategory = nil

for i,name in ipairs(categories) do
    local btn = Instance.new("TextButton", Sidebar)
    btn.Size = UDim2.new(1,-10,0,30)
    btn.Position = UDim2.new(0,5,0,40+(i-1)*35)
    btn.Text = name
    btn.TextColor3 = Color3.fromRGB(200,200,255)
    btn.BackgroundColor3 = Color3.fromRGB(40,40,80)
    btn.Font = Enum.Font.Gotham
    btn.TextSize = 16
    
    local TabFrame = Instance.new("Frame", MainFrame)
    TabFrame.Size = UDim2.new(1,-150,1,0)
    TabFrame.Position = UDim2.new(0,150,0,0)
    TabFrame.BackgroundColor3 = Color3.fromRGB(25,25,50)
    TabFrame.Visible = false
    TabFrames[name] = TabFrame
    
    btn.MouseButton1Click:Connect(function()
        if SelectedCategory then TabFrames[SelectedCategory].Visible = false end
        SelectedCategory = name
        TabFrame.Visible = true
        for _,b in pairs(Sidebar:GetChildren()) do
            if b:IsA("TextButton") then b.BackgroundColor3 = Color3.fromRGB(40,40,80) end
        end
        btn.BackgroundColor3 = Color3.fromRGB(0,120,255)
    end)
end

-- Inicializar Logger
local LoggerFrame = TabFrames["Logger"]
local LoggerLabel = Instance.new("TextLabel",LoggerFrame)
LoggerLabel.Size = UDim2.new(1,0,0,30)
LoggerLabel.Text = "Logger Functions"
LoggerLabel.TextColor3 = Color3.new(1,1,1)
LoggerLabel.BackgroundTransparency = 1

-- Avatar Copier (HumanoidDescription + Gazer)
local AvatarFrame = TabFrames["Avatar Copier"]

local EnterName = Instance.new("TextBox", AvatarFrame)
EnterName.Size = UDim2.new(0.8,0,0,30)
EnterName.Position = UDim2.new(0.1,0,0.2,0)
EnterName.PlaceholderText = "Digite nome/displayname"
EnterName.TextColor3 = Color3.new(1,1,1)
EnterName.BackgroundColor3 = Color3.fromRGB(30,30,60)
Instance.new("UICorner",EnterName).CornerRadius = UDim.new(0,6)

local CopyBtn = Instance.new("TextButton", AvatarFrame)
CopyBtn.Size = UDim2.new(0.5,0,0,30)
CopyBtn.Position = UDim2.new(0.25,0,0.5,0)
CopyBtn.Text = "COPY!"
CopyBtn.BackgroundColor3 = Color3.fromRGB(0,120,255)
CopyBtn.TextColor3 = Color3.new(1,1,1)
CopyBtn.Font = Enum.Font.GothamBold
CopyBtn.TextSize = 16
Instance.new("UICorner",CopyBtn).CornerRadius = UDim.new(0,6)

-- Funções Avatar Copier
local function applySkinVisual(username)
    local success,userId = pcall(function() return Players:GetUserIdFromNameAsync(username) end)
    if not success then return end
    local successDesc,desc = pcall(function() return Players:GetHumanoidDescriptionFromUserId(userId) end)
    if not successDesc then return end
    local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid:RemoveAccessories()
        for _,obj in pairs(character:GetChildren()) do
            if obj:IsA("Shirt") or obj:IsA("Pants") then obj:Destroy() end
        end
        local shirt = Instance.new("Shirt")
        shirt.ShirtTemplate = "rbxassetid://"..desc.Shirt
        shirt.Parent = character
        local pants = Instance.new("Pants")
        pants.PantsTemplate = "rbxassetid://"..desc.Pants
        pants.Parent = character
    end
end

-- Gazer Remote Copy
local function START(displayName)
    local player=nil
    displayName=string.lower(displayName)
    for _,plr in ipairs(Players:GetPlayers()) do
        if string.find(string.lower(plr.Name),displayName) or string.find(string.lower(plr.DisplayName),displayName) then
            player=plr break
        end
    end
    if player then
        -- Exemplo simplificado: copiar roupas e acessórios via Remote
        ReplicatedStorage.RE["1Updat1eAvata1r"]:FireServer("wear",player.Character:FindFirstChildOfClass("Humanoid"):GetAppliedDescription().Shirt)
        ReplicatedStorage.RE["1Updat1eAvata1r"]:FireServer("wear",player.Character:FindFirstChildOfClass("Humanoid"):GetAppliedDescription().Pants)
                -- Copiar roupas (já começado)
        local desc = player.Character:FindFirstChildOfClass("Humanoid"):GetAppliedDescription()
        if desc.GraphicTShirt and desc.GraphicTShirt ~= 0 then
            ReplicatedStorage.RE["1Updat1eAvata1r"]:FireServer("wear", desc.GraphicTShirt)
        end

        -- Resetar blocky antes de aplicar partes do corpo
        local bodyParts = {
            desc.Torso,
            desc.RightArm,
            desc.LeftArm,
            desc.RightLeg,
            desc.LeftLeg,
            desc.Head
        }
        ReplicatedStorage.RE["1Avata1rOrigina1l"]:FireServer("CharacterChange", bodyParts, "GAZE")

        -- Copiar acessórios
        local accessories = {
            desc.HatAccessory,
            desc.HairAccessory,
            desc.FaceAccessory,
            desc.NeckAccessory,
            desc.ShouldersAccessory,
            desc.FrontAccessory,
            desc.BackAccessory,
            desc.WaistAccessory
        }
        for _, accList in ipairs(accessories) do
            for id in string.gmatch(accList or "", "%d+") do
                ReplicatedStorage.RE["1Updat1eAvata1r"]:FireServer("wear", tonumber(id))
            end
        end

        -- Copiar tom de pele
        local bodyColors = player.Character:FindFirstChildOfClass("BodyColors")
        if bodyColors then
            local skinToneName = bodyColors.HeadColor.Name
            ReplicatedStorage.RE["1Updat1eAvata1r"]:FireServer("skintone", skinToneName)
        end

        print("Avatar copiado de "..player.Name)
    else
        warn("Jogador não encontrado para copiar avatar.")
    end
end
