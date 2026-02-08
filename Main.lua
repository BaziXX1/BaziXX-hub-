local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local CoreGui = game:GetService("CoreGui")

-- [ 1. SYSTEM RESET ]
if CoreGui:FindFirstChild("BaziXX_Hub") then 
    CoreGui.BaziXX_Hub:Destroy() 
end

-- [ 2. CONFIG ]
local Config = {
    ESP = { 
        Master = false, 
        Murderer = true, 
        Sheriff = true, 
        Innocent = false, 
        GunDrop = true,
        Tracers = false,
        ShowDistance = true,
        ShowNames = true
    },
    Speed = { Enabled = false, Value = 16 },
    AimBot = { Enabled = false, AutoShoot = false },
    TeleportGun = false,
    Theme = Color3.fromRGB(0, 120, 255),
    Language = "RU"
}

-- [ 3. LOCALIZATION ]
local Lang = {
    RU = {
        Title = "BaziXX hub v0.5",
        ESPMaster = "ESP Мастер",
        ShowMurderer = "Показывать Убийцу",
        ShowSheriff = "Показывать Шерифа",
        ShowInnocent = "Показывать Мирных",
        GunDrop = "Подсветка Оружия",
        Tracers = "Линии к игрокам",
        ShowDistance = "Показывать дистанцию",
        ShowNames = "Показывать имена",
        AimBot = "АимБот (Автоприцел)",
        AutoShoot = "Авто-стрельба",
        SpeedHack = "Ускорение",
        TeleportGun = "Телепорт к Оружию",
        Speed = "Скорость",
        Settings = "Настройки",
        Language = "Язык",
        ThemeColor = "Цвет темы:",
        Murderer = "Убийца",
        Sheriff = "Шериф",
        Innocent = "Мирный",
        GunHere = "ОРУЖИЕ ЗДЕСЬ"
    },
    EN = {
        Title = "BaziXX hub v0.5",
        ESPMaster = "ESP Master",
        ShowMurderer = "Show Murderer",
        ShowSheriff = "Show Sheriff",
        ShowInnocent = "Show Innocent",
        GunDrop = "Gun Highlight",
        Tracers = "Player Lines",
        ShowDistance = "Show Distance",
        ShowNames = "Show Names",
        AimBot = "AimBot (Auto Aim)",
        AutoShoot = "Auto Shoot",
        SpeedHack = "Speed Hack",
        TeleportGun = "Teleport to Gun",
        Speed = "Speed",
        Settings = "Settings",
        Language = "Language",
        ThemeColor = "Theme Color:",
        Murderer = "Murderer",
        Sheriff = "Sheriff",
        Innocent = "Innocent",
        GunHere = "GUN HERE"
    }
}

local function GetText(key)
    return Lang[Config.Language][key] or key
end

-- [ 4. UI BUILDER ]
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "BaziXX_Hub"
ScreenGui.Parent = CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 340, 0, 480)
MainFrame.Position = UDim2.new(0.5, -170, 0.5, -240)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 12)

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Config.Theme
UIStroke.Thickness = 2
UIStroke.Parent = MainFrame

-- SHADOW EFFECT
local Shadow = Instance.new("ImageLabel")
Shadow.Name = "Shadow"
Shadow.Size = UDim2.new(1, 30, 1, 30)
Shadow.Position = UDim2.new(0, -15, 0, -15)
Shadow.BackgroundTransparency = 1
Shadow.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
Shadow.ImageColor3 = Color3.new(0, 0, 0)
Shadow.ImageTransparency = 0.5
Shadow.ScaleType = Enum.ScaleType.Slice
Shadow.SliceCenter = Rect.new(10, 10, 118, 118)
Shadow.ZIndex = -1
Shadow.Parent = MainFrame

-- HEADER
local Header = Instance.new("Frame")
Header.Size = UDim2.new(1, 0, 0, 45)
Header.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Header.Parent = MainFrame
Instance.new("UICorner", Header).CornerRadius = UDim.new(0, 12)

local Title = Instance.new("TextLabel")
Title.Name = "TitleLabel"
Title.Text = GetText("Title")
Title.Size = UDim2.new(1, -140, 1, 0)
Title.Position = UDim2.new(0, 15, 0, 0)
Title.TextColor3 = Config.Theme
Title.Font = Enum.Font.GothamBold
Title.TextSize = 18
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.BackgroundTransparency = 1
Title.Parent = Header

-- PAGES
local PageContainer = Instance.new("Frame")
PageContainer.Size = UDim2.new(1, 0, 1, -50)
PageContainer.Position = UDim2.new(0, 0, 0, 50)
PageContainer.BackgroundTransparency = 1
PageContainer.Parent = MainFrame

