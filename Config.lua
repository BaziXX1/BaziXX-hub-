--[[
    BaziXX Hub - Configuration File
    Customize your settings here
]]

return {
    -- ESP Settings
    ESP = {
        Master = false,              -- Main ESP toggle
        Murderer = true,             -- Show murderer
        Sheriff = true,              -- Show sheriff
        Innocent = false,            -- Show innocent players
        GunDrop = true,              -- Highlight gun drops
        Tracers = false,             -- Show lines to players
        ShowDistance = true,         -- Display distance
        ShowNames = true,            -- Display player names
        ShowHealth = true,           -- Display health bars
        BoxESP = false,              -- Box around players
        ChamsEnabled = false         -- Chams effect
    },
    
    -- Speed Hack
    Speed = {
        Enabled = false,
        Value = 16                   -- Default Roblox speed
    },
    
    -- Jump Power
    Jump = {
        Enabled = false,
        Value = 50                   -- Default jump power
    },
    
    -- AimBot Settings
    AimBot = {
        Enabled = false,
        AutoShoot = false,
        FOV = 100,                   -- Field of view for aimbot
        ShowFOV = false,             -- Show FOV circle
        Smoothness = 5,              -- Aim smoothness (1-20)
        TargetPart = "Head"          -- "Head" or "HumanoidRootPart"
    },
    
    -- Teleport Settings
    TeleportGun = false,             -- Auto teleport to gun
    
    -- Auto Farm
    AutoCollectCoins = false,        -- Auto collect coins
    
    -- Kill All (Sheriff only)
    KillAll = false,
    
    -- Movement
    Noclip = false,                  -- Walk through walls
    InfiniteJump = false,            -- Jump infinitely
    
    -- Flight
    Flight = {
        Enabled = false,
        Speed = 50                   -- Flight speed
    },
    
    -- UI Settings
    Theme = Color3.fromRGB(0, 120, 255),  -- Theme color (Blue)
    Language = "RU",                      -- "RU" or "EN"
    UIScale = 1,                          -- UI scale multiplier
    Notifications = true,                 -- Show notifications
    
    -- Advanced Settings
    Advanced = {
        AntiKick = false,            -- Anti-kick (experimental)
        AntiCheat = false,           -- Anti-cheat bypass (risky)
        PerformanceMode = false      -- Reduce effects for better FPS
    }
}
