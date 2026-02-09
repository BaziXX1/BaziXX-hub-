--[[
    BaziXX Hub v1.0 - Enhanced Edition
    Murder Mystery 2 Advanced Cheat
    Features: ESP, Aimbot, Speed, Teleports, Auto-Farm, Animations
]]

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local CoreGui = game:GetService("CoreGui")

-- [ SYSTEM RESET ]
if CoreGui:FindFirstChild("BaziXX_Hub") then 
    CoreGui.BaziXX_Hub:Destroy() 
end

-- [ CONFIG ]
local Config = {
    ESP = { 
        Master = false, 
        Murderer = true, 
        Sheriff = true, 
        Innocent = false, 
        GunDrop = true,
        Tracers = false,
        ShowDistance = true,
        ShowNames = true,
        ShowHealth = true,
        BoxESP = false,
        ChamsEnabled = false
    },
    Speed = { Enabled = false, Value = 16 },
    Jump = { Enabled = false, Value = 50 },
    AimBot = { 
        Enabled = false, 
        AutoShoot = false,
        FOV = 100,
        ShowFOV = false,
        Smoothness = 5,
        TargetPart = "Head"
    },
    TeleportGun = false,
    AutoCollectCoins = false,
    KillAll = false,
    Noclip = false,
    InfiniteJump = false,
    Flight = { Enabled = false, Speed = 50 },
    Theme = Color3.fromRGB(0, 120, 255),
    Language = "RU",
    UIScale = 1,
    Notifications = true
}

-- [ LOCALIZATION ]
local Lang = {
    RU = {
        Title = "BaziXX Hub v1.0",
        -- ESP Section
        ESPSection = "ESP & Визуализация",
        ESPMaster = "Главный ESP",
        ShowMurderer = "Показывать Убийцу",
        ShowSheriff = "Показывать Шерифа",
        ShowInnocent = "Показывать Мирных",
        GunDrop = "Подсветка Оружия",
        Tracers = "Линии к игрокам",
        ShowDistance = "Показывать дистанцию",
        ShowNames = "Показывать имена",
        ShowHealth = "Показывать здоровье",
        BoxESP = "Квадраты вокруг игроков",
        ChamsESP = "Chams (через стены)",
        
        -- Combat Section
        CombatSection = "Бой & АимБот",
        AimBot = "АимБот (Автоприцел)",
        AutoShoot = "Авто-стрельба",
        ShowFOV = "Показать FOV круг",
        FOVSize = "Размер FOV",
        AimSmoothness = "Плавность прицела",
        TargetPart = "Цель в",
        ShootMurderer = "Выстрелить в Убийцу",
        KillAll = "Убить всех (Sheriff)",
        
        -- Movement Section
        MovementSection = "Передвижение",
        SpeedHack = "Ускорение",
        JumpHack = "Усиление прыжка",
        Speed = "Скорость",
        JumpPower = "Сила прыжка",
        TeleportGun = "Телепорт к Оружию",
        Noclip = "Проходить сквозь стены",
        InfiniteJump = "Бесконечный прыжок",
        Flight = "Полёт",
        FlightSpeed = "Скорость полёта",
        
        -- Auto-Farm Section
        FarmSection = "Авто-Фарм",
        AutoCollectCoins = "Авто-сбор монет",
        AutoPlayAgain = "Авто-играть снова",
        
        -- Misc Section
        MiscSection = "Разное",
        FullBright = "Полная яркость",
        RemoveFog = "Убрать туман",
        
        -- Settings
        Settings = "Настройки",
        Language = "Язык",
        ThemeColor = "Цвет темы",
        UIScale = "Размер интерфейса",
        Notifications = "Уведомления",
        
        -- Roles
        Murderer = "Убийца",
        Sheriff = "Шериф",
        Innocent = "Мирный",
        GunHere = "ОРУЖИЕ ЗДЕСЬ",
        
        -- Notifications
        PlayerIsMurderer = " - это Убийца!",
        PlayerIsSheriff = " - это Шериф!",
        GunDropped = "Оружие упало!",
        TeleportedToGun = "Телепортирован к оружию",
        
        -- Tabs
        TabMain = "Главная",
        TabVisual = "Визуал",
        TabCombat = "Бой",
        TabMovement = "Движение",
        TabMisc = "Разное",
        TabSettings = "Настройки"
    },
    EN = {
        Title = "BaziXX Hub v1.0",
        -- ESP Section
        ESPSection = "ESP & Visuals",
        ESPMaster = "ESP Master",
        ShowMurderer = "Show Murderer",
        ShowSheriff = "Show Sheriff",
        ShowInnocent = "Show Innocent",
        GunDrop = "Gun Highlight",
        Tracers = "Player Lines",
        ShowDistance = "Show Distance",
        ShowNames = "Show Names",
        ShowHealth = "Show Health",
        BoxESP = "Box ESP",
        ChamsESP = "Chams (Through Walls)",
        
        -- Combat Section
        CombatSection = "Combat & AimBot",
        AimBot = "AimBot (Auto Aim)",
        AutoShoot = "Auto Shoot",
        ShowFOV = "Show FOV Circle",
        FOVSize = "FOV Size",
        AimSmoothness = "Aim Smoothness",
        TargetPart = "Target",
        ShootMurderer = "Shoot Murderer",
        KillAll = "Kill All (Sheriff)",
        
        -- Movement Section
        MovementSection = "Movement",
        SpeedHack = "Speed Hack",
        JumpHack = "Jump Boost",
        Speed = "Speed",
        JumpPower = "Jump Power",
        TeleportGun = "Teleport to Gun",
        Noclip = "Noclip",
        InfiniteJump = "Infinite Jump",
        Flight = "Flight",
        FlightSpeed = "Flight Speed",
        
        -- Auto-Farm Section
        FarmSection = "Auto-Farm",
        AutoCollectCoins = "Auto Collect Coins",
        AutoPlayAgain = "Auto Play Again",
        
        -- Misc Section
        MiscSection = "Miscellaneous",
        FullBright = "Full Bright",
        RemoveFog = "Remove Fog",
        
        -- Settings
        Settings = "Settings",
        Language = "Language",
        ThemeColor = "Theme Color",
        UIScale = "UI Scale",
        Notifications = "Notifications",
        
        -- Roles
        Murderer = "Murderer",
        Sheriff = "Sheriff",
        Innocent = "Innocent",
        GunHere = "GUN HERE",
        
        -- Notifications
        PlayerIsMurderer = " is the Murderer!",
        PlayerIsSheriff = " is the Sheriff!",
        GunDropped = "Gun dropped!",
        TeleportedToGun = "Teleported to gun",
        
        -- Tabs
        TabMain = "Main",
        TabVisual = "Visual",
        TabCombat = "Combat",
        TabMovement = "Movement",
        TabMisc = "Misc",
        TabSettings = "Settings"
    }
}

