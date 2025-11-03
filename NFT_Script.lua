-- NFT Battle Auto Farm FIXED
getgenv().Settings = {Stars=5,AutoSell=true,AutoUpgrade=true}

local function AutoFarm()
    while task.wait(0.5) do
        -- Ищем правильное название для кейсов
        local workspaceItems = workspace:GetChildren()
        local cases = nil
        
        for i,v in pairs(workspaceItems) do
            if string.find(string.lower(v.Name), "case") or 
               string.find(string.lower(v.Name), "crate") or
               string.find(string.lower(v.Name), "chest") then
                cases = v
                break
            end
        end
        
        -- Авто-открытие если нашли кейсы
        if cases then
            for i,v in pairs(cases:GetChildren()) do
                if v:GetAttribute("Tier") == Settings.Stars then
                    game:GetService("ReplicatedStorage").Events.OpenCase:FireServer(v)
                end
            end
        end
        
        -- Авто-продажа (проверяем инвентарь)
        local player = game.Players.LocalPlayer
        local backpack = player:FindFirstChild("Backpack") or player:FindFirstChild("Inventory")
        
        if backpack then
            for i,v in pairs(backpack:GetChildren()) do
                if v:GetAttribute("Rarity") == "Common" then
                    game:GetService("ReplicatedStorage").Events.SellItem:FireServer(v)
                end
            end
        end
        
        -- Апгрейд
        if backpack then
            for i,v in pairs(backpack:GetChildren()) do
                local success, result = pcall(function()
                    return game:GetService("ReplicatedStorage").Events.UpgradeItem:FireServer(v)
                end)
            end
        end
    end
end

AutoFarm()
