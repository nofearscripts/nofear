--// NoFear Hub OpenSrc Loader
--// nofear.up.railway.app | discord.gg/G9QSXsB9wY

local placeId = game.PlaceId

local scripts = {
    -- Rivals
    [6035872082]        = "https://raw.githubusercontent.com/nofearscripts/rval/refs/heads/main/main/main.lua",
    -- BloxStrike Main
    [114234929420007]   = "https://raw.githubusercontent.com/nofearscripts/b4st/refs/heads/main/main.lua",
    -- BlockSpin
    [104715542330896]   = "https://raw.githubusercontent.com/nofearscripts/bspin/refs/heads/main/main.lua",
    -- Star Fishing
    [86111605798689]    = "https://raw.githubusercontent.com/nofearscripts/strfsch/refs/heads/main/main.lua",
    -- Weird Gun Game
    [94590879393563]    = "https://raw.githubusercontent.com/nofearscripts/wrdggame/refs/heads/main/main.lua",
    -- Abyss
    [127794225497302]   = "https://raw.githubusercontent.com/nofearscripts/aby/refs/heads/main/main.lua",
}


local skinchangerGames = {
    [114234929420007] = "https://raw.githubusercontent.com/nofearscripts/bstrikeskinchanger/refs/heads/main/main.lua",
}

local url = scripts[placeId]
local skinUrl = skinchangerGames[placeId]

if url then
    local ok, err = pcall(function()
        loadstring(game:HttpGet(url))()
    end)
    if not ok then
        
    end
    
    if skinUrl then
        task.delay(1, function()
            pcall(function()
                loadstring(game:HttpGet(skinUrl))()
            end)
        end)
    end
else
    
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    pcall(function()
        local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
        local sg = Instance.new("ScreenGui")
        sg.Name = "NoFearNotSupported"
        sg.ResetOnSpawn = false
        sg.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        sg.Parent = PlayerGui

        local f = Instance.new("Frame", sg)
        f.Size = UDim2.new(0, 400, 0, 70)
        f.Position = UDim2.new(0.5, -200, 0, -80)
        f.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
        f.BorderSizePixel = 0
        f.ZIndex = 100
        Instance.new("UICorner", f).CornerRadius = UDim.new(0, 8)
        local stroke = Instance.new("UIStroke", f)
        stroke.Color = Color3.fromRGB(255, 107, 157)
        stroke.Thickness = 1.5
        stroke.Transparency = 0.3

        local t = Instance.new("TextLabel", f)
        t.Size = UDim2.new(1, -20, 1, 0)
        t.Position = UDim2.new(0, 10, 0, 0)
        t.BackgroundTransparency = 1
        t.Text = "⚠️ NoFear | Game not supported (PlaceId: " .. tostring(placeId) .. ")"
        t.TextColor3 = Color3.fromRGB(220, 220, 220)
        t.TextSize = 14
        t.Font = Enum.Font.GothamBold
        t.TextWrapped = true
        t.TextXAlignment = Enum.TextXAlignment.Center
        t.ZIndex = 101

        f:TweenPosition(UDim2.new(0.5, -200, 0, 20), Enum.EasingDirection.Out, Enum.EasingStyle.Back, 0.5, true)
        task.delay(5, function()
            if f and f.Parent then
                f:TweenPosition(UDim2.new(0.5, -200, 0, -80), Enum.EasingDirection.In, Enum.EasingStyle.Back, 0.5, true, function()
                    sg:Destroy()
                end)
            end
        end)
    end)
end