local function GetText(key)
    return Lang[Config.Language][key] or key
end

-- [ NOTIFICATION SYSTEM ]
local NotificationQueue = {}
local function ShowNotification(text, duration)
    if not Config.Notifications then return end
    
    local notif = Instance.new("Frame")
    notif.Size = UDim2.new(0, 300, 0, 0)
    notif.Position = UDim2.new(1, -320, 1, -20 - (#NotificationQueue * 70))
    notif.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    notif.BorderSizePixel = 0
    notif.Parent = CoreGui:FindFirstChild("BaziXX_Hub")
    
    local corner = Instance.new("UICorner", notif)
    corner.CornerRadius = UDim.new(0, 8)
    
    local stroke = Instance.new("UIStroke", notif)
    stroke.Color = Config.Theme
    stroke.Thickness = 2
    
    local label = Instance.new("TextLabel", notif)
    label.Size = UDim2.new(1, -20, 1, 0)
    label.Position = UDim2.new(0, 10, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = Color3.new(1, 1, 1)
    label.Font = Enum.Font.GothamBold
    label.TextSize = 14
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.TextWrapped = true
    
    table.insert(NotificationQueue, notif)
    
    -- Animate in
    TweenService:Create(notif, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, 300, 0, 60)
    }):Play()
    
    task.delay(duration or 3, function()
        TweenService:Create(notif, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
            Position = UDim2.new(1, 0, notif.Position.Y.Scale, notif.Position.Y.Offset)
        }):Play()
        
        task.wait(0.3)
        table.remove(NotificationQueue, table.find(NotificationQueue, notif))
        notif:Destroy()
        
        -- Reposition remaining notifications
        for i, n in pairs(NotificationQueue) do
            TweenService:Create(n, TweenInfo.new(0.2), {
                Position = UDim2.new(1, -320, 1, -20 - ((i - 1) * 70))
            }):Play()
        end
    end)
end

-- [ UI BUILDER ]
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "BaziXX_Hub"
ScreenGui.Parent = CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

-- Main Frame
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 550, 0, 420)
MainFrame.Position = UDim2.new(0.5, -275, 0.5, -210)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui
MainFrame.ClipsDescendants = false

local MainCorner = Instance.new("UICorner", MainFrame)
MainCorner.CornerRadius = UDim.new(0, 12)

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Config.Theme
UIStroke.Thickness = 2
UIStroke.Parent = MainFrame

-- Animated Shadow
local Shadow = Instance.new("ImageLabel")
Shadow.Name = "Shadow"
Shadow.Size = UDim2.new(1, 40, 1, 40)
Shadow.Position = UDim2.new(0, -20, 0, -20)
Shadow.BackgroundTransparency = 1
Shadow.Image = "rbxassetid://5554236805"
Shadow.ImageColor3 = Color3.new(0, 0, 0)
Shadow.ImageTransparency = 0.7
Shadow.ScaleType = Enum.ScaleType.Slice
Shadow.SliceCenter = Rect.new(23, 23, 277, 277)
Shadow.ZIndex = -1
Shadow.Parent = MainFrame

-- Pulse animation for shadow
spawn(function()
    while task.wait() do
        TweenService:Create(Shadow, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {
            ImageTransparency = 0.5
        }):Play()
    end
end)

-- HEADER
local Header = Instance.new("Frame")
Header.Size = UDim2.new(1, 0, 0, 50)
Header.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Header.BorderSizePixel = 0
Header.Parent = MainFrame

local HeaderCorner = Instance.new("UICorner", Header)
HeaderCorner.CornerRadius = UDim.new(0, 12)