local MainPage = Instance.new("ScrollingFrame")
MainPage.Name = "MainPage"
MainPage.Size = UDim2.new(1, 0, 1, 0)
MainPage.BackgroundTransparency = 1
MainPage.ScrollBarThickness = 4
MainPage.ScrollBarImageColor3 = Config.Theme
MainPage.CanvasSize = UDim2.new(0, 0, 0, 0)
MainPage.AutomaticCanvasSize = Enum.AutomaticSize.Y
MainPage.Parent = PageContainer

local SettingsPage = Instance.new("ScrollingFrame")
SettingsPage.Name = "SettingsPage"
SettingsPage.Size = UDim2.new(1, 0, 1, 0)
SettingsPage.BackgroundTransparency = 1
SettingsPage.ScrollBarThickness = 4
SettingsPage.ScrollBarImageColor3 = Config.Theme
SettingsPage.Visible = false
SettingsPage.CanvasSize = UDim2.new(0, 0, 0, 0)
SettingsPage.AutomaticCanvasSize = Enum.AutomaticSize.Y
SettingsPage.Parent = PageContainer

local Layout = Instance.new("UIListLayout", MainPage)
Layout.Padding = UDim.new(0, 8)
Layout.SortOrder = Enum.SortOrder.LayoutOrder
Layout.HorizontalAlignment = Enum.HorizontalAlignment.Center

-- [ 5. UI COMPONENTS ]

-- Smooth Animations
local function Tween(obj, props, duration)
    TweenService:Create(obj, TweenInfo.new(duration or 0.2, Enum.EasingStyle.Quad), props):Play()
end

-- Update All Text Function
local function UpdateAllText()
    Title.Text = GetText("Title")
    
    -- Update all buttons text
    for _, obj in pairs(MainPage:GetDescendants()) do
        if obj:IsA("TextButton") and obj.Parent.Name ~= "SubOption" then
            local key = obj:GetAttribute("LangKey")
            if key then
                local currentText = obj.Text
                local prefix = currentText:match("^%s*") or ""
                obj.Text = prefix .. GetText(key)
            end
        end
    end
    
    for _, obj in pairs(MainPage:GetDescendants()) do
        if obj.Name == "SubOption" then
            local btn = obj:FindFirstChildOfClass("TextButton")
            if btn then
                local key = btn:GetAttribute("LangKey")
                if key then
                    btn.Text = "• " .. GetText(key)
                end
            end
        end
    end
    
    if SpeedVal then
        SpeedVal.Text = GetText("Speed") .. ": " .. Config.Speed.Value
    end
    
    if LangBtn then
        LangBtn.Text = GetText("Language") .. ": " .. Config.Language
    end
    
    if ColLabel then
        ColLabel.Text = GetText("ThemeColor")
    end
end

-- Window Buttons
local function AddWinBtn(txt, col, pos, func)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(0, 28, 0, 28)
    b.Position = pos
    b.Text = txt
    b.BackgroundColor3 = col
    b.TextColor3 = Color3.new(1, 1, 1)
    b.Font = Enum.Font.GothamBold
    b.TextSize = 16
    b.Parent = Header
    Instance.new("UICorner", b).CornerRadius = UDim.new(0, 6)
    
    b.MouseEnter:Connect(function() Tween(b, {BackgroundColor3 = col:Lerp(Color3.new(1,1,1), 0.2)}, 0.1) end)
    b.MouseLeave:Connect(function() Tween(b, {BackgroundColor3 = col}, 0.1) end)
    b.MouseButton1Click:Connect(func)
    return b
end

AddWinBtn("×", Color3.fromRGB(220, 50, 50), UDim2.new(1, -38, 0, 8), function() 
    Tween(MainFrame, {Size = UDim2.new(0, 0, 0, 0)}, 0.3)
    task.wait(0.3)
    ScreenGui:Destroy() 
end)

local minimized = false
AddWinBtn("—", Color3.fromRGB(70, 70, 70), UDim2.new(1, -76, 0, 8), function() 
    minimized = not minimized
    if minimized then
        Tween(MainFrame, {Size = UDim2.new(0, 340, 0, 45)}, 0.3)
        PageContainer.Visible = false
    else
        Tween(MainFrame, {Size = UDim2.new(0, 340, 0, 480)}, 0.3)
        task.wait(0.3)
        PageContainer.Visible = true
    end
end)

