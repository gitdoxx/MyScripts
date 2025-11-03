-- NFT Battle Auto Farm ULTIMATE
getgenv().Settings = {Stars=5,AutoSell=true,AutoUpgrade=true}

local function SafeWait()
    local success, err = pcall(function()
        task.wait(0.5)
    end)
end

local function AutoFarm()
    while true do
        SafeWait()
        
        -- Безопасный поиск кейсов через pcall
        pcall(function()
            for i,obj in pairs(workspace:GetChildren()) do
                if obj:IsA("Model") then
                    for k,child in pairs(obj:GetChildren()) do
                        if child:GetAttribute("Tier") then
                            if child:GetAttribute("Tier") == Settings.Stars then
                                game:GetService("ReplicatedStorage"):FindFirstChild("OpenCase"):FireServer(child)
                            end
                        end
                    end
                end
            end
        end)
        
        -- Безопасная продажа
        pcall(function()
            local player = game.Players.LocalPlayer
            for i,container in pairs({player:FindFirstChild("Backpack"), player:FindFirstChild("Inventory")}) do
                if container then
                    for j,item in pairs(container:GetChildren()) do
                        if item:GetAttribute("Rarity") == "Common" then
                            game:GetService("ReplicatedStorage"):FindFirstChild("SellItem"):FireServer(item)
                        end
                    end
                end
            end
        end)
        
        -- Безопасный апгрейд
        pcall(function()
            local player = game.Players.LocalPlayer
            for i,container in pairs({player:FindFirstChild("Backpack"), player:FindFirstChild("Inventory")}) do
                if container then
                    for j,item in pairs(container:GetChildren()) do
                        game:GetService("ReplicatedStorage"):FindFirstChild("UpgradeItem"):FireServer(item)
                    end
                end
            end
        end)
    end
end

AutoFarm()
