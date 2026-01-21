--// Serviços
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer

--// Configurações
local FLY_SPEED    = 60
local FLY_ACCEL    = 4
local TOGGLE_DELAY = 0.2

--// IDs de animações (R15 públicos)
local ANIM_IDS = {
    FlyStart = 139316348405933,  -- início voo
    FlyLoop  = 132105268936736,  -- voo contínuo
}

--// Estado
local humanoid, root, animator
local isFlying = false
local flyBV, flyGyro, flyConn
local lastToggle = 0
local tracks = {}
local BLEND_TIME = 0.15

--// Funções de animação
local function createTrack(animatorObj, id, priority, looped)
    local anim = Instance.new("Animation")
    anim.AnimationId = "rbxassetid://" .. tostring(id)
    local track = animatorObj:LoadAnimation(anim)
    track.Priority = priority
    track.Looped = looped
    return track
end

local function stopAll(except)
    for _, t in pairs(tracks) do
        if t and t ~= except and t.IsPlaying then
            t:Stop(BLEND_TIME)
        end
    end
end

local function switchTo(track)
    if track and not track.IsPlaying then
        stopAll(track)
        track:Play(BLEND_TIME)
    end
end

--// Iniciar voo
local function startFly()
    if isFlying or not humanoid or not root then return end
    isFlying = true

    humanoid.PlatformStand = true
    humanoid.AutoRotate = false

    flyBV = Instance.new("BodyVelocity")
    flyBV.MaxForce = Vector3.new(1e5, 1e5, 1e5)
    flyBV.Velocity = Vector3.zero
    flyBV.Parent = root

    flyGyro = Instance.new("BodyGyro")
    flyGyro.MaxTorque = Vector3.new(1e5, 1e5, 1e5)
    flyGyro.CFrame = root.CFrame
    flyGyro.Parent = root

    -- animação de início
    switchTo(tracks.flyStart)
    task.delay(2, function()
        if isFlying then switchTo(tracks.flyLoop) end
    end)

    flyConn = RunService.RenderStepped:Connect(function(dt)
        if not isFlying or not root then return end
        local cam = workspace.CurrentCamera
        local dir = Vector3.zero

        if UserInputService:IsKeyDown(Enum.KeyCode.W) then dir += cam.CFrame.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then dir -= cam.CFrame.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then dir -= cam.CFrame.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then dir += cam.CFrame.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then dir += Vector3.new(0,1,0) end
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then dir += Vector3.new(0,-1,0) end

        local targetVel = dir.Magnitude > 0 and dir.Unit * FLY_SPEED or Vector3.zero
        flyBV.Velocity = flyBV.Velocity:Lerp(targetVel, math.clamp(FLY_ACCEL * dt, 0, 1))
        flyGyro.CFrame = CFrame.new(Vector3.zero, cam.CFrame.LookVector)
    end)
end

--// Parar voo
local function stopFly()
    if not isFlying then return end
    isFlying = false

    if flyConn then flyConn:Disconnect() flyConn = nil end
    if flyBV then flyBV:Destroy() flyBV = nil end
    if flyGyro then flyGyro:Destroy() flyGyro = nil end

    if humanoid then
        humanoid.PlatformStand = false
        humanoid.AutoRotate = true
    end
