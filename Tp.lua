local Players = game:GetService("Players")
local player = Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

if player:WaitForChild("PlayerGui"):FindFirstChild("TeleportUI") then
    player.PlayerGui.TeleportUI:Destroy()
end

local gui = Instance.new("ScreenGui")
gui.Name = "TeleportUI"
gui.ResetOnSpawn = false
gui.ZIndexBehavior = Enum.ZIndexBehavior.Global
gui.Parent = player:WaitForChild("PlayerGui")

local HIGHEST_Z = 1000000

local backdrop = Instance.new("Frame", gui)
backdrop.Size = UDim2.new(0, 320, 0, 240)
backdrop.Position = UDim2.new(0.5, -160, 0.1, 0)
backdrop.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
backdrop.BorderSizePixel = 0
backdrop.Active = true
backdrop.Draggable = true
backdrop.ZIndex = HIGHEST_Z
backdrop.BackgroundTransparency = 0.3

local backdropCorner = Instance.new("UICorner", backdrop)
backdropCorner.CornerRadius = UDim.new(0, 12)

local frame = Instance.new("Frame", backdrop)
frame.Size = UDim2.new(1, -6, 1, -6)
frame.Position = UDim2.new(0, 3, 0, 3)
frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
frame.BorderSizePixel = 0
frame.ZIndex = HIGHEST_Z + 1

local frameCorner = Instance.new("UICorner", frame)
frameCorner.CornerRadius = UDim.new(0, 10)

local glowFrame = Instance.new("Frame", frame)
glowFrame.Size = UDim2.new(1, 0, 1, 0)
glowFrame.Position = UDim2.new(0, 0, 0, 0)
glowFrame.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
glowFrame.BackgroundTransparency = 0.95
glowFrame.BorderSizePixel = 0
glowFrame.ZIndex = HIGHEST_Z + 2

local glowCorner = Instance.new("UICorner", glowFrame)
glowCorner.CornerRadius = UDim.new(0, 10)

local borderFrame = Instance.new("Frame", frame)
borderFrame.Size = UDim2.new(1, 0, 1, 0)
borderFrame.Position = UDim2.new(0, 0, 0, 0)
borderFrame.BackgroundTransparency = 1
borderFrame.BorderSizePixel = 2
borderFrame.BorderColor3 = Color3.fromRGB(255, 0, 0)
borderFrame.ZIndex = HIGHEST_Z + 3

local borderCorner = Instance.new("UICorner", borderFrame)
borderCorner.CornerRadius = UDim.new(0, 10)

local titleBar = Instance.new("Frame", frame)
titleBar.Size = UDim2.new(1, 0, 0, 40)
titleBar.Position = UDim2.new(0, 0, 0, 0)
titleBar.BackgroundTransparency = 1
titleBar.ZIndex = HIGHEST_Z + 3

local title = Instance.new("TextLabel", titleBar)
title.Text = "          Tp To Player"
title.Size = UDim2.new(1, -80, 1, 0)
title.Position = UDim2.new(0, 0, 0, 0)
title.TextColor3 = Color3.fromRGB(255, 0, 0)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.TextSize = 20
title.ZIndex = HIGHEST_Z + 4
title.TextStrokeTransparency = 0
title.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)

local minimizeBtn = Instance.new("TextButton", titleBar)
minimizeBtn.Text = "─"
minimizeBtn.Size = UDim2.new(0, 35, 0, 30)
minimizeBtn.Position = UDim2.new(1, -75, 0, 5)
minimizeBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
minimizeBtn.TextColor3 = Color3.fromRGB(255, 255, 0)
minimizeBtn.BorderSizePixel = 1
minimizeBtn.BorderColor3 = Color3.fromRGB(150, 150, 0)
minimizeBtn.Font = Enum.Font.GothamBold
minimizeBtn.TextSize = 18
minimizeBtn.ZIndex = HIGHEST_Z + 5

local minimizeBtnCorner = Instance.new("UICorner", minimizeBtn)
minimizeBtnCorner.CornerRadius = UDim.new(0, 6)

local closeBtn = Instance.new("TextButton", titleBar)
closeBtn.Text = "X"
closeBtn.Size = UDim2.new(0, 35, 0, 30)
closeBtn.Position = UDim2.new(1, -35, 0, 5)
closeBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
closeBtn.TextColor3 = Color3.fromRGB(255, 0, 0)
closeBtn.BorderSizePixel = 1
closeBtn.BorderColor3 = Color3.fromRGB(150, 0, 0)
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 16
closeBtn.ZIndex = HIGHEST_Z + 5