local HeaderCover = Instance.new("Frame", Header)
HeaderCover.Size = UDim2.new(1, 0, 0, 25)
HeaderCover.Position = UDim2.new(0, 0, 1, -25)
HeaderCover.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
HeaderCover.BorderSizePixel = 0

local Title = Instance.new("TextLabel")
Title.Name = "TitleLabel"
Title.Text = GetText("Title")
Title.Size = UDim2.new(0, 200, 1, 0)
Title.Position = UDim2.new(0, 20, 0, 0)
Title.TextColor3 = Config.Theme
Title.Font = Enum.Font.GothamBold
Title.TextSize = 20
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.BackgroundTransparency = 1
Title.Parent = Header

-- Title glow effect
local TitleGlow = Title:Clone()
TitleGlow.TextTransparency = 0.7
TitleGlow.TextStrokeTransparency = 0
TitleGlow.TextStrokeColor3 = Config.Theme
TitleGlow.ZIndex = 0
TitleGlow.Parent = Title

-- Close/Minimize buttons
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 40, 0, 40)
CloseBtn.Position = UDim2.new(1, -45, 0, 5)
CloseBtn.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
CloseBtn.Text = "×"
CloseBtn.TextColor3 = Color3.new(1, 1, 1)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 24
CloseBtn.Parent = Header

local CloseCorner = Instance.new("UICorner", CloseBtn)
CloseCorner.CornerRadius = UDim.new(0, 8)

CloseBtn.MouseButton1Click:Connect(function()
    TweenService:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
        Size = UDim2.new(0, 0, 0, 0)
    }):Play()
    task.wait(0.3)
    ScreenGui:Destroy()
end)

local MinimizeBtn = Instance.new("TextButton")
MinimizeBtn.Size = UDim2.new(0, 40, 0, 40)
MinimizeBtn.Position = UDim2.new(1, -90, 0, 5)
MinimizeBtn.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
MinimizeBtn.Text = "_"
MinimizeBtn.TextColor3 = Color3.new(1, 1, 1)
MinimizeBtn.Font = Enum.Font.GothamBold
MinimizeBtn.TextSize = 20
MinimizeBtn.Parent = Header

local MinCorner = Instance.new("UICorner", MinimizeBtn)
MinCorner.CornerRadius = UDim.new(0, 8)

local isMinimized = false
MinimizeBtn.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    TweenService:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {
        Size = isMinimized and UDim2.new(0, 550, 0, 50) or UDim2.new(0, 550, 0, 420)
    }):Play()
    MinimizeBtn.Text = isMinimized and "+" or "_"
end)

-- TAB SYSTEM
local TabContainer = Instance.new("Frame")
TabContainer.Size = UDim2.new(0, 120, 1, -60)
TabContainer.Position = UDim2.new(0, 10, 0, 60)
TabContainer.BackgroundTransparency = 1
TabContainer.Parent = MainFrame

local TabLayout = Instance.new("UIListLayout", TabContainer)
TabLayout.Padding = UDim.new(0, 5)
TabLayout.SortOrder = Enum.SortOrder.LayoutOrder

local PageContainer = Instance.new("Frame")
PageContainer.Size = UDim2.new(1, -140, 1, -60)
PageContainer.Position = UDim2.new(0, 130, 0, 60)
PageContainer.BackgroundTransparency = 1
PageContainer.Parent = MainFrame

-- Pages
local Pages = {}
local CurrentPage = nil

local function CreatePage(name)
    local Page = Instance.new("ScrollingFrame")
    Page.Name = name .. "Page"
    Page.Size = UDim2.new(1, 0, 1, 0)
    Page.BackgroundTransparency = 1
    Page.ScrollBarThickness = 4
    Page.ScrollBarImageColor3 = Config.Theme
    Page.CanvasSize = UDim2.new(0, 0, 0, 0)
    Page.AutomaticCanvasSize = Enum.AutomaticSize.Y
    Page.Visible = false
    Page.Parent = PageContainer
    
    local Layout = Instance.new("UIListLayout", Page)
    Layout.Padding = UDim.new(0, 8)
    Layout.SortOrder = Enum.SortOrder.LayoutOrder
    Layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    
    local Padding = Instance.new("UIPadding", Page)
    Padding.PaddingLeft = UDim.new(0, 10)
    Padding.PaddingRight = UDim.new(0, 10)
    Padding.PaddingTop = UDim.new(0, 10)
    
    Pages[name] = Page
    return Page
end

local VisualPage = CreatePage("Visual")
local CombatPage = CreatePage("Combat")
local MovementPage = CreatePage("Movement")
local MiscPage = CreatePage("Misc")
local SettingsPage = CreatePage("Settings")

-- [ UI COMPONENTS ]
local function Tween(obj, props, duration)
    TweenService:Create(obj, TweenInfo.new(duration or 0.2, Enum.EasingStyle.Quad), props):Play()
end

