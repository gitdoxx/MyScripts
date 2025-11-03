-- NFT Battle Auto Farm
getgenv().Settings = {Stars=5,AutoSell=true,AutoUpgrade=true}

local function AutoFarm()
    while task.wait(0.5) do
        -- Авто-открытие кейсов
        for i,v in pairs(workspace.Cases:GetChildren()) do
            if v:GetAttribute("Tier") == Settings.Stars then
                game:GetService("ReplicatedStorage").Events.OpenCase:FireServer(v)
            end
        end
        
        -- Авто-продажа
        for i,v in pairs(game.Players.LocalPlayer.Inventory:GetChildren()) do
            if v:GetAttribute("Rarity") == "Common" then
                game:GetService("ReplicatedStorage").Events.SellItem:FireServer(v)
            end
        end
        
        -- 100% апгрейд
        for i,v in pairs(game.Players.LocalPlayer.Inventory:GetChildren()) do
            local success, result = pcall(function()
                return game:GetService("ReplicatedStorage").Events.UpgradeItem:FireServer(v)
            end)
        end
    end
end

AutoFarm()
