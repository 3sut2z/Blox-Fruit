getgenv().GetBladeHits = function()
    local yourmom = {}
    GetDistance = function(v)
        return (v.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    end
    for i, v in pairs(game:GetService("Workspace").Characters:GetChildren()) do
        if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
            table.insert(yourmom, v)
        end
    end
    for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
            table.insert(yourmom, v)
        end
    end
    return yourmom
end

getgenv().GunAttack = function()
    local v2 = GetBladeHits()
    if #v2 > 0 then
        for i, v in pairs(v2) do
            game:GetService("ReplicatedStorage").Modules.Net:FindFirstChild("RE/ShootGunEvent"):FireServer(v.HumanoidRootPart.Position, {[1] = v.HumanoidRootPart})
        end
    end
end

require(game:GetService("ReplicatedStorage").Modules.CombatUtil).CanAttack = newcclosure(function()
    return true
end)


getgenv().getnameweapon = function()
    local plr = game.Players.LocalPlayer
    local char = plr.Character
    if char:FindFirstChild("EquippedWeapon") then
        for i, v in pairs(char:GetChildren()) do
            if v:IsA("Tool") then
                return v.Name
            end
        end
    end
    return
end

getgenv().Attack = function()
    -- rewrite
    if #GetBladeHits() > 0 then
        game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RE/RegisterAttack"):FireServer(-math.huge)
        local args = {}
        args[1] = nil;
        args[2] = {}
        for i, v in pairs(GetBladeHits()) do
            if not args[1] then
                args[1] = v.Head
            end
            args[2][i] = {
                [1] = v,
                [2] = v.HumanoidRootPart
            }
        end
        game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RE/RegisterHit"):FireServer(unpack(args))
        game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RE/RegisterAttack"):FireServer(-math.huge)
    end
end

local hi;
hi = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
    local funccall = getnamecallmethod()
    if tostring(funccall) == "FireServer" then
        if string.find(tostring(self), "Validator") then
            spawn(function()
                for i=0, 15 do
                    task.spawn(GunAttack)
                end
            end)
            return hi(self, ...)
        end
    end
    return hi(self, ...)
end))


local path_fx = game:GetService("ReplicatedStorage").Effect.Container.Gun_M1.RequestM1.DualFlintlock
local a = require(path_fx)
hookfunction(a, function()
    return
end)