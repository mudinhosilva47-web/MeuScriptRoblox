local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Window = Rayfield:CreateWindow({
   Name = "Brookhaven Funções Reais",
   LoadingTitle = "Carregando Brookhaven...",
   LoadingSubtitle = "Rayfield Adaptado"
})

local CarTab = Window:CreateTab("🚗 Veículos", 4483362458)
local ColorTab = Window:CreateTab("🎨 Cores", 4483362458)

-- 🚗 Spawn de veículos (usando RemoteFunction SpawnVehicle)
CarTab:CreateButton({
   Name = "Spawn Moto",
   Callback = function()
      local result = game.ReplicatedStorage.SpawnVehicle:InvokeServer("Motorcycle")
      print("Moto spawnada:", result)
   end,
})

CarTab:CreateButton({
   Name = "Spawn Carro Esportivo",
   Callback = function()
      local result = game.ReplicatedStorage.SpawnVehicle:InvokeServer("SportsCar")
      print("Carro esportivo spawnado:", result)
   end,
})

CarTab:CreateButton({
   Name = "Spawn Caminhão",
   Callback = function()
      local result = game.ReplicatedStorage.SpawnVehicle:InvokeServer("Truck")
      print("Caminhão spawnado:", result)
   end,
})

CarTab:CreateButton({
   Name = "Spawn Helicóptero",
   Callback = function()
      local result = game.ReplicatedStorage.SpawnVehicle:InvokeServer("Helicopter")
      print("Helicóptero spawnado:", result)
   end,
})

-- 🎨 Mudança de cor (usando RemoteFunction BodyColor)
ColorTab:CreateButton({
   Name = "Moto Vermelha",
   Callback = function()
      game.ReplicatedStorage.BodyColor:InvokeServer(Color3.fromRGB(255,0,0))
   end,
})

ColorTab:CreateButton({
   Name = "Moto Azul",
   Callback = function()
      game.ReplicatedStorage.BodyColor:InvokeServer(Color3.fromRGB(0,0,255))
   end,
})

ColorTab:CreateButton({
   Name = "Moto Verde",
   Callback = function()
      game.ReplicatedStorage.BodyColor:InvokeServer(Color3.fromRGB(0,255,0))
   end,
})

ColorTab:CreateButton({
   Name = "Moto Amarela",
   Callback = function()
      game.ReplicatedStorage.BodyColor:InvokeServer(Color3.fromRGB(255,255,0))
   end,
})

ColorTab:CreateButton({
   Name = "Moto Rosa",
   Callback = function()
      game.ReplicatedStorage.BodyColor:InvokeServer(Color3.fromRGB(255,0,255))
   end,
})

ColorTab:CreateButton({
   Name = "Moto Preta",
   Callback = function()
      game.ReplicatedStorage.BodyColor:InvokeServer(Color3.fromRGB(0,0,0))
   end,
})

ColorTab:CreateButton({
   Name = "Moto Branca",
   Callback = function()
      game.ReplicatedStorage.BodyColor:InvokeServer(Color3.fromRGB(255,255,255))
   end,
})