local closeBtnCorner = Instance.new("UICorner", closeBtn)
closeBtnCorner.CornerRadius = UDim.new(0, 6)

local subtitle = Instance.new("TextLabel", frame)
subtitle.Text = "▼ Search Target ▼"
subtitle.Size = UDim2.new(1, 0, 0, 20)
subtitle.Position = UDim2.new(0, 0, 0, 40)
subtitle.TextColor3 = Color3.fromRGB(150, 150, 150)
subtitle.BackgroundTransparency = 1
subtitle.Font = Enum.Font.Gotham
subtitle.TextSize = 12
subtitle.ZIndex = HIGHEST_Z + 4

local textboxFrame = Instance.new("Frame", frame)
textboxFrame.Size = UDim2.new(1, -20, 0, 35)
textboxFrame.Position = UDim2.new(0, 10, 0, 65)
textboxFrame.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
textboxFrame.BorderSizePixel = 1
textboxFrame.BorderColor3 = Color3.fromRGB(100, 0, 0)
textboxFrame.ZIndex = HIGHEST_Z + 3

local textboxCorner = Instance.new("UICorner", textboxFrame)
textboxCorner.CornerRadius = UDim.new(0, 8)

local textbox = Instance.new("TextBox", textboxFrame)
textbox.PlaceholderText = "Display name or username..."
textbox.Text = ""
textbox.Size = UDim2.new(1, -10, 1, 0)
textbox.Position = UDim2.new(0, 5, 0, 0)
textbox.BackgroundTransparency = 1
textbox.TextColor3 = Color3.fromRGB(255, 255, 255)
textbox.Font = Enum.Font.GothamBold
textbox.TextSize = 16
textbox.ClearTextOnFocus = true
textbox.ZIndex = HIGHEST_Z + 4
textbox.TextStrokeTransparency = 0.5
textbox.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)

local teleportBtn = Instance.new("TextButton", frame)
teleportBtn.Text = "⚡ EXECUTE TELEPORT ⚡"
teleportBtn.Size = UDim2.new(1, -20, 0, 35)
teleportBtn.Position = UDim2.new(0, 10, 0, 110)
teleportBtn.BackgroundColor3 = Color3.fromRGB(50, 0, 0)
teleportBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
teleportBtn.BorderSizePixel = 2
teleportBtn.BorderColor3 = Color3.fromRGB(255, 0, 0)
teleportBtn.Font = Enum.Font.GothamBold
teleportBtn.TextSize = 16
teleportBtn.ZIndex = HIGHEST_Z + 4
teleportBtn.TextStrokeTransparency = 0
teleportBtn.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)

local teleportBtnCorner = Instance.new("UICorner", teleportBtn)
teleportBtnCorner.CornerRadius = UDim.new(0, 8)

local loopTpBtn = Instance.new("TextButton", frame)
loopTpBtn.Text = "🔄 LOOP TELEPORT 🔄"
loopTpBtn.Size = UDim2.new(1, -20, 0, 35)
loopTpBtn.Position = UDim2.new(0, 10, 0, 150)
loopTpBtn.BackgroundColor3 = Color3.fromRGB(0, 50, 0)
loopTpBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
loopTpBtn.BorderSizePixel = 2
loopTpBtn.BorderColor3 = Color3.fromRGB(0, 255, 0)
loopTpBtn.Font = Enum.Font.GothamBold
loopTpBtn.TextSize = 16
loopTpBtn.ZIndex = HIGHEST_Z + 4
loopTpBtn.TextStrokeTransparency = 0
loopTpBtn.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)

local loopTpBtnCorner = Instance.new("UICorner", loopTpBtn)
loopTpBtnCorner.CornerRadius = UDim.new(0, 8)

local statusLabel = Instance.new("TextLabel", frame)
statusLabel.Text = "Press button or T to execute"
statusLabel.Size = UDim2.new(1, 0, 0, 20)
statusLabel.Position = UDim2.new(0, 0, 0, 195)
statusLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
statusLabel.BackgroundTransparency = 1
statusLabel.Font = Enum.Font.Gotham
statusLabel.TextSize = 11
statusLabel.ZIndex = HIGHEST_Z + 4

local glowTween = TweenService:Create(glowFrame, TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {BackgroundTransparency = 0.85})
glowTween:Play()

