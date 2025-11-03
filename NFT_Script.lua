-- NFT Battle 100% Upgrade Only
getgenv().UpgradeBot = true

local function HookUpgrade()
    local mt = getrawmetatable(game)
    local old = mt.__namecall
    
    setreadonly(mt, false)
    
    mt.__namecall = newcclosure(function(self, ...)
        local method = getnamecallmethod()
        local args = {...}
        
        if method == "InvokeServer" then
            if tostring(self) == "UpgradeItem" then
                -- Всегда возвращаем успех
                return true
            end
        end
        
        return old(self, ...)
    end)
    
    setreadonly(mt, true)
end

HookUpgrade()

print("100% Upgrade activated! All upgrades will succeed.")