AddWinBtn("⚙", Color3.fromRGB(70, 70, 70), UDim2.new(1, -114, 0, 8), function()
    local showSettings = not SettingsPage.Visible
    Tween(MainPage, {Position = UDim2.new(showSettings and -1 or 0, 0, 0, 0)}, 0.3)
    Tween(SettingsPage, {Position = UDim2.new(showSettings and 0 or 1, 0, 0, 0)}, 0.3)
    task.wait(0.3)
    MainPage.Visible = not showSettings
    SettingsPage.Visible = showSettings
end)

-- Toggle Creator with Animation
local function CreateToggle(parent, text, langKey, defaultState, callback)
    local Frame = Instance.new("Frame")
    Frame.Size = UDim2.new(0.92, 0, 0, 42)
    Frame.BackgroundTransparency = 1
    Frame.Parent = parent
    
    local Btn = Instance.new("TextButton")
    Btn.Size = UDim2.new(1, 0, 1, 0)
    Btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    Btn.Text = "  " .. text
    Btn.TextColor3 = Color3.new(1, 1, 1)
    Btn.TextXAlignment = Enum.TextXAlignment.Left
    Btn.Font = Enum.Font.GothamMedium
    Btn.TextSize = 14
    Btn.Parent = Frame
    Btn:SetAttribute("LangKey", langKey)
    Instance.new("UICorner", Btn).CornerRadius = UDim.new(0, 8)
    
    local Toggle = Instance.new("Frame")
    Toggle.Size = UDim2.new(0, 40, 0, 20)
    Toggle.Position = UDim2.new(1, -50, 0.5, -10)
    Toggle.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    Toggle.Parent = Btn
    Instance.new("UICorner", Toggle).CornerRadius = UDim.new(1, 0)
    
    local Circle = Instance.new("Frame")
    Circle.Size = UDim2.new(0, 16, 0, 16)
    Circle.Position = UDim2.new(0, 2, 0.5, -8)
    Circle.BackgroundColor3 = Color3.new(1, 1, 1)
    Circle.Parent = Toggle
    Instance.new("UICorner", Circle).CornerRadius = UDim.new(1, 0)
    
    local state = defaultState or false
    
    local function UpdateState(s)
        state = s
        Tween(Toggle, {BackgroundColor3 = s and Config.Theme or Color3.fromRGB(50, 50, 50)}, 0.2)
        Tween(Circle, {Position = UDim2.new(s and 1 or 0, s and -18 or 2, 0.5, -8)}, 0.2)
    end
    
    UpdateState(state)
    
    Btn.MouseButton1Click:Connect(function()
        UpdateState(not state)
        callback(state)
    end)
    
    Btn.MouseEnter:Connect(function() Tween(Btn, {BackgroundColor3 = Color3.fromRGB(40, 40, 40)}, 0.1) end)
    Btn.MouseLeave:Connect(function() Tween(Btn, {BackgroundColor3 = Color3.fromRGB(30, 30, 30)}, 0.1) end)
    
    return Frame, UpdateState
end

-- Sub-Setting Creator
local subToggles = {}
local function CreateSub(text, langKey, default, callback)
    local F = Instance.new("Frame")
    F.Name = "SubOption"
    F.Size = UDim2.new(0.92, 0, 0, 30)
    F.BackgroundTransparency = 1
    F.Visible = false
    F.Parent = MainPage
    
    local B = Instance.new("TextButton")
    B.Size = UDim2.new(0.88, 0, 1, 0)
    B.Position = UDim2.new(0.12, 0, 0, 0)
    B.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
    B.Text = "• " .. text
    B.TextColor3 = default and Config.Theme or Color3.fromRGB(120, 120, 120)
    B.Font = Enum.Font.Gotham
    B.TextSize = 12
    B.TextXAlignment = Enum.TextXAlignment.Left
    B.Parent = F
    B:SetAttribute("LangKey", langKey)
    Instance.new("UICorner", B).CornerRadius = UDim.new(0, 6)
    
    local s = default
    B.MouseButton1Click:Connect(function()
        s = not s
        Tween(B, {TextColor3 = s and Config.Theme or Color3.fromRGB(120, 120, 120)}, 0.2)
        callback(s)
    end)
    
    B.MouseEnter:Connect(function() Tween(B, {BackgroundColor3 = Color3.fromRGB(32, 32, 32)}, 0.1) end)
    B.MouseLeave:Connect(function() Tween(B, {BackgroundColor3 = Color3.fromRGB(22, 22, 22)}, 0.1) end)
    
    table.insert(subToggles, F)
end

-- --- MAIN PAGE CONTENT ---

-- 1. ESP SECTION
CreateToggle(MainPage, GetText("ESPMaster"), "ESPMaster", false, function(s) 
    Config.ESP.Master = s
    for _, v in pairs(subToggles) do
        v.Visible = s
    end
end)

