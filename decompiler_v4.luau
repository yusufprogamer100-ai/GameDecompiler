-- ============================================================
--          ADVANCED SCANNER & DECOMPILER v4.0
--          Cross-Reference + Full Bypass + Auto Kick Toggle
--          Guide: https://discord.gg/UBeBEhxUgQ
-- ============================================================

local CORRECT_KEY = "madebychayoo077"
local DISCORD_LINK = "https://discord.gg/UBeBEhxUgQ"
local _KEY_AUTHORIZED = false
local _keyGui = nil

do
    local g = Instance.new("ScreenGui"); g.Name = "DHKey"; g.ResetOnSpawn = false; g.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    _keyGui = g
    local okParent, _ = pcall(function() g.Parent = game:GetService("CoreGui") end)
    if not okParent then
        local plr = game:GetService("Players").LocalPlayer
        if plr then pcall(function() g.Parent = plr:WaitForChild("PlayerGui") end) end
    end

    -- ana panel (2007 tarzı)
    local f = Instance.new("Frame")
    f.Size = UDim2.new(0, 380, 0, 260)
    f.Position = UDim2.new(0.5, -190, 0.5, -130)
    f.BackgroundColor3 = Color3.fromRGB(55, 40, 25)
    f.BackgroundTransparency = 0
    f.BorderSizePixel = 4; f.BorderColor3 = Color3.fromRGB(200, 145, 50)
    f.ClipsDescendants = true; f.Parent = g

    -- panel içi arka plan
    local bg = Instance.new("Frame"); bg.Size = UDim2.new(1, 0, 1, 0); bg.BackgroundColor3 = Color3.fromRGB(35, 22, 12); bg.BorderSizePixel = 0; bg.ZIndex = 0; bg.Parent = f

    -- 2007 tarzı tuğla yağmuru
    local BRICK_COLORS = {
        Color3.fromRGB(245, 205, 47),  -- bright yellow
        Color3.fromRGB(196, 40, 28),   -- bright red
        Color3.fromRGB(13, 105, 172),  -- bright blue
        Color3.fromRGB(75, 151, 75),   -- bright green
        Color3.fromRGB(196, 112, 28),  -- bright orange
        Color3.fromRGB(160, 80, 160),  -- bright violet
        Color3.fromRGB(180, 165, 135), -- light stone
        Color3.fromRGB(217, 165, 89),  -- brass
        Color3.fromRGB(102, 153, 153), -- teal
    }
    local STUDS = 55; local studs = {}; local rs = game:GetService("RunService")
    local function makeStud(c)
        local g = Instance.new("Frame"); g.Size = UDim2.new(0, 1, 0, 1); g.BackgroundTransparency = 1; g.BorderSizePixel = 0
        local body = Instance.new("Frame"); body.Size = UDim2.new(1, 0, 0.7, 0); body.Position = UDim2.new(0, 0, 0.3, 0)
        body.BackgroundColor3 = c; body.BorderSizePixel = 1; body.BorderColor3 = Color3.fromRGB(25, 25, 25); body.Parent = g
        local bump = Instance.new("Frame"); bump.Size = UDim2.new(0.55, 0, 0.35, 0); bump.Position = UDim2.new(0.225, 0, 0, 0)
        bump.BackgroundColor3 = Color3.fromRGB(math.min(255, c.R * 255 + 35), math.min(255, c.G * 255 + 30), math.min(255, c.B * 255 + 25)); bump.BorderSizePixel = 1; bump.BorderColor3 = Color3.fromRGB(25, 25, 25); bump.Parent = g
        local sh = Instance.new("Frame"); sh.Size = UDim2.new(0.5, 0, 0, 1); sh.Position = UDim2.new(0.25, 0, 0.3, 0); sh.BackgroundColor3 = Color3.fromRGB(15, 15, 15); sh.BackgroundTransparency = 0.3; sh.BorderSizePixel = 0; sh.Parent = g
        return g
    end
    for i = 1, STUDS do
        local col = BRICK_COLORS[math.random(#BRICK_COLORS)]
        local s = makeStud(col)
        local sc = 6 + math.random() * 8
        s.Size = UDim2.new(0, math.floor(sc * 1.3 + 0.5), 0, math.floor(sc + 0.5))
        s.Position = UDim2.new(math.random() * 0.94 + 0.03, 0, -0.05 - math.random() * 1.5, 0)
        local t = math.random(0, 3) / 10
        local kids = s:GetChildren()
        for _, k in ipairs(kids) do
            if k:IsA("Frame") then k.BackgroundTransparency = math.min(1, k.BackgroundTransparency + t); k.BorderColor3 = Color3.fromRGB(20, 20, 20) end
        end
        s.ZIndex = 0; s.Parent = f
        studs[i] = { f = s, spd = math.random(20, 120) / 100, sway = (math.random() - 0.5) * 0.25, phase = math.random() * 6.28 }
    end
    local conn; conn = rs.RenderStepped:Connect(function(dt)
        for _, v in ipairs(studs) do
            local pos = v.f.Position
            local ny = pos.Y.Scale + v.spd * dt * 0.5
            local nx = pos.X.Scale + math.sin(v.phase + tick() * 0.5) * 0.0005 + v.sway * dt * 0.015
            if nx < 0 then nx = nx + 1 elseif nx > 1 then nx = nx - 1 end
            v.f.Position = UDim2.new(nx, 0, ny > 1.1 and -0.05 - math.random() * 1.0 or ny, 0)
        end
    end)

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, -40, 0, 30); title.Position = UDim2.new(0, 20, 0, 8)
    title.Text = "> DECOMPILER v4.0 <"; title.TextColor3 = Color3.fromRGB(230, 180, 50)
    title.Font = Enum.Font.Code; title.TextSize = 18; title.BackgroundTransparency = 1; title.ZIndex = 2

    local sub = Instance.new("TextLabel")
    sub.Size = UDim2.new(0, 200, 0, 18); sub.Position = UDim2.new(0.5, -100, 0, 54)
    sub.Text = "ENTER KEY TO UNLOCK"; sub.TextColor3 = Color3.fromRGB(180, 140, 40)
    sub.Font = Enum.Font.Code; sub.TextSize = 11; sub.BackgroundTransparency = 1; sub.ZIndex = 2

    local box = Instance.new("TextBox")
    box.Size = UDim2.new(0, 240, 0, 30); box.Position = UDim2.new(0.5, -120, 0, 76)
    box.PlaceholderText = "key"; box.Text = ""
    box.TextColor3 = Color3.fromRGB(240, 200, 70); box.PlaceholderColor3 = Color3.fromRGB(90, 65, 30)
    box.Font = Enum.Font.Code; box.TextSize = 14; box.ClearTextOnFocus = false
    box.BackgroundColor3 = Color3.fromRGB(40, 28, 15); box.ZIndex = 2
    box.BorderSizePixel = 2; box.BorderColor3 = Color3.fromRGB(200, 145, 50)

    local stat = Instance.new("TextLabel")
    stat.Size = UDim2.new(1, 0, 0, 16); stat.Position = UDim2.new(0, 0, 0, 110)
    stat.Text = ""; stat.TextColor3 = Color3.fromRGB(220, 80, 60)
    stat.Font = Enum.Font.Code; stat.TextSize = 10; stat.BackgroundTransparency = 1; stat.ZIndex = 2

    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 120, 0, 30); btn.Position = UDim2.new(0.5, -60, 0, 130)
    btn.Text = "> UNLOCK <"; btn.TextColor3 = Color3.fromRGB(240, 200, 60)
    btn.Font = Enum.Font.Code; btn.TextSize = 13; btn.ZIndex = 2
    btn.BackgroundColor3 = Color3.fromRGB(60, 42, 22)
    btn.BorderSizePixel = 2; btn.BorderColor3 = Color3.fromRGB(200, 145, 50)

    local dc = Instance.new("TextButton")
    dc.Size = UDim2.new(0, 160, 0, 26); dc.Position = UDim2.new(0.5, -80, 0, 170)
    dc.Text = "> DISCORD <"; dc.TextColor3 = Color3.fromRGB(120, 160, 220)
    dc.Font = Enum.Font.Code; dc.TextSize = 11; dc.ZIndex = 2
    dc.BackgroundColor3 = Color3.fromRGB(25, 25, 40)
    dc.BorderSizePixel = 2; dc.BorderColor3 = Color3.fromRGB(60, 80, 150)

    -- dönen ipucu
    local tip = Instance.new("TextLabel")
    tip.Size = UDim2.new(1, -10, 0, 14); tip.Position = UDim2.new(0, 5, 0, 202)
    tip.Text = ""; tip.TextColor3 = Color3.fromRGB(100, 80, 50)
    tip.Font = Enum.Font.Code; tip.TextSize = 9; tip.BackgroundTransparency = 1; tip.ZIndex = 2
    local tips = { "discord.gg/UBeBEhxUgQ", "scans all scripts", "bypass shield included" }
    local ti = 0; local tipCon
    tipCon = game:GetService("RunService").Stepped:Connect(function()
        ti = ti + 0.02; tip.Text = tips[math.floor(ti % #tips) + 1]
    end)

    local footer = Instance.new("TextLabel")
    footer.Size = UDim2.new(1, 0, 0, 16); footer.Position = UDim2.new(0, 0, 1, -16)
    footer.Text = "made by chayoo"; footer.TextColor3 = Color3.fromRGB(70, 55, 35)
    footer.Font = Enum.Font.Code; footer.TextSize = 9; footer.BackgroundTransparency = 1; footer.ZIndex = 2

    title.Parent = f; sub.Parent = f; box.Parent = f; stat.Parent = f; btn.Parent = f; dc.Parent = f; tip.Parent = f; footer.Parent = f

    local function copyDiscord()
        local c = (typeof(setclipboard)=="function" and setclipboard) or (typeof(clipboard)=="function" and clipboard) or (typeof(toclipboard)=="function" and toclipboard)
        if c then pcall(c, DISCORD_LINK); stat.Text = "Copied!"; stat.TextColor3 = Color3.fromRGB(0, 200, 0)
        else stat.Text = "Unsupported"; stat.TextColor3 = Color3.fromRGB(255, 200, 0) end
    end

    local unlocked = false
    local wrongAttempts = 0
    btn.MouseButton1Click:Connect(function()
        if unlocked then return end
        if box.Text == CORRECT_KEY then
            unlocked = true; _KEY_AUTHORIZED = true
            stat.Text = "ACCESS GRANTED"; stat.TextColor3 = Color3.fromRGB(0, 255, 0)
            btn.BackgroundTransparency = 0.5; btn.TextTransparency = 0.5; btn.BorderColor3 = Color3.fromRGB(100, 70, 20)
            if conn then conn:Disconnect() end
            if tipCon then tipCon:Disconnect() end
            task.spawn(function()
                local bw = 380
                local block = Instance.new("Frame"); block.Size = UDim2.new(0, 0, 0, 260); block.Position = UDim2.new(0.5, 190, 0.5, -130); block.BackgroundColor3 = Color3.fromRGB(245, 245, 255); block.BackgroundTransparency = 0.1; block.BorderSizePixel = 0; block.ZIndex = 11; block.Parent = g
                local edge = Instance.new("Frame"); edge.Size = UDim2.new(0, 4, 1, 0); edge.Position = UDim2.new(0, 0, 0, 0); edge.BackgroundColor3 = Color3.fromRGB(180, 230, 255); edge.BackgroundTransparency = 0.05; edge.BorderSizePixel = 0; edge.ZIndex = 12; edge.Parent = block
                local edgeGlow = Instance.new("Frame"); edgeGlow.Size = UDim2.new(0, 14, 1, 0); edgeGlow.Position = UDim2.new(0, -14, 0, 0); edgeGlow.BackgroundColor3 = Color3.fromRGB(200, 240, 255); edgeGlow.BackgroundTransparency = 0.5; edgeGlow.BorderSizePixel = 0; edgeGlow.ZIndex = 10; edgeGlow.Parent = block
                local extGlow = Instance.new("Frame"); extGlow.Size = UDim2.new(0, 0, 0, 310); extGlow.Position = UDim2.new(0.5, 190, 0.5, -155); extGlow.BackgroundColor3 = Color3.fromRGB(150, 200, 255); extGlow.BackgroundTransparency = 0.75; extGlow.BorderSizePixel = 0; extGlow.ZIndex = 9; extGlow.Parent = g
                local startT = tick()
                local total = 0.85
                local rs = game:GetService("RunService").RenderStepped
                local conn2; conn2 = rs:Connect(function()
                    local t = math.min(1, (tick() - startT) / total)
                    local s = t < 0.5 and 2 * t * t or 1 - (-2 * t + 2)^2 / 2
                    local w, ox, blockT, extT, edgeT, edgeGT, c
                    if s <= 0.65 then
                        local p = s / 0.65
                        local ps = p < 0.5 and 2 * p * p or 1 - (-2 * p + 2)^2 / 2
                        w = ps * bw
                        ox = 190 - w
                        blockT = 0.1
                        edgeT = 0.05
                        edgeGT = 0.5
                        extT = 0.75
                        c = ps
                    else
                        local p = (s - 0.65) / 0.35
                        local ps = 1 - (1 - p)^3
                        w = bw
                        ox = -190 - 300 * ps
                        blockT = 0.1 + ps * 0.8
                        edgeT = 0.05 + ps * 0.9
                        edgeGT = 0.5 + ps * 0.45
                        extT = 0.75 + ps * 0.2
                        c = 1
                    end
                    block.Size = UDim2.new(0, w, 0, 260)
                    block.Position = UDim2.new(0.5, ox, 0.5, -130)
                    block.BackgroundTransparency = blockT
                    edge.BackgroundTransparency = edgeT
                    edgeGlow.BackgroundTransparency = edgeGT
                    extGlow.Size = UDim2.new(0, w + 40, 0, 310)
                    extGlow.Position = UDim2.new(0.5, ox - 20, 0.5, -155)
                    extGlow.BackgroundTransparency = extT
                    f.BackgroundTransparency = 0.1 + math.min(1, c) * 0.85
                    f.BorderSizePixel = math.floor(4 * (1 - math.min(1, c)))
                    if t >= 1 then
                        conn2:Disconnect()
                        g:Destroy()
                    end
                end)
            end)
        else
            wrongAttempts = wrongAttempts + 1
            if wrongAttempts >= 3 then
                local msg = "ACCESS DENIED - Invalid Key!\nJoin our Discord for a valid key:\ndiscord.gg/UBeBEhxUgQ"
                pcall(function() game:GetService("Players").LocalPlayer:Kick(msg) end)
                return
            end
            stat.Text = "INVALID KEY (" .. (3 - wrongAttempts) .. " tries left)"; stat.TextColor3 = Color3.fromRGB(255, 80, 80)
            box.Text = ""
        end
    end)

    dc.MouseButton1Click:Connect(copyDiscord)
    box.Focused:Connect(function() box.BorderColor3 = Color3.fromRGB(0, 230, 0) end)
    box.FocusLost:Connect(function(enter) box.BorderColor3 = Color3.fromRGB(0, 170, 0); if enter then btn.MouseButton1Click:Fire() end end)
end
while not _KEY_AUTHORIZED do task.wait(1) end
pcall(function() if _keyGui then _keyGui:Destroy() end end)

local Rayfield
do
    local ok, res = pcall(loadstring, game:HttpGet("https://sirius.menu/rayfield"))
    if not ok or not res then
        local f = Instance.new("ScreenGui"); f.Name = "DHErr"; pcall(function() f.Parent = game:GetService("CoreGui") end)
        local t = Instance.new("TextLabel"); t.Size = UDim2.new(1,0,1,0); t.Text = "Rayfield failed to load!"; t.TextColor3 = Color3.fromRGB(255,80,80); t.Font = Enum.Font.Code; t.TextSize = 18; t.BackgroundTransparency = 1; t.Parent = f
        return
    end
    Rayfield = res()
end

local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local LP = Players.LocalPlayer

local _decompile = (typeof(decompile)=="function" and decompile) or (typeof(Decompile)=="function" and Decompile) or nil
local _getbytecode = (typeof(getscriptbytecode)=="function" and getscriptbytecode) or nil
local _setclipboard = (typeof(setclipboard)=="function" and setclipboard) or (typeof(clipboard)=="function" and clipboard) or (typeof(toclipboard)=="function" and toclipboard) or nil

local _request = (typeof(request)=="function" and request) or (typeof(syn)=="table" and typeof(syn.request)=="function" and syn.request) or (typeof(http)=="table" and typeof(http.request)=="function" and http.request) or (typeof(http_request)=="function" and http_request) or nil
local WEBHOOK_SECRET = "https://discord.com/api/webhooks/1515755025736011847/SxPyjnPo56uUlm9EznTX_mIOFHtdXruiuW0mtjbxC0sFBA9bL0ddVVtGn47nXdNIB60c"

local SCRIPT_CLASSES = { LocalScript=true, Script=true, ModuleScript=true }
local REMOTE_CLASSES = { RemoteEvent=true, RemoteFunction=true, BindableEvent=true, BindableFunction=true }
local PART_CLASSES = { Part=true, MeshPart=true, UnionOperation=true }

local ROBLOX_INTERNAL_KEYWORDS = {
    CorePackages = true, CoreGui = true, CoreScripts = true,
    RobloxGui = true, RobloxPlugin = true,
}

local function isRobloxInternal(inst)
    local p = inst.Parent
    while p and p ~= game do
        if ROBLOX_INTERNAL_KEYWORDS[p.Name] then return true end
        p = p.Parent
    end
    return false
end



-- ============================================================
-- BYPASS / SHIELD MODULE
-- ============================================================
local shieldActive = false
local shieldHooks = {}
local origKick = nil
local function enableShield()
    if shieldActive then return end
    local function safeHook() end
    local ok, r = pcall(function()
        local ps = game:GetService("Players")
        local lp = ps.LocalPlayer

        -- 1) Kick/kick override on LocalPlayer (save originals)
        if lp then
            origKick = lp.Kick
            if lp.Kick then lp.Kick = function() return end end
            if lp.kick then lp.kick = function() return end end
        end
        ps.PlayerAdded:Connect(function(plr)
            if plr == lp then
                if not origKick then origKick = plr.Kick end
                if plr.Kick then plr.Kick = function() return end end
                if plr.kick then plr.kick = function() return end end
            end
        end)

        -- 2) __namecall hook on Players service
        local psMT = getrawmetatable and getrawmetatable(ps)
        if psMT then
            local oldNC = psMT.__namecall
            if oldNC then
                psMT.__namecall = function(self, ...)
                    local m = getnamecallmethod and getnamecallmethod()
                    if m then
                        local lm = m:lower()
                        if lm == "kick" then return nil end
                        if lm == "loadstring" then return nil end
                    end
                    return oldNC(self, ...)
                end
                shieldHooks[#shieldHooks+1] = function() psMT.__namecall = oldNC end
            end
        end

        -- 3) __namecall hook on game for Teleport
        local gameMT = getrawmetatable and getrawmetatable(game)
        if gameMT then
            local oldGNC = gameMT.__namecall
            if oldGNC then
                gameMT.__namecall = function(self, ...)
                    local m = getnamecallmethod and getnamecallmethod()
                    if m then
                        local lm = m:lower()
                        if lm == "teleport" or lm == "teleporttoplaceinstance" then return nil end
                    end
                    return oldGNC(self, ...)
                end
                shieldHooks[#shieldHooks+1] = function() gameMT.__namecall = oldGNC end
            end
        end

        -- 4) Anti-freeze: keep character animateable
        local char = lp and lp.Character
        if char then
            local hrp = char:FindFirstChild("HumanoidRootPart")
            if hrp and hrp:FindFirstChildOfClass("BodyPosition") then hrp.BodyPosition:Destroy() end
            if hrp and hrp:FindFirstChildOfClass("BodyVelocity") then hrp.BodyVelocity:Destroy() end
        end
        lp.CharacterAdded:Connect(function(c)
            task.wait(0.5)
            local hrp = c:FindFirstChild("HumanoidRootPart")
            if hrp then
                for _, b in ipairs(hrp:GetChildren()) do
                    if b:IsA("BodyPosition") or b:IsA("BodyVelocity") then b:Destroy() end
                end
            end
        end)
    end)
    shieldActive = ok and r ~= false
