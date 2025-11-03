-- NFT Battle SIMPLE 100% Upgrade
getgenv().UpgradeEnabled = true

-- Простой интерфейс
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local ToggleButton = Instance.new("TextButton")
local Status = Instance.new("TextLabel")

ScreenGui.Parent = game.CoreGui

Frame.Parent = ScreenGui
Frame.Size = UDim2.new(0, 250, 0, 150)
Frame.Position = UDim2.new(0, 10, 0, 10)
Frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)

TextLabel.Parent = Frame
TextLabel.Size = UDim2.new(1, 0, 0, 40)
TextLabel.Text = "NFT SIMPLE 100%"
TextLabel.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)

ToggleButton.Parent = Frame
ToggleButton.Size = UDim2.new(0.8, 0, 0, 40)
ToggleButton.Position = UDim2.new(0.1, 0, 0.3, 0)
ToggleButton.Text = "DISABLE"
ToggleButton.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)

Status.Parent = Frame
Status.Size = UDim2.new(0.8, 0, 0, 40)
Status.Position = UDim2.new(0.1, 0, 0.7, 0)
Status.Text = "ACTIVE - SPAM MODE"
Status.BackgroundColor3 = Color3.fromRGB(0, 100, 0)
Status.TextColor3 = Color3.fromRGB(255, 255, 255)

-- Простой спам улучшениями
local upgradeSpam = nil

ToggleButton.MouseButton1Click:Connect(function()
    getgenv().UpgradeEnabled = not getgenv().UpgradeEnabled
    
    if getgenv().UpgradeEnabled then
        ToggleButton.Text = "DISABLE"
        ToggleButton.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
        Status.Text = "ACTIVE - SPAM MODE"
        Status.BackgroundColor3 = Color3.fromRGB(0, 100, 0)
        
        -- Запускаем спам улучшениями
        upgradeSpam = task.spawn(function()
            while getgenv().UpgradeEnabled and task.wait(0.5) do
                pcall(function()
                    local player = game.Players.LocalPlayer
                    
                    -- Ищем все предметы для улучшения
                    local inventory = player:FindFirstChild("Inventory") or player:FindFirstChild("Backpack")
                    if inventory then
                        for _, item in pairs(inventory:GetChildren()) do
                            -- Ищем все RemoteEvents для улучшения
                            for _, remote in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
                                if remote:IsA("RemoteEvent") and (remote.Name:lower():find("upgrade") or remote.Name:lower():find("combine")) then
                                    -- Спамим улучшением 10 раз подряд
                                    for i = 1, 10 do
                                        remote:FireServer(item)
                                        task.wait(0.05)
                                    end
                                end
                            end
                        end
                    end
                end)
            end
        end)
        
    else
        ToggleButton.Text = "ENABLE" 
        ToggleButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
        Status.Text = "DISABLED - Normal"
        Status.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
        
        -- Останавливаем спам
        if upgradeSpam then
            task.cancel(upgradeSpam)
        end
    end
end)

print("Simple 100% Upgrade loaded - Spam method!")
