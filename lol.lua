local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Ziheim51000/test/main/azurev4lib"))() 
local ThemeManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/Xirfull/Faith/main/ThemeManager"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/Ziheim51000/test/main/Save%20Manager"))()

local player = game.Players.LocalPlayer

-- List of user IDs considered as buyers
local Developers = {
    5257623427, -- Meeee
}


local function isBuyer(userId)
    for _, id in ipairs(Developers) do
        if userId == id then
            return true
        end
    end
    return false
end

local isUserBuyer = isBuyer(player.UserId)

-- Example library usage
local Window = Library:CreateWindow({
    Title = ('Faith<font color="#4517ff">.vip</font> | ' .. (isUserBuyer and "Dev Build" or "Buyer Build")),
    Center = true,
    AutoShow = true,
    TabPadding = 8,
    MenuFadeTime = 0.2 -- animation length when the UI is closed
})

local Tabs = { -- these are your tabs
   
    Aimbot = Window:AddTab('Legit'),
    ExtraSensoryPerception = Window:AddTab('Visuals'),
    ['UI Settings'] = Window:AddTab('UI Settings'),
}

local CamlockClient = Tabs.Aimbot:AddLeftGroupbox('Camlock') 
local SilentClient = Tabs.Aimbot:AddRightGroupbox('Silent Aim')
local esp = Tabs.ExtraSensoryPerception:AddRightGroupbox('Silent Aim')

CamlockClient:AddToggle('Camlock', {
    Text = 'This is a toggle',
    Default = false,
    Tooltip = 'This is a tooltip',
    Callback = function()
        local newValue = CamlockClient.Camlock.Value
        Faith.Visuals.EnableESP = newValue
        print("Toggle state changed to:", newValue)
        print("Faith.Visuals.EnableESP updated to:", Faith.Visuals.EnableESP)
    end  
})



ThemeManager:SetLibrary(Library)
ThemeManager:SetFolder('Faith.vip')
ThemeManager:ApplyToTab(Tabs['UI Settings']) -- if you gonna change UI Settings in the tabs you need to replace this as well for themes

SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({ 'MenuKeybind' })
SaveManager:SetFolder('YourCheat/games/'..game.PlaceId)
SaveManager:BuildConfigSection(Tabs['UI Settings'])
SaveManager:LoadAutoloadConfig()
