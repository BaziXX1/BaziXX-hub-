--[[
    BaziXX Hub - Animation Library & Utilities
    Additional functions and effects
]]

local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

local AnimationLib = {}

-- Smooth Tween Function
function AnimationLib:Tween(instance, properties, duration, easingStyle, easingDirection)
    duration = duration or 0.3
    easingStyle = easingStyle or Enum.EasingStyle.Quad
    easingDirection = easingDirection or Enum.EasingDirection.Out
    
    local tween = TweenService:Create(
        instance,
        TweenInfo.new(duration, easingStyle, easingDirection),
        properties
    )
    
    tween:Play()
    return tween
end

-- Ripple Effect
function AnimationLib:CreateRipple(parent, color)
    local ripple = Instance.new("Frame")
    ripple.Size = UDim2.new(0, 0, 0, 0)
    ripple.Position = UDim2.new(0.5, 0, 0.5, 0)
    ripple.AnchorPoint = Vector2.new(0.5, 0.5)
    ripple.BackgroundColor3 = color or Color3.fromRGB(255, 255, 255)
    ripple.BackgroundTransparency = 0.5
    ripple.BorderSizePixel = 0
    ripple.Parent = parent
    
    local corner = Instance.new("UICorner", ripple)
    corner.CornerRadius = UDim.new(1, 0)
    
    local tween = TweenService:Create(
        ripple,
        TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {
            Size = UDim2.new(2, 0, 2, 0),
            BackgroundTransparency = 1
        }
    )
    
    tween:Play()
    
    task.delay(0.6, function()
        ripple:Destroy()
    end)
end

