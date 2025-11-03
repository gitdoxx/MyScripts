-- NFT Battle Precious Team GUI COMPLETE
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Watermark = Instance.new("TextLabel")
local ToggleButton = Instance.new("TextButton")
local TitleLabel = Instance.new("TextLabel")

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

-- === ПРЕДИКТОР АПГРЕЙДОВ ===
local PredictFrame = Instance.new("Frame")
local PredictTitle = Instance.new("TextLabel")
local PredictScroll = Instance.new("ScrollingFrame")
local PredictToggle = Instance.new("TextButton")
local ClosePredict = Instance.new("TextButton")

-- Фрейм прогноза
PredictFrame.Parent = ScreenGui
PredictFrame.Size = UDim2.new(0, 350, 0, 400)
PredictFrame.Position = UDim2.new(0.5, -175, 0.5, -200)
PredictFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
PredictFrame.BackgroundTransparency = 0.2
PredictFrame.BorderSizePixel = 0
PredictFrame.Visible = false

local PredictCorner = Instance.new("UICorner")
PredictCorner.Parent = PredictFrame
PredictCorner.CornerRadius = UDim.new(0, 12)

-- Заголовок прогноза
PredictTitle.Parent = PredictFrame
PredictTitle.Size = UDim2.new(1, 0, 0, 50)
PredictTitle.Text = "Upgrade Predictor"
PredictTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
PredictTitle.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
PredictTitle.BackgroundTransparency = 0.3
PredictTitle.Font = Enum.Font.GothamBold
PredictTitle.TextSize = 20
PredictTitle.BorderSizePixel = 0

local PredictTitleCorner = Instance.new("UICorner")
PredictTitleCorner.Parent = PredictTitle
PredictTitleCorner.CornerRadius = UDim.new(0, 12)

-- Скролл фрейм
PredictScroll.Parent = PredictFrame
PredictScroll.Size = UDim2.new(0.9, 0, 0, 300)
PredictScroll.Position = UDim2.new(0.05, 0, 0.15, 0)
PredictScroll.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
PredictScroll.BackgroundTransparency = 0.5
PredictScroll.BorderSizePixel = 0
PredictScroll.ScrollBarThickness = 6

local ScrollCorner = Instance.new("UICorner")
ScrollCorner.Parent = PredictScroll
ScrollCorner.CornerRadius = UDim.new(0, 8)

-- Кнопка закрытия
ClosePredict.Parent = PredictFrame
ClosePredict.Size = UDim2.new(0.4, 0, 0, 40)
ClosePredict.Position = UDim2.new(0.3, 0, 0.9, -45)
ClosePredict.Text = "CLOSE"
ClosePredict.BackgroundColor3 = Color3.fromRGB(120, 40, 40)
ClosePredict.BackgroundTransparency = 0.2
ClosePredict.TextColor3 = Color3.fromRGB(255, 255, 255)
ClosePredict.Font = Enum.Font.Gotham
ClosePredict.TextSize = 16
ClosePredict.BorderSizePixel = 0

local CloseCorner = Instance.new("UICorner")
CloseCorner.Parent = ClosePredict
CloseCorner.CornerRadius = UDim.new(0, 8)

-- Кнопка Predictor в главном меню
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

-- Функция анализа улучшений
local function analyzeUpgradeChances()
    PredictScroll:ClearAllChildren()
    
    local items = {}
    local player = game.Players.LocalPlayer
    
    -- Ищем ВСЕ возможные контейнеры
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
    
    -- Если предметов нет
    if #items == 0 then
        local noItems = Instance.new("TextLabel")
        noItems.Parent = PredictScroll
        noItems.Size = UDim2.new(0.9, 0, 0, 50)
        noItems.Position = UDim2.new(0.05, 0, 0, 10)
        noItems.Text = "No upgradeable items found!\nCheck your inventory."
        noItems.TextColor3 = Color3.fromRGB(255, 255, 255)
        noItems.BackgroundTransparency = 1
        noItems.Font = Enum.Font.Gotham
        noItems.TextSize = 16
        noItems.TextWrapped = true
        PredictScroll.CanvasSize = UDim2.new(0, 0, 0, 100)
        return
    end
    
    -- Создаём карточки для каждого предмета
    local yOffset = 10
    for i, item in pairs(items) do
        local itemFrame = Instance.new("Frame")
        local itemName = Instance.new("TextLabel")
        local itemLevel = Instance.new("TextLabel")
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
        
        -- Название предмета
        itemName.Parent = itemFrame
        itemName.Size = UDim2.new(0.8, 0, 0.3, 0)
        itemName.Position = UDim2.new(0.05, 0, 0.1, 0)
        itemName.Text = "Item: " .. item.Name
        itemName.TextColor3 = Color3.fromRGB(255, 255, 255)
        itemName.BackgroundTransparency = 1
        itemName.Font = Enum.Font.Gotham
        itemName.TextSize = 14
        itemName.TextXAlignment = Enum.TextXAlignment.Left
        
        -- Уровень предмета
        local level = 1
        if item:FindFirstChild("Level") then
            level = item.Level.Value
        end
        
        itemLevel.Parent = itemFrame
        itemLevel.Size = UDim2.new(0.4, 0, 0.3, 0)
        itemLevel.Position = UDim2.new(0.05, 0, 0.4, 0)
        itemLevel.Text = "Level: " .. tostring(level)
        itemLevel.TextColor3 = Color3.fromRGB(200, 200, 255)
        itemLevel.BackgroundTransparency = 1
        itemLevel.Font = Enum.Font.Gotham
        itemLevel.TextSize = 12
        itemLevel.TextXAlignment = Enum.TextXAlignment.Left
        
        -- Шанс улучшения
        local chance = math.max(5, 100 - (level * 12))
        if level >= 8 then chance = 5 end
        
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
        itemStatus.Text = chance == 100 and "✅ 100% SUCCESS - SAFE" or 
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

-- Обработчики Predictor
PredictToggle.MouseButton1Click:Connect(function()
    PredictFrame.Visible = true
    analyzeUpgradeChances()
end)

ClosePredict.MouseButton1Click:Connect(function()
    PredictFrame.Visible = false
end)

print("Precious Team GUI + Upgrade Predictor loaded! Press Right Shift to toggle menu.")
