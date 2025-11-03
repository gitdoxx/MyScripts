-- NFT BATTLE MEMORY HACK - 100% SUCCESS
getgenv().MemoryHack = true

-- Хук всех математических функций
local oldRandom = math.random
math.random = function(a, b)
    if getgenv().MemoryHack then
        return 100 -- Всегда максимальный шанс
    end
    return oldRandom(a, b)
end

-- Хук Random.new
local oldRandomNew = Random.new
Random.new = function()
    local randomObj = oldRandomNew()
    local oldNext = randomObj.NextNumber
    randomObj.NextNumber = function(self, min, max)
        if getgenv().MemoryHack then
            return 1.0 -- Всегда 100%
        end
        return oldNext(self, min, max)
    end
    return randomObj
end

-- Прямой хук байткода функций улучшения
for i, v in next, getreg() do
    if type(v) == "function" then
        local env = getfenv(v)
        if env and env.script then
            local scriptName = tostring(env.script)
            if string.find(scriptName:lower(), "upgrade") or 
               string.find(scriptName:lower(), "success") or
               string.find(scriptName:lower(), "chance") then
               
                -- Заменяем все числовые константы меньше 100 на 100
                for constantIndex, constantValue in next, getconstants(v) do
                    if type(constantValue) == "number" and constantValue < 100 then
                        setconstant(v, constantIndex, 100)
                    end
                end
            end
        end
    end
end

-- Авто-спам улучшениями
spawn(function()
    while getgenv().MemoryHack and task.wait(0.5) do
        pcall(function()
            local player = game.Players.LocalPlayer
            for _, container in pairs({"Inventory", "Backpack", "Cards"}) do
                local items = player:FindFirstChild(container)
                if items then
                    for _, item in pairs(items:GetChildren()) do
                        -- Вызываем ВСЕ RemoteEvents
                        for _, remote in pairs(game:GetService("ReplicatedStorage"):GetDescendants()) do
                            if remote:IsA("RemoteEvent") then
                                for i = 1, 3 do
                                    remote:FireServer(item)
                                end
                            end
                        end
                    end
                end
            end
        end)
    end
end)

print("MEMORY HACK ACTIVATED - 100% SUCCESS GUARANTEED")
