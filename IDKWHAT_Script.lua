-- === ПРЕДИКТОР КОНКРЕТНЫХ АПГРЕЙДОВ ===
local UpgradePredictorFrame = Instance.new("Frame")
local PredictTitle = Instance.new("TextLabel")
local PredictScroll = Instance.new("ScrollingFrame")
local ClosePredict = Instance.new("TextButton")
local SourceItemButton = Instance.new("TextButton")
local TargetItemButton = Instance.new("TextButton")
local PredictButton = Instance.new("TextButton")
local ResultLabel = Instance.new("TextLabel")

-- Фрейм предиктора
UpgradePredictorFrame.Parent = ScreenGui
UpgradePredictorFrame.Size = UDim2.new(0, 450, 0, 500)
UpgradePredictorFrame.Position = UDim2.new(0.5, -225, 0.5, -250)
UpgradePredictorFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
UpgradePredictorFrame.BackgroundTransparency = 0.2
UpgradePredictorFrame.BorderSizePixel = 0
UpgradePredictorFrame.Visible = false

local PredictCorner = Instance.new("UICorner")
PredictCorner.Parent = UpgradePredictorFrame
PredictCorner.CornerRadius = UDim.new(0, 12)

-- Заголовок
PredictTitle.Parent = UpgradePredictorFrame
PredictTitle.Size = UDim2.new(1, 0, 0, 50)
PredictTitle.Text = "Upgrade Combination Predictor"
PredictTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
PredictTitle.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
PredictTitle.BackgroundTransparency = 0.3
PredictTitle.Font = Enum.Font.GothamBold
PredictTitle.TextSize = 18
PredictTitle.BorderSizePixel = 0

local PredictTitleCorner = Instance.new("UICorner")
PredictTitleCorner.Parent = PredictTitle
PredictTitleCorner.CornerRadius = UDim.new(0, 12)

-- Скролл фрейм для выбора предметов
PredictScroll.Parent = UpgradePredictorFrame
PredictScroll.Size = UDim2.new(0.9, 0, 0, 250)
PredictScroll.Position = UDim2.new(0.05, 0, 0.15, 0)
PredictScroll.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
PredictScroll.BackgroundTransparency = 0.5
PredictScroll.BorderSizePixel = 0
PredictScroll.ScrollBarThickness = 8

local ScrollCorner = Instance.new("UICorner")
ScrollCorner.Parent = PredictScroll
ScrollCorner.CornerRadius = UDim.new(0, 8)

-- Кнопки выбора предметов
SourceItemButton = Instance.new("TextButton")
SourceItemButton.Parent = UpgradePredictorFrame
SourceItemButton.Size = UDim2.new(0.4, 0, 0, 40)
SourceItemButton.Position = UDim2.new(0.05, 0, 0.7, 0)
SourceItemButton.Text = "SELECT SOURCE ITEM"
SourceItemButton.BackgroundColor3 = Color3.fromRGB(80, 120, 200)
SourceItemButton.BackgroundTransparency = 0.2
SourceItemButton.TextColor3 = Color3.fromRGB(255, 255, 255)
SourceItemButton.Font = Enum.Font.Gotham
SourceItemButton.TextSize = 14
SourceItemButton.BorderSizePixel = 0

local SourceCorner = Instance.new("UICorner")
SourceCorner.Parent = SourceItemButton
SourceCorner.CornerRadius = UDim.new(0, 8)

TargetItemButton = Instance.new("TextButton")
TargetItemButton.Parent = UpgradePredictorFrame
TargetItemButton.Size = UDim2.new(0.4, 0, 0, 40)
TargetItemButton.Position = UDim2.new(0.55, 0, 0.7, 0)
TargetItemButton.Text = "SELECT TARGET ITEM"
TargetItemButton.BackgroundColor3 = Color3.fromRGB(200, 120, 80)
TargetItemButton.BackgroundTransparency = 0.2
TargetItemButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TargetItemButton.Font = Enum.Font.Gotham
TargetItemButton.TextSize = 14
TargetItemButton.BorderSizePixel = 0

local TargetCorner = Instance.new("UICorner")
TargetCorner.Parent = TargetItemButton
TargetCorner.CornerRadius = UDim.new(0, 8)

