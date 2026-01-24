local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Window = Rayfield:CreateWindow({
   Name = "Brookhaven Multi-Tool",
   LoadingTitle = "Rayfield UI",
   LoadingSubtitle = "Funk, RGB, Roupas & Boombox",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil,
      FileName = "BrookhavenMultiTool"
   }
})

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- Remote do Boombox
local boomboxRemote = ReplicatedStorage:FindFirstChild("ClientMusic")

local function playBoombox(id)
    if boomboxRemote then
        boomboxRemote:FireServer(id)
    else
        warn("Remote ClientMusic não encontrado!")
    end
end

-------------------------------------------------
-- 1. Aba Music
-------------------------------------------------
local MusicTab = Window:CreateTab("Music", 4483362458)

-- Botão Stop no topo
MusicTab:CreateButton({
   Name = "Stop",
   Callback = function()
      if boomboxRemote then
         boomboxRemote:FireServer("") -- envia vazio para parar
      end
   end
})

-- IDs de funk
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

for _,id in ipairs(ids) do
   MusicTab:CreateButton({
      Name = id,
      Callback = function()
         playBoombox(id)
      end
   })
end

-------------------------------------------------
-- 2. Aba RGB
-------------------------------------------------
local RGBTab = Window:CreateTab("RGB", 4483362458)

local function rainbowBoombox(tool)
    task.spawn(function()
        while true do
            for i = 0, 1, 0.01 do
                local color = Color3.fromHSV(i, 1, 1)
                if tool:FindFirstChild("Handle") then
                    local handle = tool.Handle
                    if handle:IsA("BasePart") then
                        handle.Color = color
                    end
                    if handle:FindFirstChildOfClass("SpecialMesh") then
                        local mesh = handle:FindFirstChildOfClass("SpecialMesh")
                        mesh.VertexColor = Vector3.new(color.R, color.G, color.B)
                    end
                    for _,child in ipairs(handle:GetChildren()) do
                        if child:IsA("Decal") then
                            child.Color3 = color
                        end
                    end
                end
                task.wait(0.05)
            end
        end
    end)
end

RGBTab:CreateButton({
   Name = "Rainbow Boombox",
   Callback = function()
      local tool = player.Character:FindFirstChildWhichIsA("Tool")
      if tool then
         rainbowBoombox(tool)
      end
   end
})

-------------------------------------------------
-- 3. Aba Roupas
-------------------------------------------------
local ClothesTab = Window:CreateTab("Roupas", 4483362458)

local function copyOutfit(targetPlayer)
    local myChar = player.Character
    local targetChar = targetPlayer.Character
    if not (myChar and targetChar) then return end

    -- Remove roupas/acessórios atuais
    for _,obj in ipairs(myChar:GetChildren()) do
        if obj:IsA("Shirt") or obj:IsA("Pants") or obj:IsA("ShirtGraphic") or obj:IsA("Accessory") then
            obj:Destroy()
        end
    end

    -- Copiar Shirt
    local shirt = targetChar:FindFirstChildOfClass("Shirt")
    if shirt then
        local newShirt = Instance.new("Shirt", myChar)
        newShirt.ShirtTemplate = shirt.ShirtTemplate
    end

    -- Copiar Pants
    local pants = targetChar:FindFirstChildOfClass("Pants")
    if pants then
        local newPants = Instance.new("Pants", myChar)
        newPants.PantsTemplate = pants.PantsTemplate
    end

    -- Copiar ShirtGraphic
    local shirtGraphic = targetChar:FindFirstChildOfClass("ShirtGraphic")
    if shirtGraphic then
        local newGraphic = Instance.new("ShirtGraphic", myChar)
        newGraphic.Graphic = shirtGraphic.Graphic
    end

    -- Copiar BodyColors
    local bodyColors = targetChar:FindFirstChildOfClass("BodyColors")
    if bodyColors then
        local newColors = myChar:FindFirstChildOfClass("BodyColors") or Instance.new("BodyColors", myChar)
        newColors.HeadColor = bodyColors.HeadColor
        newColors.TorsoColor = bodyColors.TorsoColor
        newColors.LeftArmColor = bodyColors.LeftArmColor
        newColors.RightArmColor = bodyColors.RightArmColor
        newColors.LeftLegColor = bodyColors.LeftLegColor
        newColors.RightLegColor = bodyColors.RightLegColor
    end

    -- Copiar acessórios (um por um)
    for _,acc in ipairs(targetChar:GetChildren()) do
        if acc:IsA("Accessory") then
            local newAcc = acc:Clone()
            newAcc.Parent = myChar
        end
    end
end

-- Criar lista de jogadores com botões
for _,p in ipairs(game.Players:GetPlayers()) do
    if p ~= player then
        ClothesTab:CreateButton({
            Name = "Copiar roupas de "..p.Name,
            Callback = function()
                copyOutfit(p)
            end
        })
    end
end
