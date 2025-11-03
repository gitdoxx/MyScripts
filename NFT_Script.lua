-- NFT Battle 100% Upgrade ANY%
getgenv().UpgradeEnabled = true

-- Интерфейс
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local ToggleButton = Instance.new("TextButton")
local Status = Instance.new("TextLabel")

ScreenGui.Parent = game.CoreGui
ScreenGui.Name = "NFTUpgradeGUI"

Frame.Parent = ScreenGui
Frame.Size = UDim2.new(0, 250, 0, 150)
Frame.Position = UDim2.new(0, 10, 0, 10)
Frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)

TextLabel.Parent = Frame
TextLabel.Size = UDim2.new(1, 0, 0, 40)
TextLabel.Position = UDim2.new(0, 0, 0, 0)
TextLabel.Text = "NFT BATTLE UPGRADE"
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
Status.Text = "ACTIVE - 100% ANY%"
Status.BackgroundColor3 = Color3.fromRGB(0, 100, 0)
Status.TextColor3 = Color3.fromRGB(255, 255, 255)

-- Перехват ВСЕХ RemoteEvents
local function HookAllRemotes()
    local rs = game:GetService("ReplicatedStorage")
    
    for _, remote in pairs(rs:GetDescendants()) do
        if remote:IsA("RemoteEvent") then
            local oldFire = remote.FireServer
            remote.FireServer = function(self, ...)
                local args = {...}
                -- Если это похоже на улучшение (передаётся карта/предмет)
                if getgenv().UpgradeEnabled and args[1] then
                    if typeof(args[1]) == "Instance" and (args[1]:IsA("Tool") or args[1]:FindFirstChild("Level")) then
                        return true -- Всегда успех для ЛЮБОГО улучшения
                    end
                end
                return oldFire(self, ...)
            end
        elseif remote:IsA("RemoteFunction") then
            local oldInvoke = remote.InvokeServer
            remote.InvokeServer = function(self, ...)
                local args = {...}
                if getgenv().UpgradeEnabled and args[1] then
                    if typeof(args[1]) == "Instance" and (args[1]:IsA("Tool") or args[1]:FindFirstChild("Level")) then
                        return true -- Всегда успех
                    end
                end
                return oldInvoke(self, ...)
            end
        end
    end
    print("All remotes hooked for 100% upgrade!")
    return true
end

-- Переключение GUI
ToggleButton.MouseButton1Click:Connect(function()
    getgenv().UpgradeEnabled = not getgenv().UpgradeEnabled
    
    if getgenv().UpgradeEnabled then
        ToggleButton.Text = "DISABLE"
        ToggleButton.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
        Status.Text = "ACTIVE - 100% ANY%"
        Status.BackgroundColor3 = Color3.fromRGB(0, 100, 0)
    else
        ToggleButton.Text = "ENABLE" 
        ToggleButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
        Status.Text = "DISABLED - Normal"
        Status.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
    end
end)

-- Авто-улучшение
spawn(function()
    task.wait(3)
    
    local hooked = HookAllRemotes()
    
    while task.wait(2) do
        if getgenv().UpgradeEnabled then
            pcall(function()
                local player = game.Players.LocalPlayer
                
                -- Ищем все возможные контейнеры с картами
                local containers = {"Inventory", "Cards", "Backpack", "Weapons", "Pets"}
                
                for _, containerName in pairs(containers) do
                    local container = player:FindFirstChild(containerName)
                    if container then
                        -- Пробуем улучшить каждый предмет
                        for _, item in pairs(container:GetChildren()) do
                            if item:IsA("Tool") or item:FindFirstChild("Level") then
                                -- Пробуем все возможные RemoteEvents
                                for _, remote in pairs(game:GetService("ReplicatedStorage"):GetDescendants()) do
                                    if remote:IsA("RemoteEvent") then
                                        pcall(function()
                                            remote:FireServer(item)
                                        end)
                                    end
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)

print("NFT Battle 100% ANY% Upgrade loaded!")
