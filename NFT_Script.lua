-- NFT Battle Upgrade GUI
getgenv().UpgradeEnabled = true

-- Создаём интерфейс
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local ToggleButton = Instance.new("TextButton")
local Status = Instance.new("TextLabel")

ScreenGui.Parent = game.CoreGui
ScreenGui.Name = "UpgradeGUI"

Frame.Parent = ScreenGui
Frame.Size = UDim2.new(0, 200, 0, 120)
Frame.Position = UDim2.new(0, 10, 0, 10)
Frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)

TextLabel.Parent = Frame
TextLabel.Size = UDim2.new(1, 0, 0, 30)
TextLabel.Position = UDim2.new(0, 0, 0, 0)
TextLabel.Text = "NFT Battle Upgrade"
TextLabel.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)

ToggleButton.Parent = Frame
ToggleButton.Size = UDim2.new(0.8, 0, 0, 30)
ToggleButton.Position = UDim2.new(0.1, 0, 0.3, 0)
ToggleButton.Text = "DISABLE"
ToggleButton.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)

Status.Parent = Frame
Status.Size = UDim2.new(0.8, 0, 0, 30)
Status.Position = UDim2.new(0.1, 0, 0.6, 0)
Status.Text = "Status: ACTIVE"
Status.BackgroundColor3 = Color3.fromRGB(0, 100, 0)
Status.TextColor3 = Color3.fromRGB(255, 255, 255)

-- Функция переключения
ToggleButton.MouseButton1Click:Connect(function()
    getgenv().UpgradeEnabled = not getgenv().UpgradeEnabled
    
    if getgenv().UpgradeEnabled then
        ToggleButton.Text = "DISABLE"
        ToggleButton.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
        Status.Text = "Status: ACTIVE"
        Status.BackgroundColor3 = Color3.fromRGB(0, 100, 0)
    else
        ToggleButton.Text = "ENABLE" 
        ToggleButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
        Status.Text = "Status: DISABLED"
        Status.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
    end
end)

-- Хук для апгрейда
local upgradeHookSet = false

local function SetupUpgradeHook()
    if upgradeHookSet then return end
    
    for i,v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
        if string.find(string.lower(v.Name), "upgrade") then
            local oldFire = v.FireServer
            v.FireServer = function(self, ...)
                if getgenv().UpgradeEnabled then
                    return true
                else
                    return oldFire(self, ...)
                end
            end
            upgradeHookSet = true
            print("Upgrade hook installed on: " .. v.Name)
            break
        end
    end
end

-- Автопоиск и применение
spawn(function()
    while task.wait(1) do
        if not upgradeHookSet then
            SetupUpgradeHook()
        end
        
        if getgenv().UpgradeEnabled then
            pcall(function()
                local player = game.Players.LocalPlayer
                local container = player:FindFirstChild("Backpack") or player:FindFirstChild("Inventory")
                if container then
                    for j, item in pairs(container:GetChildren()) do
                        game:GetService("ReplicatedStorage"):FindFirstChild("UpgradeItem"):FireServer(item)
                    end
                end
            end)
        end
    end
end)

print("Upgrade GUI loaded successfully! Green window = active.")
