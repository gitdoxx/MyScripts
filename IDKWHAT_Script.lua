-- Исправленная функция отображения предметов
local function showItemsForSelection(selectionType)
    PredictScroll:ClearAllChildren()
    
    local items = getAllPlayerItems()
    local yOffset = 10
    
    -- Если предметов нет
    if #items == 0 then
        local noItems = Instance.new("TextLabel")
        noItems.Parent = PredictScroll
        noItems.Size = UDim2.new(0.9, 0, 0, 80)
        noItems.Position = UDim2.new(0.05, 0, 0, 10)
        noItems.Text = "No items found in inventory!\n\nMake sure you have items in:\n- Inventory\n- Backpack\n- Cards\n- Weapons"
        noItems.TextColor3 = Color3.fromRGB(255, 100, 100)
        noItems.BackgroundTransparency = 1
        noItems.Font = Enum.Font.Gotham
        noItems.TextSize = 14
        noItems.TextWrapped = true
        PredictScroll.CanvasSize = UDim2.new(0, 0, 0, 100)
        return
    end
    
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
        end)
        
        yOffset = yOffset + 60
    end
    
    PredictScroll.CanvasSize = UDim2.new(0, 0, 0, yOffset)
end