CreateSub(GetText("ShowMurderer"), "ShowMurderer", true, function(s) Config.ESP.Murderer = s end)
CreateSub(GetText("ShowSheriff"), "ShowSheriff", true, function(s) Config.ESP.Sheriff = s end)
CreateSub(GetText("ShowInnocent"), "ShowInnocent", false, function(s) Config.ESP.Innocent = s end)
CreateSub(GetText("GunDrop"), "GunDrop", true, function(s) Config.ESP.GunDrop = s end)
CreateSub(GetText("Tracers"), "Tracers", false, function(s) Config.ESP.Tracers = s end)
CreateSub(GetText("ShowDistance"), "ShowDistance", true, function(s) Config.ESP.ShowDistance = s end)
CreateSub(GetText("ShowNames"), "ShowNames", true, function(s) Config.ESP.ShowNames = s end)

-- 2. TELEPORT TO GUN
CreateToggle(MainPage, GetText("TeleportGun"), "TeleportGun", false, function(s) 
    Config.TeleportGun = s
    if s then
        -- Teleport immediately
        local gun = workspace:FindFirstChild("GunDrop")
        if gun and gun:FindFirstChild("Handle") and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            LocalPlayer.Character.HumanoidRootPart.CFrame = gun.Handle.CFrame
        end
    end
end)

-- 3. AIMBOT SECTION
local ShootBtn = Instance.new("TextButton")
ShootBtn.Size = UDim2.new(0, 85, 0, 85)
ShootBtn.Position = UDim2.new(0.85, -85, 0.5, -42)
ShootBtn.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
ShootBtn.Text = "FIRE"
ShootBtn.TextColor3 = Color3.new(1, 1, 1)
ShootBtn.Font = Enum.Font.GothamBlack
ShootBtn.TextSize = 20
ShootBtn.Visible = false
ShootBtn.Parent = ScreenGui
Instance.new("UICorner", ShootBtn).CornerRadius = UDim.new(1, 0)

local ShootStroke = Instance.new("UIStroke", ShootBtn)
ShootStroke.Color = Color3.new(1, 1, 1)
ShootStroke.Thickness = 3

ShootBtn.MouseEnter:Connect(function() Tween(ShootBtn, {Size = UDim2.new(0, 95, 0, 95)}, 0.1) end)
ShootBtn.MouseLeave:Connect(function() Tween(ShootBtn, {Size = UDim2.new(0, 85, 0, 85)}, 0.1) end)

CreateToggle(MainPage, GetText("AimBot"), "AimBot", false, function(s) 
    Config.AimBot.Enabled = s
    ShootBtn.Visible = s
end)

CreateSub(GetText("AutoShoot"), "AutoShoot", false, function(s) Config.AimBot.AutoShoot = s end)

-- 4. SPEEDHACK SECTION
local SpeedContainer = Instance.new("Frame")
SpeedContainer.Name = "SpeedContainer"
SpeedContainer.Size = UDim2.new(0.92, 0, 0, 70)
SpeedContainer.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
SpeedContainer.Visible = false
SpeedContainer.Parent = MainPage
Instance.new("UICorner", SpeedContainer).CornerRadius = UDim.new(0, 8)

SpeedVal = Instance.new("TextLabel")
SpeedVal.Size = UDim2.new(1, 0, 0, 25)
SpeedVal.Position = UDim2.new(0, 0, 0, 5)
SpeedVal.Text = GetText("Speed") .. ": 16"
SpeedVal.TextColor3 = Config.Theme
SpeedVal.BackgroundTransparency = 1
SpeedVal.Font = Enum.Font.GothamBold
SpeedVal.TextSize = 14
SpeedVal.Parent = SpeedContainer

local SliderBar = Instance.new("Frame")
SliderBar.Size = UDim2.new(0.9, 0, 0, 10)
SliderBar.Position = UDim2.new(0.05, 0, 0.55, 0)
SliderBar.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
SliderBar.Parent = SpeedContainer
Instance.new("UICorner", SliderBar).CornerRadius = UDim.new(1, 0)

local SliderFill = Instance.new("Frame")
SliderFill.Size = UDim2.new(0, 0, 1, 0)
SliderFill.BackgroundColor3 = Config.Theme
SliderFill.Parent = SliderBar
Instance.new("UICorner", SliderFill).CornerRadius = UDim.new(1, 0)