local function CreateTab(name, icon)
    local Tab = Instance.new("TextButton")
    Tab.Size = UDim2.new(1, 0, 0, 35)
    Tab.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    Tab.Text = ""
    Tab.Parent = TabContainer
    
    local TabCorner = Instance.new("UICorner", Tab)
    TabCorner.CornerRadius = UDim.new(0, 8)
    
    local Label = Instance.new("TextLabel", Tab)
    Label.Size = UDim2.new(1, -10, 1, 0)
    Label.Position = UDim2.new(0, 5, 0, 0)
    Label.BackgroundTransparency = 1
    Label.Text = icon .. " " .. name
    Label.TextColor3 = Color3.fromRGB(200, 200, 200)
    Label.Font = Enum.Font.GothamBold
    Label.TextSize = 13
    Label.TextXAlignment = Enum.TextXAlignment.Left
    
    Tab.MouseEnter:Connect(function()
        if CurrentPage ~= Pages[name] then
            Tween(Tab, {BackgroundColor3 = Color3.fromRGB(35, 35, 35)})
        end
    end)
    
    Tab.MouseLeave:Connect(function()
        if CurrentPage ~= Pages[name] then
            Tween(Tab, {BackgroundColor3 = Color3.fromRGB(25, 25, 25)})
        end
    end)
    
    Tab.MouseButton1Click:Connect(function()
        for _, page in pairs(Pages) do
            page.Visible = false
        end
        
        for _, tab in pairs(TabContainer:GetChildren()) do
            if tab:IsA("TextButton") then
                Tween(tab, {BackgroundColor3 = Color3.fromRGB(25, 25, 25)})
                local lbl = tab:FindFirstChildOfClass("TextLabel")
                if lbl then
                    Tween(lbl, {TextColor3 = Color3.fromRGB(200, 200, 200)})
                end
            end
        end
        
        Pages[name].Visible = true
        CurrentPage = Pages[name]
        Tween(Tab, {BackgroundColor3 = Config.Theme})
        Tween(Label, {TextColor3 = Color3.new(1, 1, 1)})
    end)
    
    return Tab
end

-- Create Tabs
CreateTab("Visual", "👁")
CreateTab("Combat", "⚔")
CreateTab("Movement", "🏃")
CreateTab("Misc", "⚙")
CreateTab("Settings", "🔧")

-- Set default page
VisualPage.Visible = true
CurrentPage = VisualPage
local firstTab = TabContainer:GetChildren()[2]
if firstTab:IsA("TextButton") then
    firstTab.BackgroundColor3 = Config.Theme
    local lbl = firstTab:FindFirstChildOfClass("TextLabel")
    if lbl then lbl.TextColor3 = Color3.new(1, 1, 1) end
end

-- [ UI ELEMENTS CREATORS ]
local function CreateSection(parent, text)
    local Section = Instance.new("Frame")
    Section.Size = UDim2.new(1, 0, 0, 30)
    Section.BackgroundTransparency = 1
    Section.Parent = parent
    
    local Label = Instance.new("TextLabel", Section)
    Label.Size = UDim2.new(1, 0, 1, 0)
    Label.BackgroundTransparency = 1
    Label.Text = text
    Label.TextColor3 = Config.Theme
    Label.Font = Enum.Font.GothamBold
    Label.TextSize = 16
    Label.TextXAlignment = Enum.TextXAlignment.Left
    
    local Line = Instance.new("Frame", Section)
    Line.Size = UDim2.new(1, 0, 0, 1)
    Line.Position = UDim2.new(0, 0, 1, -2)
    Line.BackgroundColor3 = Config.Theme
    Line.BorderSizePixel = 0
    
    return Section
end

local function CreateToggle(parent, text, default, callback)
    local Toggle = Instance.new("Frame")
    Toggle.Size = UDim2.new(1, 0, 0, 35)
    Toggle.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    Toggle.Parent = parent
    
    local ToggleCorner = Instance.new("UICorner", Toggle)
    ToggleCorner.CornerRadius = UDim.new(0, 8)
    
    local Label = Instance.new("TextLabel", Toggle)
    Label.Size = UDim2.new(1, -50, 1, 0)
    Label.Position = UDim2.new(0, 10, 0, 0)
    Label.BackgroundTransparency = 1
    Label.Text = text
    Label.TextColor3 = Color3.new(1, 1, 1)
    Label.Font = Enum.Font.Gotham
    Label.TextSize = 14
    Label.TextXAlignment = Enum.TextXAlignment.Left
    
    local Switch = Instance.new("Frame", Toggle)
    Switch.Size = UDim2.new(0, 40, 0, 20)
    Switch.Position = UDim2.new(1, -45, 0.5, -10)
    Switch.BackgroundColor3 = default and Config.Theme or Color3.fromRGB(50, 50, 50)
    
    local SwitchCorner = Instance.new("UICorner", Switch)
    SwitchCorner.CornerRadius = UDim.new(1, 0)
    
    local Circle = Instance.new("Frame", Switch)
    Circle.Size = UDim2.new(0, 16, 0, 16)
    Circle.Position = default and UDim2.new(1, -18, 0.5, -8) or UDim2.new(0, 2, 0.5, -8)
    Circle.BackgroundColor3 = Color3.new(1, 1, 1)
    
    local CircleCorner = Instance.new("UICorner", Circle)
    CircleCorner.CornerRadius = UDim.new(1, 0)
    
    local Button = Instance.new("TextButton", Toggle)
    Button.Size = UDim2.new(1, 0, 1, 0)
    Button.BackgroundTransparency = 1
    Button.Text = ""
    
    local enabled = default
    
    Button.MouseButton1Click:Connect(function()
        enabled = not enabled
        
        Tween(Switch, {BackgroundColor3 = enabled and Config.Theme or Color3.fromRGB(50, 50, 50)}, 0.2)
        Tween(Circle, {Position = enabled and UDim2.new(1, -18, 0.5, -8) or UDim2.new(0, 2, 0.5, -8)}, 0.2)
        
        -- Ripple effect
        local Ripple = Instance.new("Frame", Toggle)
        Ripple.Size = UDim2.new(0, 0, 0, 0)
        Ripple.Position = UDim2.new(0.5, 0, 0.5, 0)
        Ripple.AnchorPoint = Vector2.new(0.5, 0.5)
        Ripple.BackgroundColor3 = Config.Theme
        Ripple.BackgroundTransparency = 0.5
        Ripple.BorderSizePixel = 0
        local rippleCorner = Instance.new("UICorner", Ripple)
        rippleCorner.CornerRadius = UDim.new(1, 0)
        
        TweenService:Create(Ripple, TweenInfo.new(0.5), {
            Size = UDim2.new(2, 0, 2, 0),
            BackgroundTransparency = 1
        }):Play()
        
        task.delay(0.5, function() Ripple:Destroy() end)
        
        callback(enabled)
    end)
    
    Button.MouseEnter:Connect(function()
        Tween(Toggle, {BackgroundColor3 = Color3.fromRGB(30, 30, 30)})
    end)
    
    Button.MouseLeave:Connect(function()
        Tween(Toggle, {BackgroundColor3 = Color3.fromRGB(25, 25, 25)})
    end)
    
    return Toggle
