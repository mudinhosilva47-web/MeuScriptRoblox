CarTab:CreateButton({
   Name = "Moto Vermelha",
   Callback = function()
      game.ReplicatedStorage.BodyColor:InvokeServer(Color3.fromRGB(255,0,0))
   end,
})

CarTab:CreateButton({
   Name = "Moto Azul",
   Callback = function()
      game.ReplicatedStorage.BodyColor:InvokeServer(Color3.fromRGB(0,0,255))
   end,
})