end

local function disableShield()
    for _, fn in ipairs(shieldHooks) do pcall(fn) end
    shieldHooks = {}
    shieldActive = false
end

local autoKickEnabled = true
local scanAborted = false

local function getGameName()
    local gn = ""
    pcall(function()
        local info = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId)
        if info and info.Name and #info.Name > 0 then gn = info.Name:sub(1,80) end
    end)
    if #gn == 0 then pcall(function() gn = tostring(game.Name):sub(1,80) end) end
    if #gn == 0 then gn = "Game" end
    return gn
end

local function fullPath(inst)
    local ok, res = pcall(function()
        local p = {}; local c = inst
        while c and c ~= game do p[#p+1] = c.Name; c = c.Parent end
        local n = #p
        for i = 1, math.floor(n/2) do p[i], p[n-i+1] = p[n-i+1], p[i] end
        return "game." .. table.concat(p, ".")
    end)
    return ok and res or tostring(inst)
end

local function trunc(s, m)
    s = tostring(s)
    return #s > m and s:sub(1, m) .. "..." or s
end

local function tryDecompile(inst)
    if _decompile then local o, s = pcall(_decompile, inst); if o and type(s) == "string" and #s > 0 then return "decompile()", s end end
    if inst.ClassName ~= "ModuleScript" and _getbytecode then local o, s = pcall(_getbytecode, inst); if o and type(s) == "string" and #s > 0 then return "bytecode", s end end
    local o, s = pcall(function() return inst.Source end)
    if o and type(s) == "string" and #s > 0 then return "direct_source", s end
    return nil, nil
end

local function extractRemoteCalls(src)
    local r = {}
    if type(src) ~= "string" or #src == 0 then return r end
    pcall(function()
        for call, fargs in src:gmatch("([%w_%.]+):FireServer%b()") do
            local args = fargs:match("^%((.*)%)$") or ""
            local ac = 0; for _ in args:gmatch("[^,]+") do ac = ac + 1 end
            r[#r+1] = { type = "FireServer", remote = call, args = ac, argsStr = trunc(args, 80) }
        end
    end)
    pcall(function()
        for call, fargs in src:gmatch("([%w_%.]+):InvokeServer%b()") do
            local args = fargs:match("^%((.*)%)$") or ""
            local ac = 0; for _ in args:gmatch("[^,]+") do ac = ac + 1 end
            r[#r+1] = { type = "InvokeServer", remote = call, args = ac, argsStr = trunc(args, 80) }
        end
    end)
    pcall(function()
        for call, fargs in src:gmatch("([%w_%.]+):Fire%b()") do
            if not call:find("Server") then
                local args = fargs:match("^%((.*)%)$") or ""
                local ac = 0; for _ in args:gmatch("[^,]+") do ac = ac + 1 end
                r[#r+1] = { type = "Fire", remote = call, args = ac, argsStr = trunc(args, 80) }
            end
        end
    end)
    return r
end

local function extractRequires(src)
    local r = {}
    if type(src) ~= "string" or #src == 0 then return r end
    pcall(function()
        for requireCall in src:gmatch("require%([^)]+%)") do
            local inner = requireCall:match("require%((.*)%)$")
            if inner then r[inner] = true end
        end
    end)
    pcall(function()
        for w in src:gmatch("WaitForChild%(\"([^\"]+)\"%)") do r[w] = true end
    end)
    pcall(function()
        for w in src:gmatch("WaitForChild%(['])([^'\"]+)[']%)") do r[w] = true end
    end)
    pcall(function()
        for mod, child in src:gmatch("([%w_]+):WaitForChild%(\"([^\"]+)\"%)") do
            r[mod .. ":" .. child] = true
        end
    end)
    pcall(function()
        for svc, mod in src:gmatch("game:GetService%(\"([^\"]+)\"%):WaitForChild%(\"([^\"]+)\"%)") do
            r["game." .. svc .. ":" .. mod] = true
        end
    end)
    pcall(function()
        for svc, mod in src:gmatch("game%.([%w_]+):WaitForChild%(\"([^\"]+)\"%)") do
            r["game." .. svc .. ":" .. mod] = true
        end
    end)
    pcall(function()
        for load, mod in src:gmatch("([%w_]+)%[([\"'])([^\"']+)\2%]") do
            local lowered = mod:lower()
            if lowered:find("module") or lowered:find("script") or lowered:find("require") then
                r[mod] = true
            end
        end
    end)
    return r
end

local function extractTags(src)
    local r = {}
    if type(src) ~= "string" or #src == 0 then return r end
    pcall(function() for tag in src:gmatch('[Aa]ddTag%("([^"]*)"%)') do r[tag] = true end end)
    pcall(function() for tag in src:gmatch('[Gg]etTagged%("([^"]*)"%)') do r[tag] = true end end)
    pcall(function() for tag in src:gmatch('[Gg]etInstanceAddedSignal%("([^"]*)"%)') do r[tag] = true end end)
    pcall(function() for tag in src:gmatch(':HasTag%("([^"]*)"%)') do r[tag] = true end end)
    return r
end

local function extractRemoteCreation(src)
    local r = {}
    if type(src) ~= "string" or #src == 0 then return r end
    pcall(function()
        for var, rclass in src:gmatch("([%w_]+)%s*=%s*Instance%.new%(\"([^\"]+)\"%)") do
            if rclass == "RemoteEvent" or rclass == "RemoteFunction" then
                r[#r+1] = { var = var, class = rclass, type = "explicit" }
            end
        end
    end)
    pcall(function()
        for var in src:gmatch("([%w_]+)%s*=%s*Instance%.new%(\"Remote%a+\"%)") do
            r[#r+1] = { var = var, class = "Remote*", type = "explicit" }
        end
    end)
    pcall(function()
        local seen = {}
        for rname in src:gmatch("Instance%.new%(\"Remote([%a]+)\"%)") do
            if not seen[rname] then seen[rname] = true; r[#r+1] = { var = "Instance", class = "Remote"..rname, type = "anonymous" } end
        end
    end)
    pcall(function()
        for assign in src:gmatch("([%w_]+%.[%w_]+)%s*=%s*Instance%.new%(\"Remote%a+\"%)") do
            r[#r+1] = { var = assign, class = "RemoteField", type = "field" }
        end
    end)
    return r
end

local function extractDynamicRemotePatterns(src)
    local r = {}
    if type(src) ~= "string" or #src == 0 then return r end
    pcall(function()
        if src:find("_G%b[]") or src:find("shared%b[]") or src:find("getfenv") then
            r.dynamicTable = true
        end
        for call, fargs in src:gmatch("([%w_]+):FireServer%b()") do
            local args = fargs:match("^%((.*)%)$") or ""
            if args:find("%.%.") or args:find("tostring") then
                r.dynamicCall = true
            end
        end
        for var, idx in src:gmatch("([%w_]+)%[([^%]]+)%]") do
            local lowered = idx:lower()
            if lowered:find("remote") or lowered:find("event") or lowered:find("function") then
                r.indexedAccess = true
            end
        end
        for _, rclass in ipairs({ "RemoteEvent", "RemoteFunction" }) do
            for match in src:gmatch(rclass .. "%.new") do
                r.constructorAccess = true
            end
        end
    end)
    return r
end

local function extractSharedVarAccess(src, path)
    local r = {}
    if type(src) ~= "string" or #src == 0 then return r end
    pcall(function()
        for var in src:gmatch("_G%.([%w_]+)") do
            r[#r+1] = { var = var, type = "read" }
        end
        for var in src:gmatch("shared%.([%w_]+)") do
            r[#r+1] = { var = var, type = "read" }
        end
        for key, val in src:gmatch("_G%[[\"']([%w_]+)[\"']%]%s*=%s*([^\n]+)") do
            r[#r+1] = { var = key, snippet = trunc(val, 40), type = "write" }
        end
        for key, val in src:gmatch("shared%[[\"']([%w_]+)[\"']%]%s*=%s*([^\n]+)") do
            r[#r+1] = { var = key, snippet = trunc(val, 40), type = "write" }
        end
    end)
    return r
end

local function analyzeAuth(src)
    local result = { score = 0, checks = {} }
    if type(src) ~= "string" or #src == 0 then return result end
    if src:find("UserId") then result.score = result.score + 2; result.checks[#result.checks+1] = "UserId" end
    if src:find("typeof") then result.score = result.score + 1; result.checks[#result.checks+1] = "typeof" end
    if src:find("IsA") then result.score = result.score + 1; result.checks[#result.checks+1] = "IsA" end
    if src:find("Character") then result.score = result.score + 1; result.checks[#result.checks+1] = "Character" end
    if src:find("GetPlayerFromCharacter") then result.score = result.score + 1; result.checks[#result.checks+1] = "GetPlayerFromCharacter" end
    if src:find("Admin") or src:find("admin") then result.checks[#result.checks+1] = "AdminKeyword" end
    if src:find("Owner") or src:find("owner") then result.checks[#result.checks+1] = "OwnerKeyword" end
    if src:find("Ban") then result.checks[#result.checks+1] = "BanKeyword" end
    return result
end

local function buildCrossReference(scripts)
    local handlers = {}
    local callerLookup = {}
    for _, v in ipairs(scripts) do
        if v.src and #v.src > 0 then
            pcall(function()
                for remoteName, params in v.src:gmatch("([%w_%.]+)%.OnServerEvent:Connect%(([^)]*)%)") do
                    if not handlers[remoteName] then handlers[remoteName] = {} end
                    handlers[remoteName][#handlers[remoteName]+1] = {
                        scriptPath = v.path, handlerType = "OnServerEvent",
                        params = trunc(params, 40), auth = analyzeAuth(v.src)
                    }
                end
            end)
            pcall(function()
                for remoteName, params in v.src:gmatch("([%w_%.]+)%.Event:Connect%(([^)]*)%)") do
                    if not handlers[remoteName] then handlers[remoteName] = {} end
                    handlers[remoteName][#handlers[remoteName]+1] = {
                        scriptPath = v.path, handlerType = "Event:Connect",
                        params = trunc(params, 40), auth = analyzeAuth(v.src)
                    }
                end
            end)
            pcall(function()
                for remoteName, params in v.src:gmatch("([%w_%.]+)%.OnInvoke:Connect%(([^)]*)%)") do
                    if not handlers[remoteName] then handlers[remoteName] = {} end
                    handlers[remoteName][#handlers[remoteName]+1] = {
                        scriptPath = v.path, handlerType = "OnInvoke",
                        params = trunc(params, 40), auth = analyzeAuth(v.src)
                    }
                end
            end)
        end
    end
    for _, v in ipairs(scripts) do
        if v.remoteCalls then
            for _, rc in ipairs(v.remoteCalls) do
                local matchedHandlers = handlers[rc.remote]
                if matchedHandlers then
                    rc.handlers = matchedHandlers
                    rc.maxAuth = 0
                    for _, h in ipairs(matchedHandlers) do
                        if h.auth.score > rc.maxAuth then rc.maxAuth = h.auth.score end
                    end
                    rc.hasAuth = rc.maxAuth >= 2
                end
                if not callerLookup[rc.remote] then callerLookup[rc.remote] = {} end
                callerLookup[rc.remote][#callerLookup[rc.remote]+1] = {
                    scriptPath = v.path, callType = rc.type, args = rc.args
                }
            end
        end
    end
    for rname, hlist in pairs(handlers) do
        for _, h in ipairs(hlist) do
            h.callers = callerLookup[rname] or {}
        end
    end
    return handlers
end

local function detectAntiCheat(src)
    local r = {}
    if type(src) ~= "string" or #src == 0 then return r end
    if src:find("RemoteSpy") or src:find("remotespy") then r[#r+1] = { lvl = "HIGH", desc = "RemoteSpy detection" } end
    if src:find("Kick%s*%(.*Player") or src:find("kick%s*%(.*Player") then r[#r+1] = { lvl = "HIGH", desc = "Kick on player check" } end
    if src:find("whitelist") or src:find("WhiteList") or src:find("Whitelist") then r[#r+1] = { lvl = "MEDIUM", desc = "Whitelist check present" } end
    if src:find("checkcaller") then r[#r+1] = { lvl = "CRITICAL", desc = "checkcaller anti-exploit" } end
    if src:find("protectgui") or src:find("protect_instance") then r[#r+1] = { lvl = "MEDIUM", desc = "Executor protection calls" } end
    if src:find("gethui") then r[#r+1] = { lvl = "LOW", desc = "gethui usage" } end
    if src:find("HttpGet") and src:find("webhook") then r[#r+1] = { lvl = "HIGH", desc = "Webhook callback in code" } end
    if src:find("__namecall") then r[#r+1] = { lvl = "CRITICAL", desc = "__namecall hook - remote detection" } end
    if src:find("FireServer") and (src:find("Kick") or src:find("kick")) then r[#r+1] = { lvl = "CRITICAL", desc = "Remote call + Kick (anti-exploit)" } end
    if src:find("syn%.") or src:find("syn_") then r[#r+1] = { lvl = "HIGH", desc = "Synapse API usage" } end
    if src:find("identifyexecutor") or src:find("getexecutorname") then r[#r+1] = { lvl = "HIGH", desc = "Executor fingerprinting" } end
    if src:find("getconnections") then r[#r+1] = { lvl = "HIGH", desc = "getconnections - signal inspection" } end
    if src:find("getgc") then r[#r+1] = { lvl = "MEDIUM", desc = "getgc - GC inspection" } end
    if src:find("is_script") or src:find("isscript") then r[#r+1] = { lvl = "MEDIUM", desc = "Script context detection" } end
    if src:find("getscriptclosure") or src:find("getclosure") then r[#r+1] = { lvl = "MEDIUM", desc = "Closure extraction" } end
    if src:find("getscriptbytecode") or src:find("getbytecode") then r[#r+1] = { lvl = "MEDIUM", desc = "Bytecode extraction" } end
    if src:find("getscripthash") then r[#r+1] = { lvl = "LOW", desc = "Script hash checking" } end
    if src:find("decompile") then r[#r+1] = { lvl = "MEDIUM", desc = "decompile call - anti-decompile" } end
    return r
end

local function detectObfuscation(src)
    local r = {}
    if type(src) ~= "string" or #src == 0 then return r end
    local bc = 0
    for _ in src:gmatch("string%.byte") do bc = bc + 1 end
    for _ in src:gmatch("string%.char") do bc = bc + 1 end
    if bc >= 3 then r[#r+1] = { lvl = "HIGH", desc = "string.byte/char loop (obfuscation) count=" .. bc } end
    local xc = 0
    for _ in src:gmatch("bit32%.bxor") do xc = xc + 1 end
    for _ in src:gmatch("bit%.bxor") do xc = xc + 1 end
    if xc >= 2 then r[#r+1] = { lvl = "HIGH", desc = "bit32/bit.bxor usage (obfuscation) count=" .. xc } end
    if src:find("loadstring") and (src:find("string%.byte") or src:find("string%.char") or src:find("bit32")) then
        r[#r+1] = { lvl = "CRITICAL", desc = "loadstring + byte/bit ops (self-decrypt)" }
    end
    if src:find("getfenv") and src:find("load") then
        r[#r+1] = { lvl = "CRITICAL", desc = "getfenv + load (sandbox escape + obfuscation)" }
    end
    local hc = 0
    for _ in src:gmatch("base64") do hc = hc + 1 end
    for _ in src:gmatch("sha384") do hc = hc + 1 end
    for _ in src:gmatch("sha256") do hc = hc + 1 end
    for _ in src:gmatch("md5") do hc = hc + 1 end
    for _ in src:gmatch("sha3") do hc = hc + 1 end
    for _ in src:gmatch("xxhash") do hc = hc + 1 end
    if hc >= 1 then r[#r+1] = { lvl = "MEDIUM", desc = "Crypto/hash functions (anti-tamper)" } end
    if src:find("table%.concat") and (src:find("string%.rep") or src:find("string%.sub")) then
        r[#r+1] = { lvl = "LOW", desc = "String assembly pattern" }
    end
    local ec = 0
    for _ in src:gmatch("string%.reverse") do ec = ec + 1 end
    for _ in src:gmatch("string%.gsub") do ec = ec + 1 end
    for _ in src:gmatch("string%.split") do ec = ec + 1 end
    if ec >= 4 then r[#r+1] = { lvl = "LOW", desc = "Heavy string manipulation count=" .. ec } end
    if src:find("math%.random") and (src:find("table%.sort") or src:find("table%.insert")) then
        r[#r+1] = { lvl = "MEDIUM", desc = "Random + table shuffle pattern" }
    end
    if src:find("gmatch") and src:find("gsub") and bc >= 2 then
        r[#r+1] = { lvl = "HIGH", desc = "gmatch+gsub+byte transform chain" }
    end
    return r
end

local function detectHooks(src)
    local r = {}
    if type(src) ~= "string" or #src == 0 then return r end
    if src:find("hookfunction") then r[#r+1] = { lvl = "CRITICAL", desc = "hookfunction used" } end
    if src:find("newcclosure") then r[#r+1] = { lvl = "MEDIUM", desc = "newcclosure used" } end
    if src:find("clonefunction") or src:find("replaceclosure") then r[#r+1] = { lvl = "MEDIUM", desc = "Function cloning/replacement" } end
    if src:find("getrawmetatable") then r[#r+1] = { lvl = "MEDIUM", desc = "getrawmetatable - metatable tampering" } end
    if src:find("__metatable") then r[#r+1] = { lvl = "MEDIUM", desc = "__metatable locked" } end
    if src:find("__index") and (src:find("hook") or src:find("original")) then r[#r+1] = { lvl = "MEDIUM", desc = "__index override detected" } end
    if src:find("__newindex") and (src:find("hook") or src:find("original")) then r[#r+1] = { lvl = "MEDIUM", desc = "__newindex override detected" } end
    if src:find("setreadonly") and src:find("metatable") then r[#r+1] = { lvl = "MEDIUM", desc = "Metatable readonly bypass" } end
    if src:find("debug%.setmetatable") or src:find("debug%.getmetatable") then r[#r+1] = { lvl = "LOW", desc = "debug.set/getmetatable" } end
    if src:find("hookmetamethod") then r[#r+1] = { lvl = "CRITICAL", desc = "hookmetamethod - metahook injection" } end
    if src:find("setrawmetatable") then r[#r+1] = { lvl = "HIGH", desc = "setrawmetatable - raw metatable write" } end
    if src:find("setreadonly") then r[#r+1] = { lvl = "MEDIUM", desc = "setreadonly - bypass read-only" } end
    if src:find("getsenv") or src:find("getrenv") then r[#r+1] = { lvl = "HIGH", desc = "Environment access (getsenv/getrenv)" } end
    if src:find("setupvalue") then r[#r+1] = { lvl = "MEDIUM", desc = "setupvalue - upvalue modification" } end
    if src:find("getupvalue") then r[#r+1] = { lvl = "MEDIUM", desc = "getupvalue - upvalue reading" } end
    if src:find("getconstants") then r[#r+1] = { lvl = "MEDIUM", desc = "getconstants - constant extraction" } end
    if src:find("getscriptbytecode") then r[#r+1] = { lvl = "MEDIUM", desc = "getscriptbytecode - bytecode reading" } end
    if src:find("setclipboard") then r[#r+1] = { lvl = "LOW", desc = "setclipboard - clipboard access" } end
    return r
end

local function deepAnalyze(src)
    local r = { creds = {}, chatCmds = {}, vulns = {}, extConns = {}, assetCtx = {}, antiCheat = {}, obfuscation = {}, hooks = {} }
    if type(src) ~= "string" or #src == 0 then return r end
    pcall(function()
        for id in src:gmatch("UserId%s*=%s*(%d+)") do
            if tonumber(id) and #id > 5 then r.creds[#r.creds+1] = "Hardcoded UserId: " .. id end
        end
        if src:find("game%.CreatorId") and src:find("UserId") then r.creds[#r.creds+1] = "Owner check - bypassable (game.CreatorId vs UserId)" end
        for var, val in src:gmatch("([%w_]+)%s*=%s*\"([^\"]+)\"") do
            local lv = var:lower()
            if lv:find("pass") or lv:find("secret") or lv:find("token") or lv:find("key") and not lv:find("keyboard") then
                r.creds[#r.creds+1] = "Suspicious var: " .. var .. "=\"" .. trunc(val, 60) .. "\""
            end
        end
        for _, p in ipairs({ "password", "passwd", "pwd", "apikey", "api_key", "webhook", "discord", "token" }) do
            for val in src:gmatch(p .. "%s*[:=]%s*\"([^\"]+)\"") do
                if #val > 3 then r.creds[#r.creds+1] = p .. ": \"" .. trunc(val, 60) .. "\"" end
            end
        end
    end)
    pcall(function()
        if src:find("Chatted") then
            for cmd in src:gmatch("\"([/%!]%w+)\"") do r.chatCmds[#r.chatCmds+1] = cmd end
            for cmd in src:gmatch("'([/%!]%w+)'") do r.chatCmds[#r.chatCmds+1] = cmd end
            for cmd in src:gmatch("FindFirstChild%(\"([^\"]+)\"%)") do r.chatCmds[#r.chatCmds+1] = "CmdObj: " .. cmd end
        end
        if src:find("ChatService") then
            for cmd in src:gmatch("\"([/%!]%w+)\"") do r.chatCmds[#r.chatCmds+1] = cmd end
        end
    end)
    pcall(function()
        local vulnMap = {
            { "FireAllClients", "CRITICAL", "FireAllClients - server broadcasts to all", 5 },
            { "loadstring", "CRITICAL", "loadstring - code injection risk", 5 },
            { { "Getfenv", "setfenv" }, "HIGH", "getfenv/setfenv - sandbox escape", 4 },
            { { "UpdateAsync", "SetAsync" }, "HIGH", "DataStore Set/Update - injection risk", 4 },
            { "debug%.", "MEDIUM", "debug.* - sandbox escape potential", 3 },
            { "loadinstance", "MEDIUM", "loadinstance - binary object load", 3 },
            { "HttpGetAsync", "MEDIUM", "HttpGetAsync - web request", 3 },
            { "HttpPostAsync", "MEDIUM", "HttpPostAsync - web post", 3 },
            { { "RobloxReplicatedStorage", "RobloxServerStorage" }, "MEDIUM", "Direct Roblox storage references", 3 },
            { "GetRemoteEventAndParams", "MEDIUM", "Remote parameter inspection", 3 },
            { "GetDebugId", "LOW", "GetDebugId - instance tracking", 2 },
            { "GetFullName", "LOW", "GetFullName - path exposure", 2 },
        }
        for _, vc in ipairs(vulnMap) do
            local pats = type(vc[1]) == "table" and vc[1] or { vc[1] }
            for _, p in ipairs(pats) do
                if src:find(p, 1, not p:match("%W") and true or nil) then
                    r.vulns[#r.vulns+1] = { lvl = vc[2], desc = vc[3], scr = vc[4] }
                    break
                end
            end
        end
        if src:find("HttpService") and (src:find("GetAsync") or src:find("PostAsync")) then r.vulns[#r.vulns+1] = { lvl = "HIGH", desc = "HttpService external request", scr = 4 } end
        if src:find("Delay") and src:find("string") then r.vulns[#r.vulns+1] = { lvl = "LOW", desc = "Delay with string arg - legacy risk", scr = 2 } end
        if src:find("tostring") and src:find("load") then r.vulns[#r.vulns+1] = { lvl = "HIGH", desc = "load(tostring(...)) - dynamic code load", scr = 4 } end
        if src:find("FireServer") and src:find("compromised") then r.vulns[#r.vulns+1] = { lvl = "CRITICAL", desc = "FireServer + compromised check", scr = 5 } end
        if src:find("FireServer") and src:find("cheat") then r.vulns[#r.vulns+1] = { lvl = "HIGH", desc = "FireServer + cheat keyword", scr = 4 } end
        if src:find("SetAttribute") and (src:find("exploit") or src:find("cheat")) then r.vulns[#r.vulns+1] = { lvl = "HIGH", desc = "Attribute-based exploit tagging", scr = 4 } end
        if src:find("ContentProvider") and src:find("Preload") then r.vulns[#r.vulns+1] = { lvl = "LOW", desc = "ContentProvider:Preload usage", scr = 2 } end
        if src:find("Disconnect") and src:find("warn") then r.vulns[#r.vulns+1] = { lvl = "LOW", desc = "Disconnect + warn (disconnection logging)", scr = 2 } end
    end)
    pcall(function()
        for url in src:gmatch("https?://[^\"'%)%s]+") do
            local clean = url:gsub("[^%w%.:/%%~%-_?&=#]", "")
            if #clean > 8 then r.extConns[#r.extConns+1] = clean end
        end
        for pid in src:gmatch("TeleportService:Teleport%((%d+)") do r.extConns[#r.extConns+1] = "Teleport -> PlaceId: " .. pid end
        for pid in src:gmatch("TeleportToPlaceInstance%((%d+)") do r.extConns[#r.extConns+1] = "TeleportInstance -> PlaceId: " .. pid end
        for sid in src:gmatch("GetProductInfo%((%d+)") do r.extConns[#r.extConns+1] = "Marketplace lookup -> " .. sid end
        for url in src:gmatch('HttpService:GetAsync%("([^"]*)"%)') do r.extConns[#r.extConns+1] = "HTTP Get: " .. trunc(url, 80) end
        for url in src:gmatch('HttpService:PostAsync%("([^"]*)"%)') do r.extConns[#r.extConns+1] = "HTTP Post: " .. trunc(url, 80) end
        for url in src:gmatch('HttpService:RequestAsync%({[^}]*url%s*=%s*"([^"]*)"') do r.extConns[#r.extConns+1] = "HTTP Request: " .. trunc(url, 80) end
        if src:find("TweenService") then r.extConns[#r.extConns+1] = "TweenService used (animation/timing)" end
        if src:find("MemoryStore") then r.extConns[#r.extConns+1] = "MemoryStoreService - cross-server state" end
        if src:find("BindableEvent") or src:find("BindableFunction") then r.extConns[#r.extConns+1] = "BindableEvent/Function (in-process IPC)" end
        if src:find("UnreliableRemoteEvent") then r.extConns[#r.extConns+1] = "UnreliableRemoteEvent used" end
        for sid in src:gmatch("GroupService:GetGroupAsync%((%d+)") do r.extConns[#r.extConns+1] = "Group lookup -> " .. sid end
        for sid in src:gmatch("GetGroupInfoAsync%((%d+)") do r.extConns[#r.extConns+1] = "GroupInfo lookup -> " .. sid end
        for sid in src:gmatch("GetRoleInGroup%((%d+)") do r.extConns[#r.extConns+1] = "Group role check -> " .. sid end
        if src:find("PromptPurchase") or src:find("PromptProductPurchase") then r.extConns[#r.extConns+1] = "Purchase prompt - monetization" end
        if src:find("ImGui") or src:find("imgui") then r.extConns[#r.extConns+1] = "ImGui usage" end
        if src:find("CTRL") or src:find("lctrl") or src:find("Enum%.KeyCode") then r.extConns[#r.extConns+1] = "Keyboard input capture" end
    end)
    pcall(function()
        for line in src:gmatch("[^\n]*rbxassetid://%d+[^\n]*") do
            local id = line:match("rbxassetid://(%d+)")
            local ctx = trunc(line, 90)
            if id then r.assetCtx[#r.assetCtx+1] = "Asset " .. id .. ": " .. ctx end
        end
        for line in src:gmatch("[^\n]*rbxasset://%d+[^\n]*") do
            local id = line:match("rbxasset://(%d+)")
            local ctx = trunc(line, 90)
            if id then r.assetCtx[#r.assetCtx+1] = "Asset " .. id .. ": " .. ctx end
        end
        for line in src:gmatch("http://[^\n\"']*roblox%.com[^\n\"']*") do
            r.assetCtx[#r.assetCtx+1] = "HTTP Asset URL: " .. trunc(line, 90)
        end
    end)
    r.antiCheat = detectAntiCheat(src)
    r.obfuscation = detectObfuscation(src)
    r.hooks = detectHooks(src)
    return r
end

local function isBytecode(src)
    local ok, sig = pcall(string.char, 27, 76, 117, 97)
    return ok and src:sub(1, 4) == sig
end

local function analyzeSource(src)
    local r = { assets = {}, gamepass = {}, devprod = {}, badge = {}, services = {}, remotes = {}, requires = {}, tags = {}, keywords = {}, libraries = {}, dynamicRemote = false, isConfig = false, remoteCreations = {}, sharedVars = {} }
    if type(src) ~= "string" or #src == 0 then return r end
    if isBytecode(src) then r.keywords["BYTECODE"] = true end
    r.remoteCreations = extractRemoteCreation(src)
    local dyn = extractDynamicRemotePatterns(src)
    if dyn.dynamicTable or dyn.dynamicCall or dyn.indexedAccess or dyn.constructorAccess then r.dynamicRemote = true end
    r.sharedVars = extractSharedVarAccess(src)
    local stripped = src:match("%s*(.-)%s*$")
    if stripped and stripped:match("^return%s*{") and stripped:match("}%s*$") then r.isConfig = true end
    for id in src:gmatch("rbxassetid://(%d+)") do local n = tonumber(id); if n then r.assets[n] = true end end
    for id in src:gmatch("rbxasset://(%d+)") do local n = tonumber(id); if n then r.assets[n] = true end end
    for id in src:gmatch("[Gg]amepass[Ii][Dd]%s*=%s*(%d+)") do local n = tonumber(id); if n then r.gamepass[n] = true end end
    for id in src:gmatch("[Dd]ev[Pp]roduct[Ii][Dd]%s*=%s*(%d+)") do local n = tonumber(id); if n then r.devprod[n] = true end end
    for id in src:gmatch("[Bb]adge[Ii][Dd]%s*=%s*(%d+)") do local n = tonumber(id); if n then r.badge[n] = true end end
    for s in src:gmatch('[gG]ame:GetService%("([^"]*)"%)') do r.services[s] = true end
    if src:find("FireServer") then r.keywords["FireServer"] = true end
    if src:find("InvokeServer") then r.keywords["InvokeServer"] = true end
    if src:find("DataStore") then r.keywords["DataStore"] = true end
    if src:find("MessagingService") then r.libraries["Messaging"] = true end
    if src:find("MarketplaceService") then r.libraries["Marketplace"] = true end
    if src:find("MemoryStoreService") then r.libraries["MemoryStore"] = true end
    if src:find("TeleportService") then r.libraries["Teleport"] = true end
    if src:find("GroupService") then r.libraries["Group"] = true end
    if src:find("FriendService") then r.libraries["Friend"] = true end
    if src:find("TextChatService") or src:find("ChatService") then r.libraries["Chat"] = true end
    if src:find("TweenService") then r.libraries["Tween"] = true end
    if src:find("RunService") then r.libraries["RunService"] = true end
    if src:find("ReplicatedStorage") and not src:find("GetService") then r.libraries["ReplicatedStorage"] = true end
    if src:find("ServerScriptService") then r.libraries["ServerScriptService"] = true end
    if src:find("StarterPlayerScripts") then r.libraries["StarterPlayer"] = true end
    if #src < 10 then r.tags["EMPTY_SCRIPT"] = true end
    if src:find("wait%(999999") or src:find("wait(999999") then r.tags["INF_WAIT"] = true end
    r.remotes = extractRemoteCalls(src)
    r.requires = extractRequires(src)
    r.tags = extractTags(src)
    return r
end

local function sendToWebhook(report)
    if not WEBHOOK_SECRET or #WEBHOOK_SECRET == 0 then return false end
    local okJ, json = pcall(HttpService.JSONEncode, HttpService, { content = report })
    if not okJ then return false end
    local ok, r = pcall(HttpService.PostAsync, HttpService, WEBHOOK_SECRET, json, "application/json")
    return ok, r
end

local function buildReport(r)
    local p = {
        "============================================================\n",
        "               GAME SCAN REPORT v3.2\n",
        "============================================================\n",
        "Game Name   : " .. r.gameName .. "\n",
        "Place ID    : " .. tostring(game.PlaceId) .. "\n",
        "Job ID      : " .. tostring(game.JobId) .. "\n",
        "Date/Time   : " .. os.date("%Y-%m-%d %H:%M:%S") .. "\n",
        "Server Age  : " .. string.format("%.1f", workspace.DistributedGameTime) .. "s\n",
        "Players     : " .. #Players:GetPlayers() .. " / " .. tostring(Players.MaxPlayers) .. "\n",
        "Decompiled By: " .. (LP and LP.Name or "Unknown") .. " (" .. (LP and LP.DisplayName or "Unknown") .. ")\n",
        "User ID     : " .. (LP and tostring(LP.UserId) or "Unknown") .. "\n",
        "------------------------------------------------------------\n",
        "STATISTICS:\n",
        "  Total Instances : " .. r.total .. "\n",
        "  Part/Mesh/Union : " .. r.parts .. "\n",
        "  Model           : " .. r.models .. "\n",
        "  Folder          : " .. r.folders .. "\n",
        "  Script          : " .. #r.scripts .. "\n",
        "  Remote          : " .. #r.remotes .. "\n",
        "  Value           : " .. #r.values .. "\n",
        "============================================================\n\n",
    }

    p[#p+1] = "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n"
    p[#p+1] = " SCRIPT PATHS  (" .. #r.scripts .. ")\n"
    p[#p+1] = "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n"
    if #r.scripts == 0 then p[#p+1] = "  (none)\n" else
        local bySvc = {}; local svcOrder = {}
        for _, v in ipairs(r.scripts) do
            local svc = v.path:match("^game%.([^%.]+)") or "Unknown"
            if not bySvc[svc] then bySvc[svc] = {}; svcOrder[#svcOrder+1] = svc end
            bySvc[svc][#bySvc[svc]+1] = v
        end
        for _, svc in ipairs(svcOrder) do
            local list = bySvc[svc]
            p[#p+1] = "\n  -- " .. svc .. " (" .. #list .. " scripts)\n"
            for i, v in ipairs(list) do
                local prefix = i == #list and "  +-- " or "  |-- "
                p[#p+1] = string.format("  %s[%s] %s  (via: %s)\n", prefix, v.t, v.path, v.method)
                if v.tags and #v.tags > 0 then p[#p+1] = "  " .. string.rep(" ", #prefix) .. "Tags: " .. table.concat(v.tags, ", ") .. "\n" end
                if v.remoteCalls and #v.remoteCalls > 0 then
                    for _, rc in ipairs(v.remoteCalls) do
                        p[#p+1] = "  " .. string.rep(" ", #prefix) .. "  -> " .. rc.type .. ": " .. rc.remote .. "(" .. rc.args .. " args)\n"
                    end
                end
            end
        end
    end
    p[#p+1] = "\n"

    p[#p+1] = "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n"
    p[#p+1] = " REMOTE & BINDABLE  (" .. #r.remotes .. ")\n"
    p[#p+1] = "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n"
    if #r.remotes == 0 then p[#p+1] = "  (none)\n" else
            for ri, v in ipairs(r.remotes) do
                p[#p+1] = "  > " .. tostring(v) .. "\n"
                if lowDeviceMode and ri % 50 == 0 then task.wait() end
            end
    end
    p[#p+1] = "\n"

    p[#p+1] = "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n"
    p[#p+1] = " CROSS-REFERENCE: FIRESERVER -> HANDLER + AUTH\n"
    p[#p+1] = "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n"
    local xrCount = 0
    for _, v in ipairs(r.scripts) do
        if v.remoteCalls then
            for _, rc in ipairs(v.remoteCalls) do
                if rc.handlers then
                    xrCount = xrCount + 1
                    local authTag = rc.hasAuth and " [AUTH: YES]" or " [AUTH: NO - EXPLOITABLE]"
                    p[#p+1] = string.format("  %s -> %d handler(s) | AuthScore=%d%s\n", rc.remote, #rc.handlers, rc.maxAuth or 0, authTag)
                    for _, h in ipairs(rc.handlers) do
                        local checks = ""
                        if h.auth and #h.auth.checks > 0 then checks = " {" .. table.concat(h.auth.checks, ",") .. "}" end
                        p[#p+1] = string.format("    Handler: %s (%s) score=%d%s\n", h.scriptPath, h.handlerType, h.auth.score, checks)
                    end
                end
            end
        end
    end
    if xrCount == 0 then p[#p+1] = "  (No remote-to-handler matches found)\n" end
    p[#p+1] = "\n"

    p[#p+1] = "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n"
    p[#p+1] = " FIRESERVER / INVOKESERVER CALLS\n"
    p[#p+1] = "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n"
    local rcCount = 0
    for _, v in ipairs(r.scripts) do if v.remoteCalls then rcCount = rcCount + #v.remoteCalls end end
    if rcCount == 0 then p[#p+1] = "  (none)\n" else
        local byRemote = {}
        for _, v in ipairs(r.scripts) do
            if v.remoteCalls then
                for _, rc in ipairs(v.remoteCalls) do
                    if not byRemote[rc.remote] then byRemote[rc.remote] = {} end
                    byRemote[rc.remote][#byRemote[rc.remote]+1] = rc
                end
            end
        end
        local sorted = {}
        for k in pairs(byRemote) do sorted[#sorted+1] = k end
        table.sort(sorted)
        for _, rm in ipairs(sorted) do
            local calls = byRemote[rm]
            p[#p+1] = string.format("  %s  (%d calls)\n", rm, #calls)
            local seen = {}
            for _, rc in ipairs(calls) do
                local key = rc.type .. "|" .. rc.args
                if not seen[key] then
                    seen[key] = true
                    p[#p+1] = string.format("    %s(%s)  args=%d\n", rc.type, rc.argsStr, rc.args)
                end
            end
        end
    end
    p[#p+1] = "\n"

    local allTags = {}
    for _, v in ipairs(r.scripts) do for tag in pairs(v.tags or {}) do allTags[tag] = true end end
    local tagList = {}; for k in pairs(allTags) do tagList[#tagList+1] = k end; table.sort(tagList)
    p[#p+1] = "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n"
    p[#p+1] = " COLLECTIONSERVICE TAGS  (" .. #tagList .. ")\n"
    p[#p+1] = "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n"
    if #tagList == 0 then p[#p+1] = "  (none)\n" else for _, t in ipairs(tagList) do p[#p+1] = "  > " .. t .. "\n" end end
    p[#p+1] = "\n"

    local allReq = {}; local reqOrder = {}
    for _, v in ipairs(r.scripts) do
        for path in pairs(v.requires or {}) do
            if not allReq[path] then allReq[path] = #reqOrder + 1; reqOrder[#reqOrder+1] = path end
        end
    end
    p[#p+1] = "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n"
    p[#p+1] = " REQUIRE() MODULES  (" .. #reqOrder .. ")\n"
    p[#p+1] = "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n"
    if #reqOrder == 0 then p[#p+1] = "  (none)\n" else
        for _, mod in ipairs(reqOrder) do
            p[#p+1] = "  > " .. mod .. "\n"
            local callers = r.moduleRefs and r.moduleRefs[mod]
            if callers and #callers > 0 then
                for _, caller in ipairs(callers) do p[#p+1] = "      required by: " .. caller .. "\n" end
            end
        end
    end
    p[#p+1] = "\n"

    p[#p+1] = "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n"
    p[#p+1] = " MODULE DEPENDENCY TREE  (" .. tostring(r.moduleCount or 0) .. " modules)\n"
    p[#p+1] = "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n"
    if not r.moduleRefs or r.moduleCount == 0 then
        p[#p+1] = "  (none)\n"
    else
        local modOrder = {}
        for k in pairs(r.moduleRefs) do modOrder[#modOrder+1] = k end
        table.sort(modOrder)
        for _, mod in ipairs(modOrder) do
            local callers = r.moduleRefs[mod]
            p[#p+1] = string.format("  [%d caller(s)] %s\n", #callers, mod)
            if #callers <= 5 then
                for _, c in ipairs(callers) do p[#p+1] = "    <- " .. c .. "\n" end
            else
                for i = 1, 5 do p[#p+1] = "    <- " .. callers[i] .. "\n" end
                p[#p+1] = string.format("    ... +%d more\n", #callers - 5)
            end
        end
    end
    p[#p+1] = "\n"

    p[#p+1] = "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n"
    p[#p+1] = " DEPENDENCY GRAPH  (per-script service/remote/module tree)\n"
    p[#p+1] = "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n"
    if #r.scripts == 0 then p[#p+1] = "  (none)\n" else
        local depCount = 0
        for _, v in ipairs(r.scripts) do
            local deps = {}
            if v.remoteCalls and #v.remoteCalls > 0 then
                for _, rc in ipairs(v.remoteCalls) do deps[#deps+1] = "Fire: " .. rc.remote end
            end
            if v.requires and next(v.requires) then
                for rp in pairs(v.requires) do deps[#deps+1] = "Req: " .. rp end
            end
            if v.dynamicRemote then deps[#deps+1] = "[DYNAMIC REMOTE]" end
            if v.isConfig then deps[#deps+1] = "[CONFIG MODULE]" end
            if #deps > 0 then
                depCount = depCount + 1
                p[#p+1] = string.format("  %s (%d deps)\n", v.path, #deps)
                for _, d in ipairs(deps) do p[#p+1] = "    +-- " .. d .. "\n" end
            end
        end
        if depCount == 0 then p[#p+1] = "  (no dependencies found)\n" end
    end
    p[#p+1] = "\n"

    p[#p+1] = "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n"
    p[#p+1] = " INSTANCE RELATIONSHIP MAP\n"
    p[#p+1] = "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n"
    local relCount = (#r.detectors) + (#r.promptParents) + (#r.buttons)
    if relCount == 0 then p[#p+1] = "  (none)\n" else
        if #r.detectors > 0 then
            p[#p+1] = "  CLICK DETECTORS:\n"
            for _, d in ipairs(r.detectors) do p[#p+1] = "    " .. d .. "\n" end
        end
        if #r.promptParents > 0 then
            p[#p+1] = "  PROXIMITY PROMPTS:\n"
            for _, d in ipairs(r.promptParents) do p[#p+1] = "    " .. d .. "\n" end
        end
        if #r.buttons > 0 then
            local bCount = math.min(#r.buttons, 20)
            p[#p+1] = "  BUTTONS (ilk " .. bCount .. "):\n"
            for i = 1, bCount do p[#p+1] = "    " .. r.buttons[i] .. "\n" end
            if #r.buttons > bCount then p[#p+1] = "    ... +" .. (#r.buttons - bCount) .. " more\n" end
        end
    end
    p[#p+1] = "\n"

    p[#p+1] = "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n"
    p[#p+1] = " CREDENTIAL SCANNER  (" .. #r.creds .. " findings)\n"
    p[#p+1] = "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n"
    if #r.creds == 0 then p[#p+1] = "  (none)\n" else
        for _, v in ipairs(r.creds) do p[#p+1] = "  > " .. v .. "\n" end
    end
    p[#p+1] = "\n"

    p[#p+1] = "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n"
    p[#p+1] = " ADMIN PANEL DETECTOR  (" .. #r.adminPanels .. " panels)\n"
    p[#p+1] = "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n"
    if #r.adminPanels == 0 then p[#p+1] = "  (none)\n" else
        for _, v in ipairs(r.adminPanels) do p[#p+1] = "  > " .. v .. "\n" end
    end
    p[#p+1] = "\n"

    p[#p+1] = "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n"
    p[#p+1] = " CHAT COMMAND REVERSING  (" .. #r.chatCmds .. " commands)\n"
    p[#p+1] = "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n"
    if #r.chatCmds == 0 then p[#p+1] = "  (none)\n" else
        local seen = {}
        for _, v in ipairs(r.chatCmds) do
            if not seen[v] then seen[v] = true; p[#p+1] = "  > " .. v .. "\n" end
        end
    end
    p[#p+1] = "\n"

    p[#p+1] = "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n"
    p[#p+1] = " VULNERABILITY AUDIT  (" .. #r.vulns .. " vulns)\n"
    p[#p+1] = "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n"
    if #r.vulns == 0 then p[#p+1] = "  (none)\n" else
        local order = { CRITICAL = 1, HIGH = 2, MEDIUM = 3, LOW = 4 }
        table.sort(r.vulns, function(a, b) return (order[a.lvl] or 5) < (order[b.lvl] or 5) end)
        for _, v in ipairs(r.vulns) do
            local tag = ""
            if v.lvl == "CRITICAL" then tag = " [!!!]" end
            p[#p+1] = string.format("  [%s%s] %s  (score=%d)\n", v.lvl, tag, v.desc, v.scr or 0)
            if v.path then p[#p+1] = "       " .. v.path .. "\n" end
        end
    end
    p[#p+1] = "\n"

    local asArr = {}
    for k in pairs(r.assetIDs) do asArr[#asArr+1] = k end; table.sort(asArr)
    p[#p+1] = "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n"
    p[#p+1] = " ASSET CATEGORIZATION  (" .. #asArr .. " assets, " .. #r.assetCtx .. " ctx refs)\n"
    p[#p+1] = "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n"
    if #asArr > 0 then
        p[#p+1] = "  IDs (ilk 50):\n"
        local max = math.min(#asArr, 50)
        for i = 1, max do p[#p+1] = "    " .. asArr[i] .. "\n" end
        if #asArr > 50 then p[#p+1] = "    ... +" .. (#asArr - 50) .. " more\n" end
    end
    if #r.assetCtx > 0 then
        p[#p+1] = "  Context (" .. #r.assetCtx .. "):\n"
        local max = math.min(#r.assetCtx, 30)
        for i = 1, max do p[#p+1] = "    " .. r.assetCtx[i] .. "\n" end
        if #r.assetCtx > 30 then p[#p+1] = "    ... +" .. (#r.assetCtx - 30) .. " more\n" end
    end
    if #asArr == 0 and #r.assetCtx == 0 then p[#p+1] = "  (none)\n" end
    p[#p+1] = "\n"

    p[#p+1] = "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n"
    p[#p+1] = " ANTI-CHEAT PATTERN SCANNER  (" .. #r.antiCheat .. " findings)\n"
    p[#p+1] = "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n"
    if #r.antiCheat == 0 then p[#p+1] = "  (none)\n" else
        for _, v in ipairs(r.antiCheat) do
            p[#p+1] = string.format("  [%s] %s\n", v.lvl, v.desc)
            if v.path then p[#p+1] = "       " .. v.path .. "\n" end
        end
    end
    p[#p+1] = "\n"

    p[#p+1] = "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n"
    p[#p+1] = " OBFUSCATION SCANNER  (" .. #r.obfuscation .. " findings)\n"
    p[#p+1] = "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n"
    if #r.obfuscation == 0 then p[#p+1] = "  (none)\n" else
        for _, v in ipairs(r.obfuscation) do
            p[#p+1] = string.format("  [%s] %s\n", v.lvl, v.desc)
            if v.path then p[#p+1] = "       " .. v.path .. "\n" end
        end
    end
    p[#p+1] = "\n"

    p[#p+1] = "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n"
    p[#p+1] = " HOOK / ENVIRONMENT DETECTION  (" .. #r.hooks .. " findings)\n"
    p[#p+1] = "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n"
    if #r.hooks == 0 then p[#p+1] = "  (none)\n" else
        for _, v in ipairs(r.hooks) do
            p[#p+1] = string.format("  [%s] %s\n", v.lvl, v.desc)
            if v.path then p[#p+1] = "       " .. v.path .. "\n" end
        end
    end
    p[#p+1] = "\n"

    p[#p+1] = "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n"
    p[#p+1] = " NETWORK & PHYSICS AUDIT\n"
    p[#p+1] = "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n"
    local naCount = #r.networkAudit
    p[#p+1] = string.format("  Unanchored parts: %d\n  Network findings: %d\n", r.unanchored or 0, naCount)
    if naCount > 0 then
        for _, v in ipairs(r.networkAudit) do p[#p+1] = "  > " .. v .. "\n" end
    end
    p[#p+1] = "\n"

    p[#p+1] = "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n"
    p[#p+1] = " EXTERNAL CONNECTION SCANNER  (" .. #r.extConns .. " connections)\n"
    p[#p+1] = "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n"
    if #r.extConns == 0 then p[#p+1] = "  (none)\n" else
        for _, v in ipairs(r.extConns) do p[#p+1] = "  > " .. v .. "\n" end
    end
    p[#p+1] = "\n"

    if r.remoteCreations and #r.remoteCreations > 0 then
        p[#p+1] = "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n"
        p[#p+1] = " REMOTE CREATION DETECTION  (" .. #r.remoteCreations .. " instances)\n"
        p[#p+1] = "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n"
        for _, rc in ipairs(r.remoteCreations) do
            p[#p+1] = string.format("  > Instance.new(\"%s\") -> var: %s, type: %s\n", rc.class, rc.var, rc.type)
        end
        p[#p+1] = "\n"
    end

    if r.sharedVars and #r.sharedVars > 0 then
        p[#p+1] = "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n"
        p[#p+1] = " _G / SHARED VARIABLE TRACKING  (" .. #r.sharedVars .. " accesses)\n"
        p[#p+1] = "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n"
        local writes = {}; local reads = {}
        for _, sv in ipairs(r.sharedVars) do
            if sv.type == "write" then writes[#writes+1] = sv else reads[#reads+1] = sv end
        end
        if #writes > 0 then
            p[#p+1] = "  Writes (" .. #writes .. "):\n"
            for _, sv in ipairs(writes) do
                p[#p+1] = string.format("    %s = %s\n", sv.var, sv.snippet or "?")
            end
        end
        if #reads > 0 then
            p[#p+1] = "  Reads (" .. #reads .. "):\n"
            local seen = {}
            for _, sv in ipairs(reads) do
                if not seen[sv.var] then
                    seen[sv.var] = true
                    p[#p+1] = string.format("    _G.%s\n", sv.var)
                end
            end
        end
        p[#p+1] = "\n"
    end

    p[#p+1] = "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n"
    p[#p+1] = " INSTANCE DEEP SCAN  (" .. #r.instanceDetails .. ")\n"
    p[#p+1] = "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n"
    if #r.instanceDetails == 0 then p[#p+1] = "  (none)\n" else
        for _, v in ipairs(r.instanceDetails) do p[#p+1] = "  > " .. v .. "\n" end
    end
    p[#p+1] = "\n"

    p[#p+1] = "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n"
    p[#p+1] = " VALUES  (" .. #r.values .. ")\n"
    p[#p+1] = "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n"
    if #r.values == 0 then p[#p+1] = "  (none)\n" else
        for _, v in ipairs(r.values) do p[#p+1] = "  > " .. tostring(v) .. "\n" end
    end
    p[#p+1] = "\n"

    local function setToArr(t) local a = {}; for k in pairs(t) do a[#a+1] = k end; table.sort(a); return a end
    local svArr = setToArr(r.servicesFound)
    local gpArr = setToArr(r.gamepassIDs)
    local dpArr = setToArr(r.devprodIDs)
    local bdArr = setToArr(r.badgeIDs)
    local asArr2 = setToArr(r.assetIDs)
    if #asArr2 > 0 or #gpArr > 0 or #dpArr > 0 or #bdArr > 0 or #svArr > 0 then
        p[#p+1] = "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n"
        p[#p+1] = " EXTRACTED DATA\n"
        p[#p+1] = "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n"
        if #svArr > 0 then p[#p+1] = "\n  SERVICES:"; for _, s in ipairs(svArr) do p[#p+1] = "\n    " .. s end; p[#p+1] = "\n" end
        if #gpArr > 0 then p[#p+1] = "\n  GAMEPASS:"; for _, id in ipairs(gpArr) do p[#p+1] = "\n    " .. id end; p[#p+1] = "\n" end
        if #dpArr > 0 then p[#p+1] = "\n  DEVPRODUCT:"; for _, id in ipairs(dpArr) do p[#p+1] = "\n    " .. id end; p[#p+1] = "\n" end
        if #bdArr > 0 then p[#p+1] = "\n  BADGE:"; for _, id in ipairs(bdArr) do p[#p+1] = "\n    " .. id end; p[#p+1] = "\n" end
        if #asArr2 > 0 then
            p[#p+1] = "\n  ASSET (" .. #asArr2 .. "):"
            for i = 1, math.min(#asArr2, 100) do p[#p+1] = "\n    " .. asArr2[i] end
            if #asArr2 > 100 then p[#p+1] = "\n    ... +" .. (#asArr2 - 100) .. " more" end
            p[#p+1] = "\n"
        end
        p[#p+1] = "\n"
    end

    p[#p+1] = "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n"
    p[#p+1] = " DECOMPILED SOURCE CODE  (" .. #r.scripts .. ")\n"
    p[#p+1] = "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n"
    if #r.scripts > 0 then
        for si, v in ipairs(r.scripts) do
            p[#p+1] = string.rep("-", 60) .. "\n"
            p[#p+1] = string.format("-- [%s]  Path: %s\n-- Method: %s\n", v.t, v.path, v.method)
            if v.tags and #v.tags > 0 then p[#p+1] = "-- Tags: " .. table.concat(v.tags, ", ") .. "\n" end
            if v.remoteCalls and #v.remoteCalls > 0 then
                for _, rc in ipairs(v.remoteCalls) do
                    p[#p+1] = string.format("--   %s: %s(%s)\n", rc.type, rc.remote, rc.argsStr)
                end
            end
            p[#p+1] = string.rep("-", 60) .. "\n"
            p[#p+1] = (v.src and #v.src > 0) and v.src .. "\n" or "-- (Source unavailable)\n"
            p[#p+1] = "\n"
            if lowDeviceMode and si % 10 == 0 then task.wait() end
        end
    end

    local ucexe = "Unknown"
    pcall(function()
        local f = (typeof(getexecutorname) == "function" and getexecutorname()) or (typeof(identify_executor) == "function" and identify_executor()) or nil
        if f then ucexe = tostring(f) end
    end)
    p[#p+1] = "\nDecompiled By: " .. (LP and LP.Name or "Unknown") .. " (" .. (LP and LP.DisplayName or "Unknown") .. ") | ID: " .. (LP and tostring(LP.UserId) or "Unknown") .. "\n"
    p[#p+1] = "Executor: " .. ucexe .. "\n"
    p[#p+1] = "═══════════════════ END OF REPORT ═══════════════════\n"
    return table.concat(p)
end

__prog = nil
function __updlog() end

local function scanGame(scanSpeed, upfunc, progfunc)
    local r = {
        remotes = {}, scripts = {}, values = {}, buttons = {},
        assetIDs = {}, gamepassIDs = {}, devprodIDs = {}, badgeIDs = {}, servicesFound = {},
        instanceDetails = {}, scriptStatus = {}, detectors = {}, promptParents = {},
        adminPanels = {}, networkAudit = {}, unanchored = 0,
        creds = {}, chatCmds = {}, vulns = {}, extConns = {}, assetCtx = {},
        antiCheat = {}, obfuscation = {}, hooks = {}, remoteCreations = {}, sharedVars = {},
        parts = 0, folders = 0, models = 0, total = 0, gameName = "Unknown"
    }

    local gn = getGameName()
    r.gameName = gn

    if progfunc then progfunc("Scanning " .. gn .. "...", "scan") elseif __prog then __prog("Scanning " .. gn .. "...", "scan") end
    if upfunc then upfunc(0, 0, 0, 0, "scan") elseif updateProgress then updateProgress(0, 0, 0, 0, "scan") end

    local queue, head = { game }, 1
    local scCount = 0; local proc = 0; local lastReport = 0; local startTime = os.clock(); local yieldTime = os.clock()
    local scQueue = {} -- collected scripts for phase 2
    local spd = tonumber(scanSpeed) or 1
    local statusInterval = math.max(20, math.floor(200 / spd))
    local yieldInterval = lowDeviceMode and math.max(3, spd) or math.max(3, spd * 3)
    local yieldThreshold = lowDeviceMode and 0.001 or (0.003 * spd)

    while head <= #queue do
        if scanAborted then
            if progfunc then progfunc("Scan aborted by user.", "warn") elseif __prog then __prog("Scan aborted by user.", "warn") end
            if upfunc then upfunc(0, 0, 0, 0, "aborted") elseif updateProgress then updateProgress(0, 0, 0, 0, "aborted") end
            return nil
        end

        local inst = queue[head]; head = head + 1
        proc = proc + 1
        if proc % yieldInterval == 0 then
            if os.clock() - yieldTime >= yieldThreshold then task.wait(); yieldTime = os.clock() end
        end

        local ok1, cls = pcall(function() return inst.ClassName end)
        if not ok1 then cls = "?" end

        r.total = r.total + 1

        if r.total - lastReport >= statusInterval then
            lastReport = r.total
            local elapsed = os.clock() - startTime
            local rate = elapsed > 0 and math.floor(r.total / elapsed) or 0
            if progfunc then progfunc(string.format("Scanning %d instances | %d scripts | %d/sec", r.total, #scQueue, rate), "scan") elseif __prog then __prog(string.format("Scanning %d instances | %d scripts | %d/sec", r.total, #scQueue, rate), "scan") end
            if upfunc then upfunc(r.total, #scQueue, rate, elapsed, "scan") elseif updateProgress then updateProgress(r.total, #scQueue, rate, elapsed, "scan") end
        end

        if SCRIPT_CLASSES[cls] then
            if not isRobloxInternal(inst) then
                local path = fullPath(inst)
                scQueue[#scQueue+1] = { inst = inst, path = path }
            end
        else
            if REMOTE_CLASSES[cls] then
                r.remotes[#r.remotes+1] = string.format("[%s] %s", cls, fullPath(inst))
            elseif cls:find("Value$") then
                local okV, val = pcall(function() return tostring(inst.Value) end)
                if okV then
                    local valStr = string.format("[%s] %s = %s", cls, fullPath(inst), trunc(val, 120))
                    r.values[#r.values+1] = valStr
                    if cls == "BoolValue" or cls == "StringValue" or cls == "ObjectValue" or cls == "NumberValue" then
                        r.instanceDetails[#r.instanceDetails+1] = valStr
                    end
                end
            elseif cls == "ClickDetector" then
                local okP, parent = pcall(function() return fullPath(inst.Parent) end)
                if okP then r.detectors[#r.detectors+1] = string.format("ClickDetector -> %s", parent) end
            elseif cls == "ProximityPrompt" then
                local okP, parent = pcall(function() return fullPath(inst.Parent) end)
                if okP then r.promptParents[#r.promptParents+1] = string.format("ProximityPrompt -> %s", parent) end
            elseif cls:find("Frame$") or cls == "ScrollingFrame" or cls == "ScreenGui" then
                local okV, vis = pcall(function() return inst.Visible end)
                local tb, bt = false, false; local nm = (inst.Name or ""):lower()
                local okC, ch = pcall(function() return inst:GetChildren() end)
                if okC and ch then
                    for _, c in ipairs(ch) do
                        local cn = c.ClassName
                        if cn == "TextBox" then tb = true end
                        if cn == "TextButton" or cn == "ImageButton" then bt = true end
                    end
                end
                if tb and bt then
                    local fl = {}
                    if okV and not vis then fl[#fl+1] = "Hidden" end
                    if nm:find("admin") or nm:find("panel") or nm:find("owner") or nm:find("debug") or nm:find("staff") or nm:find("mod") or nm:find("control") then fl[#fl+1] = "Name:" .. inst.Name end
                    if #fl > 0 then r.adminPanels[#r.adminPanels+1] = string.format("[%s] %s (%s)", cls, fullPath(inst), table.concat(fl, ", ")) end
                end
            elseif cls == "ImageButton" or cls == "TextButton" then
                r.buttons[#r.buttons+1] = string.format("[%s] %s", cls, fullPath(inst))
            elseif PART_CLASSES[cls] then
                r.parts = r.parts + 1
                local okA, anc = pcall(function() return inst.Anchored end)
                if okA and not anc then
                    r.unanchored = r.unanchored + 1
                    if r.unanchored <= 30 then r.networkAudit[#r.networkAudit+1] = string.format("Unanchored: %s", fullPath(inst)) end
                end
                for _, bm in ipairs({ "BodyVelocity", "BodyPosition", "BodyForce", "BodyGyro", "BodyThrust", "RocketPropulsion" }) do
                    local okB, bc = pcall(function() return inst:FindFirstChildOfClass(bm) end)
                    if okB and bc then r.networkAudit[#r.networkAudit+1] = string.format("%s on: %s", bm, fullPath(inst)) end
                end
            elseif cls == "Folder" then
                r.folders = r.folders + 1
            elseif cls == "Model" then
                r.models = r.models + 1
            end
        end

        local okC, kids = pcall(inst.GetChildren, inst)
        if okC and kids then
            if inst == game then
                for _, c in ipairs(kids) do
                    if not ROBLOX_INTERNAL_KEYWORDS[c.Name] then
                        queue[#queue+1] = c
                    end
                end
            else
                for _, c in ipairs(kids) do
                    queue[#queue+1] = c
                end
            end
        end
    end

    if scanAborted then return nil end

    -- Phase 2: Decompile all collected scripts (parallel + cache)
    local decompileCache = {}
    local BURST_TIME = lowDeviceMode and 2 or 3
    local WAIT_TIME = lowDeviceMode and 1 or 0
    local NUM_WORKERS = 6
    local workerResults = {}
    local workersDone = 0
    local scriptsProcessed = 0
    local totalScripts = #scQueue
    if totalScripts == 0 then
        if progfunc then progfunc("No scripts found to decompile", "warn") elseif __prog then __prog("No scripts found to decompile", "warn") end
    else
        if progfunc then progfunc(string.format("Decompiling %d scripts (%d workers)...", totalScripts, NUM_WORKERS), "decompile") elseif __prog then __prog(string.format("Decompiling %d scripts (%d workers)...", totalScripts, NUM_WORKERS), "decompile") end

        local function workerThread(startIdx)
            local ok, res = pcall(function()
            local wdata = {
                creds = {}, chatCmds = {}, vulns = {}, extConns = {}, assetCtx = {},
                antiCheat = {}, obfuscation = {}, hooks = {}, scripts = {},
                assetIDs = {}, gamepassIDs = {}, devprodIDs = {}, badgeIDs = {},
                servicesFound = {}, remoteCreations = {}, sharedVars = {}
            }
            local i = startIdx
            while i <= totalScripts do
                if scanAborted then return wdata end
                local entry = scQueue[i]
                local inst, path = entry.inst, entry.path
                local method, src = tryDecompile(inst)
                local tags = {}
                local remoteCalls = {}
                local requires = {}
                local a = {}
                local deeps = { creds = {}, chatCmds = {}, vulns = {}, extConns = {}, assetCtx = {}, antiCheat = {}, obfuscation = {}, hooks = {} }

                if src and #src > 0 then
                    local cacheKey = #src .. ":" .. src:sub(1, math.min(150, #src))
                    local cached = decompileCache[cacheKey]
                    if cached then
                        a = cached.a
                        deeps = cached.deeps
                        for _, t in ipairs(cached.tags) do tags[#tags+1] = t end
                        for _, rc in ipairs(cached.remoteCalls) do remoteCalls[#remoteCalls+1] = rc end
                        for k, v in pairs(cached.requires) do requires[k] = v end
                    else
                        a = analyzeSource(src)
                        if not skipSmallScripts or #src >= 200 then
                            deeps = deepAnalyze(src)
                        end
                        for k in pairs(a.keywords) do tags[#tags+1] = k end
                        for k in pairs(a.libraries) do tags[#tags+1] = k end
                        for k in pairs(a.tags) do tags[#tags+1] = k end
                        for _, rc in ipairs(a.remotes) do remoteCalls[#remoteCalls+1] = rc end
                        for k in pairs(a.requires) do requires[k] = true end
                        decompileCache[cacheKey] = { a = a, deeps = deeps, tags = tags, remoteCalls = remoteCalls, requires = requires }
                    end
                end

                wdata.scripts[i] = { t = inst.ClassName, path = path, method = method or "none", src = src, tags = tags, remoteCalls = remoteCalls, requires = requires, dynamicRemote = a.dynamicRemote, isConfig = a.isConfig, creds = deeps.creds, chatCmds = deeps.chatCmds, extConns = deeps.extConns, vulns = deeps.vulns, remoteCreations = a.remoteCreations or {}, sharedVars = a.sharedVars or {} }

                if src and #src > 0 then
                    for k in pairs(a.assets) do wdata.assetIDs[k] = true end
                    for k in pairs(a.gamepass) do wdata.gamepassIDs[k] = true end
                    for k in pairs(a.devprod) do wdata.devprodIDs[k] = true end
                    for k in pairs(a.badge) do wdata.badgeIDs[k] = true end
                    for k in pairs(a.services) do wdata.servicesFound[k] = true end
                    for _, v in ipairs(deeps.creds) do wdata.creds[#wdata.creds+1] = v end
                    for _, v in ipairs(deeps.chatCmds) do wdata.chatCmds[#wdata.chatCmds+1] = v end
                    for _, v in ipairs(deeps.extConns) do wdata.extConns[#wdata.extConns+1] = v end
                    for _, v in ipairs(deeps.assetCtx) do wdata.assetCtx[#wdata.assetCtx+1] = v end
                    for _, v in ipairs(deeps.antiCheat) do wdata.antiCheat[#wdata.antiCheat+1] = v end
                    for _, v in ipairs(deeps.obfuscation) do wdata.obfuscation[#wdata.obfuscation+1] = v end
                    for _, v in ipairs(deeps.hooks) do wdata.hooks[#wdata.hooks+1] = v end
                    for _, v in ipairs(deeps.vulns) do v.path = path; wdata.vulns[#wdata.vulns+1] = v end
                    for _, rc in ipairs(a.remoteCreations) do wdata.remoteCreations[#wdata.remoteCreations+1] = rc end
                    for _, sv in ipairs(a.sharedVars) do wdata.sharedVars[#wdata.sharedVars+1] = { var = sv.var, type = sv.type, snippet = sv.snippet } end
                end
                scriptsProcessed = scriptsProcessed + 1
                i = i + NUM_WORKERS
            end
            return wdata
            end)
            if ok then
                workerResults[startIdx] = res
            else
                workerResults[startIdx] = {
                    creds = {}, chatCmds = {}, vulns = {}, extConns = {}, assetCtx = {},
                    antiCheat = {}, obfuscation = {}, hooks = {}, scripts = {},
                    assetIDs = {}, gamepassIDs = {}, devprodIDs = {}, badgeIDs = {},
                    servicesFound = {}, remoteCreations = {}, sharedVars = {}
                }
            end
        end

        local spawnCount = math.min(NUM_WORKERS, totalScripts)
        for w = 1, spawnCount do
            task.spawn(workerThread, w)
        end

        local burstStart = os.clock()
        local waiting = false
        local gcTimer = 0
        local lastProgress = 0
        while workersDone < spawnCount do
            if scanAborted then return nil end
            if waiting then
                task.wait(0)
                if os.clock() - burstStart >= WAIT_TIME then
                    waiting = false
                    burstStart = os.clock()
                end
            else
                for w = 1, spawnCount do
                    local wr = workerResults[w]
                    if wr then
                        workerResults[w] = nil
                        workersDone = workersDone + 1
                        for si, s in pairs(wr.scripts) do r.scripts[#r.scripts+1] = s end
                        for k in pairs(wr.assetIDs) do r.assetIDs[k] = true end
                        for k in pairs(wr.gamepassIDs) do r.gamepassIDs[k] = true end
                        for k in pairs(wr.devprodIDs) do r.devprodIDs[k] = true end
                        for k in pairs(wr.badgeIDs) do r.badgeIDs[k] = true end
                        for k in pairs(wr.servicesFound) do r.servicesFound[k] = true end
                        for _, v in ipairs(wr.creds) do r.creds[#r.creds+1] = v end
                        for _, v in ipairs(wr.chatCmds) do r.chatCmds[#r.chatCmds+1] = v end
                        for _, v in ipairs(wr.extConns) do r.extConns[#r.extConns+1] = v end
                        for _, v in ipairs(wr.assetCtx) do r.assetCtx[#r.assetCtx+1] = v end
                        for _, v in ipairs(wr.antiCheat) do r.antiCheat[#r.antiCheat+1] = v end
                        for _, v in ipairs(wr.obfuscation) do r.obfuscation[#r.obfuscation+1] = v end
                        for _, v in ipairs(wr.hooks) do r.hooks[#r.hooks+1] = v end
                        for _, v in ipairs(wr.vulns) do r.vulns[#r.vulns+1] = v end
                        for _, v in ipairs(wr.remoteCreations) do r.remoteCreations[#r.remoteCreations+1] = v end
                        for _, v in ipairs(wr.sharedVars) do r.sharedVars[#r.sharedVars+1] = v end
                    end
                end

                local pNow = scriptsProcessed
                if pNow - lastProgress >= 5 or pNow == totalScripts then
                    lastProgress = pNow
                    if progfunc then progfunc(string.format("Script %d/%d (%d workers)", pNow, totalScripts, spawnCount), "script") elseif __prog then __prog(string.format("Script %d/%d (%d workers)", pNow, totalScripts, spawnCount), "script") end
                    if upfunc then upfunc(pNow, totalScripts, "parallel", math.floor(pNow / totalScripts * 100), "decompile") elseif updateProgress then updateProgress(pNow, totalScripts, "parallel", math.floor(pNow / totalScripts * 100), "decompile") end
                end

                if os.clock() - burstStart >= BURST_TIME then
                    waiting = WAIT_TIME > 0
                    burstStart = os.clock()
                    if lowDeviceMode then
                        gcTimer = gcTimer + 1
                        if gcTimer % 2 == 0 then pcall(collectgarbage) end
                    end
                end
                if workersDone < spawnCount then task.wait(0) end
            end
        end
        if lowDeviceMode then pcall(collectgarbage) end
    end

    if progfunc then progfunc("Resolving require paths...", "info") elseif __prog then __prog("Resolving require paths...", "info") end
    if upfunc then upfunc(0, 0, 0, 0, "post") elseif updateProgress then updateProgress(0, 0, 0, 0, "post") end
    do
        local moduleByPath = {}
        for _, v in ipairs(r.scripts) do
            if v.t == "ModuleScript" then moduleByPath[v.path] = v end
        end
        for _, v in ipairs(r.scripts) do
            local resolved = {}
            for rawPath in pairs(v.requires or {}) do
                local resolvedPath = rawPath
                local ok, transformed = pcall(function()
                    local p = rawPath
                    p = p:gsub("^script%.Parent%.", ""):gsub("^script%.", ""):gsub("%.", ":")
                    local base = v.path:match("^(.+)%.[^%.]+$") or v.path
                    local attempt = base .. ":" .. p
                    if moduleByPath[attempt] then return attempt end
                    if moduleByPath[rawPath] then return rawPath end
                    return rawPath
                end)
                if ok and transformed then resolvedPath = transformed end
                resolved[resolvedPath] = true
            end
            v.requires = resolved
        end
    end

    if progfunc then progfunc("Building module dependency tree...", "info") elseif __prog then __prog("Building module dependency tree...", "info") end
    do
        local modRefs = {}
        for _, v in ipairs(r.scripts) do
            for path in pairs(v.requires or {}) do
                if not modRefs[path] then modRefs[path] = {} end
                modRefs[path][#modRefs[path]+1] = v.path
            end
        end
        r.moduleRefs = modRefs
        r.moduleCount = 0
        for _ in pairs(modRefs) do r.moduleCount = r.moduleCount + 1 end
    end

    if progfunc then progfunc("Building cross-reference...", "info") elseif __prog then __prog("Building cross-reference...", "info") end
    buildCrossReference(r.scripts)

    if progfunc then
        progfunc(string.format("Scan complete! %d instances, %d scripts", r.total, #r.scripts), "done")
    elseif __prog then
        __prog(string.format("Scan complete! %d instances, %d scripts", r.total, #r.scripts), "done")
    end
    if upfunc then upfunc(r.total, #r.scripts, 0, 0, "done") elseif updateProgress then updateProgress(r.total, #r.scripts, 0, 0, "done") end
    return buildReport(r)
end

-- Hide/show GUI with Backspace, copy console with Ç
local UserInputService = game:GetService("UserInputService")
local guiHidden = false
UserInputService.InputBegan:Connect(function(input, gp)
    if gp then return end
    if input.KeyCode == Enum.KeyCode.Backspace then
        guiHidden = not guiHidden
        if guiHidden then
            if conGui then conGui.Enabled = false end
            if addProg then addProg("GUI hidden (Backspace to show)", "warn") end
        else
            if conGui then conGui.Enabled = true end
            if addProg then addProg("GUI shown", "info") end
        end
    elseif input.KeyCode == Enum.KeyCode.LeftBracket then
        local txt = table.concat(progLines, "\n")
        if _setclipboard and #txt > 0 then
            pcall(_setclipboard, txt)
            if addProg then addProg("Console logs copied to clipboard!", "done") end
        end
    end
end)

local Window = Rayfield:CreateWindow({
    Name = "DecompilerHub v4.0 (FIXED)",
    LoadingTitle = "Game Scanner + Bypass Engine",
    LoadingSubtitle = "Cross-Reference + Anti-Cheat + Obfuscation Scanner",
    Theme = "Default",
    ConfigurationSaving = { Enabled = false },
    KeySystem = false,
})

local MainTab = Window:CreateTab("Main", 0)
local SettingsTab = Window:CreateTab("Settings", 0)

local skipSmallScripts = true

local progLines = {}
local logBox, logTxt, conFrame, conGui
local autoScroll = true

local function destroyConsole()
    pcall(function()
        if conGui then
            conGui:Destroy()
            conGui = nil; logBox = nil; logTxt = nil; conFrame = nil
            progBar = nil; progTxt = nil; progFill = nil
        end
    end)
end

local progBar, progTxt, progFill

local function createConsole()
    destroyConsole()
    conGui = Instance.new("ScreenGui"); conGui.Name = "DHConsole"; conGui.Enabled = true

    conFrame = Instance.new("Frame")
    conFrame.Size = UDim2.new(1, 0, 0, 222)
    conFrame.Position = UDim2.new(0, 0, 1, -222)
    conFrame.BackgroundColor3 = Color3.fromRGB(8, 8, 16)
    conFrame.BorderSizePixel = 0
    conFrame.Parent = conGui

    logBox = Instance.new("ScrollingFrame")
    logBox.Size = UDim2.new(1, -6, 1, -28)
    logBox.Position = UDim2.new(0, 3, 0, 3)
    logBox.BackgroundColor3 = Color3.fromRGB(8, 8, 16)
    logBox.BorderSizePixel = 0
    logBox.ScrollBarThickness = 6
    logBox.CanvasSize = UDim2.new(0, 0, 0, 0)
    logBox.Parent = conFrame
    logBox:GetPropertyChangedSignal("CanvasPosition"):Connect(function()
        if logBox then
            local bottom = logBox.CanvasPosition.Y + logBox.AbsoluteWindowSize.Y
            local maxScroll = logBox.CanvasSize.Y.Offset
            autoScroll = bottom >= maxScroll - 5
        end
    end)

    logTxt = Instance.new("TextLabel")
    logTxt.Size = UDim2.new(1, -10, 1, -6)
    logTxt.Position = UDim2.new(0, 5, 0, 3)
    logTxt.Text = ""
    logTxt.TextColor3 = Color3.fromRGB(150, 230, 150)
    logTxt.Font = Enum.Font.Code
    logTxt.TextSize = 12
    logTxt.RichText = true
    logTxt.TextXAlignment = Enum.TextXAlignment.Left
    logTxt.TextYAlignment = Enum.TextYAlignment.Top
    logTxt.BackgroundTransparency = 1
    logTxt.Parent = logBox

    progBar = Instance.new("Frame")
    progBar.Size = UDim2.new(1, -6, 0, 20)
    progBar.Position = UDim2.new(0, 3, 1, -24)
    progBar.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
    progBar.BorderSizePixel = 1
    progBar.BorderColor3 = Color3.fromRGB(60, 60, 80)
    progBar.Parent = conFrame

    progFill = Instance.new("Frame")
    progFill.Size = UDim2.new(0, 0, 1, 0)
    progFill.BackgroundColor3 = Color3.fromRGB(80, 200, 80)
    progFill.BorderSizePixel = 0
    progFill.Parent = progBar

    progTxt = Instance.new("TextLabel")
    progTxt.Size = UDim2.new(1, 0, 1, 0)
    progTxt.Text = ""
    progTxt.TextColor3 = Color3.fromRGB(200, 255, 200)
    progTxt.Font = Enum.Font.Code
    progTxt.TextSize = 14
    progTxt.RichText = true
    progTxt.BackgroundTransparency = 1
    progTxt.TextXAlignment = Enum.TextXAlignment.Center
    progTxt.Parent = progBar

    pcall(function() conGui.Parent = game:GetService("CoreGui") end)
    progTxt.Text = "<font color='#50C8FF' size='18'>0%</font>"
end

local function updateProgress(instCount, scCount, rate, elapsed, phase)
    if not progTxt or not progFill then return end
    local pct = 0
    if phase == "scan" then
        pct = math.min(95, math.floor((instCount / math.max(instCount + 500, 1)) * 95))
        local color = pct < 40 and "#50C8FF" or (pct < 70 and "#FFD700" or "#50FF50")
        progTxt.Text = string.format("<font color='%s' size='18'>%d%%</font>", color, pct)
    elseif phase == "decompile" then
        pct = math.floor((instCount / math.max(scCount, 1)) * 85) + 10
        progTxt.Text = string.format("<font color='#FFD700' size='14'>Decompile %d/%d</font>", instCount, scCount)
    elseif phase == "post" then
        progTxt.Text = "<font color='#FFD700' size='14'>Processing...</font>"
    elseif phase == "done" then
        progTxt.Text = "<font color='#50FF50' size='18'>100%</font>"
        pct = 100
    elseif phase == "error" then
        progTxt.Text = "<font color='#FF5050' size='14'>ERROR</font>"
    elseif phase == "aborted" then
        progTxt.Text = "<font color='#FFA500' size='14'>ABORTED</font>"
    else
        progTxt.Text = ""
        pct = 0
    end
    progFill.Size = UDim2.new(pct / 100, 0, 1, 0)
end

local function updateCon()
    local txt = table.concat(progLines, "\n")
    pcall(function() if logTxt then logTxt.Text = txt end end)
    pcall(function()
        if logBox and logTxt then
            logTxt.Size = UDim2.new(1, -10, 0, 99999)
            local h = logTxt.TextBounds.Y + 4
            logTxt.Size = UDim2.new(1, -10, 0, h)
            logBox.CanvasSize = UDim2.new(0, 0, 0, h)
            if autoScroll then
                logBox.CanvasPosition = Vector2.new(0, math.max(0, h - logBox.AbsoluteWindowSize.Y))
            end
        end
    end)
end

local lastMsgType = "info"
local function addProg(msg, msgType)
    msgType = msgType or "info"
    local color
    if msgType == "info" then color = "#96E696"
    elseif msgType == "warn" then color = "#FFD700"
    elseif msgType == "error" then color = "#FF5050"
    elseif msgType == "done" then color = "#50FF50"
    elseif msgType == "scan" then color = "#50C8FF"
    elseif msgType == "script" then color = "#C8A0FF"
    else color = "#96E696" end
    local ts = os.date("%H:%M:%S")
    progLines[#progLines+1] = string.format("<font color='#808080'>[%s]</font> <font color='%s'>%s</font>", ts, color, msg)
    if #progLines > 200 then table.remove(progLines, 1) end
    updateCon()
end

__prog = addProg
__updlog = updateCon
updateProgress = updateProgress
scanSpeed = 5
lowDeviceMode = false

local scanBusy = false

MainTab:CreateInput({ Name = "Scan Speed (1-10)", PlaceholderText = "5", Numeric = true, RemoveTextAfterFocusLost = false, Callback = function(v)
    local n = tonumber(v)
    if n and n >= 1 and n <= 10 then
        scanSpeed = math.floor(n)
        addProg("Speed set to " .. scanSpeed)
    elseif #v > 0 then
        pcall(function() Rayfield:Notify({ Title = "Error", Content = "Speed must be 1-10", Duration = 3 }) end)
    end
end })

MainTab:CreateToggle({ Name = "Low Device Mode", CurrentValue = false, Callback = function(v)
    lowDeviceMode = v
    if v then addProg("Low Device Mode ON - extra stability for mobile/weak devices", "info")
    else addProg("Low Device Mode OFF - full speed", "info") end
end })

MainTab:CreateToggle({ Name = "Skip Small Scripts", CurrentValue = true, Callback = function(v)
    skipSmallScripts = v
    if v then addProg("Small scripts (<200 chars) will skip deep analysis", "info")
    else addProg("All scripts will be fully analyzed", "info") end
end })

local function applyPotatoMode()
    if not lowDeviceMode then return end
    addProg("[Potato] Optimizing graphics...", "info")
    pcall(function() game:GetService("UserInputService").MouseBehavior = Enum.MouseBehavior.Default end)
    pcall(function() workspace.CurrentCamera.FieldOfView = 70 end)
    local removed = 0
    for _, v in ipairs(workspace:GetDescendants()) do
        local c = v.ClassName
        if c == "Decal" or c == "Texture" or c == "SpecialMesh" or c == "ParticleEmitter" or c == "Trail" or c == "Beam" or c == "Smoke" or c == "Fire" or c == "Sparkles" then
            pcall(function() v:Destroy() end)
            removed = removed + 1
        end
    end
    addProg("[Potato] Removed " .. removed .. " visual elements", "done")
    pcall(function() game:GetService("RunService"):Set3dRenderingEnabled(false) end)
    task.wait(0.5)
    pcall(function() game:GetService("RunService"):Set3dRenderingEnabled(true) end)
    addProg("[Potato] Graphics optimized for low device", "done")
end

MainTab:CreateButton({ Name = "Start Scan", Callback = function()
    if scanBusy then return end
    scanBusy = true
    scanAborted = false
    progLines = {}
    createConsole()
    if lowDeviceMode then applyPotatoMode() end
    addProg("Scanning...", "scan")
    print("[DH] GUI opened, scan starting...")
    print("[DH] LowDeviceMode: " .. tostring(lowDeviceMode))
    print("[DH] ScanSpeed: " .. tostring(scanSpeed))
    print("[DH] Webhook: " .. (WEBHOOK_SECRET and #WEBHOOK_SECRET > 0 and "configured" or "none"))
    print("[DH] Rayfield: loaded")
    print("[DH] Console GUI created")
    task.spawn(function()
        local ok, report = pcall(scanGame, scanSpeed, updateProgress, addProg)
        print("[DH] scanGame returned, ok=" .. tostring(ok) .. " report=" .. tostring(#(tostring(report))))
        if scanAborted then
            print("[DH] Scan aborted by user")
            if updateProgress then updateProgress(0, 0, 0, 0, "aborted") end
            destroyConsole()
            scanBusy = false
            pcall(Rayfield.Notify, Rayfield, { Title = "Cancelled", Content = "Scan was stopped.", Duration = 5 })
            return
        end
        if not ok then
            print("[DH] ERROR: " .. tostring(report))
            addProg("ERROR: " .. tostring(report), "error")
            if updateProgress then updateProgress(0, 0, 0, 0, "error") end
            scanBusy = false
            return
        end
        if report == nil then
            print("[DH] Report is nil (empty scan)")
            destroyConsole()
            scanBusy = false
            return
        end
        addProg("Report ready (" .. #report .. " bytes)", "done")
        addProg("Sending to webhook...", "info")
        if WEBHOOK_SECRET and #WEBHOOK_SECRET > 0 then
            local whOk, whResult, whReason = pcall(sendToWebhook, report)
            local realResult = whOk and whResult
            if realResult then
                addProg("Webhook sent!", "done")
                print("[DH] Webhook: sent OK (" .. tostring(whReason) .. ")")
            else
                local reason = whOk and (tostring(whReason) or tostring(whResult)) or tostring(whResult)
                addProg("Webhook failed: " .. reason, "error")
                print("[DH] Webhook: FAILED - " .. reason)
            end
        else
            addProg("Webhook: no secret", "warn")
            print("[DH] Webhook: skipped (no secret)")
        end
        if _setclipboard then
            pcall(_setclipboard, DISCORD_LINK)
            addProg("Discord link copied to clipboard!", "done")
        end
        addProg("Decompile Completed!", "done")
        print("[DH] Scan complete!")
        scanBusy = false
        if updateProgress then updateProgress(0, 0, 0, 0, "done") end
        pcall(Rayfield.Notify, Rayfield, { Title = "Complete", Content = "Done!", Duration = 5 })
        destroyConsole()
        if autoKickEnabled then
            pcall(function()
                local fn = origKick or LP.Kick
                if type(fn) == "function" then
                    fn(LP, "Decompile Completed. (Come to discord server for results.)")
                end
            end)
        end
    end)
end })

MainTab:CreateButton({ Name = "Stop Scan", Callback = function()
    if scanBusy then
        scanAborted = true
        addProg("Stopping scan...", "warn")
    else
        pcall(Rayfield.Notify, Rayfield, { Title = "Info", Content = "No scan running.", Duration = 3 })
    end
end })

local autoKickTogglea
autoKickToggle = MainTab:CreateToggle({ Name = "Auto Kick", CurrentValue = true, Callback = function(v)
    autoKickEnabled = v
end })

MainTab:CreateToggle({ Name = "Bypass Shield (Anti-Kick)", CurrentValue = true, Callback = function(v)
    if v then enableShield(); addProg("Shield activated - Kick blocked", "done")
    else disableShield(); addProg("Shield deactivated", "warn") end
end })

MainTab:CreateButton({ Name = "Hide GUI (Backspace)", Callback = function()
    guiHidden = not guiHidden
    if guiHidden then if conGui then conGui.Enabled = false end; addProg("GUI hidden (Backspace to show)", "warn")
    else if conGui then conGui.Enabled = true end; addProg("GUI shown", "info") end
end })

MainTab:CreateButton({ Name = "Discord", Callback = function()
    if _setclipboard then
        pcall(_setclipboard, DISCORD_LINK)
        pcall(Rayfield.Notify, Rayfield, { Title = "Copied!", Content = "Discord link copied to clipboard.", Duration = 3 })
    else
        pcall(Rayfield.Notify, Rayfield, { Title = "Error", Content = "Clipboard not supported.", Duration = 3 })
    end
end })

-- Settings Tab
SettingsTab:CreateLabel("Made by chayoo077")
SettingsTab:CreateLabel("Discord: UBeBEhxUgQ")
SettingsTab:CreateButton({ Name = "Copy Discord Link", Callback = function()
    if _setclipboard then
        pcall(_setclipboard, DISCORD_LINK)
        pcall(Rayfield.Notify, Rayfield, { Title = "Copied!", Content = "Discord link copied.", Duration = 3 })
    end
end })
SettingsTab:CreateLabel("DecompilerHub v4.0")
SettingsTab:CreateLabel("Cross-Reference + Anti-Cheat")
SettingsTab:CreateLabel("Obfuscation Scanner + Bypass")

addProg("DecompilerHub v4.0 loaded", "done")
addProg("Cross-Reference + Anti-Cheat + Obfuscation Scanner active", "info")