end

local function CreateSlider(parent, text, min, max, default, callback)
    local Slider = Instance.new("Frame")
    Slider.Size = UDim2.new(1, 0, 0, 50)
    Slider.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    Slider.Parent = parent
    
    local SliderCorner = Instance.new("UICorner", Slider)
    SliderCorner.CornerRadius = UDim.new(0, 8)
    
    local Label = Instance.new("TextLabel", Slider)
    Label.Size = UDim2.new(1, -20, 0, 20)
    Label.Position = UDim2.new(0, 10, 0, 5)
    Label.BackgroundTransparency = 1
    Label.Text = text
    Label.TextColor3 = Color3.new(1, 1, 1)
    Label.Font = Enum.Font.Gotham
    Label.TextSize = 14
    Label.TextXAlignment = Enum.TextXAlignment.Left
    
    local ValueLabel = Instance.new("TextLabel", Slider)
    ValueLabel.Size = UDim2.new(0, 50, 0, 20)
    ValueLabel.Position = UDim2.new(1, -60, 0, 5)
    ValueLabel.BackgroundTransparency = 1
    ValueLabel.Text = tostring(default)
    ValueLabel.TextColor3 = Config.Theme
    ValueLabel.Font = Enum.Font.GothamBold
    ValueLabel.TextSize = 14
    ValueLabel.TextXAlignment = Enum.TextXAlignment.Right
    
    local SliderBack = Instance.new("Frame", Slider)
    SliderBack.Size = UDim2.new(1, -20, 0, 4)
    SliderBack.Position = UDim2.new(0, 10, 1, -15)
    SliderBack.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    
    local SliderBackCorner = Instance.new("UICorner", SliderBack)
    SliderBackCorner.CornerRadius = UDim.new(1, 0)
    
    local SliderFill = Instance.new("Frame", SliderBack)
    SliderFill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
    SliderFill.BackgroundColor3 = Config.Theme
    SliderFill.BorderSizePixel = 0
    
    local SliderFillCorner = Instance.new("UICorner", SliderFill)
    SliderFillCorner.CornerRadius = UDim.new(1, 0)
    
    local SliderButton = Instance.new("TextButton", Slider)
    SliderButton.Size = UDim2.new(1, 0, 1, 0)
    SliderButton.BackgroundTransparency = 1
    SliderButton.Text = ""
    
    local dragging = false
    
    SliderButton.MouseButton1Down:Connect(function()
        dragging = true
    end)
    
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
    
    local function update(input)
        local pos = math.clamp((input.Position.X - SliderBack.AbsolutePosition.X) / SliderBack.AbsoluteSize.X, 0, 1)
        local value = math.floor(min + (max - min) * pos)
        
        Tween(SliderFill, {Size = UDim2.new(pos, 0, 1, 0)}, 0.1)
        ValueLabel.Text = tostring(value)
        callback(value)
    end
    
    SliderButton.MouseButton1Down:Connect(function()
        update(UserInputService:GetMouseLocation())
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            update(input)
        end
    end)
    
    return Slider
end

local function CreateButton(parent, text, callback)
    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(1, 0, 0, 40)
    Button.BackgroundColor3 = Config.Theme
    Button.Text = text
    Button.TextColor3 = Color3.new(1, 1, 1)
    Button.Font = Enum.Font.GothamBold
    Button.TextSize = 14
    Button.Parent = parent
    
    local ButtonCorner = Instance.new("UICorner", Button)
    ButtonCorner.CornerRadius = UDim.new(0, 8)
    
    local Gradient = Instance.new("UIGradient", Button)
    Gradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(200, 200, 200))
    }
    Gradient.Rotation = 90
    
    Button.MouseEnter:Connect(function()
        Tween(Button, {Size = UDim2.new(1, 0, 0, 42)})
    end)
    
    Button.MouseLeave:Connect(function()
        Tween(Button, {Size = UDim2.new(1, 0, 0, 40)})
    end)
    
    Button.MouseButton1Click:Connect(function()
        -- Click animation
        Tween(Button, {Size = UDim2.new(0.95, 0, 0, 38)}, 0.1)
        task.wait(0.1)
        Tween(Button, {Size = UDim2.new(1, 0, 0, 40)}, 0.1)
        callback()
    end)
    
    return Button
