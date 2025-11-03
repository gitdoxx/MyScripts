-- NFT Battle Precious Team GUI - COMPLETE SCRIPT
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Watermark = Instance.new("TextLabel")
local ToggleButton = Instance.new("TextButton")
local TitleLabel = Instance.new("TextLabel")
local PredictToggle = Instance.new("TextButton")

ScreenGui.Parent = game.CoreGui
ScreenGui.Name = "PreciousGUI"
ScreenGui.ResetOnSpawn = false

-- Главное окно
MainFrame.Parent = ScreenGui
MainFrame.Size = UDim2.new(0, 300, 0, 200)
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
MainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
MainFrame.BackgroundTransparency = 0.3
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true

-- Скругленные углы
local UICorner = Instance.new("UICorner")
UICorner.Parent = MainFrame
UICorner.CornerRadius = UDim.new(0, 12)

-- Заголовок
TitleLabel.Parent = MainFrame
TitleLabel.Size = UDim2.new(1, 0, 0, 40)
TitleLabel.Text = "Precious Team Menu"
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TitleLabel.BackgroundTransparency = 0.5
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextSize = 18
TitleLabel.BorderSizePixel = 0

local TitleCorner = Instance.new("UICorner")
TitleCorner.Parent = TitleLabel
TitleCorner.CornerRadius = UDim.new(0, 12)

-- Водяной знак
Watermark.Parent = ScreenGui
Watermark.Size = UDim2.new(0, 120, 0, 30)
Watermark.Position = UDim2.new(1, -130, 0, 10)
Watermark.Text = "Precious Team"
Watermark.TextColor3 = Color3.fromRGB(255, 255, 255)
Watermark.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Watermark.BackgroundTransparency = 0.7
Watermark.TextTransparency = 0.3
Watermark.Font = Enum.Font.GothamBold
Watermark.TextSize = 14
Watermark.BorderSizePixel = 0

local WatermarkCorner = Instance.new("UICorner")
WatermarkCorner.Parent = Watermark
WatermarkCorner.CornerRadius = UDim.new(0, 8)

-- Кнопка водяного знака
ToggleButton.Parent = MainFrame
ToggleButton.Size = UDim2.new(0.7, 0, 0, 40)
ToggleButton.Position = UDim2.new(0.15, 0, 0.3, 0)
ToggleButton.Text = "WATERMARK: ON"
ToggleButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
ToggleButton.BackgroundTransparency = 0.2
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.Font = Enum.Font.Gotham
ToggleButton.TextSize = 16
ToggleButton.BorderSizePixel = 0

local ButtonCorner = Instance.new("UICorner")
ButtonCorner.Parent = ToggleButton
ButtonCorner.CornerRadius = UDim.new(0, 8)

-- Кнопка предиктора в главном меню
PredictToggle = Instance.new("TextButton")
PredictToggle.Parent = MainFrame
PredictToggle.Size = UDim2.new(0.7, 0, 0, 40)
PredictToggle.Position = UDim2.new(0.15, 0, 0.6, 0)
PredictToggle.Text = "UPGRADE PREDICTOR"
PredictToggle.BackgroundColor3 = Color3.fromRGB(80, 80, 150)
PredictToggle.BackgroundTransparency = 0.2
PredictToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
PredictToggle.Font = Enum.Font.Gotham
PredictToggle.TextSize = 16
PredictToggle.BorderSizePixel = 0

local PredictToggleCorner = Instance.new("UICorner")
PredictToggleCorner.Parent = PredictToggle
PredictToggleCorner.CornerRadius = UDim.new(0, 8)

-- Управление
local tweenService = game:GetService("TweenService")
local watermarkEnabled = true
local menuVisible = true

-- Функции показа/скрытия
local function hideMenu()
    menuVisible = false
    local hideTween = tweenService:Create(
        MainFrame,
        TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {Size = UDim2.new(0, 0, 0, 0), Position = UDim2.new(0.5, 0, 0.5, 0), BackgroundTransparency = 1}
    )
    hideTween:Play()
end

local function showMenu()
    menuVisible = true
    local showTween = tweenService:Create(
        MainFrame,
        TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
        {Size = UDim2.new(0, 300, 0, 200), Position = UDim2.new(0.5, -150, 0.5, -100), BackgroundTransparency = 0.3}
    )
    showTween:Play()
end

-- Показываем меню при запуске
showMenu()

-- Обработчик Right Shift
local UIS = game:GetService("UserInputService")
local rightShiftDown = false

UIS.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.RightShift then
        rightShiftDown = true
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.RightShift and rightShiftDown then
        rightShiftDown = false
        if menuVisible then
            hideMenu()
        else
            showMenu()
        end
    end
end)

-- Переключение водяного знака
ToggleButton.MouseButton1Click:Connect(function()
    watermarkEnabled = not watermarkEnabled
    
    if watermarkEnabled then
        ToggleButton.Text = "WATERMARK: ON"
        ToggleButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
        Watermark.Visible = true
    else
        ToggleButton.Text = "WATERMARK: OFF" 
        ToggleButton.BackgroundColor3 = Color3.fromRGB(120, 40, 40)
        Watermark.Visible = false
    end
end)

-- === НОВЫЙ ПРЕДИКТОР АПГРЕЙДОВ ===
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
                if item:IsA("Tool") or item:IsA("Model") then
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
    local sourceName = string.lower(sourceItem.Name)
    local targetName = string.lower(targetItem.Name)
    
    local baseChance = 50
    
    -- Модификаторы на основе редкости
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
    
    -- Модификаторы на основе типа
    if string.find(sourceName, "star") or string.find(sourceName, "pop") then
        baseChance = baseChance + 10
    end
    
    if string.find(targetName, "flower") or string.find(targetName, "sakura") then
        baseChance = baseChance + 5
    end
    
    baseChance = math.max(5, math.min(95, baseChance))
    
    local randomValue = math.random(1, 100)
    local success = randomValue <= baseChance
    
    return success, baseChance, randomValue
end

-- Обработчики кнопок предиктора
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

-- Обработчик кнопки предиктора в главном меню
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

print("Complete Precious Team GUI loaded! Press Right Shift to toggle menu.")
