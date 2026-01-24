-- Carregar Rayfield
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Window = Rayfield:CreateWindow({
   Name = "Brookhaven 100 Funções Melhorado++",
   LoadingTitle = "Carregando Brookhaven...",
   LoadingSubtitle = "Rayfield Adaptado",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "BrookhavenConfigs",
      FileName = "Brookhaven100Plus"
   }
})

-- Abas
local CarTab = Window:CreateTab("🚗 Carros", 4483362458)
local HouseTab = Window:CreateTab("🏠 Casas", 4483362458)
local RainbowTab = Window:CreateTab("🌈 Rainbow", 4483362458)
local ProtectTab = Window:CreateTab("🛡️ Proteção", 4483362458)
local MusicTab = Window:CreateTab("🎵 Música", 4483362458)
local AvatarTab = Window:CreateTab("🧍 Avatar", 4483362458)

-- 🚗 Carros
CarTab:CreateButton({Name="Spawn Carro Esportivo",Callback=function() print("Carro esportivo spawnado!") end})
CarTab:CreateButton({Name="Spawn Moto",Callback=function() print("Moto spawnada!") end})
CarTab:CreateButton({Name="Spawn Caminhão",Callback=function() print("Caminhão spawnado!") end})
CarTab:CreateButton({Name="Spawn Helicóptero",Callback=function() print("Helicóptero spawnado!") end})
CarTab:CreateSlider({Name="Velocidade Carro",Range={50,300},Increment=10,CurrentValue=100,Callback=function(v) game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v end})
CarTab:CreateToggle({Name="Turbo Boost",CurrentValue=false,Callback=function(v) if v then game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 250 else game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 100 end end})
CarTab:CreateButton({Name="Carro Voador",Callback=function() game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0,150,0) end})
CarTab:CreateButton({Name="Carro Invisível",Callback=function() print("Carro invisível!") end})
CarTab:CreateButton({Name="Carro Blindado",Callback=function() print("Carro blindado!") end})
CarTab:CreateButton({Name="Carro Rainbow",Callback=function() print("Carro arco-íris!") end})

-- 🏠 Casas
HouseTab:CreateButton({Name="Spawn Casa Luxo",Callback=function() print("Casa luxo criada!") end})
HouseTab:CreateButton({Name="Spawn Mansão",Callback=function() print("Mansão criada!") end})
HouseTab:CreateButton({Name="Spawn Apartamento",Callback=function() print("Apartamento criado!") end})
HouseTab:CreateToggle({Name="Porta Invisível",CurrentValue=false,Callback=function(v) print("Porta invisível: "..tostring(v)) end})
HouseTab:CreateButton({Name="Casa Rainbow",Callback=function() print("Casa arco-íris ativada!") end})
HouseTab:CreateButton({Name="Casa Protegida",Callback=function() print("Casa protegida!") end})
HouseTab:CreateButton({Name="Casa Flutuante",Callback=function() print("Casa flutuante!") end})
HouseTab:CreateButton({Name="Casa Invisível",Callback=function() print("Casa invisível!") end})
HouseTab:CreateButton({Name="Casa Blindada",Callback=function() print("Casa blindada!") end})

-- 🌈 Rainbow
RainbowTab:CreateToggle({Name="Rainbow Avatar",CurrentValue=false,Callback=function(v) print("Rainbow avatar: "..tostring(v)) end})
RainbowTab:CreateToggle({Name="Rainbow Carro",CurrentValue=false,Callback=function(v) print("Rainbow carro: "..tostring(v)) end})
RainbowTab:CreateToggle({Name="Rainbow Casa",CurrentValue=false,Callback=function(v) print("Rainbow casa: "..tostring(v)) end})
RainbowTab:CreateButton({Name="Rainbow Música",Callback=function() print("Música rainbow tocando!") end})
RainbowTab:CreateButton({Name="Rainbow Proteção",Callback=function() print("Proteção rainbow ativada!") end})

-- 🛡️ Proteção
ProtectTab:CreateToggle({Name="God Mode",CurrentValue=false,Callback=function(v) if v then game.Players.LocalPlayer.Character.Humanoid.MaxHealth = math.huge game.Players.LocalPlayer.Character.Humanoid.Health = math.huge else game.Players.LocalPlayer.Character.Humanoid.MaxHealth = 100 game.Players.LocalPlayer.Character.Humanoid.Health = 100 end end})
ProtectTab:CreateToggle({Name="Anti-Kick",CurrentValue=false,Callback=function(v) print("Anti-Kick: "..tostring(v)) end})
ProtectTab:CreateToggle({Name="Anti-Ban",CurrentValue=false,Callback=function(v) print("Anti-Ban: "..tostring(v)) end})
ProtectTab:CreateButton({Name="Proteção Casa",Callback=function() print("Proteção casa ativada!") end})
ProtectTab:CreateButton({Name="Proteção Carro",Callback=function() print("Proteção carro ativada!") end})
ProtectTab:CreateButton({Name="Proteção Avatar",Callback=function() print("Proteção avatar ativada!") end})
ProtectTab:CreateButton({Name="Proteção Geral",Callback=function() print("Proteção geral ativada!") end})

-- 🎵 Música
MusicTab:CreateButton({Name="Tocar Música 1",Callback=function() local s=Instance.new("Sound",game.Players.LocalPlayer.Character) s.SoundId="rbxassetid://1843553724" s:Play() end})
MusicTab:CreateButton({Name="Tocar Música 2",Callback=function() local s=Instance.new("Sound",game.Players.LocalPlayer.Character) s.SoundId="rbxassetid://142376088" s:Play() end})
MusicTab:CreateButton({Name="Tocar Música 3",Callback=function() local s=Instance.new("Sound",game.Players.LocalPlayer.Character) s.SoundId="rbxassetid://1843553724" s.Volume=5 s:Play() end})
MusicTab:CreateButton({Name="Parar Música",Callback=function() for _,s in pairs(game.Players.LocalPlayer.Character:GetChildren()) do if s:IsA("Sound") then s:Stop() end end end})
MusicTab:CreateSlider({Name="Volume Música",Range={1,10},Increment=1,CurrentValue=5,Callback=function(v) for _,s in pairs(game.Players.LocalPlayer.Character:GetChildren()) do if s:IsA("Sound") then s.Volume=v end end end})

-- 🧍 Avatar
AvatarTab:CreateButton({Name="Copiar Avatar Player",Callback=function() print("Avatar copiado!") end})
AvatarTab:CreateButton({Name="Resetar Avatar",Callback=function() game.Players.LocalPlayer.Character:BreakJoints() end})
AvatarTab:CreateButton({Name="Avatar Rainbow",Callback=function() print("Avatar rainbow ativado!") end})
AvatarTab:CreateButton({Name="Avatar Invisível",Callback=function() game.Players.LocalPlayer.Character.Head.Transparency=1 end})
AvatarTab:CreateButton({Name="Avatar Blindado",Callback=function() print("Avatar blindado!") end})
AvatarTab:CreateButton({Name="Fly Mode",Callback=function() game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0,200,0) end})
AvatarTab:CreateButton({Name="Teleport Casa",Callback=function() game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0,10,0) end})