end

-- [ VISUAL PAGE ]
CreateSection(VisualPage, GetText("ESPSection"))

CreateToggle(VisualPage, GetText("ESPMaster"), Config.ESP.Master, function(v)
    Config.ESP.Master = v
end)

CreateToggle(VisualPage, GetText("ShowMurderer"), Config.ESP.Murderer, function(v)
    Config.ESP.Murderer = v
end)

CreateToggle(VisualPage, GetText("ShowSheriff"), Config.ESP.Sheriff, function(v)
    Config.ESP.Sheriff = v
end)

CreateToggle(VisualPage, GetText("ShowInnocent"), Config.ESP.Innocent, function(v)
    Config.ESP.Innocent = v
end)

CreateToggle(VisualPage, GetText("GunDrop"), Config.ESP.GunDrop, function(v)
    Config.ESP.GunDrop = v
end)

CreateToggle(VisualPage, GetText("Tracers"), Config.ESP.Tracers, function(v)
    Config.ESP.Tracers = v
end)

CreateToggle(VisualPage, GetText("ShowNames"), Config.ESP.ShowNames, function(v)
    Config.ESP.ShowNames = v
end)

CreateToggle(VisualPage, GetText("ShowDistance"), Config.ESP.ShowDistance, function(v)
    Config.ESP.ShowDistance = v
end)

CreateToggle(VisualPage, GetText("ShowHealth"), Config.ESP.ShowHealth, function(v)
    Config.ESP.ShowHealth = v
end)

CreateToggle(VisualPage, GetText("BoxESP"), Config.ESP.BoxESP, function(v)
    Config.ESP.BoxESP = v
end)

-- [ COMBAT PAGE ]
CreateSection(CombatPage, GetText("CombatSection"))

CreateToggle(CombatPage, GetText("AimBot"), Config.AimBot.Enabled, function(v)
    Config.AimBot.Enabled = v
end)

CreateToggle(CombatPage, GetText("AutoShoot"), Config.AimBot.AutoShoot, function(v)
    Config.AimBot.AutoShoot = v
end)

CreateToggle(CombatPage, GetText("ShowFOV"), Config.AimBot.ShowFOV, function(v)
    Config.AimBot.ShowFOV = v
end)

CreateSlider(CombatPage, GetText("FOVSize"), 50, 300, Config.AimBot.FOV, function(v)
    Config.AimBot.FOV = v
end)

CreateSlider(CombatPage, GetText("AimSmoothness"), 1, 20, Config.AimBot.Smoothness, function(v)
    Config.AimBot.Smoothness = v
end)

local ShootBtn = CreateButton(CombatPage, GetText("ShootMurderer"), function()
    -- Will be implemented later
end)

-- [ MOVEMENT PAGE ]
CreateSection(MovementPage, GetText("MovementSection"))

CreateToggle(MovementPage, GetText("SpeedHack"), Config.Speed.Enabled, function(v)
    Config.Speed.Enabled = v
end)

CreateSlider(MovementPage, GetText("Speed"), 16, 200, Config.Speed.Value, function(v)
    Config.Speed.Value = v
end)

CreateToggle(MovementPage, GetText("JumpHack"), Config.Jump.Enabled, function(v)
    Config.Jump.Enabled = v
end)

CreateSlider(MovementPage, GetText("JumpPower"), 50, 200, Config.Jump.Value, function(v)
    Config.Jump.Value = v
end)

CreateToggle(MovementPage, GetText("TeleportGun"), Config.TeleportGun, function(v)
    Config.TeleportGun = v
end)

CreateToggle(MovementPage, GetText("Noclip"), Config.Noclip, function(v)
    Config.Noclip = v
end)

CreateToggle(MovementPage, GetText("InfiniteJump"), Config.InfiniteJump, function(v)
    Config.InfiniteJump = v
end)

CreateToggle(MovementPage, GetText("Flight"), Config.Flight.Enabled, function(v)
    Config.Flight.Enabled = v
end)

CreateSlider(MovementPage, GetText("FlightSpeed"), 10, 200, Config.Flight.Speed, function(v)
    Config.Flight.Speed = v
end)

-- [ MISC PAGE ]
CreateSection(MiscPage, GetText("FarmSection"))

CreateToggle(MiscPage, GetText("AutoCollectCoins"), Config.AutoCollectCoins, function(v)
    Config.AutoCollectCoins = v
end)

CreateSection(MiscPage, GetText("MiscSection"))

CreateToggle(MiscPage, "Full Bright", false, function(v)
    if v then
        Lighting.Brightness = 2
        Lighting.ClockTime = 14
        Lighting.FogEnd = 100000
        Lighting.GlobalShadows = false
        Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
    else
        Lighting.Brightness = 1
        Lighting.ClockTime = 12
        Lighting.FogEnd = 100000
        Lighting.GlobalShadows = true
        Lighting.OutdoorAmbient = Color3.fromRGB(70, 70, 70)
    end
end)