local SliderKnob = Instance.new("Frame")
SliderKnob.Size = UDim2.new(0, 18, 0, 18)
SliderKnob.Position = UDim2.new(0, -9, 0.5, -9)
SliderKnob.BackgroundColor3 = Color3.new(1, 1, 1)
SliderKnob.Parent = SliderFill
Instance.new("UICorner", SliderKnob).CornerRadius = UDim.new(1, 0)

local TriggerBtn = Instance.new("TextButton")
TriggerBtn.Size = UDim2.new(1, 0, 3, 0)
TriggerBtn.Position = UDim2.new(0, 0, -1, 0)
TriggerBtn.BackgroundTransparency = 1
TriggerBtn.Text = ""
TriggerBtn.Parent = SliderBar

CreateToggle(MainPage, GetText("SpeedHack"), "SpeedHack", false, function(s) 
    Config.Speed.Enabled = s
    SpeedContainer.Visible = s
end)

-- SLIDER LOGIC
local dragging = false

TriggerBtn.MouseButton1Down:Connect(function() dragging = true end)
TriggerBtn.TouchTap:Connect(function(positions)
    local mouseX = positions[1].X
    local startX = SliderBar.AbsolutePosition.X
    local width = SliderBar.AbsoluteSize.X
    local percent = math.clamp((mouseX - startX) / width, 0, 1)
    
    Config.Speed.Value = math.floor(16 + (percent * 84))
    Tween(SliderFill, {Size = UDim2.new(percent, 0, 1, 0)}, 0.1)
    SpeedVal.Text = GetText("Speed") .. ": " .. Config.Speed.Value
end)

UserInputService.InputEnded:Connect(function(input) 
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then 
        dragging = false 
    end 
end)

RunService.RenderStepped:Connect(function()
    if dragging then
        local mouseX = UserInputService:GetMouseLocation().X
        local startX = SliderBar.AbsolutePosition.X
        local width = SliderBar.AbsoluteSize.X
        local percent = math.clamp((mouseX - startX) / width, 0, 1)
        
        Config.Speed.Value = math.floor(16 + (percent * 84))
        SliderFill.Size = UDim2.new(percent, 0, 1, 0)
        SpeedVal.Text = GetText("Speed") .. ": " .. Config.Speed.Value
    end
end)

-- --- SETTINGS PAGE CONTENT ---
local SLayout = Instance.new("UIListLayout", SettingsPage)
SLayout.Padding = UDim.new(0, 8)
SLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center

LangBtn = Instance.new("TextButton")
LangBtn.Size = UDim2.new(0.92, 0, 0, 45)
LangBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
LangBtn.Text = GetText("Language") .. ": " .. Config.Language
LangBtn.TextColor3 = Color3.new(1, 1, 1)
LangBtn.Font = Enum.Font.GothamBold
LangBtn.TextSize = 14
LangBtn.Parent = SettingsPage
Instance.new("UICorner", LangBtn).CornerRadius = UDim.new(0, 8)

LangBtn.MouseButton1Click:Connect(function()
    Config.Language = (Config.Language == "RU") and "EN" or "RU"
    UpdateAllText()
    Tween(LangBtn, {BackgroundColor3 = Config.Theme}, 0.2)
    task.wait(0.2)
    Tween(LangBtn, {BackgroundColor3 = Color3.fromRGB(35, 35, 35)}, 0.2)
end)

ColLabel = Instance.new("TextLabel")
ColLabel.Size = UDim2.new(0.92, 0, 0, 35)
ColLabel.Text = GetText("ThemeColor")
ColLabel.TextColor3 = Color3.new(1, 1, 1)
ColLabel.BackgroundTransparency = 1
ColLabel.Font = Enum.Font.GothamBold
ColLabel.TextSize = 14
ColLabel.Parent = SettingsPage

local Colors = {
    Color3.fromRGB(0, 120, 255),
    Color3.fromRGB(255, 60, 60),
    Color3.fromRGB(50, 255, 100),
    Color3.fromRGB(150, 50, 255),
    Color3.fromRGB(255, 200, 50)
}

local CFrame = Instance.new("Frame")
CFrame.Size = UDim2.new(0.92, 0, 0, 50)
CFrame.BackgroundTransparency = 1
CFrame.Parent = SettingsPage

local CLayout = Instance.new("UIListLayout", CFrame)
CLayout.FillDirection = Enum.FillDirection.Horizontal
CLayout.Padding = UDim.new(0, 8)
CLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center

