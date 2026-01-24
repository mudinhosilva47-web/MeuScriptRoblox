-- Menu Rayfield Profissional Neon
-- Autor: Copilot (adaptável para Delta/Studio)

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Menu Profissional Neon",
   LoadingTitle = "Brookhaven Boombox",
   LoadingSubtitle = "by Mudin",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "RayfieldConfigs",
      FileName = "BrookhavenMenu"
   },
   Discord = {
      Enabled = false
   },
   KeySystem = false
})

-- 🌟 Aba Desenvolvedores
local DevTab = Window:CreateTab("👨‍💻 Desenvolvedores", 4483362458)
DevTab:CreateSection("Criado por Mudin")

-- 🎵 Aba Música
local MusicTab = Window:CreateTab("🎵 Música", 4483362458)
MusicTab:CreateSection("IDs para Boombox")

MusicTab:CreateInput({
   Name = "Adicionar ID de Música",
   PlaceholderText = "Digite o ID aqui",
   RemoveTextAfterFocus = false,
   Callback = function(Text)
      local sound = Instance.new("Sound")
      sound.SoundId = "rbxassetid://"..Text
      sound.Parent = game.Players.LocalPlayer.Character:FindFirstChild("Boombox") or game.Players.LocalPlayer.Character
      sound:Play()
   end
})

-- 🛡 Aba Proteção
local ProtectTab = Window:CreateTab("🛡 Proteção", 4483362458)
ProtectTab:CreateSection("Anti-Fling / Anti-Sit")

ProtectTab:CreateButton({
   Name = "Ativar Proteção",
   Callback = function()
      -- Exemplo simples de proteção contra fling
      game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
      game.Players.LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics, false)
   end
})

-- 🚀 Aba Teleporte
local TeleportTab = Window:CreateTab("🚀 Teleporte", 4483362458)
TeleportTab:CreateSection("Teleporte para Jogadores")

local Players = game:GetService("Players")

for _,plr in pairs(Players:GetPlayers()) do
   TeleportTab:CreateButton({
      Name = "Ir até "..plr.Name,
      Callback = function()
         local lp = Players.LocalPlayer
         if lp.Character and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
            lp.Character:MoveTo(plr.Character.HumanoidRootPart.Position + Vector3.new(0,2,0))
         end
      end
   })
end

-- 💬 Aba Chat Geral
local ChatTab = Window:CreateTab("💬 Chat Geral", 4483362458)
ChatTab:CreateSection("Ver Privados")

ChatTab:CreateButton({
   Name = "Abrir Chat Geral",
   Callback = function()
      local ScreenGui = Instance.new("ScreenGui", game.Players.LocalPlayer.PlayerGui)
      local Frame = Instance.new("Frame", ScreenGui)
      Frame.Size = UDim2.new(0,300,0,200)
      Frame.Position = UDim2.new(0.7,0,0.1,0)
      Frame.BackgroundColor3 = Color3.fromRGB(20,20,20)

      local TextBox = Instance.new("TextBox", Frame)
      TextBox.Size = UDim2.new(1,0,1,0)
      TextBox.Text = "Mensagens privadas aparecerão aqui..."
      TextBox.TextColor3 = Color3.fromRGB(0,255,255)
      TextBox.BackgroundTransparency = 1
   end
})