-- [ SETTINGS PAGE ]
CreateSection(SettingsPage, GetText("Settings"))

CreateToggle(SettingsPage, GetText("Notifications"), Config.Notifications, function(v)
    Config.Notifications = v
end)

local LangBtn = CreateButton(SettingsPage, GetText("Language") .. ": " .. Config.Language, function()
    Config.Language = Config.Language == "RU" and "EN" or "RU"
    LangBtn.Text = GetText("Language") .. ": " .. Config.Language
    ShowNotification("Language changed to " .. Config.Language, 2)
    -- Update all text
    Title.Text = GetText("Title")
end)

-- [ CORE FUNCTIONS ]

-- Get Player Role
local function GetPlayerRole(player)
    if player.Backpack:FindFirstChild("Knife") or (player.Character and player.Character:FindFirstChild("Knife")) then
        return "Murderer", Color3.fromRGB(255, 0, 0)
    elseif player.Backpack:FindFirstChild("Gun") or (player.Character and player.Character:FindFirstChild("Gun")) then
        return "Sheriff", Color3.fromRGB(0, 0, 255)
    else
        return "Innocent", Color3.fromRGB(0, 255, 0)
    end
end

-- FOV Circle
local FOVCircle = Drawing.new("Circle")
FOVCircle.Thickness = 2
FOVCircle.NumSides = 50
FOVCircle.Radius = Config.AimBot.FOV
FOVCircle.Filled = false
FOVCircle.Transparency = 1
FOVCircle.ZIndex = 999
FOVCircle.Color = Config.Theme

-- ESP Update
local function UpdateESP()
    if not Config.ESP.Master then return end
    
    -- Players ESP
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") and p.Character:FindFirstChild("Humanoid") then
            local hrp = p.Character.HumanoidRootPart
            
            if not hrp or not p.Character.Humanoid or p.Character.Humanoid.Health <= 0 then
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
                    hl.FillTransparency = 0.5
                    hl.OutlineTransparency = 0
                end
                hl.FillColor = color
                hl.OutlineColor = color
            else
                if hl then hl:Destroy() end
            end
            
            -- BILLBOARD
            local bg = p.Character:FindFirstChild("BaziXX_BG")
            if show and (Config.ESP.ShowNames or Config.ESP.ShowDistance or Config.ESP.ShowHealth) then
                if not bg then
                    bg = Instance.new("BillboardGui", p.Character)
                    bg.Name = "BaziXX_BG"
                    bg.Size = UDim2.new(0, 200, 0, 60)
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
                    local healthText = Config.ESP.ShowHealth and ("\n❤ " .. math.floor(p.Character.Humanoid.Health) .. "/" .. math.floor(p.Character.Humanoid.MaxHealth)) or ""
                    local roleText = GetText(role)
                    
                    label.Text = roleText .. "\n" .. nameText .. distText .. healthText
                    label.TextColor3 = color
                end
            else
                if bg then bg:Destroy() end
            end
            
            -- TRACERS
            local line = p.Character:FindFirstChild("BaziXX_Tracer")
            if show and Config.ESP.Tracers then
                if not line then
                    local att0 = Instance.new("Attachment", workspace.Terrain)
                    att0.Name = "BaziXX_TracerAtt0_" .. p.Name
                    
                    local att1 = Instance.new("Attachment", hrp)
                    att1.Name = "BaziXX_TracerAtt1"
                    
                    line = Instance.new("Beam", p.Character)
                    line.Name = "BaziXX_Tracer"
                    line.Attachment0 = att0
                    line.Attachment1 = att1
                    line.Width0 = 0.1
                    line.Width1 = 0.1
                    line.FaceCamera = true
                    line.Transparency = NumberSequence.new(0.3)
                    
                    line:SetAttribute("Att0", att0)
                end
                
                line.Color = ColorSequence.new(color)
                
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
    
    -- Gun ESP
    local gun = workspace:FindFirstChild("GunDrop")
    if gun and gun:FindFirstChild("Handle") then
        local hl = gun:FindFirstChild("BaziXX_GunHL")
        if Config.ESP.GunDrop then
            if not hl then
                hl = Instance.new("Highlight", gun)
                hl.Name = "BaziXX_GunHL"
                hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                hl.FillColor = Color3.fromRGB(255, 255, 0)
                hl.OutlineColor = Color3.fromRGB(255, 255, 0)
                hl.FillTransparency = 0.3
                hl.OutlineTransparency = 0
            end
            
            local bg = gun:FindFirstChild("BaziXX_GunBG")
            if not bg then
                bg = Instance.new("BillboardGui", gun)
                bg.Name = "BaziXX_GunBG"
                bg.Size = UDim2.new(0, 200, 0, 50)
                bg.AlwaysOnTop = true
                bg.StudsOffset = Vector3.new(0, 2, 0)
                bg.Adornee = gun.Handle
                
                local txt = Instance.new("TextLabel", bg)
                txt.Size = UDim2.new(1, 0, 1, 0)
                txt.BackgroundTransparency = 1
                txt.Text = GetText("GunHere")
                txt.TextColor3 = Color3.fromRGB(255, 255, 0)
                txt.Font = Enum.Font.GothamBold
                txt.TextSize = 16
                txt.TextStrokeTransparency = 0
                txt.TextStrokeColor3 = Color3.new(0, 0, 0)
            end
        else
            if hl then hl:Destroy() end
            if gun:FindFirstChild("BaziXX_GunBG") then gun.BaziXX_GunBG:Destroy() end
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
                ShowNotification(GetText("TeleportedToGun"), 1)
            end
        end
    end
