-- Wastelane Script by ChatGPT - All-In-One Hack GUI
-- USE COM UM EXECUTOR ROBLOX (como Synapse, Fluxus etc.)

-- Carregar GUI básica
local Library = loadstring(game:HttpGet("https://pastebin.com/raw/6JHX1J4Z"))() -- UI lib

local Window = Library:CreateWindow("Wastelane Hack")

-- Auto Farm
Window:CreateToggle("Auto Farm", function(state)
    getgenv().autoFarm = state
    while getgenv().autoFarm do
        -- Mover até inimigos ou loot
        for _, enemy in pairs(workspace:GetDescendants()) do
            if enemy.Name == "Enemy" and enemy:FindFirstChild("HumanoidRootPart") then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = enemy.HumanoidRootPart.CFrame + Vector3.new(0, 5, 0)
                wait(0.5)
            end
        end
        wait()
    end
end)

-- Kill Aura
Window:CreateToggle("Kill Aura", function(state)
    getgenv().killAura = state
    while getgenv().killAura do
        local tool = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
        if tool then
            for _, enemy in pairs(workspace:GetDescendants()) do
                if enemy.Name == "Enemy" and enemy:FindFirstChild("Humanoid") then
                    enemy.Humanoid:TakeDamage(100)
                end
            end
        end
        wait(0.3)
    end
end)

-- Teleporte
Window:CreateButton("Teleport: Loja", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(100, 5, 100)) -- ajuste conforme o local real
end)

-- Comprar tudo
Window:CreateButton("Comprar Tudo", function()
    local remote = game:GetService("ReplicatedStorage"):FindFirstChild("BuyItem") -- nome do RemoteEvent pode mudar
    local itens = {"Magnum", "Espingarda", "Armazém"}
    for _, item in ipairs(itens) do
        remote:FireServer(item)
        wait(0.2)
    end
end)

-- God Mode (Experimental)
Window:CreateToggle("God Mode", function(state)
    if state then
        local char = game.Players.LocalPlayer.Character
        if char:FindFirstChild("Humanoid") then
            char.Humanoid.Name = "1"
            local clone = char["1"]:Clone()
            clone.Name = "Humanoid"
            clone.Parent = char
            wait(0.5)
            char["1"]:Destroy()
        end
    end
end)

print("Script carregado para Wastelane!")