-- Кнопка предсказания
PredictButton = Instance.new("TextButton")
PredictButton.Parent = UpgradePredictorFrame
PredictButton.Size = UDim2.new(0.6, 0, 0, 50)
PredictButton.Position = UDim2.new(0.2, 0, 0.8, 0)
PredictButton.Text = "PREDICT UPGRADE SUCCESS"
PredictButton.BackgroundColor3 = Color3.fromRGB(100, 200, 100)
PredictButton.BackgroundTransparency = 0.2
PredictButton.TextColor3 = Color3.fromRGB(255, 255, 255)
PredictButton.Font = Enum.Font.GothamBold
PredictButton.TextSize = 16
PredictButton.BorderSizePixel = 0

local PredictBtnCorner = Instance.new("UICorner")
PredictBtnCorner.Parent = PredictButton
PredictBtnCorner.CornerRadius = UDim.new(0, 8)

-- Результат
ResultLabel = Instance.new("TextLabel")
ResultLabel.Parent = UpgradePredictorFrame
ResultLabel.Size = UDim2.new(0.8, 0, 0, 60)
ResultLabel.Position = UDim2.new(0.1, 0, 0.9, 0)
ResultLabel.Text = "Select items to predict upgrade"
ResultLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
ResultLabel.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
ResultLabel.BackgroundTransparency = 0.3
ResultLabel.Font = Enum.Font.Gotham
ResultLabel.TextSize = 14
ResultLabel.TextWrapped = true
ResultLabel.BorderSizePixel = 0

local ResultCorner = Instance.new("UICorner")
ResultCorner.Parent = ResultLabel
ResultCorner.CornerRadius = UDim.new(0, 8)

-- Кнопка закрытия
ClosePredict = Instance.new("TextButton")
ClosePredict.Parent = UpgradePredictorFrame
ClosePredict.Size = UDim2.new(0.3, 0, 0, 35)
ClosePredict.Position = UDim2.new(0.35, 0, 0.95, -40)
ClosePredict.Text = "CLOSE"
ClosePredict.BackgroundColor3 = Color3.fromRGB(120, 40, 40)
ClosePredict.BackgroundTransparency = 0.2
ClosePredict.TextColor3 = Color3.fromRGB(255, 255, 255)
ClosePredict.Font = Enum.Font.Gotham
ClosePredict.TextSize = 14
ClosePredict.BorderSizePixel = 0

local CloseCorner = Instance.new("UICorner")
CloseCorner.Parent = ClosePredict
CloseCorner.CornerRadius = UDim.new(0, 8)

-- Переменные для выбранных предметов
local selectedSourceItem = nil
local selectedTargetItem = nil

-- Функция получения всех предметов игрока
local function getAllPlayerItems()
    local items = {}
    local player = game.Players.LocalPlayer
    
    local containers = {
        "Inventory", "Backpack", "Cards", "Weapons", "Pets",
        "Tools", "Items", "Collection"
    }
    
    for _, containerName in pairs(containers) do
        local container = player:FindFirstChild(containerName)
        if container then
            for _, item in pairs(container:GetChildren()) do
                if item:IsA("Tool") or item:IsA("Model") or item:FindFirstChild("Level") then
                    table.insert(items, item)
                end
            end
        end
    end
    
    return items
end

-- Функция отображения предметов для выбора
local function showItemsForSelection(selectionType)
    PredictScroll:ClearAllChildren()
    
    local items = getAllPlayerItems()
    local yOffset = 10
    
    for i, item in pairs(items) do
        local itemFrame = Instance.new("Frame")
        local itemName = Instance.new("TextLabel")
        local selectButton = Instance.new("TextButton")
        
        itemFrame.Parent = PredictScroll
        itemFrame.Size = UDim2.new(0.95, 0, 0, 50)
        itemFrame.Position = UDim2.new(0.025, 0, 0, yOffset)
        itemFrame.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        itemFrame.BackgroundTransparency = 0.5
        itemFrame.BorderSizePixel = 0
        
        local itemCorner = Instance.new("UICorner")
        itemCorner.Parent = itemFrame
        itemCorner.CornerRadius = UDim.new(0, 8)
        
        itemName.Parent = itemFrame
        itemName.Size = UDim2.new(0.6, 0, 1, 0)
        itemName.Position = UDim2.new(0.05, 0, 0, 0)
        itemName.Text = item.Name
        itemName.TextColor3 = Color3.fromRGB(255, 255, 255)
        itemName.BackgroundTransparency = 1
        itemName.Font = Enum.Font.Gotham
        itemName.TextSize = 14
        itemName.TextXAlignment = Enum.TextXAlignment.Left
        
        selectButton.Parent = itemFrame
        selectButton.Size = UDim2.new(0.3, 0, 0.6, 0)
        selectButton.Position = UDim2.new(0.65, 0, 0.2, 0)
        selectButton.Text = "SELECT"
        selectButton.BackgroundColor3 = selectionType == "source" and Color3.fromRGB(80, 120, 200) or Color3.fromRGB(200, 120, 80)
        selectButton.BackgroundTransparency = 0.2
        selectButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        selectButton.Font = Enum.Font.Gotham
        selectButton.TextSize = 12
        selectButton.BorderSizePixel = 0
        
        local btnCorner = Instance.new("UICorner")
        btnCorner.Parent = selectButton
        btnCorner.CornerRadius = UDim.new(0, 6)
        
        selectButton.MouseButton1Click:Connect(function()
            if selectionType == "source" then
                selectedSourceItem = item
                SourceItemButton.Text = "SOURCE: " .. item.Name
            else
                selectedTargetItem = item
                TargetItemButton.Text = "TARGET: " .. item.Name
            end
            UpgradePredictorFrame.Visible = true
        end)
        
        yOffset = yOffset + 60
    end
    
    PredictScroll.CanvasSize = UDim2.new(0, 0, 0, yOffset)
