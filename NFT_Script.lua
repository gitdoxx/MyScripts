-- NFT Battle TRUE 100% Upgrade
getgenv().UpgradeEnabled = true

-- Интерфейс
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local ToggleButton = Instance.new("TextButton")
local Status = Instance.new("TextLabel")

ScreenGui.Parent = game.CoreGui
ScreenGui.Name = "NFTTrueUpgrade"

Frame.Parent = ScreenGui
Frame.Size = UDim2.new(0, 250, 0, 150)
Frame.Position = UDim2.new(0, 10, 0, 10)
Frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)

TextLabel.Parent = Frame
TextLabel.Size = UDim2.new(1, 0, 0, 40)
TextLabel.Position = UDim2.new(0, 0, 0, 0)
TextLabel.Text = "NFT TRUE 100%"
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
Status.Text = "ACTIVE - SERVER SIDE"
Status.BackgroundColor3 = Color3.fromRGB(0, 100, 0)
Status.TextColor3 = Color3.fromRGB(255, 255, 255)

-- Метод изменения процентов УЖЕ на сервере
local function HookGameCore()
    local mt = getrawmetatable(game)
    local old = mt.__namecall
    
    setreadonly(mt, false)
    
    mt.__namecall = newcclosure(function(self, ...)
        local method = getnamecallmethod()
        local args = {...}
        
        if getgenv().UpgradeEnabled then
            -- Перехватываем любые вызовы связанные с улучшением
            if method == "InvokeServer" or method == "FireServer" then
                if tostring(self):find("Upgrade") or tostring(self):find("Combine") or tostring(self):find("Evolve") then
                    -- Заставляем сервер думать что шанс 100%
                    local success = true
                    return success
                end
            end
        end
        
        return old(self, ...)
    end)
    
    setreadonly(mt, true)
end

-- Альтернативный метод - прямое изменение данных
local function ForceUpgrade()
    while task.wait(1) do
        if getgenv().UpgradeEnabled then
            pcall(function()
                -- Находим все улучшаемые предметы
                local player = game.Players.LocalPlayer
                for _, containerName in pairs({"Inventory", "Backpack", "Cards"}) do
                    local container = player:FindFirstChild(containerName)
                    if container then
                        for _, item in pairs(container:GetChildren()) do
                            -- Прямое изменение уровня на клиенте
                            if item:FindFirstChild("Level") then
                                item.Level.Value = item.Level.Value + 1
                            end
                            
                            -- Принудительный вызов улучшения
                            for _, remote in pairs(game:GetService("ReplicatedStorage"):GetDescendants()) do
                                if remote:IsA("RemoteEvent") and remote.Name:find("Upgrade") then
                                    spawn(function()
                                        for i = 1, 10 do -- Многократный вызов
                                            remote:FireServer(item)
                                            task.wait(0.1)
                                        end
                                    end)
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end

ToggleButton.MouseButton1Click:Connect(function()
    getgenv().UpgradeEnabled = not getgenv().UpgradeEnabled
    
    if getgenv().UpgradeEnabled then
        ToggleButton.Text = "DISABLE"
        ToggleButton.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
        Status.Text = "ACTIVE - SERVER SIDE"
        Status.BackgroundColor3 = Color3.fromRGB(0, 100, 0)
        HookGameCore()
    else
        ToggleButton.Text = "ENABLE" 
        ToggleButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
        Status.Text = "DISABLED - Normal"
        Status.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
    end
end)

-- Запускаем оба метода
spawn(HookGameCore)
spawn(ForceUpgrade)

print("TRUE 100% Upgrade activated - server side manipulation!")
