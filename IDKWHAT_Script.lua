-- NFT Battle Precious Team GUI FIXED
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

print("Precious Team GUI loaded! Press Right Shift to toggle menu.")