end

-- Функция предсказания успеха апгрейда
local function predictUpgradeSuccess(sourceItem, targetItem)
    -- Алгоритм предсказания на основе названий и свойств предметов
    local sourceName = string.lower(sourceItem.Name)
    local targetName = string.lower(targetItem.Name)
    
    -- Базовый шанс
    local baseChance = 50
    
    -- Модификаторы на основе редкости в названии
    if string.find(sourceName, "gold") or string.find(sourceName, "legendary") then
        baseChance = baseChance + 30
    elseif string.find(sourceName, "epic") or string.find(sourceName, "rare") then
        baseChance = baseChance + 15
    end
    
    if string.find(targetName, "gold") or string.find(targetName, "legendary") then
        baseChance = baseChance - 20
    elseif string.find(targetName, "epic") or string.find(targetName, "rare") then
        baseChance = baseChance - 10
    end
    
    -- Модификаторы на основе типа предмета
    if string.find(sourceName, "star") or string.find(sourceName, "pop") then
        baseChance = baseChance + 10
    end
    
    if string.find(targetName, "flower") or string.find(targetName, "sakura") then
        baseChance = baseChance + 5
    end
    
    -- Ограничиваем шанс от 5% до 95%
    baseChance = math.max(5, math.min(95, baseChance))
    
    -- Симуляция случайности
    local randomValue = math.random(1, 100)
    local success = randomValue <= baseChance
    
    return success, baseChance, randomValue
end

-- Обработчики кнопок
SourceItemButton.MouseButton1Click:Connect(function()
    showItemsForSelection("source")
end)

TargetItemButton.MouseButton1Click:Connect(function()
    showItemsForSelection("target")
end)

PredictButton.MouseButton1Click:Connect(function()
    if selectedSourceItem and selectedTargetItem then
        local success, chance, randomValue = predictUpgradeSuccess(selectedSourceItem, selectedTargetItem)
        
        if success then
            ResultLabel.Text = "✅ UPGRADE SUCCESS!\nChance: " .. chance .. "%\nRoll: " .. randomValue .. "/100\n\n" ..
                              selectedSourceItem.Name .. " → " .. selectedTargetItem.Name .. " = SUCCESS"
            ResultLabel.BackgroundColor3 = Color3.fromRGB(0, 100, 0)
        else
            ResultLabel.Text = "❌ UPGRADE FAILED!\nChance: " .. chance .. "%\nRoll: " .. randomValue .. "/100\n\n" ..
                              selectedSourceItem.Name .. " → " .. selectedTargetItem.Name .. " = FAILED"
            ResultLabel.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
        end
    else
        ResultLabel.Text = "Please select both source and target items!"
        ResultLabel.BackgroundColor3 = Color3.fromRGB(100, 100, 0)
    end
end)

-- Обновляем кнопку в главном меню
PredictToggle.MouseButton1Click:Connect(function()
    UpgradePredictorFrame.Visible = true
    selectedSourceItem = nil
    selectedTargetItem = nil
    SourceItemButton.Text = "SELECT SOURCE ITEM"
    TargetItemButton.Text = "SELECT TARGET ITEM"
    ResultLabel.Text = "Select items to predict upgrade"
    ResultLabel.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
end)

ClosePredict.MouseButton1Click:Connect(function()
    UpgradePredictorFrame.Visible = false
end)
