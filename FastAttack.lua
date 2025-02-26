local targets = {}
local targetName = nil

function Attack(target)
    if target[1]:FindFirstChild("HumanoidRootPart") and target[2]:FindFirstChild("HumanoidRootPart") and target[3]:FindFirstChild("HumanoidRootPart") and target[4]:FindFirstChild("HumanoidRootPart") then
        game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RE/RegisterAttack"):FireServer(0)        
        local args = {
            [1] = target[1]:WaitForChild("Head"),
            [2] = {
                [1] = {
                    [1] = target[2],
                    [2] = target[2]:WaitForChild("HumanoidRootPart")},
                [2] = {
                    [1] = target[3],
                    [2] = target[3]:WaitForChild("HumanoidRootPart")},
                }
            }
        game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RE/RegisterHit"):FireServer(unpack(args))
    end
end
spawn(function()
    while task.wait() do
        pcall(function()
            if FastAttackSpeed then
                for i,v in pairs(workspace:FindFirstChild("Enemies"):GetChildren()) do
                    if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude <= 60 then
                            if targetName == nil or targetName == v.Name and FastAttackMon == v.Name then
                                table.insert(targets, v)
                                targetName = v.Name
                            else
                                targetName = FastAttackMon
                            end
                        end
                    end
                end
                Attack(targets)
                targets = {}
                targetName = nil
            end
        end)
    end
end)
FastAttackSpeed = true