for _, c in pairs(Colors) do
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(0, 50, 0, 50)
    b.Text = ""
    b.BackgroundColor3 = c
    b.Parent = CFrame
    Instance.new("UICorner", b).CornerRadius = UDim.new(1, 0)
    
    local Stroke = Instance.new("UIStroke", b)
    Stroke.Color = Color3.new(1, 1, 1)
    Stroke.Thickness = 0
    Stroke.Transparency = 1
    
    b.MouseEnter:Connect(function() 
        Tween(b, {Size = UDim2.new(0, 55, 0, 55)}, 0.1)
        Tween(Stroke, {Thickness = 3, Transparency = 0}, 0.1)
    end)
    b.MouseLeave:Connect(function() 
        Tween(b, {Size = UDim2.new(0, 50, 0, 50)}, 0.1)
        Tween(Stroke, {Thickness = 0, Transparency = 1}, 0.1)
    end)
    
    b.MouseButton1Click:Connect(function()
        Config.Theme = c
        Tween(UIStroke, {Color = c}, 0.3)
        Tween(SliderFill, {BackgroundColor3 = c}, 0.3)
        Tween(Title, {TextColor3 = c}, 0.3)
        Tween(SpeedVal, {TextColor3 = c}, 0.3)
        MainPage.ScrollBarImageColor3 = c
        SettingsPage.ScrollBarImageColor3 = c
        
        -- Update all active toggles
        for _, obj in pairs(MainPage:GetDescendants()) do
            if obj:IsA("Frame") and obj.Parent:IsA("TextButton") and obj.BackgroundColor3 ~= Color3.fromRGB(50, 50, 50) then
                Tween(obj, {BackgroundColor3 = c}, 0.3)
            end
        end
        
        -- Update sub-options colors
        for _, sub in pairs(subToggles) do
            local btn = sub:FindFirstChildOfClass("TextButton")
            if btn and btn.TextColor3 ~= Color3.fromRGB(120, 120, 120) then
                Tween(btn, {TextColor3 = c}, 0.3)
            end
        end
    end)
end

-- [ 6. GAME LOGIC ]

-- Optimized role detection
local function GetPlayerRole(player)
    if not player or not player.Character then return "Innocent", Color3.fromRGB(0, 255, 0) end
    
    local backpack = player:FindFirstChild("Backpack")
    local character = player.Character
    
    if (backpack and backpack:FindFirstChild("Knife")) or character:FindFirstChild("Knife") then
        return "Murderer", Color3.fromRGB(255, 60, 60)
    elseif (backpack and backpack:FindFirstChild("Gun")) or character:FindFirstChild("Gun") then
        return "Sheriff", Color3.fromRGB(60, 120, 255)
    end
    
    return "Innocent", Color3.fromRGB(100, 255, 100)
end