end)

-- Noclip
RunService.Stepped:Connect(function()
    if Config.Noclip and LocalPlayer.Character then
        for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end
end)

-- Infinite Jump
UserInputService.JumpRequest:Connect(function()
    if Config.InfiniteJump and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
    end
end)

-- Flight
local flying = false
local flySpeed = Config.Flight.Speed
local flyControl = {F = 0, B = 0, L = 0, R = 0}
local flyBV, flyBG

local function startFly()
    if not LocalPlayer.Character or not LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then return end
    
    local hrp = LocalPlayer.Character.HumanoidRootPart
    
    flyBV = Instance.new("BodyVelocity", hrp)
    flyBV.Velocity = Vector3.new(0, 0, 0)
    flyBV.MaxForce = Vector3.new(9e4, 9e4, 9e4)
    
    flyBG = Instance.new("BodyGyro", hrp)
    flyBG.MaxTorque = Vector3.new(9e4, 9e4, 9e4)
    flyBG.CFrame = hrp.CFrame
    
    flying = true
end

local function stopFly()
    if flyBV then flyBV:Destroy() end
    if flyBG then flyBG:Destroy() end
    flying = false
end

UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if not Config.Flight.Enabled then return end
    
    if input.KeyCode == Enum.KeyCode.W then
        flyControl.F = 1
    elseif input.KeyCode == Enum.KeyCode.S then
        flyControl.B = -1
    elseif input.KeyCode == Enum.KeyCode.A then
        flyControl.L = -1
    elseif input.KeyCode == Enum.KeyCode.D then
        flyControl.R = 1
    end
end)

UserInputService.InputEnded:Connect(function(input, gpe)
    if input.KeyCode == Enum.KeyCode.W then
        flyControl.F = 0
    elseif input.KeyCode == Enum.KeyCode.S then
        flyControl.B = 0
    elseif input.KeyCode == Enum.KeyCode.A then
        flyControl.L = 0
    elseif input.KeyCode == Enum.KeyCode.D then
        flyControl.R = 0
    end
end)

-- Auto Collect Coins
spawn(function()
    while task.wait(0.1) do
        if Config.AutoCollectCoins and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            for _, coin in pairs(workspace:GetChildren()) do
                if coin.Name == "Coin" or coin.Name == "CoinContainer" then
                    if coin:FindFirstChild("ClickDetector") then
                        fireclickdetector(coin.ClickDetector)
                    end
                end
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
    
    -- JumpHack
    if Config.Jump.Enabled and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.JumpPower = Config.Jump.Value
    end
    
    -- Flight
    if Config.Flight.Enabled then
        if not flying then
            startFly()
        end
        
        if flying and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local hrp = LocalPlayer.Character.HumanoidRootPart
            local cam = workspace.CurrentCamera
            
            local speed = Config.Flight.Speed
            
            if flyBV and flyBG then
                flyBG.CFrame = cam.CFrame
                
                local direction = ((cam.CFrame.LookVector * (flyControl.F + flyControl.B)) + 
                                  ((cam.CFrame * CFrame.new(flyControl.L + flyControl.R, 0, 0).Position) - cam.CFrame.Position))
                
                flyBV.Velocity = direction * speed
            end
        end
    else
        if flying then
            stopFly()
        end
    end
    
    -- FOV Circle
    if Config.AimBot.ShowFOV then
        FOVCircle.Visible = true
        FOVCircle.Radius = Config.AimBot.FOV
        FOVCircle.Position = UserInputService:GetMouseLocation()
        FOVCircle.Color = Config.Theme
    else
        FOVCircle.Visible = false
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
                        local targetPart = p.Character:FindFirstChild(Config.AimBot.TargetPart) or p.Character.HumanoidRootPart
                        local dist = (targetPart.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                        
                        local screenPos, onScreen = Camera:WorldToViewportPoint(targetPart.Position)
                        if onScreen then
                            local mousePos = UserInputService:GetMouseLocation()
                            local screenDist = (Vector2.new(screenPos.X, screenPos.Y) - mousePos).Magnitude
                            
                            if screenDist < Config.AimBot.FOV and dist < closest then
                                closest = dist
                                target = targetPart
                            end
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

-- Manual Shoot Button
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
            
            ShowNotification("Shot at Murderer!", 1)
        end
    else
        ShowNotification("No target or gun found!", 2)
    end
end)

-- Cleanup on player death
LocalPlayer.CharacterAdded:Connect(function()
    task.wait(1)
    if Config.Speed.Enabled and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.WalkSpeed = Config.Speed.Value
    end
    if Config.Jump.Enabled and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.JumpPower = Config.Jump.Value
    end
end)

-- Intro Animation
MainFrame.Size = UDim2.new(0, 0, 0, 0)
TweenService:Create(MainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
    Size = UDim2.new(0, 550, 0, 420)
}):Play()

ShowNotification("BaziXX Hub v1.0 loaded! 🎉", 3)
print("BaziXX Hub v1.0 loaded successfully!")
