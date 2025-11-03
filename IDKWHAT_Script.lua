-- Исправленная функция анализа улучшений
local function analyzeUpgradeChances()
    PredictScroll:ClearAllChildren()
    
    local items = {}
    local player = game.Players.LocalPlayer
    
    -- Расширенный поиск ВСЕХ возможных контейнеров
    local containers = {
        "Inventory", "Backpack", "Cards", "Weapons", "Pets",
        "Tools", "Items", "Collection", "Storage", "Character"
    }
    
    -- Ищем во всех контейнерах игрока
    for _, containerName in pairs(containers) do
        local container = player:FindFirstChild(containerName)
        if container then
            for _, item in pairs(container:GetChildren()) do
                -- Добавляем ЛЮБОЙ предмет для тестирования
                table.insert(items, item)
            end
        end
    end
    
    -- Также проверяем Character
    if player.Character then
        for _, item in pairs(player.Character:GetChildren()) do
            if item:IsA("Tool") then
                table.insert(items, item)
            end
        end
    end
    
    -- Отладочная информация
    print("Found " .. #items .. " items total")
    for i, item in pairs(items) do
        print("Item " .. i .. ": " .. item.Name .. " (" .. item.ClassName .. ")")
    end
    
    -- Если предметов нет
    if #items == 0 then
        local noItems = Instance.new("TextLabel")
        noItems.Parent = PredictScroll
        noItems.Size = UDim2.new(0.9, 0, 0, 80)
        noItems.Position = UDim2.new(0.05, 0, 0, 10)
        noItems.Text = "DEBUG: No items found!\nContainers checked:\n" .. table.concat(containers, ", ")
        noItems.TextColor3 = Color3.fromRGB(255, 100, 100)
        noItems.BackgroundTransparency = 1
        noItems.Font = Enum.Font.Gotham
        noItems.TextSize = 12
        noItems.TextWrapped = true
        PredictScroll.CanvasSize = UDim2.new(0, 0, 0, 120)
        return
    end
    
    -- Создаём карточки для каждого предмета
    local yOffset = 10
    for i, item in pairs(items) do
        local itemFrame = Instance.new("Frame")
        local itemName = Instance.new("TextLabel")
        local itemClass = Instance.new("TextLabel")
        local itemChance = Instance.new("TextLabel")
        local itemStatus = Instance.new("TextLabel")
        
        itemFrame.Parent = PredictScroll
        itemFrame.Size = UDim2.new(0.95, 0, 0, 80)
        itemFrame.Position = UDim2.new(0.025, 0, 0, yOffset)
        itemFrame.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        itemFrame.BackgroundTransparency = 0.5
        itemFrame.BorderSizePixel = 0
        
        local itemCorner = Instance.new("UICorner")
        itemCorner.Parent = itemFrame
        itemCorner.CornerRadius = UDim.new(0, 8)
        
        -- Название и класс предмета
        itemName.Parent = itemFrame
        itemName.Size = UDim2.new(0.8, 0, 0.3, 0)
        itemName.Position = UDim2.new(0.05, 0, 0.1, 0)
        itemName.Text = item.Name
        itemName.TextColor3 = Color3.fromRGB(255, 255, 255)
        itemName.BackgroundTransparency = 1
        itemName.Font = Enum.Font.Gotham
        itemName.TextSize = 14
        itemName.TextXAlignment = Enum.TextXAlignment.Left
        
        itemClass.Parent = itemFrame
        itemClass.Size = UDim2.new(0.4, 0, 0.3, 0)
        itemClass.Position = UDim2.new(0.05, 0, 0.4, 0)
        itemClass.Text = "Class: " .. item.ClassName
        itemClass.TextColor3 = Color3.fromRGB(200, 200, 255)
        itemClass.BackgroundTransparency = 1
        itemClass.Font = Enum.Font.Gotham
        itemClass.TextSize = 11
        itemClass.TextXAlignment = Enum.TextXAlignment.Left
        
        -- Шанс улучшения (на основе имени и класса)
        local chance = 50 -- базовый шанс
        if string.find(item.Name:lower(), "common") then chance = 80
        elseif string.find(item.Name:lower(), "rare") then chance = 60
        elseif string.find(item.Name:lower(), "epic") then chance = 40
        elseif string.find(item.Name:lower(), "legendary") then chance = 20
        end
        
        itemChance.Parent = itemFrame
        itemChance.Size = UDim2.new(0.3, 0, 0.3, 0)
        itemChance.Position = UDim2.new(0.65, 0, 0.4, 0)
        itemChance.Text = chance .. "%"
        itemChance.TextColor3 = chance == 100 and Color3.fromRGB(0, 255, 0) or 
                               chance >= 50 and Color3.fromRGB(255, 255, 0) or 
                               Color3.fromRGB(255, 50, 50)
        itemChance.BackgroundTransparency = 1
        itemChance.Font = Enum.Font.GothamBold
        itemChance.TextSize = 16
        
        -- Статус
        itemStatus.Parent = itemFrame
        itemStatus.Size = UDim2.new(0.9, 0, 0.3, 0)
        itemStatus.Position = UDim2.new(0.05, 0, 0.7, 0)
        itemStatus.Text = chance == 100 and "✅ 100% SUCCESS" or 
                         chance >= 70 and "⚠️ MEDIUM RISK" or
                         chance >= 30 and "🔴 HIGH RISK" or
                         "💀 VERY HIGH RISK"
        itemStatus.TextColor3 = chance == 100 and Color3.fromRGB(0, 255, 0) or 
                               chance >= 70 and Color3.fromRGB(255, 255, 0) or
                               chance >= 30 and Color3.fromRGB(255, 150, 0) or
                               Color3.fromRGB(255, 50, 50)
        itemStatus.BackgroundTransparency = 1
        itemStatus.Font = Enum.Font.Gotham
        itemStatus.TextSize = 12
        itemStatus.TextXAlignment = Enum.TextXAlignment.Left
        
        yOffset = yOffset + 90
    end
    
    PredictScroll.CanvasSize = UDim2.new(0, 0, 0, yOffset)
end