-- Pulse Animation
function AnimationLib:PulseAnimation(instance, property, startValue, endValue, duration)
    duration = duration or 1
    
    spawn(function()
        while instance and instance.Parent do
            local tween1 = self:Tween(instance, {[property] = endValue}, duration/2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
            tween1.Completed:Wait()
            
            local tween2 = self:Tween(instance, {[property] = startValue}, duration/2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
            tween2.Completed:Wait()
        end
    end)
end

-- Rainbow Effect
function AnimationLib:RainbowEffect(instance, property, speed)
    speed = speed or 1
    
    spawn(function()
        while instance and instance.Parent do
            for hue = 0, 1, 0.01 * speed do
                if not instance or not instance.Parent then break end
                instance[property] = Color3.fromHSV(hue, 1, 1)
                RunService.RenderStepped:Wait()
            end
        end
    end)
end

-- Shake Animation
function AnimationLib:Shake(instance, intensity, duration)
    intensity = intensity or 5
    duration = duration or 0.5
    
    local originalPos = instance.Position
    local startTime = tick()
    
    spawn(function()
        while tick() - startTime < duration do
            local offsetX = math.random(-intensity, intensity)
            local offsetY = math.random(-intensity, intensity)
            
            instance.Position = UDim2.new(
                originalPos.X.Scale,
                originalPos.X.Offset + offsetX,
                originalPos.Y.Scale,
                originalPos.Y.Offset + offsetY
            )
            
            RunService.RenderStepped:Wait()
        end
        
        instance.Position = originalPos
    end)
end

-- Bounce Animation
function AnimationLib:Bounce(instance, height, duration)
    height = height or 10
    duration = duration or 0.5
    
    local originalPos = instance.Position
    
    local tween1 = self:Tween(
        instance,
        {Position = UDim2.new(originalPos.X.Scale, originalPos.X.Offset, originalPos.Y.Scale, originalPos.Y.Offset - height)},
        duration/2,
        Enum.EasingStyle.Quad,
        Enum.EasingDirection.Out
    )
    
    tween1.Completed:Connect(function()
        self:Tween(
            instance,
            {Position = originalPos},
            duration/2,
            Enum.EasingStyle.Bounce,
            Enum.EasingDirection.Out
        )
    end)
end

-- Fade In Animation
function AnimationLib:FadeIn(instance, duration)
    duration = duration or 0.3
    
    if instance:IsA("GuiObject") then
        instance.BackgroundTransparency = 1
        self:Tween(instance, {BackgroundTransparency = 0}, duration)
    elseif instance:IsA("TextLabel") or instance:IsA("TextButton") then
        instance.TextTransparency = 1
        self:Tween(instance, {TextTransparency = 0}, duration)
    end
end

-- Fade Out Animation
function AnimationLib:FadeOut(instance, duration)
    duration = duration or 0.3
    
    local tween
    if instance:IsA("GuiObject") then
        tween = self:Tween(instance, {BackgroundTransparency = 1}, duration)
    elseif instance:IsA("TextLabel") or instance:IsA("TextButton") then
        tween = self:Tween(instance, {TextTransparency = 1}, duration)
    end
    
    if tween then
        tween.Completed:Connect(function()
            instance:Destroy()
        end)
    end
end

-- Slide In Animation
function AnimationLib:SlideIn(instance, direction, duration)
    direction = direction or "Left"
    duration = duration or 0.3
    
    local originalPos = instance.Position
    local startPos
    
    if direction == "Left" then
        startPos = UDim2.new(-1, 0, originalPos.Y.Scale, originalPos.Y.Offset)
    elseif direction == "Right" then
        startPos = UDim2.new(2, 0, originalPos.Y.Scale, originalPos.Y.Offset)
    elseif direction == "Top" then
        startPos = UDim2.new(originalPos.X.Scale, originalPos.X.Offset, -1, 0)
    elseif direction == "Bottom" then
        startPos = UDim2.new(originalPos.X.Scale, originalPos.X.Offset, 2, 0)
    end
    
    instance.Position = startPos
    self:Tween(instance, {Position = originalPos}, duration, Enum.EasingStyle.Back)
end

-- Rotate Animation
function AnimationLib:Rotate(instance, degrees, duration)
    duration = duration or 1
    
    if instance:IsA("ImageLabel") or instance:IsA("ImageButton") then
        self:Tween(instance, {Rotation = degrees}, duration, Enum.EasingStyle.Linear)
    end
end

-- Scale Animation
function AnimationLib:Scale(instance, scale, duration)
    duration = duration or 0.3
    
    local originalSize = instance.Size
    
    self:Tween(
        instance,
        {Size = UDim2.new(originalSize.X.Scale * scale, 0, originalSize.Y.Scale * scale, 0)},
        duration,
        Enum.EasingStyle.Back
    )
end

-- Glow Effect
function AnimationLib:AddGlow(instance, color, intensity)
    color = color or Color3.new(1, 1, 1)
    intensity = intensity or 0.5
    
    local glow = Instance.new("ImageLabel")
    glow.Size = UDim2.new(1, 20, 1, 20)
    glow.Position = UDim2.new(0, -10, 0, -10)
    glow.BackgroundTransparency = 1
    glow.Image = "rbxassetid://5554236805"
    glow.ImageColor3 = color
    glow.ImageTransparency = 1 - intensity
    glow.ScaleType = Enum.ScaleType.Slice
    glow.SliceCenter = Rect.new(23, 23, 277, 277)
    glow.ZIndex = instance.ZIndex - 1
    glow.Parent = instance
    
    return glow
end

-- Particle Effect
function AnimationLib:CreateParticles(parent, color, count)
    count = count or 10
    color = color or Color3.fromRGB(0, 120, 255)
    
    for i = 1, count do
        local particle = Instance.new("Frame")
        particle.Size = UDim2.new(0, math.random(2, 5), 0, math.random(2, 5))
        particle.Position = UDim2.new(math.random(), 0, math.random(), 0)
        particle.BackgroundColor3 = color
        particle.BorderSizePixel = 0
        particle.Parent = parent
        
        local corner = Instance.new("UICorner", particle)
        corner.CornerRadius = UDim.new(1, 0)
        
        -- Random movement
        spawn(function()
            local endPos = UDim2.new(
                math.random(-1, 2),
                0,
                math.random(-1, 2),
                0
            )
            
            local tween = self:Tween(
                particle,
                {
                    Position = endPos,
                    BackgroundTransparency = 1
                },
                math.random(1, 3),
                Enum.EasingStyle.Quad
            )
            
            tween.Completed:Connect(function()
                particle:Destroy()
            end)
        end)
    end
end

-- Utility Functions
local Utils = {}

-- Format Number
function Utils:FormatNumber(num)
    if num >= 1000000 then
        return string.format("%.1fM", num / 1000000)
    elseif num >= 1000 then
        return string.format("%.1fK", num / 1000)
    else
        return tostring(num)
    end
end

-- Round Number
function Utils:Round(num, decimals)
    decimals = decimals or 0
    local mult = 10^decimals
    return math.floor(num * mult + 0.5) / mult
end

-- Get Distance
function Utils:GetDistance(pos1, pos2)
    return (pos1 - pos2).Magnitude
end

-- Format Time
function Utils:FormatTime(seconds)
    local hours = math.floor(seconds / 3600)
    local minutes = math.floor((seconds % 3600) / 60)
    local secs = math.floor(seconds % 60)
    
    if hours > 0 then
        return string.format("%02d:%02d:%02d", hours, minutes, secs)
    else
        return string.format("%02d:%02d", minutes, secs)
    end
end

-- Check if Player is Visible
function Utils:IsVisible(part, camera)
    camera = camera or workspace.CurrentCamera
    
    local ray = Ray.new(camera.CFrame.Position, (part.Position - camera.CFrame.Position).Unit * 500)
    local hit = workspace:FindPartOnRayWithIgnoreList(ray, {camera})
    
    return hit == part or hit:IsDescendantOf(part.Parent)
end

-- Get All Players in Radius
function Utils:GetPlayersInRadius(position, radius)
    local players = {}
    
    for _, player in pairs(game.Players:GetPlayers()) do
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local distance = self:GetDistance(position, player.Character.HumanoidRootPart.Position)
            if distance <= radius then
                table.insert(players, player)
            end
        end
    end
    
    return players
end

return {
    Animation = AnimationLib,
    Utils = Utils
}