local borderTween = TweenService:Create(borderFrame, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {BorderColor3 = Color3.fromRGB(150, 0, 0)})
borderTween:Play()

local titleTween = TweenService:Create(title, TweenInfo.new(3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {TextColor3 = Color3.fromRGB(200, 50, 50)})
titleTween:Play()

local function findPlayerByName(name)
    local lowerName = string.lower(name)
    
    local exactMatch = Players:FindFirstChild(name)
    if exactMatch then
        return exactMatch
    end
    
    for _, plr in pairs(Players:GetPlayers()) do

        if string.lower(plr.DisplayName) == lowerName then
            return plr
        end

        if string.lower(plr.Name) == lowerName then
            return plr
        end
    end
    
    for _, plr in pairs(Players:GetPlayers()) do

        if string.find(string.lower(plr.DisplayName), lowerName, 1, true) then
            return plr
        end

        if string.find(string.lower(plr.Name), lowerName, 1, true) then
            return plr
        end
    end
    
    return nil
end

local function shakeEffect(obj, intensity)
    local originalPos = obj.Position
    for i = 1, 5 do
        local shakeX = math.random(-intensity, intensity)
        local shakeY = math.random(-intensity, intensity)
        obj.Position = originalPos + UDim2.new(0, shakeX, 0, shakeY)
        wait(0.02)
    end
    obj.Position = originalPos
end

local function flashEffect()
    local flash = Instance.new("Frame", frame)
    flash.Size = UDim2.new(1, 0, 1, 0)
    flash.Position = UDim2.new(0, 0, 0, 0)
    flash.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    flash.BackgroundTransparency = 0.7
    flash.BorderSizePixel = 0
    flash.ZIndex = HIGHEST_Z + 10
    
    local flashCorner = Instance.new("UICorner", flash)
    flashCorner.CornerRadius = UDim.new(0, 10)
    
    local flashTween = TweenService:Create(flash, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 1})
    flashTween:Play()
    flashTween.Completed:Connect(function()
        flash:Destroy()
    end)
end

local isLooping = false
local loopConnection

local function teleportToPlayer(targetName)
    local target = findPlayerByName(targetName)  
    if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
        local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
        if hrp then
            statusLabel.Text = "TARGET ACQUIRED - TELEPORTING..."
            statusLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
            flashEffect()
            hrp.CFrame = target.Character.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0)
            wait(2)
            statusLabel.Text = "Press button or T to execute"
            statusLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
        end
    else
        statusLabel.Text = "TARGET NOT FOUND"
        statusLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
        wait(2)
        statusLabel.Text = "Press button or T to execute"
        statusLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    end
end

textbox.Focused:Connect(function()
    local focusTween = TweenService:Create(textboxFrame, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {BorderColor3 = Color3.fromRGB(255, 0, 0)})
    focusTween:Play()
end)

textbox.FocusLost:Connect(function()
    local unfocusTween = TweenService:Create(textboxFrame, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {BorderColor3 = Color3.fromRGB(100, 0, 0)})
    unfocusTween:Play()
end)

local isMinimized = false

local function toggleMinimize()
    isMinimized = not isMinimized
    
    if isMinimized then
        local minimizeTween = TweenService:Create(backdrop, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {Size = UDim2.new(0, 320, 0, 45)})
        minimizeTween:Play()
        
        subtitle.Visible = false
        textboxFrame.Visible = false
        teleportBtn.Visible = false
        loopTpBtn.Visible = false
        statusLabel.Visible = false
        minimizeBtn.Text = "□"
    else
        local expandTween = TweenService:Create(backdrop, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {Size = UDim2.new(0, 320, 0, 240)})
        expandTween:Play()
        
        subtitle.Visible = true
        textboxFrame.Visible = true
        teleportBtn.Visible = true
        loopTpBtn.Visible = true
        statusLabel.Visible = true
        minimizeBtn.Text = "─"
    end
end

minimizeBtn.MouseButton1Click:Connect(toggleMinimize)

closeBtn.MouseButton1Click:Connect(function()
    local closeTween = TweenService:Create(backdrop, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {
        Size = UDim2.new(0, 0, 0, 0),
        BackgroundTransparency = 1
    })
    closeTween:Play()
    closeTween.Completed:Connect(function()
        gui:Destroy()
    end)
end)

minimizeBtn.MouseEnter:Connect(function()
    local hoverTween = TweenService:Create(minimizeBtn, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {
        BackgroundColor3 = Color3.fromRGB(60, 60, 0),
        BorderColor3 = Color3.fromRGB(255, 255, 0)
    })
    hoverTween:Play()
end)