-- ESP Update Function
local function UpdateESP()
    if not Config.ESP.Master then
        -- Cleanup all ESP
        for _, obj in pairs(workspace:GetDescendants()) do
            if obj.Name and string.match(obj.Name, "^BaziXX_") then
                obj:Destroy()
            end
        end
        return
    end

    -- GUN ESP (FIXED)
    if Config.ESP.GunDrop then
        local gun = workspace:FindFirstChild("GunDrop")
        if gun then
            local handle = gun:FindFirstChild("Handle")
            if handle then
                -- Highlight
                if not gun:FindFirstChild("BaziXX_GunHL") then
                    local hl = Instance.new("Highlight", gun)
                    hl.Name = "BaziXX_GunHL"
                    hl.FillColor = Color3.fromRGB(255, 255, 0)
                    hl.FillTransparency = 0.2
                    hl.OutlineColor = Color3.fromRGB(255, 200, 0)
                    hl.OutlineTransparency = 0
                    hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                end
                
                -- Billboard
                if not gun:FindFirstChild("BaziXX_GunBG") then
                    local bg = Instance.new("BillboardGui", gun)
                    bg.Name = "BaziXX_GunBG"
                    bg.Size = UDim2.new(0, 150, 0, 60)
                    bg.AlwaysOnTop = true
                    bg.StudsOffset = Vector3.new(0, 2, 0)
                    bg.Adornee = handle
                    
                    local txt = Instance.new("TextLabel", bg)
                    txt.Size = UDim2.new(1, 0, 1, 0)
                    txt.Text = "🔫 " .. GetText("GunHere")
                    txt.TextColor3 = Color3.fromRGB(255, 255, 0)
                    txt.BackgroundTransparency = 1
                    txt.Font = Enum.Font.GothamBlack
                    txt.TextSize = 16
                    txt.TextStrokeTransparency = 0
                    txt.TextStrokeColor3 = Color3.new(0, 0, 0)
                end
                
                -- Distance update
                local bg = gun:FindFirstChild("BaziXX_GunBG")
                if bg and bg:FindFirstChild("TextLabel") and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    local dist = math.floor((handle.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude)
                    bg.TextLabel.Text = "🔫 " .. GetText("GunHere") .. "\n[" .. dist .. "m]"
                end
            end
        else
            -- Clean up if gun doesn't exist
            for _, obj in pairs(workspace:GetChildren()) do
                if obj.Name == "GunDrop" then
                    local hl = obj:FindFirstChild("BaziXX_GunHL")
                    local bg = obj:FindFirstChild("BaziXX_GunBG")
                    if hl then hl:Destroy() end
                    if bg then bg:Destroy() end
                end
            end
        end
    else
        -- Remove gun ESP if disabled
        local gun = workspace:FindFirstChild("GunDrop")
        if gun then
            local hl = gun:FindFirstChild("BaziXX_GunHL")
            local bg = gun:FindFirstChild("BaziXX_GunBG")
            if hl then hl:Destroy() end
            if bg then bg:Destroy() end
        end
    end

    -- PLAYER ESP
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") and p.Character:FindFirstChild("Humanoid") then
            local hrp = p.Character.HumanoidRootPart
            local hum = p.Character.Humanoid
            
            if hum.Health <= 0 or hrp.Position.Y < -50 then
                -- Clean up dead/fallen players
                local hl = p.Character:FindFirstChild("BaziXX_HL")
                local bg = p.Character:FindFirstChild("BaziXX_BG")
                local line = p.Character:FindFirstChild("BaziXX_Tracer")
                if hl then hl:Destroy() end
                if bg then bg:Destroy() end
                if line then line:Destroy() end
                continue
            end
            
            local role, color = GetPlayerRole(p)
            
            local show = (role == "Murderer" and Config.ESP.Murderer) or
                        (role == "Sheriff" and Config.ESP.Sheriff) or
                        (role == "Innocent" and Config.ESP.Innocent)
            
            -- HIGHLIGHT
            local hl = p.Character:FindFirstChild("BaziXX_HL")
            if show then
                if not hl then 
                    hl = Instance.new("Highlight", p.Character) 
                    hl.Name = "BaziXX_HL" 
                    hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                    hl.FillTransparency = 0.4
                    hl.OutlineTransparency = 0
                end
                hl.FillColor = color
                hl.OutlineColor = color
            else
                if hl then hl:Destroy() end
            end
            
            -- BILLBOARD (Name + Distance)
            local bg = p.Character:FindFirstChild("BaziXX_BG")
            if show and (Config.ESP.ShowNames or Config.ESP.ShowDistance) then
                if not bg then
                    bg = Instance.new("BillboardGui", p.Character)
                    bg.Name = "BaziXX_BG"
                    bg.Size = UDim2.new(0, 200, 0, 50)
                    bg.AlwaysOnTop = true
                    bg.StudsOffset = Vector3.new(0, 3, 0)
                    bg.Adornee = hrp
                    
                    local txt = Instance.new("TextLabel", bg)
                    txt.Name = "Label"
                    txt.Size = UDim2.new(1, 0, 1, 0)
                    txt.BackgroundTransparency = 1
                    txt.Font = Enum.Font.GothamBold
                    txt.TextSize = 14
                    txt.TextStrokeTransparency = 0
                    txt.TextStrokeColor3 = Color3.new(0, 0, 0)
                end
                
                local label = bg:FindFirstChild("Label")
                if label then
                    local dist = math.floor((hrp.Position - Camera.CFrame.Position).Magnitude)
                    local nameText = Config.ESP.ShowNames and p.Name or ""
                    local distText = Config.ESP.ShowDistance and (" [" .. dist .. "m]") or ""
                    local roleText = GetText(role)
                    
                    label.Text = roleText .. "\n" .. nameText .. distText
                    label.TextColor3 = color
                end
            else
                if bg then bg:Destroy() end
            end
            
            -- TRACERS (FIXED - Uses Beam instead of LineHandleAdornment)
            local line = p.Character:FindFirstChild("BaziXX_Tracer")
            if show and Config.ESP.Tracers then
                if not line then
                    -- Create attachments
                    local att0 = Instance.new("Attachment", workspace.Terrain)
                    att0.Name = "BaziXX_TracerAtt0_" .. p.Name
                    
                    local att1 = Instance.new("Attachment", hrp)
                    att1.Name = "BaziXX_TracerAtt1"
                    
                    -- Create beam
                    line = Instance.new("Beam", p.Character)
                    line.Name = "BaziXX_Tracer"
                    line.Attachment0 = att0
                    line.Attachment1 = att1
                    line.Width0 = 0.1
                    line.Width1 = 0.1
                    line.FaceCamera = true
                    line.Transparency = NumberSequence.new(0.3)
                    
                    -- Store attachments
                    line:SetAttribute("Att0", att0)
                end
                
                line.Color = ColorSequence.new(color)
                
                -- Update attachment0 position (from camera bottom)
                local att0 = line:GetAttribute("Att0")
                if att0 and att0:IsA("Attachment") then
                    local camPos = Camera.CFrame.Position + (Camera.CFrame.UpVector * -3)
                    att0.WorldPosition = camPos
                end
                
                line.Enabled = true
            else
                if line then
                    local att0 = line:GetAttribute("Att0")
                    if att0 and att0:IsA("Attachment") then
                        att0:Destroy()
                    end
                    local att1 = hrp:FindFirstChild("BaziXX_TracerAtt1")
                    if att1 then att1:Destroy() end
                    line:Destroy()
                end
            end
        end
    end
end

-- Auto Teleport to Gun
local lastTeleport = 0
RunService.Heartbeat:Connect(function()
    if Config.TeleportGun and tick() - lastTeleport > 0.5 then
        local gun = workspace:FindFirstChild("GunDrop")
        if gun and gun:FindFirstChild("Handle") and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local dist = (gun.Handle.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
            if dist > 5 then
                LocalPlayer.Character.HumanoidRootPart.CFrame = gun.Handle.CFrame + Vector3.new(0, 3, 0)
                lastTeleport = tick()
            end
        end
    end
end)

-- Main Loop
RunService.RenderStepped:Connect(function()
    -- SpeedHack
    if Config.Speed.Enabled and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.WalkSpeed = Config.Speed.Value
    end
    
    -- Update ESP
    UpdateESP()
    
    -- Auto AimBot
    if Config.AimBot.Enabled and Config.AimBot.AutoShoot then
        local target = nil
        local closest = math.huge
        
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") and p.Character:FindFirstChild("Humanoid") then
                if p.Character.Humanoid.Health > 0 then
                    local role = GetPlayerRole(p)
                    if role == "Murderer" then
                        local dist = (p.Character.HumanoidRootPart.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                        if dist < closest and dist < 100 then
                            closest = dist
                            target = p.Character.HumanoidRootPart
                        end
                    end
                end
            end
        end
        
        if target then
            local gun = LocalPlayer.Character:FindFirstChild("Gun") or LocalPlayer.Backpack:FindFirstChild("Gun")
            if gun then
                if gun.Parent == LocalPlayer.Backpack then 
                    LocalPlayer.Character.Humanoid:EquipTool(gun) 
                    task.wait(0.1) 
                end
                
                local remote = gun:FindFirstChild("Shoot")
                if remote then
                    pcall(function()
                        remote:FireServer(
                            CFrame.new(LocalPlayer.Character.HumanoidRootPart.Position, target.Position),
                            CFrame.new(LocalPlayer.Character.HumanoidRootPart.Position)
                        )
                    end)
                end
            end
        end
    end
end)

-- Manual AimBot Button
ShootBtn.MouseButton1Click:Connect(function()
    local target = nil
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p.Character then
            local role = GetPlayerRole(p)
            if role == "Murderer" and p.Character:FindFirstChild("HumanoidRootPart") and p.Character:FindFirstChild("Humanoid") then
                if p.Character.Humanoid.Health > 0 then
                    target = p.Character.HumanoidRootPart
                    break
                end
            end
        end
    end
    
    local gun = LocalPlayer.Character:FindFirstChild("Gun") or LocalPlayer.Backpack:FindFirstChild("Gun")
    if gun and target then
        if gun.Parent == LocalPlayer.Backpack then 
            LocalPlayer.Character.Humanoid:EquipTool(gun) 
            task.wait(0.1) 
        end
        
        local remote = gun:FindFirstChild("Shoot")
        if remote then
            pcall(function()
                remote:FireServer(
                    CFrame.new(LocalPlayer.Character.HumanoidRootPart.Position, target.Position),
                    CFrame.new(LocalPlayer.Character.HumanoidRootPart.Position)
                )
            end)
            
            -- Visual feedback
            Tween(ShootBtn, {BackgroundColor3 = Color3.fromRGB(100, 255, 100)}, 0.1)
            task.wait(0.2)
            Tween(ShootBtn, {BackgroundColor3 = Color3.fromRGB(255, 60, 60)}, 0.1)
        end
    end
end)

-- Cleanup on player death
LocalPlayer.CharacterAdded:Connect(function()
    task.wait(1)
    if Config.Speed.Enabled and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.WalkSpeed = Config.Speed.Value
    end
end)

print("BaziXX Hub v0.5 loaded successfully!")