minimizeBtn.MouseLeave:Connect(function()
    local leaveTween = TweenService:Create(minimizeBtn, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {
        BackgroundColor3 = Color3.fromRGB(25, 25, 25),
        BorderColor3 = Color3.fromRGB(150, 150, 0)
    })
    leaveTween:Play()
end)

closeBtn.MouseEnter:Connect(function()
    local hoverTween = TweenService:Create(closeBtn, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {
        BackgroundColor3 = Color3.fromRGB(60, 0, 0),
        BorderColor3 = Color3.fromRGB(255, 0, 0)
    })
    hoverTween:Play()
end)

loopTpBtn.MouseButton1Click:Connect(function()
    local name = textbox.Text
    if name and name ~= "" then
        if not isLooping then
            isLooping = true
            loopTpBtn.Text = "🛑 STOP LOOP 🛑"
            loopTpBtn.BackgroundColor3 = Color3.fromRGB(50, 0, 0)
            loopTpBtn.BorderColor3 = Color3.fromRGB(255, 0, 0)
            statusLabel.Text = "LOOP ACTIVE - Click to stop"
            statusLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
            
            loopConnection = spawn(function()
                while isLooping do
                    local target = findPlayerByName(name)  
                    if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
                        local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
                        if hrp then
                            hrp.CFrame = target.Character.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0)
                        end
                    end
                    wait(0.01)
                end
            end)
        else
            isLooping = false
            loopTpBtn.Text = "🔄 LOOP TELEPORT 🔄"
            loopTpBtn.BackgroundColor3 = Color3.fromRGB(0, 50, 0)
            loopTpBtn.BorderColor3 = Color3.fromRGB(0, 255, 0)
            statusLabel.Text = "Press button or T to execute"
            statusLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
        end
    end
end)

loopTpBtn.MouseEnter:Connect(function()
    if not isLooping then
        local hoverTween = TweenService:Create(loopTpBtn, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {
            BackgroundColor3 = Color3.fromRGB(0, 100, 0),
            BorderColor3 = Color3.fromRGB(100, 255, 100),
            TextColor3 = Color3.fromRGB(255, 255, 100)
        })
        hoverTween:Play()
    else
        local hoverTween = TweenService:Create(loopTpBtn, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {
            BackgroundColor3 = Color3.fromRGB(100, 0, 0),
            BorderColor3 = Color3.fromRGB(255, 100, 100),
            TextColor3 = Color3.fromRGB(255, 255, 100)
        })
        hoverTween:Play()
    end
end)

loopTpBtn.MouseLeave:Connect(function()
    if not isLooping then
        local leaveTween = TweenService:Create(loopTpBtn, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {
            BackgroundColor3 = Color3.fromRGB(0, 50, 0),
            BorderColor3 = Color3.fromRGB(0, 255, 0),
            TextColor3 = Color3.fromRGB(255, 255, 255)
        })
        leaveTween:Play()
    else
        local leaveTween = TweenService:Create(loopTpBtn, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {
            BackgroundColor3 = Color3.fromRGB(50, 0, 0),
            BorderColor3 = Color3.fromRGB(255, 0, 0),
            TextColor3 = Color3.fromRGB(255, 255, 255)
        })
        leaveTween:Play()
    end
end)

teleportBtn.MouseButton1Click:Connect(function()
    local name = textbox.Text
    if name and name ~= "" then
        spawn(function()
            teleportToPlayer(name)
        end)
    end
end)

teleportBtn.MouseEnter:Connect(function()
    local hoverTween = TweenService:Create(teleportBtn, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {
        BackgroundColor3 = Color3.fromRGB(100, 0, 0),
        BorderColor3 = Color3.fromRGB(255, 100, 100),
        TextColor3 = Color3.fromRGB(255, 255, 100)
    })
    hoverTween:Play()
end)

teleportBtn.MouseLeave:Connect(function()
    local leaveTween = TweenService:Create(teleportBtn, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {
        BackgroundColor3 = Color3.fromRGB(50, 0, 0),
        BorderColor3 = Color3.fromRGB(255, 0, 0),
        TextColor3 = Color3.fromRGB(255, 255, 255)
    })
    leaveTween:Play()
end)

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.T and not isMinimized then
        local name = textbox.Text
        if name and name ~= "" then
            spawn(function()
                teleportToPlayer(name)
            end)
        end
    end
end)
