-- 第1段：UI初始化 + 框架 + 导航

local Players = game:GetService("Players")
local PlayerGui = Players.LocalPlayer:WaitForChild("PlayerGui")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local UserInputService = game:GetService("UserInputService")

local function getGlobalExecCount()
    if getgenv and getgenv().GlobalExecCount then return getgenv().GlobalExecCount end
    local success, result = pcall(function()
        if syn and syn.crypt and syn.crypt.custom then
            local data = syn.crypt.custom("read", "black_script_exec_count.txt")
            if data then return tonumber(data) or 0 end
        end
        return 0
    end)
    if success and result and result > 0 then return result end
    success, result = pcall(function()
        if readfile then
            local data = readfile("black_script_exec_count.txt")
            if data then return tonumber(data) or 0 end
        end
        return 0
    end)
    if success and result and result > 0 then return result end
    return 0
end

local function saveGlobalExecCount(count)
    if getgenv then getgenv().GlobalExecCount = count end
    pcall(function()
        if syn and syn.crypt and syn.crypt.custom then
            syn.crypt.custom("write", "black_script_exec_count.txt", tostring(count))
        end
    end)
    pcall(function()
        if writefile then writefile("black_script_exec_count.txt", tostring(count)) end
    end)
end

local globalExecCount = getGlobalExecCount()
if globalExecCount == 0 then globalExecCount = 1 else globalExecCount = globalExecCount + 1 end
saveGlobalExecCount(globalExecCount)

if globalExecCount == 520 then
    spawn(function()
        local heartGui = Instance.new("ScreenGui")
        heartGui.Name = "HeartEffectGui"
        heartGui.ResetOnSpawn = false
        heartGui.Parent = PlayerGui
        local overlay = Instance.new("Frame")
        overlay.Size = UDim2.new(1, 0, 1, 0)
        overlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        overlay.BackgroundTransparency = 0.5
        overlay.ZIndex = 999
        overlay.Parent = heartGui
        local heartLabel = Instance.new("TextLabel")
        heartLabel.Size = UDim2.new(0, 200, 0, 200)
        heartLabel.Position = UDim2.new(0.5, -100, 0.5, -100)
        heartLabel.Text = "❤️"
        heartLabel.Font = Enum.Font.GothamBold
        heartLabel.TextSize = 150
        heartLabel.BackgroundTransparency = 1
        heartLabel.ZIndex = 1000
        heartLabel.Parent = heartGui
        local heartHue = 0
        local heartConn = RunService.RenderStepped:Connect(function(delta)
            heartHue = (heartHue + delta * 0.5) % 1
            heartLabel.TextColor3 = Color3.fromHSV(heartHue, 1, 1)
        end)
        heartLabel.Size = UDim2.new(0, 0, 0, 0)
        TweenService:Create(heartLabel, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = UDim2.new(0, 200, 0, 200)}):Play()
        wait(3)
        local msgLabel = Instance.new("TextLabel")
        msgLabel.Size = UDim2.new(0, 400, 0, 60)
        msgLabel.Position = UDim2.new(0.5, -200, 0.5, 120)
        msgLabel.Text = "您已执行 520 次，感谢您的支持！❤️"
        msgLabel.Font = Enum.Font.GothamBold
        msgLabel.TextSize = 24
        msgLabel.BackgroundTransparency = 1
        msgLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        msgLabel.TextStrokeTransparency = 0
        msgLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
        msgLabel.ZIndex = 1000
        msgLabel.Parent = heartGui
        local msgHue = 0
        local msgConn = RunService.RenderStepped:Connect(function(delta)
            msgHue = (msgHue + delta * 0.3) % 1
            msgLabel.TextColor3 = Color3.fromHSV(msgHue, 1, 1)
        end)
        wait(2)
        heartConn:Disconnect()
        msgConn:Disconnect()
        TweenService:Create(heartLabel, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Size = UDim2.new(0, 0, 0, 0)}):Play()
        TweenService:Create(msgLabel, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {TextTransparency = 1}):Play()
        TweenService:Create(overlay, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {BackgroundTransparency = 1}):Play()
        wait(0.5)
        heartGui:Destroy()
    end)
end

spawn(function()
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://80701295792893"
    sound.Volume = 1
    sound.Parent = workspace
    sound:Play()
    sound.Ended:Connect(function() sound:Destroy() end)
end)

spawn(function()
    local welcomeGui = Instance.new("ScreenGui")
    welcomeGui.Name = "WelcomeGui"
    welcomeGui.ResetOnSpawn = false
    welcomeGui.Parent = PlayerGui
    local welcomeLabel = Instance.new("TextLabel")
    welcomeLabel.Size = UDim2.new(0, 500, 0, 80)
    welcomeLabel.Position = UDim2.new(0.5, -250, 0.5, -40)
    welcomeLabel.Text = "欢迎使用黑脚本·管理员版"
    welcomeLabel.Font = Enum.Font.GothamBold
    welcomeLabel.TextSize = 36
    welcomeLabel.BackgroundTransparency = 1
    welcomeLabel.TextStrokeTransparency = 0
    welcomeLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    welcomeLabel.ZIndex = 1000
    welcomeLabel.Parent = welcomeGui
    local hue2 = 0
    local colorConnection
    colorConnection = RunService.RenderStepped:Connect(function(delta)
        hue2 = (hue2 + delta * 0.5) % 1
        welcomeLabel.TextColor3 = Color3.fromHSV(hue2, 1, 1)
    end)
    wait(3)
    colorConnection:Disconnect()
    TweenService:Create(welcomeLabel, TweenInfo.new(0.8, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {TextTransparency = 1, TextStrokeTransparency = 1}):Play()
    wait(0.8)
    welcomeGui:Destroy()
    local infoGui = Instance.new("ScreenGui")
    infoGui.Name = "InfoGui"
    infoGui.ResetOnSpawn = false
    infoGui.Parent = PlayerGui
    local infoLabel = Instance.new("TextLabel")
    infoLabel.Size = UDim2.new(0, 400, 0, 60)
    infoLabel.Position = UDim2.new(0.5, -200, 0.5, -30)
    infoLabel.Text = "此脚本会一直更新\n此脚本作者:CHANGCHENG66"
    infoLabel.Font = Enum.Font.GothamBold
    infoLabel.TextSize = 22
    infoLabel.BackgroundTransparency = 1
    infoLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    infoLabel.TextStrokeTransparency = 0
    infoLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    infoLabel.ZIndex = 1000
    infoLabel.Parent = infoGui
    wait(2)
    TweenService:Create(infoLabel, TweenInfo.new(0.6, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {TextTransparency = 1, TextStrokeTransparency = 1}):Play()
    wait(0.6)
    infoGui:Destroy()
end)

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ModernUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = PlayerGui

local Bar = Instance.new("Frame")
Bar.Size = UDim2.new(0, 280, 0, 46)
Bar.Position = UDim2.new(0.5, -140, 0, 8)
Bar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Bar.BackgroundTransparency = 0.25
Bar.BorderSizePixel = 0
Bar.ZIndex = 20
Bar.Parent = ScreenGui
local BarCorner = Instance.new("UICorner")
BarCorner.CornerRadius = UDim.new(0, 14)
BarCorner.Parent = Bar
local RGBOutline = Instance.new("Frame")
RGBOutline.Size = UDim2.new(1, 3, 1, 3)
RGBOutline.Position = UDim2.new(0, -1.5, 0, -1.5)
RGBOutline.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
RGBOutline.ZIndex = 19
RGBOutline.Parent = Bar
local RGBOutlineCorner = Instance.new("UICorner")
RGBOutlineCorner.CornerRadius = UDim.new(0, 15)
RGBOutlineCorner.Parent = RGBOutline

local DragBtn = Instance.new("TextButton")
DragBtn.Size = UDim2.new(0, 60, 1, 0)
DragBtn.Position = UDim2.new(0, 0, 0, 0)
DragBtn.Text = "+"
DragBtn.TextColor3 = Color3.fromRGB(80, 80, 80)
DragBtn.Font = Enum.Font.GothamBold
DragBtn.TextSize = 22
DragBtn.BackgroundTransparency = 1
DragBtn.BorderSizePixel = 0
DragBtn.ZIndex = 21
DragBtn.AutoButtonColor = false
DragBtn.Parent = Bar
local Divider = Instance.new("Frame")
Divider.Size = UDim2.new(0, 1, 0.6, 0)
Divider.Position = UDim2.new(0, 60, 0.2, 0)
Divider.BackgroundColor3 = Color3.fromRGB(180, 180, 180)
Divider.BorderSizePixel = 0
Divider.ZIndex = 22
Divider.Parent = Bar
local OpenBtn = Instance.new("TextButton")
OpenBtn.Size = UDim2.new(1, -64, 1, -6)
OpenBtn.Position = UDim2.new(0, 62, 0, 3)
OpenBtn.Text = "打开黑脚本"
OpenBtn.TextColor3 = Color3.fromRGB(40, 40, 40)
OpenBtn.Font = Enum.Font.GothamBold
OpenBtn.TextSize = 14
OpenBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
OpenBtn.BackgroundTransparency = 0.15
OpenBtn.BorderSizePixel = 0
OpenBtn.ZIndex = 21
OpenBtn.AutoButtonColor = false
OpenBtn.Parent = Bar
local OpenCorner = Instance.new("UICorner")
OpenCorner.CornerRadius = UDim.new(0, 10)
OpenCorner.Parent = OpenBtn
OpenBtn.MouseEnter:Connect(function() OpenBtn.BackgroundColor3 = Color3.fromRGB(240, 240, 240) end)
OpenBtn.MouseLeave:Connect(function() OpenBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255) end)
local dragging = false
local dragStart = nil
local startPos = nil
DragBtn.MouseButton1Down:Connect(function()
    dragging = true
    dragStart = UserInputService:GetMouseLocation()
    startPos = Bar.Position
end)
DragBtn.MouseMoved:Connect(function(x, y)
    if dragging then
        local delta = UserInputService:GetMouseLocation() - dragStart
        Bar.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)
UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end
end)

local FPSLabel = Instance.new("TextLabel")
FPSLabel.Size = UDim2.new(0, 180, 0, 28)
FPSLabel.Position = UDim2.new(0, 8, 0, 8)
FPSLabel.BackgroundTransparency = 1
FPSLabel.Font = Enum.Font.GothamBold
FPSLabel.TextSize = 16
FPSLabel.TextXAlignment = Enum.TextXAlignment.Left
FPSLabel.ZIndex = 100
FPSLabel.Visible = true
FPSLabel.RichText = true
FPSLabel.Parent = ScreenGui
local fpsEnabled = true
local lastFrameTime = tick()
local frameCount = 0
local currentFPS = 0
RunService.RenderStepped:Connect(function()
    if fpsEnabled then
        frameCount = frameCount + 1
        local e = tick() - lastFrameTime
        if e >= 0.5 then
            currentFPS = math.floor(frameCount / e)
            frameCount = 0; lastFrameTime = tick()
            local c = currentFPS >= 30 and "255,0,0" or "255,255,0"
            FPSLabel.Text = '<font color="rgb(255,255,255)">FPS: </font><font color="rgb(' .. c .. ')">' .. currentFPS .. '</font>'
        end
    end
end)

local espEnabled = false
local espHighlights = {}
local espBillboards = {}
local teamGlowHighlights = {}
local enemyGlowHighlights = {}

local function clearESP()
    for _, h in pairs(espHighlights) do pcall(function() h:Destroy() end) end
    for _, b in pairs(espBillboards) do pcall(function() b:Destroy() end) end
    espHighlights = {}; espBillboards = {}
end

local function clearTeamGlow()
    for _, h in pairs(teamGlowHighlights) do pcall(function() h:Destroy() end) end
    teamGlowHighlights = {}
end

local function clearEnemyGlow()
    for _, h in pairs(enemyGlowHighlights) do pcall(function() h:Destroy() end) end
    enemyGlowHighlights = {}
end

local infJumpEnabled = false
local infJumpConnection = nil
local spinConnection = nil
local followConnection = nil
local followActive = false

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 580, 0, 440)
MainFrame.Position = UDim2.new(0.5, -290, 0.5, -220)
MainFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MainFrame.BackgroundTransparency = 0.06
MainFrame.Visible = false
MainFrame.ZIndex = 2
MainFrame.Parent = ScreenGui
local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 14)
MainCorner.Parent = MainFrame
local RGBBorder = Instance.new("Frame")
RGBBorder.Size = UDim2.new(1, 5, 1, 5)
RGBBorder.Position = UDim2.new(0, -2.5, 0, -2.5)
RGBBorder.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
RGBBorder.ZIndex = 1
RGBBorder.Parent = MainFrame
local RGBBorderCorner = Instance.new("UICorner")
RGBBorderCorner.CornerRadius = UDim.new(0, 16)
RGBBorderCorner.Parent = RGBBorder

local borderColors = {
    ["金色"] = Color3.fromRGB(255, 215, 0),
    ["红色"] = Color3.fromRGB(255, 0, 0),
    ["蓝色"] = Color3.fromRGB(0, 150, 255),
    ["绿色"] = Color3.fromRGB(0, 255, 100),
    ["紫色"] = Color3.fromRGB(200, 0, 255),
    ["粉色"] = Color3.fromRGB(255, 100, 200),
    ["青色"] = Color3.fromRGB(0, 255, 255),
    ["白色"] = Color3.fromRGB(255, 255, 255),
}
local currentBorderColor = "金色"
local isRainbowBorder = false
local borderRainbowConn = nil

local function setBorderColor(colorName)
    if colorName == "彩虹色" then
        isRainbowBorder = true
        if borderRainbowConn then borderRainbowConn:Disconnect() end
        local h = 0
        borderRainbowConn = RunService.RenderStepped:Connect(function(delta)
            h = (h + delta * 0.4) % 1
            local c = Color3.fromHSV(h, 0.8, 1)
            RGBBorder.BackgroundColor3 = c
            RGBOutline.BackgroundColor3 = c
        end)
    else
        isRainbowBorder = false
        if borderRainbowConn then borderRainbowConn:Disconnect(); borderRainbowConn = nil end
        currentBorderColor = colorName
        local c = borderColors[colorName]
        RGBBorder.BackgroundColor3 = c
        RGBOutline.BackgroundColor3 = c
    end
end

setBorderColor("金色")

local InnerPanel = Instance.new("Frame")
InnerPanel.Size = UDim2.new(1, -6, 1, -6)
InnerPanel.Position = UDim2.new(0, 3, 0, 3)
InnerPanel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
InnerPanel.ClipsDescendants = true
InnerPanel.ZIndex = 3
InnerPanel.Parent = MainFrame
local InnerCorner = Instance.new("UICorner")
InnerCorner.CornerRadius = UDim.new(0, 12)
InnerCorner.Parent = InnerPanel

local panelMode = "平板"
local isOpen = false
local contentPages = {}
local navButtons = {}

local TopBar = Instance.new("Frame")
TopBar.Size = UDim2.new(1, 0, 0, 36)
TopBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TopBar.BorderSizePixel = 0
TopBar.ZIndex = 10
TopBar.Parent = InnerPanel
local TopBarCorner = Instance.new("UICorner")
TopBarCorner.CornerRadius = UDim.new(0, 12)
TopBarCorner.Parent = TopBar

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(0, 120, 1, 0)
TitleLabel.Position = UDim2.new(0, 12, 0, 0)
TitleLabel.Text = "黑脚本·管理员版"
TitleLabel.TextColor3 = Color3.fromRGB(50, 50, 50)
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextSize = 15
TitleLabel.BackgroundTransparency = 1
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.ZIndex = 11
TitleLabel.Parent = TopBar

local InfoBox = Instance.new("Frame")
InfoBox.Size = UDim2.new(0, 220, 0, 30)
InfoBox.Position = UDim2.new(0, 135, 0, 3)
InfoBox.BackgroundColor3 = Color3.fromRGB(76, 175, 80)
InfoBox.BorderSizePixel = 0
InfoBox.ZIndex = 12
InfoBox.Parent = TopBar
local InfoCorner = Instance.new("UICorner")
InfoCorner.CornerRadius = UDim.new(0, 6)
InfoCorner.Parent = InfoBox
local InfoRGBOutline = Instance.new("Frame")
InfoRGBOutline.Size = UDim2.new(1, 2, 1, 2)
InfoRGBOutline.Position = UDim2.new(0, -1, 0, -1)
InfoRGBOutline.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
InfoRGBOutline.ZIndex = 11
InfoRGBOutline.Parent = InfoBox
local InfoRGBCorner = Instance.new("UICorner")
InfoRGBCorner.CornerRadius = UDim.new(0, 7)
InfoRGBCorner.Parent = InfoRGBOutline
local infoHue = 0
RunService.RenderStepped:Connect(function(delta)
    infoHue = (infoHue + delta * 0.5) % 1
    InfoRGBOutline.BackgroundColor3 = Color3.fromHSV(infoHue, 0.7, 1)
end)
local InfoLabel = Instance.new("TextLabel")
InfoLabel.Size = UDim2.new(1, 0, 1, 0)
InfoLabel.Text = "黑脚本 V2.0"
InfoLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
InfoLabel.Font = Enum.Font.GothamBold
InfoLabel.TextSize = 10
InfoLabel.BackgroundTransparency = 1
InfoLabel.ZIndex = 13
InfoLabel.Parent = InfoBox
spawn(function()
    while true do
        local now = os.date("*t")
        InfoLabel.Text = "黑脚本 V2.0 | " .. now.month .. "月" .. now.day .. "日 " .. string.format("%02d:%02d:%02d", now.hour, now.min, now.sec)
        wait(1)
    end
end)

local AdminBadge = Instance.new("Frame")
AdminBadge.Size = UDim2.new(0, 85, 0, 30)
AdminBadge.Position = UDim2.new(0, 359, 0, 3)
AdminBadge.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
AdminBadge.BorderSizePixel = 0
AdminBadge.ZIndex = 12
AdminBadge.Parent = TopBar
local AdminCorner = Instance.new("UICorner")
AdminCorner.CornerRadius = UDim.new(0, 6)
AdminCorner.Parent = AdminBadge
local AdminRGBOutline = Instance.new("Frame")
AdminRGBOutline.Size = UDim2.new(1, 3, 1, 3)
AdminRGBOutline.Position = UDim2.new(0, -1.5, 0, -1.5)
AdminRGBOutline.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
AdminRGBOutline.ZIndex = 11
AdminRGBOutline.Parent = AdminBadge
local AdminRGBCorner = Instance.new("UICorner")
AdminRGBCorner.CornerRadius = UDim.new(0, 8)
AdminRGBCorner.Parent = AdminRGBOutline
local adminHue = 0
RunService.RenderStepped:Connect(function(delta)
    adminHue = (adminHue + delta * 0.4) % 1
    AdminRGBOutline.BackgroundColor3 = Color3.fromHSV(adminHue, 0.8, 1)
end)
local AdminText = Instance.new("TextLabel")
AdminText.Size = UDim2.new(1, 0, 1, 0)
AdminText.Text = "👑 管理员版本"
AdminText.TextColor3 = Color3.fromRGB(0, 0, 0)
AdminText.Font = Enum.Font.GothamBold
AdminText.TextSize = 11
AdminText.BackgroundTransparency = 1
AdminText.ZIndex = 13
AdminText.Parent = AdminBadge

local CloseButton = Instance.new("TextButton")
CloseButton.Size = UDim2.new(0, 28, 0, 28)
CloseButton.Position = UDim2.new(1, -34, 0, 4)
CloseButton.Text = "×"
CloseButton.TextColor3 = Color3.fromRGB(100, 100, 100)
CloseButton.Font = Enum.Font.GothamBold
CloseButton.TextSize = 18
CloseButton.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
CloseButton.BorderSizePixel = 0
CloseButton.ZIndex = 11
CloseButton.Parent = TopBar
local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(1, 0)
CloseCorner.Parent = CloseButton
CloseButton.MouseEnter:Connect(function() CloseButton.BackgroundColor3 = Color3.fromRGB(200, 200, 200) end)
CloseButton.MouseLeave:Connect(function() CloseButton.BackgroundColor3 = Color3.fromRGB(230, 230, 230) end)

local HideButton = Instance.new("TextButton")
HideButton.Size = UDim2.new(0, 28, 0, 28)
HideButton.Position = UDim2.new(1, -68, 0, 4)
HideButton.Text = "−"
HideButton.TextColor3 = Color3.fromRGB(100, 100, 100)
HideButton.Font = Enum.Font.GothamBold
HideButton.TextSize = 20
HideButton.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
HideButton.BorderSizePixel = 0
HideButton.ZIndex = 11
HideButton.Parent = TopBar
local HideCorner = Instance.new("UICorner")
HideCorner.CornerRadius = UDim.new(1, 0)
HideCorner.Parent = HideButton
HideButton.MouseEnter:Connect(function() HideButton.BackgroundColor3 = Color3.fromRGB(200, 200, 200) end)
HideButton.MouseLeave:Connect(function() HideButton.BackgroundColor3 = Color3.fromRGB(230, 230, 230) end)

local TopDivider = Instance.new("Frame")
TopDivider.Size = UDim2.new(1, -24, 0, 1)
TopDivider.Position = UDim2.new(0, 12, 0, 36)
TopDivider.BackgroundColor3 = Color3.fromRGB(225, 225, 225)
TopDivider.BorderSizePixel = 0
TopDivider.ZIndex = 10
TopDivider.Parent = InnerPanel

local MainContentContainer = Instance.new("Frame")
MainContentContainer.Size = UDim2.new(1, 0, 1, -36)
MainContentContainer.Position = UDim2.new(0, 0, 0, 36)
MainContentContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MainContentContainer.BorderSizePixel = 0
MainContentContainer.ZIndex = 5
MainContentContainer.Parent = InnerPanel

local PlayerInfoPanel = Instance.new("Frame")
PlayerInfoPanel.Size = UDim2.new(0, 140, 0, 46)
PlayerInfoPanel.Position = UDim2.new(0, 8, 1, -54)
PlayerInfoPanel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PlayerInfoPanel.BackgroundTransparency = 0.08
PlayerInfoPanel.BorderSizePixel = 0
PlayerInfoPanel.ZIndex = 15
PlayerInfoPanel.Parent = InnerPanel
local PIPCorner = Instance.new("UICorner")
PIPCorner.CornerRadius = UDim.new(0, 8)
PIPCorner.Parent = PlayerInfoPanel
local PIPAvatar = Instance.new("ImageLabel")
PIPAvatar.Size = UDim2.new(0, 32, 0, 32)
PIPAvatar.Position = UDim2.new(0, 7, 0, 7)
PIPAvatar.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
PIPAvatar.ZIndex = 16
PIPAvatar.Parent = PlayerInfoPanel
local PIPAvatarCorner = Instance.new("UICorner")
PIPAvatarCorner.CornerRadius = UDim.new(1, 0)
PIPAvatarCorner.Parent = PIPAvatar
local PIPDisplayName = Instance.new("TextLabel")
PIPDisplayName.Size = UDim2.new(1, -46, 0, 16)
PIPDisplayName.Position = UDim2.new(0, 44, 0, 4)
PIPDisplayName.Text = Players.LocalPlayer.DisplayName
PIPDisplayName.TextColor3 = Color3.fromRGB(50, 50, 50)
PIPDisplayName.Font = Enum.Font.GothamBold
PIPDisplayName.TextSize = 11
PIPDisplayName.BackgroundTransparency = 1
PIPDisplayName.TextXAlignment = Enum.TextXAlignment.Left
PIPDisplayName.ZIndex = 16
PIPDisplayName.Parent = PlayerInfoPanel
local PIPUsername = Instance.new("TextLabel")
PIPUsername.Size = UDim2.new(1, -46, 0, 14)
PIPUsername.Position = UDim2.new(0, 44, 0, 22)
PIPUsername.Text = "@" .. Players.LocalPlayer.Name
PIPUsername.TextColor3 = Color3.fromRGB(110, 110, 110)
PIPUsername.Font = Enum.Font.Gotham
PIPUsername.TextSize = 9
PIPUsername.BackgroundTransparency = 1
PIPUsername.TextXAlignment = Enum.TextXAlignment.Left
PIPUsername.ZIndex = 16
PIPUsername.Parent = PlayerInfoPanel
spawn(function()
    local userId = Players.LocalPlayer.UserId
    local content, ready = Players:GetUserThumbnailAsync(userId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size48x48)
    PIPAvatar.Image = content
end)

local NavFrame = Instance.new("Frame")
NavFrame.Size = UDim2.new(0, 135, 1, 0)
NavFrame.Position = UDim2.new(0, 0, 0, 0)
NavFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
NavFrame.BackgroundTransparency = 0.03
NavFrame.BorderSizePixel = 0
NavFrame.ZIndex = 6
NavFrame.Parent = MainContentContainer
local NavDivider = Instance.new("Frame")
NavDivider.Size = UDim2.new(0, 1, 1, 0)
NavDivider.Position = UDim2.new(1, 0, 0, 0)
NavDivider.BackgroundColor3 = Color3.fromRGB(225, 225, 225)
NavDivider.BorderSizePixel = 0
NavDivider.ZIndex = 7
NavDivider.Parent = NavFrame
local NavScroll = Instance.new("ScrollingFrame")
NavScroll.Size = UDim2.new(1, 0, 1, 0)
NavScroll.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
NavScroll.BackgroundTransparency = 0.03
NavScroll.BorderSizePixel = 0
NavScroll.ScrollBarThickness = 2
NavScroll.ScrollBarImageColor3 = Color3.fromRGB(180, 180, 180)
NavScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
NavScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
NavScroll.ZIndex = 6
NavScroll.Parent = NavFrame
local NavList = Instance.new("UIListLayout")
NavList.Padding = UDim.new(0, 2)
NavList.Parent = NavScroll
local NavTopPad = Instance.new("Frame")
NavTopPad.Size = UDim2.new(1, 0, 0, 5)
NavTopPad.BackgroundTransparency = 1
NavTopPad.Parent = NavScroll
local navItems = {{name = "公告", icon = "📢"},{name = "通用", icon = "⚙️"},{name = "战斗功能", icon = "⚔️"},{name = "整活功能", icon = "🎭"},{name = "音乐区", icon = "🎵"},{name = "甩飞", icon = "💨"},{name = "服务器", icon = "📡"},{name = "国内脚本", icon = "🇨🇳"},{name = "设置", icon = "⚙️"}}
local selectedNav = nil
local ContentArea = Instance.new("Frame")
ContentArea.Size = UDim2.new(1, -136, 1, 0)
ContentArea.Position = UDim2.new(0, 136, 0, 0)
ContentArea.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ContentArea.BorderSizePixel = 0
ContentArea.ZIndex = 6
ContentArea.Parent = MainContentContainer
function switchContent(n) for a, b in pairs(contentPages) do b.Visible = (a == n) end end
local function selectNav(button, itemName)
    if selectedNav then selectedNav.BackgroundColor3 = Color3.fromRGB(255, 255, 255) end
    button.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
    selectedNav = button
    TitleLabel.Text = itemName
    switchContent(itemName)
end
for _, item in ipairs(navItems) do
    local NavButton = Instance.new("TextButton")
    NavButton.Size = UDim2.new(1, -12, 0, 36); NavButton.Position = UDim2.new(0, 6, 0, 0)
    NavButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255); NavButton.Text = ""
    NavButton.BorderSizePixel = 0; NavButton.ZIndex = 7; NavButton.AutoButtonColor = false; NavButton.Parent = NavScroll
    local NavCorner = Instance.new("UICorner"); NavCorner.CornerRadius = UDim.new(0, 8); NavCorner.Parent = NavButton
    local NavIcon = Instance.new("TextLabel")
    NavIcon.Size = UDim2.new(0, 14, 1, 0); NavIcon.Position = UDim2.new(0, 2, 0, 0)
    NavIcon.Text = item.icon; NavIcon.TextSize = 10; NavIcon.BackgroundTransparency = 1
    NavIcon.TextXAlignment = Enum.TextXAlignment.Left; NavIcon.ZIndex = 8; NavIcon.Parent = NavButton
    local NavLabel = Instance.new("TextLabel")
    NavLabel.Size = UDim2.new(1, -22, 1, 0); NavLabel.Position = UDim2.new(0, 26, 0, 0)
    NavLabel.Text = "  " .. item.name; NavLabel.TextColor3 = Color3.fromRGB(60, 60, 60)
    NavLabel.Font = Enum.Font.GothamSemibold; NavLabel.TextSize = 11; NavLabel.BackgroundTransparency = 1
    NavLabel.TextXAlignment = Enum.TextXAlignment.Left; NavLabel.ZIndex = 8; NavLabel.Parent = NavButton
    NavButton.MouseButton1Click:Connect(function() selectNav(NavButton, item.name) end)
    NavButton.MouseEnter:Connect(function() if NavButton ~= selectedNav then NavButton.BackgroundColor3 = Color3.fromRGB(240, 240, 240) end end)
    NavButton.MouseLeave:Connect(function() if NavButton ~= selectedNav then NavButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255) end end)
    table.insert(navButtons, {button = NavButton, name = item.name})
end

-- ============ 面板缩放函数 ============
local function applyPanelSize()
    if panelMode == "平板" then
        MainFrame.Size = UDim2.new(0, 580, 0, 440)
        MainFrame.Position = UDim2.new(0.5, -290, 0.5, -220)
        RGBOutline.Size = UDim2.new(1, 5, 1, 5)
        TitleLabel.Size = UDim2.new(0, 120, 1, 0)
        TitleLabel.Position = UDim2.new(0, 12, 0, 0)
        TitleLabel.TextSize = 15
        InfoBox.Size = UDim2.new(0, 220, 0, 30)
        InfoBox.Position = UDim2.new(0, 135, 0, 3)
        InfoLabel.TextSize = 10
        AdminBadge.Size = UDim2.new(0, 85, 0, 30)
        AdminBadge.Position = UDim2.new(0, 359, 0, 3)
        AdminText.Text = "👑 管理员版本"
        AdminText.TextSize = 11
        TopBar.Size = UDim2.new(1, 0, 0, 36)
        TopDivider.Position = UDim2.new(0, 12, 0, 36)
        MainContentContainer.Position = UDim2.new(0, 0, 0, 36)
        MainContentContainer.Size = UDim2.new(1, 0, 1, -36)
    else
        MainFrame.Size = UDim2.new(0, 500, 0, 340)
        MainFrame.Position = UDim2.new(0.5, -250, 0.5, -170)
        RGBOutline.Size = UDim2.new(1, 3, 1, 3)
        TitleLabel.Size = UDim2.new(0, 100, 1, 0)
        TitleLabel.Position = UDim2.new(0, 10, 0, 0)
        TitleLabel.TextSize = 13
        InfoBox.Size = UDim2.new(0, 180, 0, 24)
        InfoBox.Position = UDim2.new(0, 100, 0, 4)
        InfoLabel.TextSize = 8
        AdminBadge.Size = UDim2.new(0, 68, 0, 24)
        AdminBadge.Position = UDim2.new(0, 290, 0, 4)
        AdminText.Text = "👑 管理员"
        AdminText.TextSize = 9
        TopBar.Size = UDim2.new(1, 0, 0, 32)
        TopDivider.Position = UDim2.new(0, 12, 0, 32)
        MainContentContainer.Position = UDim2.new(0, 0, 0, 32)
        MainContentContainer.Size = UDim2.new(1, 0, 1, -32)
    end
    if isRainbowBorder then
    else
        local c = borderColors[currentBorderColor] or Color3.fromRGB(255, 215, 0)
        RGBBorder.BackgroundColor3 = c
        RGBOutline.BackgroundColor3 = c
    end
end

-- ============ 打开/关闭函数（提前定义） ============
function openPanel()
    if isOpen then return end
    isOpen = true
    MainFrame.Visible = true
    MainFrame.Size = UDim2.new(0, 0, 0, 0)
    MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
    applyPanelSize()
    local targetSize = MainFrame.Size
    local targetPos = MainFrame.Position
    MainFrame.Size = UDim2.new(0, 0, 0, 0)
    MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
    TweenService:Create(MainFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = targetSize, Position = targetPos}):Play()
end

function closePanel()
    if not isOpen then return end
    isOpen = false
    TweenService:Create(MainFrame, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Size = UDim2.new(0, 0, 0, 0), Position = UDim2.new(0.5, 0, 0.5, 0)}):Play()
    wait(0.15)
    MainFrame.Visible = false
end

OpenBtn.MouseButton1Click:Connect(function()
    if isOpen then closePanel() else openPanel() end
end)

HideButton.MouseButton1Click:Connect(function()
    if isOpen then closePanel() else openPanel() end
end)
-- 第2段：createButtonCard

local function createButtonCard(parent, name, desc, icon, url)
    local Card = Instance.new("Frame")
    Card.Size = UDim2.new(1, -16, 0, 46); Card.Position = UDim2.new(0, 8, 0, 0)
    Card.BackgroundColor3 = Color3.fromRGB(252, 252, 252); Card.BorderSizePixel = 0; Card.ZIndex = 7; Card.Parent = parent
    local CardCorner = Instance.new("UICorner"); CardCorner.CornerRadius = UDim.new(0, 10); CardCorner.Parent = Card
    local CardStroke = Instance.new("UIStroke"); CardStroke.Color = Color3.fromRGB(230, 230, 230); CardStroke.Thickness = 1; CardStroke.Parent = Card
    local IconFrame = Instance.new("Frame")
    IconFrame.Size = UDim2.new(0, 26, 0, 26); IconFrame.Position = UDim2.new(0, 10, 0, 10)
    IconFrame.BackgroundColor3 = Color3.fromRGB(240, 240, 240); IconFrame.BorderSizePixel = 0; IconFrame.ZIndex = 8; IconFrame.Parent = Card
    local IconCorner = Instance.new("UICorner"); IconCorner.CornerRadius = UDim.new(0, 6); IconCorner.Parent = IconFrame
    local IconText = Instance.new("TextLabel")
    IconText.Size = UDim2.new(1, 0, 1, 0); IconText.Text = icon; IconText.TextSize = 11
    IconText.BackgroundTransparency = 1; IconText.ZIndex = 9; IconText.Parent = IconFrame
    local TitleText = Instance.new("TextLabel")
    TitleText.Size = UDim2.new(0, 180, 0, 15); TitleText.Position = UDim2.new(0, 44, 0, 5)
    TitleText.Text = name; TitleText.TextColor3 = Color3.fromRGB(50, 50, 50)
    TitleText.Font = Enum.Font.GothamSemibold; TitleText.TextSize = 11
    TitleText.BackgroundTransparency = 1; TitleText.TextXAlignment = Enum.TextXAlignment.Left; TitleText.ZIndex = 8; TitleText.Parent = Card
    local DescText = Instance.new("TextLabel")
    DescText.Size = UDim2.new(1, -100, 0, 13); DescText.Position = UDim2.new(0, 44, 0, 22)
    DescText.Text = desc .. " | 可能需等待"; DescText.TextColor3 = Color3.fromRGB(130, 130, 130)
    DescText.Font = Enum.Font.Gotham; DescText.TextSize = 9; DescText.BackgroundTransparency = 1
    DescText.TextXAlignment = Enum.TextXAlignment.Left; DescText.ZIndex = 8; DescText.Parent = Card
    local Btn = Instance.new("TextButton")
    Btn.Size = UDim2.new(0, 50, 0, 20); Btn.Position = UDim2.new(1, -58, 0, 13)
    Btn.Text = "执行"; Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    Btn.Font = Enum.Font.GothamBold; Btn.TextSize = 10; Btn.BackgroundColor3 = Color3.fromRGB(255, 140, 0)
    Btn.BorderSizePixel = 0; Btn.ZIndex = 9; Btn.AutoButtonColor = false; Btn.Parent = Card
    local BtnCorner = Instance.new("UICorner"); BtnCorner.CornerRadius = UDim.new(0, 5); BtnCorner.Parent = Btn
    Btn.MouseEnter:Connect(function() Btn.BackgroundColor3 = Color3.fromRGB(255, 160, 20) end)
    Btn.MouseLeave:Connect(function() Btn.BackgroundColor3 = Color3.fromRGB(255, 140, 0) end)
    Btn.MouseButton1Click:Connect(function()
        Btn.BackgroundColor3 = Color3.fromRGB(76, 175, 80)
        if url == "teleport" or url == "follow" then
            local tpGui = Instance.new("ScreenGui"); tpGui.Parent = PlayerGui
            local tpFrame = Instance.new("Frame")
            tpFrame.Size = UDim2.new(0, 190, 0, 280); tpFrame.Position = UDim2.new(0.5, -95, 0.5, -140)
            tpFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35); tpFrame.BorderSizePixel = 0; tpFrame.ZIndex = 50; tpFrame.Parent = tpGui
            local tpCorner = Instance.new("UICorner"); tpCorner.CornerRadius = UDim.new(0, 10); tpCorner.Parent = tpFrame
            local tb = Instance.new("Frame")
            tb.Size = UDim2.new(1, 0, 0, 30); tb.BackgroundColor3 = Color3.fromRGB(50, 50, 50); tb.BorderSizePixel = 0; tb.ZIndex = 51; tb.Parent = tpFrame
            local tbCorner = Instance.new("UICorner"); tbCorner.CornerRadius = UDim.new(0, 10); tbCorner.Parent = tb
            local ttl = Instance.new("TextLabel")
            ttl.Size = UDim2.new(1, -28, 1, 0); ttl.Position = UDim2.new(0, 10, 0, 0)
            ttl.Text = url == "follow" and "选择跟随" or "选择玩家"; ttl.TextColor3 = Color3.fromRGB(255, 255, 255); ttl.Font = Enum.Font.GothamBold
            ttl.TextSize = 13; ttl.BackgroundTransparency = 1; ttl.TextXAlignment = Enum.TextXAlignment.Left; ttl.ZIndex = 52; ttl.Parent = tb
            local cls = Instance.new("TextButton")
            cls.Size = UDim2.new(0, 20, 0, 20); cls.Position = UDim2.new(1, -24, 0, 5)
            cls.Text = "×"; cls.TextColor3 = Color3.fromRGB(255, 255, 255); cls.Font = Enum.Font.GothamBold
            cls.TextSize = 12; cls.BackgroundColor3 = Color3.fromRGB(255, 60, 60); cls.BorderSizePixel = 0; cls.ZIndex = 52; cls.AutoButtonColor = false; cls.Parent = tb
            local clsCorner = Instance.new("UICorner"); clsCorner.CornerRadius = UDim.new(1, 0); clsCorner.Parent = cls
            cls.MouseButton1Click:Connect(function() tpGui:Destroy() end)
            local sf = Instance.new("ScrollingFrame")
            sf.Size = UDim2.new(1, 0, 1, -65); sf.Position = UDim2.new(0, 0, 0, 30)
            sf.BackgroundColor3 = Color3.fromRGB(35, 35, 35); sf.BorderSizePixel = 0; sf.ScrollBarThickness = 3
            sf.CanvasSize = UDim2.new(0, 0, 0, 0); sf.ZIndex = 51; sf.Parent = tpFrame
            local sfl = Instance.new("UIListLayout"); sfl.Padding = UDim.new(0, 2); sfl.Parent = sf
            local clBtn = Instance.new("TextButton")
            clBtn.Size = UDim2.new(1, -16, 0, 28); clBtn.Position = UDim2.new(0, 8, 1, -35)
            clBtn.Text = "关闭"; clBtn.TextColor3 = Color3.fromRGB(255, 255, 255); clBtn.Font = Enum.Font.GothamBold
            clBtn.TextSize = 12; clBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60); clBtn.BorderSizePixel = 0; clBtn.ZIndex = 51; clBtn.AutoButtonColor = false; clBtn.Parent = tpFrame
            local clCorner = Instance.new("UICorner"); clCorner.CornerRadius = UDim.new(0, 5); clCorner.Parent = clBtn
            clBtn.MouseButton1Click:Connect(function() tpGui:Destroy() end)
            local cnt = 0
            for _, plr in ipairs(Players:GetPlayers()) do
                if plr ~= Players.LocalPlayer then
                    local pbtn = Instance.new("TextButton")
                    pbtn.Size = UDim2.new(1, -12, 0, 30); pbtn.Position = UDim2.new(0, 6, 0, 0)
                    pbtn.Text = plr.Name; pbtn.TextColor3 = Color3.fromRGB(255, 255, 255); pbtn.Font = Enum.Font.Gotham
                    pbtn.TextSize = 12; pbtn.BackgroundColor3 = Color3.fromRGB(55, 55, 55); pbtn.BorderSizePixel = 0; pbtn.ZIndex = 52; pbtn.AutoButtonColor = false; pbtn.Parent = sf
                    local pCorner = Instance.new("UICorner"); pCorner.CornerRadius = UDim.new(0, 5); pCorner.Parent = pbtn
                    pbtn.MouseButton1Click:Connect(function()
                        if url == "follow" then
                            followActive = true
                            if followConnection then followConnection:Disconnect() end
                            followConnection = RunService.RenderStepped:Connect(function()
                                if not followActive then followConnection:Disconnect(); followConnection = nil; return end
                                local c = Players.LocalPlayer.Character
                                local tc = plr.Character
                                if c and c:FindFirstChild("HumanoidRootPart") and tc and tc:FindFirstChild("HumanoidRootPart") then
                                    c.HumanoidRootPart.CFrame = tc.HumanoidRootPart.CFrame + Vector3.new(3, 0, 0)
                                end
                            end)
                            local jumpConn
                            jumpConn = UserInputService.JumpRequest:Connect(function()
                                if followActive then
                                    followActive = false
                                    if followConnection then followConnection:Disconnect(); followConnection = nil end
                                    if jumpConn then jumpConn:Disconnect() end
                                end
                            end)
                            local keyConn
                            keyConn = UserInputService.InputBegan:Connect(function(input, gp)
                                if gp then return end
                                if input.KeyCode == Enum.KeyCode.Space then
                                    if followActive then
                                        followActive = false
                                        if followConnection then followConnection:Disconnect(); followConnection = nil end
                                        if keyConn then keyConn:Disconnect() end
                                        if jumpConn then jumpConn:Disconnect() end
                                    end
                                end
                            end)
                        else
                            local c = Players.LocalPlayer.Character; local tc = plr.Character
                            if c and c:FindFirstChild("HumanoidRootPart") and tc and tc:FindFirstChild("HumanoidRootPart") then
                                c.HumanoidRootPart.CFrame = tc.HumanoidRootPart.CFrame + Vector3.new(3, 0, 0)
                            end
                        end
                        tpGui:Destroy()
                    end)
                    cnt = cnt + 1
                end
            end
            sf.CanvasSize = UDim2.new(0, 0, 0, cnt * 32 + 8)
        elseif url == "home" then
            if homePosition then
                local c = Players.LocalPlayer.Character
                if c and c:FindFirstChild("HumanoidRootPart") then
                    c.HumanoidRootPart.CFrame = homePosition
                end
            end
        else
            if name == "驾驶帝国" then pcall(function() getgenv().XiaoPi = "皮脚本-驾驶帝国" end) end
            task.spawn(function() pcall(function() loadstring(game:HttpGet(url))() end) end)
        end
        wait(0.3)
        Btn.BackgroundColor3 = Color3.fromRGB(255, 140, 0)
    end)
end
-- 第3段：createFeatureToggle 前半

local function createFeatureToggle(parent, name, description, icon, runCode)
    local Card = Instance.new("Frame")
    Card.Size = UDim2.new(1, -16, 0, 46); Card.Position = UDim2.new(0, 8, 0, 0)
    Card.BackgroundColor3 = Color3.fromRGB(252, 252, 252); Card.BorderSizePixel = 0; Card.ZIndex = 7; Card.Parent = parent
    local CardCorner = Instance.new("UICorner"); CardCorner.CornerRadius = UDim.new(0, 10); CardCorner.Parent = Card
    local CardStroke = Instance.new("UIStroke"); CardStroke.Color = Color3.fromRGB(230, 230, 230); CardStroke.Thickness = 1; CardStroke.Parent = Card
    local IconFrame = Instance.new("Frame")
    IconFrame.Size = UDim2.new(0, 26, 0, 26); IconFrame.Position = UDim2.new(0, 10, 0, 10)
    IconFrame.BackgroundColor3 = Color3.fromRGB(240, 240, 240); IconFrame.BorderSizePixel = 0; IconFrame.ZIndex = 8; IconFrame.Parent = Card
    local IconCorner = Instance.new("UICorner"); IconCorner.CornerRadius = UDim.new(0, 6); IconCorner.Parent = IconFrame
    local IconText = Instance.new("TextLabel")
    IconText.Size = UDim2.new(1, 0, 1, 0); IconText.Text = icon; IconText.TextSize = 11
    IconText.BackgroundTransparency = 1; IconText.ZIndex = 9; IconText.Parent = IconFrame
    local TitleText = Instance.new("TextLabel")
    TitleText.Size = UDim2.new(0, 180, 0, 15); TitleText.Position = UDim2.new(0, 44, 0, 5)
    TitleText.Text = name; TitleText.TextColor3 = Color3.fromRGB(50, 50, 50)
    TitleText.Font = Enum.Font.GothamSemibold; TitleText.TextSize = 11
    TitleText.BackgroundTransparency = 1; TitleText.TextXAlignment = Enum.TextXAlignment.Left; TitleText.ZIndex = 8; TitleText.Parent = Card
    local DescText = Instance.new("TextLabel")
    DescText.Size = UDim2.new(1, -100, 0, 13); DescText.Position = UDim2.new(0, 44, 0, 22)
    DescText.Text = description; DescText.TextColor3 = Color3.fromRGB(130, 130, 130)
    DescText.Font = Enum.Font.Gotham; DescText.TextSize = 9; DescText.BackgroundTransparency = 1
    DescText.TextXAlignment = Enum.TextXAlignment.Left; DescText.ZIndex = 8; DescText.Parent = Card
    local Toggle = Instance.new("TextButton")
    Toggle.Size = UDim2.new(0, 36, 0, 20); Toggle.Position = UDim2.new(1, -46, 0, 13)
    Toggle.BackgroundColor3 = Color3.fromRGB(200, 200, 200); Toggle.Text = ""
    Toggle.BorderSizePixel = 0; Toggle.ZIndex = 8; Toggle.AutoButtonColor = false; Toggle.Parent = Card
    local ToggleCorner = Instance.new("UICorner"); ToggleCorner.CornerRadius = UDim.new(1, 0); ToggleCorner.Parent = Toggle
    local ToggleKnob = Instance.new("Frame")
    ToggleKnob.Size = UDim2.new(0, 16, 0, 16); ToggleKnob.Position = UDim2.new(0, 2, 0, 2)
    ToggleKnob.BackgroundColor3 = Color3.fromRGB(255, 255, 255); ToggleKnob.BorderSizePixel = 0; ToggleKnob.ZIndex = 9; ToggleKnob.Parent = Toggle
    local KnobCorner = Instance.new("UICorner"); KnobCorner.CornerRadius = UDim.new(1, 0); KnobCorner.Parent = ToggleKnob
    local toggleState = false
    local toggleConn = nil
    Toggle.MouseButton1Click:Connect(function()
        toggleState = not toggleState
        if toggleState then
            Toggle.BackgroundColor3 = Color3.fromRGB(255, 140, 0)
            ToggleKnob:TweenPosition(UDim2.new(1, -18, 0, 2), "Out", "Quad", 0.15)
            if runCode == "esp" then enableESP()
            elseif runCode == "night" then Lighting.Brightness = 2; Lighting.ClockTime = 14; Lighting.FogEnd = 100000; Lighting.GlobalShadows = false
            elseif runCode == "fps" then fpsEnabled = true; FPSLabel.Visible = true
            elseif runCode == "float" then
                local c = Players.LocalPlayer.Character
                if c and c:FindFirstChild("HumanoidRootPart") then
                    local hrp = c.HumanoidRootPart; local floatY = hrp.Position.Y
                    toggleConn = RunService.RenderStepped:Connect(function()
                        if hrp and hrp.Parent then hrp.Velocity = Vector3.new(hrp.Velocity.X, 0, hrp.Velocity.Z); hrp.CFrame = CFrame.new(hrp.Position.X, floatY, hrp.Position.Z) end
                    end)
                end
            elseif runCode == "antiafk" then local vu = game:GetService("VirtualUser"); Players.LocalPlayer.Idled:Connect(function() vu:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame); wait(1); vu:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame) end)
            elseif runCode == "collect" then
                local c = Players.LocalPlayer.Character
                if c and c:FindFirstChild("HumanoidRootPart") then
                    local hrp = c.HumanoidRootPart
                    toggleConn = RunService.RenderStepped:Connect(function()
                        for _, item in ipairs(workspace:GetDescendants()) do
                            if item:IsA("Tool") or item:IsA("MeshPart") or (item:IsA("Part") and (item.Name:lower():find("drop") or item.Name:lower():find("coin") or item.Name:lower():find("gem") or item.Name:lower():find("collect") or item.Name:lower():find("orb"))) then
                                if (item.Position - hrp.Position).Magnitude < 80 then
                                    item.CFrame = hrp.CFrame + Vector3.new(math.random(-3,3), 0, math.random(-3,3))
                                end
                            end
                        end
                    end)
                end
            elseif runCode == "clicktp" then
                local mouse = Players.LocalPlayer:GetMouse()
                toggleConn = mouse.Button1Down:Connect(function()
                    local c = Players.LocalPlayer.Character
                    if c and c:FindFirstChild("HumanoidRootPart") and mouse.Hit then
                        c.HumanoidRootPart.CFrame = CFrame.new(mouse.Hit.p + Vector3.new(0, 3, 0))
                    end
                end)
            elseif runCode == "autoclick" then
                local vu = game:GetService("VirtualUser"); local camera = workspace.CurrentCamera
                toggleConn = RunService.RenderStepped:Connect(function()
                    local s = camera.ViewportSize; vu:Button1Down(Vector2.new(s.X/2, s.Y/2)); wait(0.05); vu:Button1Up(Vector2.new(s.X/2, s.Y/2))
                end)
            elseif runCode == "speedhack" then
                toggleConn = RunService.RenderStepped:Connect(function()
                    for _, v in ipairs(workspace:GetDescendants()) do if v:IsA("Animation") then v.Speed = 2 end end
                end)
            elseif runCode == "itemesp" then
                toggleConn = RunService.RenderStepped:Connect(function()
                    for _, item in ipairs(workspace:GetDescendants()) do
                        if (item:IsA("Tool") or item.Name:find("Drop")) and not item:FindFirstChild("ItemESP") then
                            local hl = Instance.new("Highlight"); hl.Name = "ItemESP"
                            hl.FillColor = Color3.fromRGB(0, 255, 0); hl.OutlineColor = Color3.fromRGB(255, 255, 0); hl.Parent = item
                        end
                    end
                end)
            elseif runCode == "invisible" then
                local c = Players.LocalPlayer.Character
                if c then for _, v in ipairs(c:GetDescendants()) do if v:IsA("BasePart") then v.Transparency = 0.8 end end end
            elseif runCode == "noclip" then
                local c = Players.LocalPlayer.Character
                if c then for _, v in ipairs(c:GetDescendants()) do if v:IsA("BasePart") then v.CanCollide = false end end end
            elseif runCode == "god" then
                local c = Players.LocalPlayer.Character
                if c and c:FindFirstChild("Humanoid") then
                    c.Humanoid.MaxHealth = 99999; c.Humanoid.Health = 99999
                    toggleConn = RunService.RenderStepped:Connect(function()
                        if c and c:FindFirstChild("Humanoid") then c.Humanoid.Health = 99999 end
                    end)
                end
elseif runCode == "teamglow" then
                local myTeam = Players.LocalPlayer.Team
                clearTeamGlow()
                toggleConn = RunService.RenderStepped:Connect(function()
                    for _, p in ipairs(Players:GetPlayers()) do
                        if p ~= Players.LocalPlayer and p.Character and p.Team == myTeam then
                            if not teamGlowHighlights[p] then
                                local hl = Instance.new("Highlight"); hl.Name = "TeamGlow"
                                hl.FillColor = Color3.fromRGB(0, 100, 255); hl.OutlineColor = Color3.fromRGB(0, 150, 255); hl.FillTransparency = 0.5; hl.Parent = p.Character
                                teamGlowHighlights[p] = hl
                            end
                        end
                    end
                end)
            elseif runCode == "enemyglow" then
                local myTeam = Players.LocalPlayer.Team
                clearEnemyGlow()
                toggleConn = RunService.RenderStepped:Connect(function()
                    for _, p in ipairs(Players:GetPlayers()) do
                        if p ~= Players.LocalPlayer and p.Character and p.Team ~= myTeam then
                            if not enemyGlowHighlights[p] then
                                local hl = Instance.new("Highlight"); hl.Name = "EnemyGlow"
                                hl.FillColor = Color3.fromRGB(255, 0, 0); hl.OutlineColor = Color3.fromRGB(255, 50, 50); hl.FillTransparency = 0.5; hl.Parent = p.Character
                                enemyGlowHighlights[p] = hl
                            end
                        end
                    end
                end)
            elseif runCode == "autoattack" then
                toggleConn = RunService.RenderStepped:Connect(function()
                    local c = Players.LocalPlayer.Character; if not c then return end
                    local nearest = nil; local minDist = 15; local myTeam = Players.LocalPlayer.Team
                    for _, p in ipairs(Players:GetPlayers()) do
                        if p ~= Players.LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") and p.Team ~= myTeam and p.Character.Humanoid.Health > 0 then
                            local dist = (p.Character.HumanoidRootPart.Position - c.HumanoidRootPart.Position).Magnitude
                            if dist < minDist then minDist = dist; nearest = p.Character end
                        end
                    end
                    if nearest and c:FindFirstChild("HumanoidRootPart") then
                        c.HumanoidRootPart.CFrame = nearest.HumanoidRootPart.CFrame + Vector3.new(2, 0, 0)
                        local tool = c:FindFirstChildOfClass("Tool")
                        if tool and tool:FindFirstChild("Handle") then
                            firetouchinterest(tool.Handle, nearest, 0); firetouchinterest(tool.Handle, nearest, 1)
                        end
                    end
                end)
            elseif runCode == "fulllight" then
                Lighting.Brightness = 5; Lighting.ClockTime = 14; Lighting.FogEnd = 100000; Lighting.GlobalShadows = false; Lighting.OutdoorAmbient = Color3.fromRGB(200, 200, 200)
            elseif runCode == "suicide" then
                local c = Players.LocalPlayer.Character
                if c and c:FindFirstChild("Humanoid") then c.Humanoid.Health = 0 end
            elseif runCode == "superspeed" then
                local c = Players.LocalPlayer.Character
                if c and c:FindFirstChild("Humanoid") then c.Humanoid.WalkSpeed = 1000 end
            elseif runCode == "infstamina" then
                toggleConn = RunService.RenderStepped:Connect(function()
                    local c = Players.LocalPlayer.Character
                    if c and c:FindFirstChild("Humanoid") then c.Humanoid.MaxHealth = c.Humanoid.MaxHealth end
                end)
            elseif runCode == "infammo" then
                toggleConn = RunService.RenderStepped:Connect(function()
                    local c = Players.LocalPlayer.Character
                    if c then
                        for _, tool in ipairs(c:GetChildren()) do
                            if tool:IsA("Tool") and tool:FindFirstChild("Ammo") then tool.Ammo.Value = 999 end
                        end
                    end
                end)
            elseif runCode == "serverinfo" then
                local infoActive = true
                local infoGui = Instance.new("ScreenGui")
                infoGui.Name = "ServerInfoGui"
                infoGui.ResetOnSpawn = false
                infoGui.Parent = PlayerGui
                local infoFrame = Instance.new("Frame")
                infoFrame.Size = UDim2.new(0, 280, 0, 180)
                infoFrame.Position = UDim2.new(1, -290, 0, 10)
                infoFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                infoFrame.BackgroundTransparency = 0.2
                infoFrame.BorderSizePixel = 0
                infoFrame.ZIndex = 500
                infoFrame.Parent = infoGui
                local infoCorner = Instance.new("UICorner")
                infoCorner.CornerRadius = UDim.new(0, 8)
                infoCorner.Parent = infoFrame
                local playerCountLabel = Instance.new("TextLabel")
                playerCountLabel.Size = UDim2.new(1, -16, 0, 30)
                playerCountLabel.Position = UDim2.new(0, 8, 0, 8)
                playerCountLabel.Text = "服务器人数: " .. #Players:GetPlayers()
                playerCountLabel.Font = Enum.Font.GothamBold
                playerCountLabel.TextSize = 14
                playerCountLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                playerCountLabel.BackgroundTransparency = 1
                playerCountLabel.TextXAlignment = Enum.TextXAlignment.Left
                playerCountLabel.ZIndex = 501
                playerCountLabel.Parent = infoFrame
                local coordLabel = Instance.new("TextLabel")
                coordLabel.Size = UDim2.new(1, -16, 0, 30)
                coordLabel.Position = UDim2.new(0, 8, 0, 40)
                coordLabel.Font = Enum.Font.Gotham
                coordLabel.TextSize = 12
                coordLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
                coordLabel.BackgroundTransparency = 1
                coordLabel.TextXAlignment = Enum.TextXAlignment.Left
                coordLabel.ZIndex = 501
                coordLabel.Parent = infoFrame
                local nearestLabel = Instance.new("TextLabel")
                nearestLabel.Size = UDim2.new(1, -16, 0, 90)
                nearestLabel.Position = UDim2.new(0, 8, 0, 72)
                nearestLabel.Font = Enum.Font.Gotham
                nearestLabel.TextSize = 11
                nearestLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
                nearestLabel.BackgroundTransparency = 1
                nearestLabel.TextXAlignment = Enum.TextXAlignment.Left
                nearestLabel.TextYAlignment = Enum.TextYAlignment.Top
                nearestLabel.ZIndex = 501
                nearestLabel.Parent = infoFrame
                local renderConn = RunService.RenderStepped:Connect(function()
                    if not infoActive then return end
                    playerCountLabel.Text = "服务器人数: " .. #Players:GetPlayers()
                    local c = Players.LocalPlayer.Character
                    if c and c:FindFirstChild("HumanoidRootPart") then
                        local pos = c.HumanoidRootPart.Position
                        coordLabel.Text = "坐标: X:" .. math.floor(pos.X) .. " Y:" .. math.floor(pos.Y) .. " Z:" .. math.floor(pos.Z)
                    end
                    local nearestText = "附近玩家:\n"
                    local myPos = c and c:FindFirstChild("HumanoidRootPart") and c.HumanoidRootPart.Position
                    for _, p in ipairs(Players:GetPlayers()) do
                        if p ~= Players.LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") and myPos then
                            local dist = math.floor((p.Character.HumanoidRootPart.Position - myPos).Magnitude)
                            nearestText = nearestText .. "  " .. p.Name .. " - " .. dist .. "m\n"
                        end
                    end
                    nearestLabel.Text = nearestText
                end)
                toggleConn = {Disconnect = function() infoActive = false; if infoGui then infoGui:Destroy() end; if renderConn then renderConn:Disconnect() end end}
            elseif runCode == "dance1" then
                local c = Players.LocalPlayer.Character
                if c and c:FindFirstChild("Humanoid") then
                    local anim = Instance.new("Animation"); anim.AnimationId = "rbxassetid://5918726674"
                    local track = c.Humanoid:LoadAnimation(anim); track:Play()
                    toggleConn = {Disconnect = function() if track then track:Stop() end end}
                end
            elseif runCode == "fire" then
                local c = Players.LocalPlayer.Character
                if c and c:FindFirstChild("HumanoidRootPart") then
                    local fire = Instance.new("ParticleEmitter"); fire.Name = "FireFX"; fire.Texture = "rbxassetid://0"
                    fire.Color = ColorSequence.new(Color3.fromRGB(255, 100, 0)); fire.Rate = 30; fire.Speed = NumberRange.new(3, 6)
                    fire.Lifetime = NumberRange.new(0.5, 1); fire.Parent = c.HumanoidRootPart
                end
            elseif runCode == "glow" then
                local c = Players.LocalPlayer.Character
                if c then
                    local hl = Instance.new("Highlight"); hl.Name = "PlayerGlow"
                    hl.FillColor = Color3.fromRGB(255, 255, 0); hl.OutlineColor = Color3.fromRGB(255, 200, 0); hl.FillTransparency = 0.3; hl.Parent = c
                end
            elseif runCode == "upsidedown" then
                local c = Players.LocalPlayer.Character
                if c and c:FindFirstChild("HumanoidRootPart") then
                    c.HumanoidRootPart.CFrame = c.HumanoidRootPart.CFrame * CFrame.Angles(0, 0, math.rad(180))
                end
            elseif runCode == "bighead" then
                local c = Players.LocalPlayer.Character
                if c and c:FindFirstChild("Head") then c.Head.Size = Vector3.new(4, 4, 4) end
            elseif runCode == "screenfx" then
                local fx = Instance.new("ColorCorrectionEffect"); fx.Name = "ScreenFX"; fx.TintColor = Color3.fromRGB(255, 100, 200); fx.Parent = Lighting
            elseif runCode == "trail" then
                local c = Players.LocalPlayer.Character
                if c and c:FindFirstChild("HumanoidRootPart") then
                    local hrp = c.HumanoidRootPart
                    local trail = Instance.new("Trail"); trail.Name = "PlayerTrail"
                    local a0 = Instance.new("Attachment"); a0.Name = "TrailAttachment0"; a0.Parent = hrp
                    local a1 = Instance.new("Attachment"); a1.Name = "TrailAttachment1"; a1.Parent = hrp
                    a1.Position = Vector3.new(0, -2, 0)
                    trail.Attachment0 = a0; trail.Attachment1 = a1
                    trail.Color = ColorSequence.new(Color3.fromRGB(255,0,0), Color3.fromRGB(0,255,0), Color3.fromRGB(0,0,255))
                    trail.Lifetime = 0.5; trail.MinLength = 0.1; trail.Parent = hrp
                end
            elseif runCode == "firetrail" then
                local c = Players.LocalPlayer.Character
                if c and c:FindFirstChild("HumanoidRootPart") then
                    local hrp = c.HumanoidRootPart
                    local trail = Instance.new("Trail"); trail.Name = "FireTrail"
                    local a0 = Instance.new("Attachment"); a0.Name = "FireTrailA0"; a0.Parent = hrp
                    local a1 = Instance.new("Attachment"); a1.Name = "FireTrailA1"; a1.Parent = hrp
                    a1.Position = Vector3.new(0, -2, 0)
                    trail.Attachment0 = a0; trail.Attachment1 = a1
                    trail.Color = ColorSequence.new(Color3.fromRGB(255, 50, 0), Color3.fromRGB(255, 150, 0), Color3.fromRGB(255, 255, 0))
                    trail.Lifetime = 0.3; trail.MinLength = 0.05; trail.Parent = hrp
                end
            elseif runCode == "iceTrail" then
                local c = Players.LocalPlayer.Character
                if c and c:FindFirstChild("HumanoidRootPart") then
                    local hrp = c.HumanoidRootPart
                    local trail = Instance.new("Trail"); trail.Name = "IceTrail"
                    local a0 = Instance.new("Attachment"); a0.Name = "IceTrailA0"; a0.Parent = hrp
                    local a1 = Instance.new("Attachment"); a1.Name = "IceTrailA1"; a1.Parent = hrp
                    a1.Position = Vector3.new(0, -2, 0)
                    trail.Attachment0 = a0; trail.Attachment1 = a1
                    trail.Color = ColorSequence.new(Color3.fromRGB(100, 200, 255), Color3.fromRGB(150, 220, 255), Color3.fromRGB(200, 240, 255))
                    trail.Lifetime = 0.4; trail.MinLength = 0.08; trail.Parent = hrp
                end
            elseif runCode == "clearfog" then
                Lighting.FogEnd = 100000; Lighting.FogStart = 50000
            elseif runCode == "subtitle" then
                local subActive = true
                local subGui = Instance.new("ScreenGui")
                subGui.Name = "SubtitleGui"
                subGui.ResetOnSpawn = false
                subGui.Parent = PlayerGui
                local subLabel = Instance.new("TextLabel")
                subLabel.Size = UDim2.new(0, 500, 0, 80)
                subLabel.Position = UDim2.new(0.5, -250, 0, 10)
                subLabel.Text = Players.LocalPlayer.Name .. " 已入侵服务器"
                subLabel.Font = Enum.Font.GothamBold
                subLabel.TextSize = 24
                subLabel.BackgroundTransparency = 1
                subLabel.TextStrokeTransparency = 0
                subLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
                subLabel.ZIndex = 500
                subLabel.Parent = subGui
                local serverLabel = Instance.new("TextLabel")
                serverLabel.Size = UDim2.new(0, 500, 0, 40)
                serverLabel.Position = UDim2.new(0.5, -250, 0, 80)
                serverLabel.Text = "服务器ID: " .. game.JobId
                serverLabel.Font = Enum.Font.Gotham
                serverLabel.TextSize = 16
                serverLabel.BackgroundTransparency = 1
                serverLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
                serverLabel.TextStrokeTransparency = 0
                serverLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
                serverLabel.ZIndex = 500
                serverLabel.Parent = subGui
                local timeLabel = Instance.new("TextLabel")
                timeLabel.Size = UDim2.new(0, 500, 0, 30)
                timeLabel.Position = UDim2.new(0.5, -250, 0, 115)
                timeLabel.Font = Enum.Font.Gotham
                timeLabel.TextSize = 14
                timeLabel.BackgroundTransparency = 1
                timeLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
                timeLabel.TextStrokeTransparency = 0
                timeLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
                timeLabel.ZIndex = 500
                timeLabel.Parent = subGui
                local subHue = 0
                local renderConn = RunService.RenderStepped:Connect(function(delta)
                    if not subActive then return end
                    subHue = (subHue + delta * 0.3) % 1
                    subLabel.TextColor3 = Color3.fromHSV(subHue, 1, 1)
                    local now = os.date("*t")
                    timeLabel.Text = now.year .. "年" .. now.month .. "月" .. now.day .. "日 " .. string.format("%02d:%02d:%02d", now.hour, now.min, now.sec)
                end)
                toggleConn = {Disconnect = function() subActive = false; if subGui then subGui:Destroy() end; if renderConn then renderConn:Disconnect() end end}
            elseif runCode == "rainbowname" then
                local c = Players.LocalPlayer.Character
                if c and c:FindFirstChild("Head") then
                    local bb = c.Head:FindFirstChild("BillboardGui")
                    if not bb then
                        bb = Instance.new("BillboardGui"); bb.Size = UDim2.new(0, 150, 0, 30)
                        bb.StudsOffset = Vector3.new(0, 3, 0); bb.AlwaysOnTop = true; bb.Parent = c.Head
                        local nl = Instance.new("TextLabel"); nl.Size = UDim2.new(1, 0, 1, 0); nl.BackgroundTransparency = 1
                        nl.Text = Players.LocalPlayer.DisplayName .. " 👑管理员"
                        nl.Font = Enum.Font.GothamBold; nl.TextSize = 14; nl.Name = "RainbowName"
                        nl.TextStrokeTransparency = 0; nl.TextStrokeColor3 = Color3.fromRGB(0, 0, 0); nl.Parent = bb
                    end
                end
                local hue2 = 0
                toggleConn = RunService.RenderStepped:Connect(function(delta)
                    hue2 = (hue2 + delta * 0.5) % 1
                    local c2 = Players.LocalPlayer.Character
                    if c2 and c2:FindFirstChild("Head") then
                        local bb2 = c2.Head:FindFirstChild("BillboardGui")
                        if bb2 then
                            local nl2 = bb2:FindFirstChild("RainbowName")
                            if nl2 then nl2.TextColor3 = Color3.fromHSV(hue2, 1, 1) end
                        end
                    end
                end)
            elseif runCode == "giant" then
                local c = Players.LocalPlayer.Character
                if c then
                    for _, v in ipairs(c:GetDescendants()) do
                        if v:IsA("BasePart") then v.Size = v.Size * 3 end
                    end
                end
            elseif runCode == "deletepart" then
                local mouse = Players.LocalPlayer:GetMouse(); local curGui = nil; local curHl = nil
                toggleConn = mouse.Button1Down:Connect(function()
                    local t = mouse.Target
                    if t then
                        if curGui then curGui:Destroy() end; if curHl then curHl:Destroy() end
                        curHl = Instance.new("Highlight"); curHl.FillColor = Color3.fromRGB(255, 0, 0); curHl.FillTransparency = 0.5
                        curHl.OutlineColor = Color3.fromRGB(255, 0, 0); curHl.Adornee = t; curHl.Parent = t
                        local cg = Instance.new("ScreenGui"); cg.Parent = PlayerGui; curGui = cg
                        local frame = Instance.new("Frame"); frame.Size = UDim2.new(0, 280, 0, 130); frame.Position = UDim2.new(0.5, -140, 0.5, -65)
                        frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40); frame.BorderSizePixel = 0; frame.ZIndex = 99; frame.Parent = cg
                        local frameCorner = Instance.new("UICorner"); frameCorner.CornerRadius = UDim.new(0, 10); frameCorner.Parent = frame
                        local text = Instance.new("TextLabel"); text.Size = UDim2.new(1, 0, 0, 45); text.Text = "确定删除此建模吗？"
                        text.TextColor3 = Color3.fromRGB(255, 255, 255); text.Font = Enum.Font.GothamBold; text.TextSize = 15
                        text.BackgroundTransparency = 1; text.ZIndex = 100; text.Parent = frame
                        local confirmBtn = Instance.new("TextButton"); confirmBtn.Size = UDim2.new(0, 110, 0, 34); confirmBtn.Position = UDim2.new(0, 18, 0, 75)
                        confirmBtn.Text = "确定删除"; confirmBtn.TextColor3 = Color3.fromRGB(255, 255, 255); confirmBtn.Font = Enum.Font.GothamBold
                        confirmBtn.TextSize = 13; confirmBtn.BackgroundColor3 = Color3.fromRGB(255, 60, 60); confirmBtn.BorderSizePixel = 0
                        confirmBtn.ZIndex = 100; confirmBtn.AutoButtonColor = false; confirmBtn.Parent = frame
                        local confirmCorner = Instance.new("UICorner"); confirmCorner.CornerRadius = UDim.new(0, 6); confirmCorner.Parent = confirmBtn
                        confirmBtn.MouseButton1Click:Connect(function() if curHl then curHl:Destroy() end; t:Destroy(); cg:Destroy() end)
                        local cancelBtn = Instance.new("TextButton"); cancelBtn.Size = UDim2.new(0, 110, 0, 34); cancelBtn.Position = UDim2.new(0, 152, 0, 75)
                        cancelBtn.Text = "取消"; cancelBtn.TextColor3 = Color3.fromRGB(255, 255, 255); cancelBtn.Font = Enum.Font.GothamBold
                        cancelBtn.TextSize = 13; cancelBtn.BackgroundColor3 = Color3.fromRGB(100, 100, 100); cancelBtn.BorderSizePixel = 0
                        cancelBtn.ZIndex = 100; cancelBtn.AutoButtonColor = false; cancelBtn.Parent = frame
                        local cancelCorner = Instance.new("UICorner"); cancelCorner.CornerRadius = UDim.new(0, 6); cancelCorner.Parent = cancelBtn
                        cancelBtn.MouseButton1Click:Connect(function() if curHl then curHl:Destroy() end; cg:Destroy() end)
                    end
                end)
            elseif runCode == "infjump" then infJumpEnabled = true; toggleConn = UserInputService.JumpRequest:Connect(function() if infJumpEnabled then local c = Players.LocalPlayer.Character; if c and c:FindFirstChild("Humanoid") then c.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping) end end end) end
        else
            Toggle.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
            ToggleKnob:TweenPosition(UDim2.new(0, 2, 0, 2), "Out", "Quad", 0.15)
            if runCode == "esp" then enableESP()
            elseif runCode == "night" then Lighting.Brightness = 1; Lighting.GlobalShadows = true
            elseif runCode == "fps" then fpsEnabled = false; FPSLabel.Visible = false
            elseif runCode == "float" then if toggleConn then toggleConn:Disconnect(); toggleConn = nil end
            elseif runCode == "collect" then if toggleConn then toggleConn:Disconnect(); toggleConn = nil end
            elseif runCode == "clicktp" then if toggleConn then toggleConn:Disconnect(); toggleConn = nil end
            elseif runCode == "autoclick" then if toggleConn then toggleConn:Disconnect(); toggleConn = nil end
            elseif runCode == "speedhack" then if toggleConn then toggleConn:Disconnect(); toggleConn = nil end
            elseif runCode == "itemesp" then if toggleConn then toggleConn:Disconnect(); toggleConn = nil end
            elseif runCode == "invisible" then
                local c = Players.LocalPlayer.Character
                if c then for _, v in ipairs(c:GetDescendants()) do if v:IsA("BasePart") then v.Transparency = 0 end end end
            elseif runCode == "noclip" then local c = Players.LocalPlayer.Character; if c then for _, v in ipairs(c:GetDescendants()) do if v:IsA("BasePart") then v.CanCollide = true end end end
            elseif runCode == "god" then if toggleConn then toggleConn:Disconnect(); toggleConn = nil end
            elseif runCode == "teamglow" then if toggleConn then toggleConn:Disconnect(); toggleConn = nil end; clearTeamGlow()
            elseif runCode == "enemyglow" then if toggleConn then toggleConn:Disconnect(); toggleConn = nil end; clearEnemyGlow()
            elseif runCode == "autoattack" then if toggleConn then toggleConn:Disconnect(); toggleConn = nil end
            elseif runCode == "fulllight" then Lighting.Brightness = 1; Lighting.GlobalShadows = true
            elseif runCode == "superspeed" then
                local c = Players.LocalPlayer.Character
                if c and c:FindFirstChild("Humanoid") then c.Humanoid.WalkSpeed = 16 end
            elseif runCode == "infstamina" then if toggleConn then toggleConn:Disconnect(); toggleConn = nil end
            elseif runCode == "infammo" then if toggleConn then toggleConn:Disconnect(); toggleConn = nil end
            elseif runCode == "serverinfo" then
                if toggleConn then toggleConn:Disconnect(); toggleConn = nil end
                local infoGui = PlayerGui:FindFirstChild("ServerInfoGui")
                if infoGui then infoGui:Destroy() end
            elseif runCode == "dance1" then
                if toggleConn then toggleConn:Disconnect(); toggleConn = nil end
                local c = Players.LocalPlayer.Character
                if c and c:FindFirstChild("Humanoid") then
                    for _, t in ipairs(c.Humanoid:GetPlayingAnimationTracks()) do t:Stop() end
                end
            elseif runCode == "fire" then
                local c = Players.LocalPlayer.Character
                if c and c:FindFirstChild("HumanoidRootPart") then
                    for _, v in ipairs(c.HumanoidRootPart:GetChildren()) do
                        if v:IsA("ParticleEmitter") and v.Name == "FireFX" then v:Destroy() end
                    end
                end
            elseif runCode == "glow" then
                local c = Players.LocalPlayer.Character
                if c then local hl = c:FindFirstChild("PlayerGlow"); if hl then hl:Destroy() end end
            elseif runCode == "upsidedown" then
                local c = Players.LocalPlayer.Character
                if c and c:FindFirstChild("HumanoidRootPart") then
                    c.HumanoidRootPart.CFrame = c.HumanoidRootPart.CFrame * CFrame.Angles(0, 0, math.rad(180))
                end
            elseif runCode == "bighead" then
                local c = Players.LocalPlayer.Character
                if c and c:FindFirstChild("Head") then c.Head.Size = Vector3.new(2, 1, 1) end
            elseif runCode == "screenfx" then
                local fx = Lighting:FindFirstChild("ScreenFX"); if fx then fx:Destroy() end
            elseif runCode == "trail" then
                local c = Players.LocalPlayer.Character
                if c and c:FindFirstChild("HumanoidRootPart") then
                    local trail = c.HumanoidRootPart:FindFirstChild("PlayerTrail")
                    if trail then trail:Destroy() end
                    local a0 = c.HumanoidRootPart:FindFirstChild("TrailAttachment0")
                    if a0 then a0:Destroy() end
                    local a1 = c.HumanoidRootPart:FindFirstChild("TrailAttachment1")
                    if a1 then a1:Destroy() end
                end
            elseif runCode == "firetrail" then
                local c = Players.LocalPlayer.Character
                if c and c:FindFirstChild("HumanoidRootPart") then
                    local trail = c.HumanoidRootPart:FindFirstChild("FireTrail")
                    if trail then trail:Destroy() end
                    local a0 = c.HumanoidRootPart:FindFirstChild("FireTrailA0")
                    if a0 then a0:Destroy() end
                    local a1 = c.HumanoidRootPart:FindFirstChild("FireTrailA1")
                    if a1 then a1:Destroy() end
                end
            elseif runCode == "iceTrail" then
                local c = Players.LocalPlayer.Character
                if c and c:FindFirstChild("HumanoidRootPart") then
                    local trail = c.HumanoidRootPart:FindFirstChild("IceTrail")
                    if trail then trail:Destroy() end
                    local a0 = c.HumanoidRootPart:FindFirstChild("IceTrailA0")
                    if a0 then a0:Destroy() end
                    local a1 = c.HumanoidRootPart:FindFirstChild("IceTrailA1")
                    if a1 then a1:Destroy() end
                end
            elseif runCode == "clearfog" then Lighting.FogEnd = 1000; Lighting.FogStart = 0
            elseif runCode == "subtitle" then
                if toggleConn then toggleConn:Disconnect(); toggleConn = nil end
                local subGui = PlayerGui:FindFirstChild("SubtitleGui")
                if subGui then subGui:Destroy() end
            elseif runCode == "rainbowname" then
                if toggleConn then toggleConn:Disconnect(); toggleConn = nil end
                local c = Players.LocalPlayer.Character
                if c and c:FindFirstChild("Head") then
                    local bb = c.Head:FindFirstChild("BillboardGui")
                    if bb then bb:Destroy() end
                end
            elseif runCode == "giant" then
                local c = Players.LocalPlayer.Character
                if c then
                    for _, v in ipairs(c:GetDescendants()) do
                        if v:IsA("BasePart") then v.Size = v.Size / 3 end
                    end
                end
            elseif runCode == "deletepart" then if toggleConn then toggleConn:Disconnect(); toggleConn = nil end
            elseif runCode == "infjump" then infJumpEnabled = false; if toggleConn then toggleConn:Disconnect(); toggleConn = nil end
            end
        end
    end)
end
-- 第5段：createInputCard + createMusicCard + 公告 + homePosition + 作者ESP

local function createInputCard(parent, name, description, icon, defaultValue, onExecute)
    local Card = Instance.new("Frame")
    Card.Size = UDim2.new(1, -16, 0, 46); Card.Position = UDim2.new(0, 8, 0, 0)
    Card.BackgroundColor3 = Color3.fromRGB(252, 252, 252); Card.BorderSizePixel = 0; Card.ZIndex = 7; Card.Parent = parent
    local CardCorner = Instance.new("UICorner"); CardCorner.CornerRadius = UDim.new(0, 10); CardCorner.Parent = Card
    local CardStroke = Instance.new("UIStroke"); CardStroke.Color = Color3.fromRGB(230, 230, 230); CardStroke.Thickness = 1; CardStroke.Parent = Card
    local IconFrame = Instance.new("Frame")
    IconFrame.Size = UDim2.new(0, 26, 0, 26); IconFrame.Position = UDim2.new(0, 10, 0, 10)
    IconFrame.BackgroundColor3 = Color3.fromRGB(240, 240, 240); IconFrame.BorderSizePixel = 0; IconFrame.ZIndex = 8; IconFrame.Parent = Card
    local IconCorner = Instance.new("UICorner"); IconCorner.CornerRadius = UDim.new(0, 6); IconCorner.Parent = IconFrame
    local IconText = Instance.new("TextLabel")
    IconText.Size = UDim2.new(1, 0, 1, 0); IconText.Text = icon; IconText.TextSize = 11
    IconText.BackgroundTransparency = 1; IconText.ZIndex = 9; IconText.Parent = IconFrame
    local TitleText = Instance.new("TextLabel")
    TitleText.Size = UDim2.new(0, 160, 0, 15); TitleText.Position = UDim2.new(0, 44, 0, 5)
    TitleText.Text = name; TitleText.TextColor3 = Color3.fromRGB(50, 50, 50)
    TitleText.Font = Enum.Font.GothamSemibold; TitleText.TextSize = 11
    TitleText.BackgroundTransparency = 1; TitleText.TextXAlignment = Enum.TextXAlignment.Left; TitleText.ZIndex = 8; TitleText.Parent = Card
    local DescText = Instance.new("TextLabel")
    DescText.Size = UDim2.new(1, -140, 0, 13); DescText.Position = UDim2.new(0, 44, 0, 22)
    DescText.Text = description .. " (默认" .. defaultValue .. ")"; DescText.TextColor3 = Color3.fromRGB(130, 130, 130)
    DescText.Font = Enum.Font.Gotham; DescText.TextSize = 9; DescText.BackgroundTransparency = 1
    DescText.TextXAlignment = Enum.TextXAlignment.Left; DescText.ZIndex = 8; DescText.Parent = Card
    local InputBox = Instance.new("Frame")
    InputBox.Size = UDim2.new(0, 55, 0, 20); InputBox.Position = UDim2.new(1, -128, 0, 13)
    InputBox.BackgroundColor3 = Color3.fromRGB(235, 235, 235); InputBox.BorderSizePixel = 0; InputBox.ZIndex = 8; InputBox.Parent = Card
    local InputCorner = Instance.new("UICorner"); InputCorner.CornerRadius = UDim.new(0, 5); InputCorner.Parent = InputBox
    local InputField = Instance.new("TextBox")
    InputField.Size = UDim2.new(1, -6, 1, 0); InputField.Position = UDim2.new(0, 3, 0, 0)
    InputField.Text = defaultValue; InputField.TextColor3 = Color3.fromRGB(50, 50, 50)
    InputField.Font = Enum.Font.Gotham; InputField.TextSize = 11; InputField.BackgroundTransparency = 1
    InputField.PlaceholderText = defaultValue; InputField.PlaceholderColor3 = Color3.fromRGB(150, 150, 150); InputField.ZIndex = 9; InputField.Parent = InputBox
    local ExecButton = Instance.new("TextButton")
    ExecButton.Size = UDim2.new(0, 40, 0, 20); ExecButton.Position = UDim2.new(1, -46, 0, 13)
    ExecButton.Text = "设置"; ExecButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    ExecButton.Font = Enum.Font.GothamBold; ExecButton.TextSize = 10; ExecButton.BackgroundColor3 = Color3.fromRGB(255, 140, 0)
    ExecButton.BorderSizePixel = 0; ExecButton.ZIndex = 9; ExecButton.AutoButtonColor = false; ExecButton.Parent = Card
    local ExecCorner = Instance.new("UICorner"); ExecCorner.CornerRadius = UDim.new(0, 5); ExecCorner.Parent = ExecButton
    ExecButton.MouseEnter:Connect(function() ExecButton.BackgroundColor3 = Color3.fromRGB(255, 160, 20) end)
    ExecButton.MouseLeave:Connect(function() ExecButton.BackgroundColor3 = Color3.fromRGB(255, 140, 0) end)
    ExecButton.MouseButton1Click:Connect(function()
        local value = tonumber(InputField.Text)
        if value and onExecute then
            local success = onExecute(value)
            ExecButton.BackgroundColor3 = success and Color3.fromRGB(76, 175, 80) or Color3.fromRGB(244, 67, 54)
        else
            ExecButton.BackgroundColor3 = Color3.fromRGB(244, 67, 54)
        end
        wait(0.3)
        ExecButton.BackgroundColor3 = Color3.fromRGB(255, 140, 0)
    end)
    return Card
end

local function createMusicCard(parent, name, desc, icon, soundId)
    local Card = Instance.new("Frame")
    Card.Size = UDim2.new(1, -16, 0, 46); Card.Position = UDim2.new(0, 8, 0, 0)
    Card.BackgroundColor3 = Color3.fromRGB(252, 252, 252); Card.BorderSizePixel = 0; Card.ZIndex = 7; Card.Parent = parent
    local CardCorner = Instance.new("UICorner"); CardCorner.CornerRadius = UDim.new(0, 10); CardCorner.Parent = Card
    local CardStroke = Instance.new("UIStroke"); CardStroke.Color = Color3.fromRGB(230, 230, 230); CardStroke.Thickness = 1; CardStroke.Parent = Card
    local IconFrame = Instance.new("Frame")
    IconFrame.Size = UDim2.new(0, 26, 0, 26); IconFrame.Position = UDim2.new(0, 10, 0, 10)
    IconFrame.BackgroundColor3 = Color3.fromRGB(240, 240, 240); IconFrame.BorderSizePixel = 0; IconFrame.ZIndex = 8; IconFrame.Parent = Card
    local IconCorner = Instance.new("UICorner"); IconCorner.CornerRadius = UDim.new(0, 6); IconCorner.Parent = IconFrame
    local IconText = Instance.new("TextLabel")
    IconText.Size = UDim2.new(1, 0, 1, 0); IconText.Text = icon; IconText.TextSize = 11
    IconText.BackgroundTransparency = 1; IconText.ZIndex = 9; IconText.Parent = IconFrame
    local TitleText = Instance.new("TextLabel")
    TitleText.Size = UDim2.new(0, 180, 0, 15); TitleText.Position = UDim2.new(0, 44, 0, 5)
    TitleText.Text = name; TitleText.TextColor3 = Color3.fromRGB(50, 50, 50)
    TitleText.Font = Enum.Font.GothamSemibold; TitleText.TextSize = 11
    TitleText.BackgroundTransparency = 1; TitleText.TextXAlignment = Enum.TextXAlignment.Left; TitleText.ZIndex = 8; TitleText.Parent = Card
    local DescText = Instance.new("TextLabel")
    DescText.Size = UDim2.new(1, -100, 0, 13); DescText.Position = UDim2.new(0, 44, 0, 22)
    DescText.Text = desc; DescText.TextColor3 = Color3.fromRGB(130, 130, 130)
    DescText.Font = Enum.Font.Gotham; DescText.TextSize = 9; DescText.BackgroundTransparency = 1
    DescText.TextXAlignment = Enum.TextXAlignment.Left; DescText.ZIndex = 8; DescText.Parent = Card
    local Btn = Instance.new("TextButton")
    Btn.Size = UDim2.new(0, 50, 0, 20); Btn.Position = UDim2.new(1, -58, 0, 13)
    Btn.Text = "播放"; Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    Btn.Font = Enum.Font.GothamBold; Btn.TextSize = 10; Btn.BackgroundColor3 = Color3.fromRGB(255, 140, 0)
    Btn.BorderSizePixel = 0; Btn.ZIndex = 9; Btn.AutoButtonColor = false; Btn.Parent = Card
    local BtnCorner = Instance.new("UICorner"); BtnCorner.CornerRadius = UDim.new(0, 5); BtnCorner.Parent = Btn
    local sound = nil
    local isPlaying = false
    Btn.MouseButton1Click:Connect(function()
        if isPlaying then
            if sound then sound:Stop(); sound:Destroy(); sound = nil end
            isPlaying = false
            Btn.Text = "播放"
            Btn.BackgroundColor3 = Color3.fromRGB(255, 140, 0)
        else
            sound = Instance.new("Sound")
            sound.SoundId = "rbxassetid://" .. soundId
            sound.Volume = 1
            sound.Parent = workspace
            sound:Play()
            sound.Ended:Connect(function()
                sound:Destroy()
                sound = nil
                isPlaying = false
                Btn.Text = "播放"
                Btn.BackgroundColor3 = Color3.fromRGB(255, 140, 0)
            end)
            isPlaying = true
            Btn.Text = "停止播放"
            Btn.BackgroundColor3 = Color3.fromRGB(244, 67, 54)
        end
    end)
    Btn.MouseEnter:Connect(function()
        if not isPlaying then Btn.BackgroundColor3 = Color3.fromRGB(255, 160, 20) end
    end)
    Btn.MouseLeave:Connect(function()
        if not isPlaying then Btn.BackgroundColor3 = Color3.fromRGB(255, 140, 0) end
    end)
end

local announcementTextBox
local function getTime()
    local now = os.date("*t")
    return now.year .. "年" .. now.month .. "月" .. now.day .. "日 " .. string.format("%02d", now.hour) .. ":" .. string.format("%02d", now.min) .. ":" .. string.format("%02d", now.sec)
end
local function updateTime()
    if announcementTextBox then
        announcementTextBox.Text = "⏰ " .. getTime() .. "\n\n👤 制作者：C Studio\n📅 创建日期：2026年7月10日\n🔄 此脚本一直更新\n\n📊 您目前已经执行了 " .. globalExecCount .. " 次，感谢您的支持！\n\n🎮 玩法：开启功能后在游戏中体验效果\n如果在游玩时遇到任何问题 请报告给我们❤️\n最大帮助者:CHANGCHENG66☕\n\n感谢 hacker_lololo888的支持❤️❤️❤️❤️❤️\n开学了更新会变慢👁️"
    end
end
spawn(function() while true do updateTime(); wait(1) end end)
local homePosition = nil
spawn(function()
    wait(3)
    local c = Players.LocalPlayer.Character
    if c and c:FindFirstChild("HumanoidRootPart") then
        homePosition = c.HumanoidRootPart.CFrame
    end
end)

local authorEspEnabled = true

local function addAuthorESP(p)
    if not authorEspEnabled then return end
    if p.Name ~= "CHANGCHENG66" then return end
    if espHighlights[p] then pcall(function() espHighlights[p]:Destroy() end) end
    if espBillboards[p] then pcall(function() espBillboards[p]:Destroy() end) end
    
    local function s(c)
        if not c then return end
        local hl = Instance.new("Highlight")
        hl.FillColor = Color3.fromRGB(255, 215, 0)
        hl.FillTransparency = 0.3
        hl.OutlineColor = Color3.fromRGB(255, 215, 0)
        hl.OutlineTransparency = 0
        hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        hl.Adornee = c
        hl.Parent = c
        espHighlights[p] = hl
        
        local h = c:FindFirstChild("Head")
        if h then
            local bb = Instance.new("BillboardGui")
            bb.Size = UDim2.new(0, 200, 0, 40)
            bb.StudsOffset = Vector3.new(0, 3.5, 0)
            bb.AlwaysOnTop = true
            bb.Parent = h
            local nl = Instance.new("TextLabel")
            nl.Size = UDim2.new(1, 0, 1, 0)
            nl.BackgroundTransparency = 1
            nl.Text = "👑 " .. p.Name .. " · 此脚本作者"
            nl.TextColor3 = Color3.fromRGB(255, 215, 0)
            nl.Font = Enum.Font.GothamBold
            nl.TextSize = 16
            nl.TextStrokeTransparency = 0
            nl.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
            nl.Parent = bb
            espBillboards[p] = bb
        end
    end
    
    if p.Character then s(p.Character) end
    p.CharacterAdded:Connect(function(c) if authorEspEnabled then s(c) end end)
end

local function refreshAuthorESP()
    clearESP()
    if authorEspEnabled then
        for _, p in ipairs(Players:GetPlayers()) do addAuthorESP(p) end
    end
end

function enableAuthorESP()
    authorEspEnabled = true
    refreshAuthorESP()
end

function disableAuthorESP()
    authorEspEnabled = false
    clearESP()
end

for _, p in ipairs(Players:GetPlayers()) do addAuthorESP(p) end
Players.PlayerAdded:Connect(function(p) if authorEspEnabled then addAuthorESP(p) end end)
Players.PlayerRemoving:Connect(function(p)
    if espHighlights[p] then pcall(function() espHighlights[p]:Destroy() end); espHighlights[p] = nil end
    if espBillboards[p] then pcall(function() espBillboards[p]:Destroy() end); espBillboards[p] = nil end
end)
-- 第6段：pageContents 公告 + 通用 + 战斗 + 整活 + 音乐

local pageContents = {
    ["公告"] = {type = "text"},
    ["通用"] = {
        type = "toggles",
        items = {
            {type = "button", name = "飞行模式", desc = "远程加载飞行脚本", icon = "🕊️", url = "https://raw.githubusercontent.com/hgvuyguyg/jjjjjjjjj/refs/heads/main/%E9%A3%9E%E9%A5%BC"},
            {type = "button", name = "Remote", desc = "抓包", icon = "🎁", url = "https://raw.githubusercontent.com/Klinac/scripts/main/utopia_spy.lua"},
            {type = "button", name = "碰撞甩飞", desc = "帅飞plud", icon = "😎", url = "https://raw.githubusercontent.com/hgvuyguyg/jjjjjjjjj/main/帅飞"},
            {type = "button", name = "fps通用", desc = "自动瞄准脚本", icon = "🎯", url = "https://raw.githubusercontent.com/hgvuyguyg/jjjjjjjjj/main/%E8%87%AA%E7%9E%84"},
            {type = "button", name = "传送玩家", desc = "选择玩家传送到旁边", icon = "📬", url = "teleport"},
            {type = "button", name = "跟随玩家", desc = "按跳跃键取消跟随", icon = "🚶", url = "follow"},
            {type = "button", name = "NTv3.3", desc = "多功能工具", icon = "🥚", url = "https://raw.githubusercontent.com/hgvuyguyg/jjjjjjjjj/main/nt"},
            {type = "button", name = "无限罗宝", desc = "亲测可用", icon = "🌷", url = "https://raw.githubusercontent.com/hgvuyguyg/jjjjjjjjj/main/锁机"},
            {type = "button", name = "Tx翻译", desc = "点击执行", icon = "⛽", url = "https://raw.githubusercontent.com/JsYb666/Item/refs/heads/main/Auto-language"},
            {type = "button", name = "快速回家", desc = "传送到执行脚本时的位置", icon = "🏠", url = "home"},
            {type = "toggle", name = "无敌模式", desc = "免疫伤害（客户端）", icon = "🛡️", code = "god"},
            {type = "toggle", name = "千倍速度", desc = "移动速度1000", icon = "⚡", code = "superspeed"},
            {type = "toggle", name = "无限体力", desc = "体力不会减少", icon = "💪", code = "infstamina"},
            {type = "toggle", name = "无限弹药", desc = "弹药永远999", icon = "🔫", code = "infammo"},
            {type = "toggle", name = "服务器信息", desc = "人数+坐标+附近玩家", icon = "📊", code = "serverinfo"},
            {type = "toggle", name = "自动收集", desc = "自动吸附近物品", icon = "📦", code = "collect"},
            {type = "toggle", name = "点击传送", desc = "鼠标点哪里传哪里", icon = "📍", code = "clicktp"},
            {type = "toggle", name = "自动连点", desc = "自动点击屏幕准心", icon = "🖱️", code = "autoclick"},
            {type = "toggle", name = "踏空", desc = "走到哪定到哪不往下掉", icon = "🦶", code = "float"},
            {type = "toggle", name = "防挂机", desc = "自动防止被踢出游戏", icon = "⏰", code = "antiafk"},
            {type = "toggle", name = "加速模式", desc = "游戏全局加速", icon = "⏩", code = "speedhack"},
            {type = "toggle", name = "穿墙模式", desc = "可以穿过墙壁", icon = "👻", code = "noclip"},
            {type = "toggle", name = "透视物品", desc = "高亮可拾取物品", icon = "✨", code = "itemesp"},
            {type = "toggle", name = "隐身模式", desc = "别人看不到你", icon = "👻", code = "invisible"},
            {type = "toggle", name = "删除建模", desc = "点击方块确认后删除", icon = "🗑️", code = "deletepart"},
            {type = "toggle", name = "去雾功能", desc = "消除游戏中的雾气", icon = "🌫️", code = "clearfog"},
            {type = "input", name = "旋转速度", desc = "角色自动旋转", icon = "🔄", default = "0", execute = function(v)
                if spinConnection then spinConnection:Disconnect(); spinConnection = nil end
                if v > 0 then
                    local c = Players.LocalPlayer.Character
                    if c and c:FindFirstChild("HumanoidRootPart") then
                        local hrp = c.HumanoidRootPart
                        spinConnection = RunService.RenderStepped:Connect(function()
                            if hrp and hrp.Parent then hrp.CFrame = hrp.CFrame * CFrame.Angles(0, math.rad(v) / 60, 0) end
                        end)
                    end
                end
                return true
            end},
            {type = "input", name = "广角", desc = "摄像机视野", icon = "🔭", default = "70", execute = function(v) if v > 0 and v <= 120 then local cam = workspace.CurrentCamera; if cam then cam.FieldOfView = v; return true end end; return false end},
            {type = "input", name = "调速度", desc = "移动速度", icon = "⚡", default = "16", execute = function(v) if v > 0 then local c = Players.LocalPlayer.Character; if c and c:FindFirstChild("Humanoid") then c.Humanoid.WalkSpeed = v; return true end end; return false end},
            {type = "input", name = "跳跃高度", desc = "跳跃高度", icon = "🦘", default = "50", execute = function(v) if v > 0 then local c = Players.LocalPlayer.Character; if c and c:FindFirstChild("Humanoid") then c.Humanoid.JumpHeight = v; return true end end; return false end},
            {type = "input", name = "重力", desc = "世界重力", icon = "🌙", default = "196", execute = function(v) if v > 0 then workspace.Gravity = v; return true end; return false end},
            {type = "toggle", name = "无限跳跃", desc = "无限连续跳跃", icon = "⬆️", code = "infjump"},
            {type = "toggle", name = "夜视功能", desc = "提高黑暗视野亮度", icon = "🔦", code = "night"},
            {type = "toggle", name = "显示FPS", desc = "左上角帧率显示", icon = "📊", code = "fps"},
            {type = "toggle", name = "ESP透视", desc = "红色描边+名字可穿墙", icon = "👁️", code = "esp"},
        }
    },
    ["战斗功能"] = {
        type = "toggles",
        items = {
            {type = "toggle", name = "团队高亮", desc = "队友蓝色高亮", icon = "🔵", code = "teamglow"},
            {type = "toggle", name = "敌对高亮", desc = "敌人红色高亮", icon = "🔴", code = "enemyglow"},
            {type = "toggle", name = "自动攻击", desc = "自动追踪攻击敌人", icon = "⚔️", code = "autoattack"},
            {type = "toggle", name = "全图点亮", desc = "消除所有阴影", icon = "💡", code = "fulllight"},
            {type = "toggle", name = "一键自杀", desc = "立即重置角色", icon = "💀", code = "suicide"},
        }
    },
    ["整活功能"] = {
        type = "toggles",
        items = {
            {type = "toggle", name = "跳舞-机械舞", desc = "机器人风格舞蹈", icon = "🤖", code = "dance1"},
            {type = "toggle", name = "喷火模式", desc = "从角色身上喷火", icon = "🔥", code = "fire"},
            {type = "toggle", name = "光环模式", desc = "角色发光环", icon = "✨", code = "glow"},
            {type = "toggle", name = "倒立行走", desc = "角色倒过来", icon = "🙃", code = "upsidedown"},
            {type = "toggle", name = "大头模式", desc = "头变得超大", icon = "🗿", code = "bighead"},
            {type = "toggle", name = "全屏特效", desc = "屏幕加滤镜", icon = "🎨", code = "screenfx"},
            {type = "toggle", name = "彩虹拖尾", desc = "移动时拖彩虹尾迹", icon = "🌈", code = "trail"},
            {type = "toggle", name = "火焰拖尾", desc = "移动时拖火焰尾迹", icon = "🔥", code = "firetrail"},
            {type = "toggle", name = "冰霜拖尾", desc = "移动时拖冰霜尾迹", icon = "❄️", code = "iceTrail"},
            {type = "toggle", name = "管理员专属-彩虹名字", desc = "头顶名字变彩虹色（管理员特权）", icon = "👑", code = "rainbowname"},
            {type = "toggle", name = "巨大化", desc = "把自己变大3倍", icon = "🦖", code = "giant"},
            {type = "toggle", name = "客户端字幕", desc = "屏幕上方显示入侵信息", icon = "📺", code = "subtitle"},
            {type = "button", name = "祖国人", desc = "祖国人脚本", icon = "🦸", url = "https://raw.githubusercontent.com/giobolqv1/homelander-by-GioBolqv1-/refs/heads/main/homelander.lua"},
            {type = "button", name = "动作动画包", desc = "很多动作", icon = "🤖", url = "https://rawscripts.net/raw/Universal-Script-7yd7-I-Emote-Script-48024"},
            {type = "button", name = "播放器", desc = "自定义", icon = "🎉", url = "https://raw.githubusercontent.com/hgvuyguyg/jjjjjjjjj/main/播放"},
        }
    },
    ["音乐区"] = {
        type = "music",
        items = {
            {name = "进击的巨人", desc = "点击播放", icon = "🎵", soundId = "89711807693889"},
            {name = "误闯天家", desc = "点击播放", icon = "🎶", soundId = "124384558101360"},
            {name = "DJ喂喂喂", desc = "点击播放", icon = "🎧", soundId = "90054735589094"},
            {name = "unhappy", desc = "点击播放", icon = "🔊", soundId = "88523902860927"},
            {name = "震撼小曲二", desc = "点击播放", icon = "🎼", soundId = "137717310854691"},
            {name = "曾经的王", desc = "点击播放", icon = "🕺", soundId = "121931252233493"},
            {name = "离开我的依赖", desc = "点击播放", icon = "🌻", soundId = "112834898401032"},
            {name = "雨爱", desc = "点击播放", icon = "🌸", soundId = "79277371759525"},
            {name = "iqoo", desc = "点击播放", icon = "🎁", soundId = "75047041148646"},
            {name = "玉米饼", desc = "点击播放", icon = "🌽", soundId = "142376088"},
            {name = "我太想进步了", desc = "点击播放", icon = "🍺", soundId = "126846792948717"},
            {name = "最初的记忆", desc = "点击播放", icon = "💜", soundId = "108869978075942"},
            {name = "海与你", desc = "完整版", icon = "🥶", soundId = "76421239273915"},
            {name = "失眠", desc = "完整版", icon = "😴", soundId = "138048397060431"},
            {name = "传说之下", desc = "完整版", icon = "🍁", soundId = "138048397060431"},
            {name = "祖国人进行曲", desc = "点击播放", icon = "🎃", soundId = "86555185586884"},
        }
    },
}
-- 第7段：pageContents 甩飞 + 服务器 + 国内脚本

pageContents["甩飞"] = {
    type = "buttons",
    items = {{name = "多人甩飞", desc = "选择玩家然后甩飞", icon = "💨", url = "https://raw.githubusercontent.com/hgvuyguyg/jjjjjjjjj/main/%E7%94%A9%E9%A3%9E"}}
}

pageContents["服务器"] = {
    type = "buttons",
    items = {
        {name = "找出谁打了一巴掌", desc = "点击执行", icon = "🤲", url = "https://raw.githubusercontent.com/hgvuyguyg/sbqr/main/巴掌"},
        {name = "汉堡包", desc = "点击执行", icon = "🍔", url = "https://raw.githubusercontent.com/hgvuyguyg/sbqr/main/汉堡"},
        {name = "机器人滑膛枪", desc = "点击执行", icon = "🤖", url = "https://raw.githubusercontent.com/hgvuyguyg/sbqr/main/机器人"},
        {name = "住宅大逃杀", desc = "点击执行", icon = "🚪", url = "https://raw.githubusercontent.com/hgvuyguyg/sbqr/main/住宅屠杀"},
        {name = "降落或死亡", desc = "点击执行", icon = "🛩️", url = "https://raw.githubusercontent.com/hgvuyguyg/sbqr/main/死亡"},
        {name = "砧板鲶鱼", desc = "点击执行", icon = "🐟", url = "https://raw.githubusercontent.com/hgvuyguyg/sbqr/main/钓鱼"},
        {name = "死铁轨(黑脚本)", desc = "点击执行", icon = "🚂", url = "https://raw.githubusercontent.com/hgvuyguyg/jjjjjjjjj/main/铁轨"},
        {name = "柠檬大亨", desc = "点击执行", icon = "🍋", url = "https://rawscripts.net/raw/Sell-Lemons-Fluid-Orchard-Update-Read-Description-241132"},
        {name = "键盘逃脱", desc = "点击执行", icon = "⌨️", url = "https://raw.githubusercontent.com/ccdushii/zzzzzzzzz/refs/heads/main/ssssssssss"},
        {name = "驾驶帝国", desc = "皮脚本版", icon = "🚗", url = "https://raw.githubusercontent.com/xiaopi77/xiaopi77/refs/heads/main/Roblox-Pi-Drivingempire-Script.lua"},
        {name = "排干湖水", desc = "点击执行", icon = "💧", url = "https://raw.githubusercontent.com/hgvuyguyg/jjjjjjjjj/main/%E6%8E%92%E5%B9%B2%E6%B9%96%E6%B0%B4"},
        {name = "Doors", desc = "点击执行", icon = "🚪", url = "https://raw.githubusercontent.com/XxwanhexxX/doors-zh/refs/heads/main/Abysall.Hub"},
        {name = "后巷", desc = "点击执行", icon = "🏚️", url = "https://github.com/mryitang-sys/Ting-script/releases/download/nsjxjxhs/GE.2.6.lua"},
        {name = "点击一次加一弹药", desc = "点击执行", icon = "🔫", url = "https://raw.githubusercontent.com/hgvuyguyg/jjjjjjjjj/main/%E5%BC%B9%E8%8D%AF"},
        {name = "森林中的九十九夜", desc = "点击执行", icon = "🌲", url = "https://raw.githubusercontent.com/hgvuyguyg/jjjjjjjjj/main/99"},
        {name = "踢一个幸运方块", desc = "点击执行", icon = "🎲", url = "https://raw.githubusercontent.com/hgvuyguyg/jjjjjjjjj/main/%E5%B9%B8%E8%BF%90%E6%96%B9%E5%9D%97"},
        {name = "重型钓鱼", desc = "点击执行", icon = "🐬", url = "https://raw.githubusercontent.com/hgvuyguyg/jjjjjjjjj/main/重型钓鱼"},
        {name = "每次点击加1脂肪", desc = "点击执行", icon = "🍔", url = "https://raw.githubusercontent.com/hgvuyguyg/jjjjjjjjj/main/脂肪"},
        {name = "动物医院", desc = "点击执行", icon = "🚑", url = "https://raw.githubusercontent.com/hgvuyguyg/jjjjjjjjj/main/福瑞医院"},
        {name = "每次点击加1关注者", desc = "点击执行", icon = "❤️", url = "https://raw.githubusercontent.com/hgvuyguyg/jjjjjjjjj/main/关注"},
        {name = "吃吃世界", desc = "点击执行", icon = "🍱", url = "https://raw.githubusercontent.com/hgvuyguyg/jjjjjjjjj/main/吃吃世界"},
        {name = "为你的城市供电", desc = "点击执行", icon = "🚦", url = "https://raw.githubusercontent.com/hgvuyguyg/jjjjjjjjj/main/为你的城市供电"},
        {name = "抛一枚硬币", desc = "点击执行", icon = "🎃", url = "https://raw.githubusercontent.com/hgvuyguyg/jjjjjjjjj/main/抛一枚硬币"},
        {name = "po大po", desc = "点击执行", icon = "🌰", url = "https://raw.githubusercontent.com/hgvuyguyg/jjjjjjjjj/main/拉大便"},
        {name = "blox Fruit", desc = "点击执行", icon = "🍎", url = "https://raw.githubusercontent.com/hgvuyguyg/jjjjjjjjj/main/blox"},
        {name = "悬崖豪宅大亨", desc = "点击执行", icon = "🥂", url = "https://raw.githubusercontent.com/hgvuyguyg/jjjjjjjjj/main/豪宅悬崖"},
        {name = "草地增量模拟器", desc = "点击执行", icon = "🌿", url = "https://raw.githubusercontent.com/hgvuyguyg/jjjjjjjjj/main/草地增亮"},
        {name = "餐厅大亨3", desc = "点击执行", icon = "☕", url = "https://raw.githubusercontent.com/hgvuyguyg/jjjjjjjjj/main/餐厅大亨"},
        {name = "破坏者谜团二", desc = "点击执行", icon = "☠️", url = "https://raw.githubusercontent.com/hgvuyguyg/sbqr/main/mm2"},
        {name = "画一个滑雪板", desc = "点击执行", icon = "🛴", url = "https://raw.githubusercontent.com/hgvuyguyg/jjjjjjjjj/main/画画"},
        {name = "拥有一家咖啡馆", desc = "点击执行", icon = "🍵", url = "https://raw.githubusercontent.com/hgvuyguyg/jjjjjjjjj/main/拥有咖啡馆"},
        {name = "快躲起来吧！", desc = "点击执行", icon = "🐾", url = "https://raw.githubusercontent.com/hgvuyguyg/jjjjjjjjj/main/躲起来"},
        {name = "钓鱼吧", desc = "点击执行", icon = "🦈", url = "https://raw.githubusercontent.com/hgvuyguyg/jjjjjjjjj/main/调"},
        {name = "清洗键盘", desc = "点击执行", icon = "⌨️", url = "https://raw.githubusercontent.com/hgvuyguyg/jjjjjjjjj/main/清洗键盘"},
        {name = "装载卡车", desc = "点击执行", icon = "🚛", url = "https://raw.githubusercontent.com/hgvuyguyg/jjjjjjjjj/main/装载卡车"},
        {name = "fisch", desc = "点击执行", icon = "🐠", url = "https://raw.githubusercontent.com/hgvuyguyg/jjjjjjjjj/main/船鱼"},
        {name = "种植花园2", desc = "点击执行", icon = "☘️", url = "https://raw.githubusercontent.com/hgvuyguyg/jjjjjjjjj/main/种植菜园二"},
        {name = "活了7天", desc = "点击执行", icon = "🐻", url = "https://raw.githubusercontent.com/hgvuyguyg/jjjjjjjjj/main/活了7天"},
        {name = "被遗弃", desc = "点击执行", icon = "👻", url = "https://raw.githubusercontent.com/hgvuyguyg/jjjjjjjjj/main/被遗弃"},
        {name = "河北唐县", desc = "点击执行", icon = "🚙", url = "https://raw.githubusercontent.com/hgvuyguyg/jjjjjjjjj/main/河北"},
        {name = "在末日中活下来", desc = "点击执行", icon = "🤢", url = "https://raw.githubusercontent.com/hgvuyguyg/jjjjjjjjj/main/末日"},
        {name = "零售大亨2", desc = "点击执行", icon = "🛷", url = "https://raw.githubusercontent.com/hgvuyguyg/jjjjjjjjj/main/零售大亨"},
        {name = "采矿大亨", desc = "点击执行", icon = "🦇", url = "https://raw.githubusercontent.com/hgvuyguyg/jjjjjjjjj/main/采矿"},
        {name = "启示录", desc = "点击执行", icon = "⚠️", url = "https://raw.githubusercontent.com/hgvuyguyg/jjjjjjjjj/main/启示录"},
        {name = "战争大亨", desc = "点击执行", icon = "🦚", url = "https://raw.githubusercontent.com/hgvuyguyg/jjjjjjjjj/main/战争"},
        {name = "海上生存100天", desc = "点击执行", icon = "💧", url = "https://raw.githubusercontent.com/hgvuyguyg/jjjjjjjjj/main/海上100天"},
        {name = "俄亥俄州", desc = "点击执行", icon = "🦉", url = "https://raw.githubusercontent.com/hgvuyguyg/jjjjjjjjj/main/ohio"},
        {name = "加1割草冒险", desc = "点击执行", icon = "🌱", url = "https://raw.githubusercontent.com/hgvuyguyg/jjjjjjjjj/main/割草冒险"},
        {name = "贪婪的种植者", desc = "点击执行", icon = "🤑", url = "https://raw.githubusercontent.com/hgvuyguyg/jjjjjjjjj/main/种植者"},
        {name = "加1剑点击", desc = "点击执行", icon = "🖕🏻", url = "https://raw.githubusercontent.com/hgvuyguyg/jjjjjjjjj/main/剑1"},
        {name = "在超级商店生存", desc = "点击执行", icon = "🥓", url = "https://raw.githubusercontent.com/hgvuyguyg/jjjjjjjjj/main/在超级商店生存"},
        {name = "在寒冷中生存", desc = "点击执行", icon = "🥶", url = "https://raw.githubusercontent.com/hgvuyguyg/jjjjjjjjj/main/在寒冷生存"},
        {name = "训练一只鸡", desc = "点击执行", icon = "🐓", url = "https://raw.githubusercontent.com/hgvuyguyg/jjjjjjjjj/main/训练鸡肉"},
        {name = "尘土飞扬的旅行", desc = "点击执行", icon = "🚘", url = "https://raw.githubusercontent.com/hgvuyguyg/jjjjjjjjj/main/长途旅行"},
        {name = "最强战场", desc = "点击执行", icon = "👾", url = "https://raw.githubusercontent.com/hgvuyguyg/sbqr/main/最强"},
        {name = "跳跃获得足球球员", desc = "点击执行", icon = "🎈", url = "https://raw.githubusercontent.com/hgvuyguyg/jjjjjjjjj/main/获得球员"},
        {name = "伐木大亨2", desc = "点击执行", icon = "🌳", url = "https://raw.githubusercontent.com/hgvuyguyg/jjjjjjjjj/main/伐木大亨"},
        {name = "偷一个蛋", desc = "点击执行", icon = "🥚", url = "https://pastefy.app/4lHhgnhn/raw"},
        {name = "变身升级", desc = "点击执行", icon = "🐛", url = "https://raw.githubusercontent.com/hgvuyguyg/jjjjjjjjj/main/变身升级"},
        {name = "加1肌肉破坏墙壁", desc = "点击执行", icon = "💪🏼", url = "https://raw.githubusercontent.com/hgvuyguyg/jjjjjjjjj/main/肌肉墙壁"},
        {name = "加1翅膀偷走脑残", desc = "点击执行", icon = "🍪", url = "https://raw.githubusercontent.com/hgvuyguyg/jjjjjjjjj/main/翅膀脑残"},
        {name = "踢球进太空", desc = "点击执行", icon = "🐃", url = "https://raw.githubusercontent.com/hgvuyguyg/jjjjjjjjj/main/踢球太空"},
        {name = "魔法战利品", desc = "点击执行", icon = "✨", url = "https://raw.githubusercontent.com/hgvuyguyg/jjjjjjjjj/main/魔法战利品"},
        {name = "夜幕降临", desc = "点击执行", icon = "🐼", url = "https://raw.githubusercontent.com/hgvuyguyg/jjjjjjjjj/main/夜幕降临"},
        {name = "我的恐龙生活", desc = "点击执行", icon = "🦖", url = "https://raw.githubusercontent.com/hgvuyguyg/jjjjjjjjj/main/恐龙生活"},
        {name = "加一双跳自行车", desc = "点击执行", icon = "🚲", url = "https://raw.githubusercontent.com/hgvuyguyg/jjjjjjjjj/main/双跳车"},
        {name = "谋杀之岛2", desc = "点击执行", icon = "🌶️", url = "https://raw.githubusercontent.com/hgvuyguyg/jjjjjjjjj/main/谋杀之岛"},
        {name = "声名远播", desc = "点击执行", icon = "🍃", url = "https://raw.githubusercontent.com/hgvuyguyg/jjjjjjjjj/main/抢劫"},
        {name = "加1速度僵尸键盘逃脱", desc = "点击执行", icon = "🐊", url = "https://raw.githubusercontent.com/hgvuyguyg/jjjjjjjjj/main/僵尸键盘"},
        {name = "清理所有树叶", desc = "点击执行", icon = "🍁", url = "https://raw.githubusercontent.com/hgvuyguyg/jjjjjjjjj/main/清理树叶"},
        {name = "开箱asmr", desc = "点击执行", icon = "🍰", url = "https://raw.githubusercontent.com/hgvuyguyg/jjjjjjjjj/main/开箱脆皮"},
        {name = "因为脑残退化而倒下", desc = "点击执行", icon = "🐊", url = "https://raw.githubusercontent.com/hgvuyguyg/jjjjjjjjj/main/脑残倒下"},
        {name = "我的木材农场", desc = "点击执行", icon = "🌲", url = "https://raw.githubusercontent.com/hgvuyguyg/jjjjjjjjj/main/我的木材农场"},
        {name = "加一个后空翻键盘逃脱", desc = "点击执行", icon = "💀", url = "https://raw.githubusercontent.com/hgvuyguyg/jjjjjjjjj/main/后空翻键盘"},
        {name = "每次点击加一排水速度", desc = "点击执行", icon = "💧", url = "https://raw.githubusercontent.com/hgvuyguyg/jjjjjjjjj/main/点击加排水"},
        {name = "加一肌肉进化", desc = "点击执行", icon = "💪🏼", url = "https://raw.githubusercontent.com/hgvuyguyg/jjjjjjjjj/main/加一肌肉精华"},
        {name = "抽取一只军队", desc = "点击执行", icon = "🍼", url = "https://raw.githubusercontent.com/hgvuyguyg/jjjjjjjjj/main/抽军队"},
        {name = "合拼一个核弹", desc = "点击执行", icon = "😺", url = "https://raw.githubusercontent.com/hgvuyguyg/jjjjjjjjj/main/合并核弹"},
        {name = "加一速度进化", desc = "点击执行", icon = "🐒", url = "https://raw.githubusercontent.com/hgvuyguyg/jjjjjjjjj/main/加速度进化"},
        {name = "逃跑者", desc = "点击执行", icon = "👻", url = "https://raw.githubusercontent.com/hgvuyguyg/sbqr/main/淘宝"},
        {name = "击杀头目", desc = "点击执行", icon = "🎅🏿", url = "https://raw.githubusercontent.com/hgvuyguyg/jjjjjjjjj/main/击杀头目"},
        {name = "加一速度沙滩逃脱", desc = "点击执行", icon = "🏖️", url = "https://raw.githubusercontent.com/hgvuyguyg/jjjjjjjjj/main/加一沙滩"},
        {name = "dit", desc = "点击执行", icon = "🦰", url = "https://raw.githubusercontent.com/hgvuyguyg/jjjjjjjjj/main/dit"},
        {name = "正在探矿", desc = "点击执行", icon = "👀", url = "https://raw.githubusercontent.com/hgvuyguyg/jjjjjjjjj/main/正在挖矿"},
        {name = "蝗虫之屋", desc = "点击执行", icon = "🦗", url = "https://raw.githubusercontent.com/hgvuyguyg/jjjjjjjjj/main/蝗虫之王"},
        {name = "加一超级英雄进化", desc = "点击执行", icon = "🐲", url = "https://raw.githubusercontent.com/hgvuyguyg/jjjjjjjjj/main/加油英雄"},
        {name = "拯救猫咪", desc = "点击执行", icon = "🐱", url = "https://raw.githubusercontent.com/hgvuyguyg/jjjjjjjjj/main/拯救猫"},
        {name = "恐怖寿司[第一章]", desc = "点击执行", icon = "😱", url = "https://raw.githubusercontent.com/hgvuyguyg/jjjjjjjjj/main/寿司"},
        {name = "加一蛛丝逃脱", desc = "点击执行", icon = "🕸️", url = "https://raw.githubusercontent.com/hgvuyguyg/jjjjjjjjj/main/加一蜘蛛"},
        {name = "加一跳墙奥比逃脱", desc = "点击执行", icon = "🛫", url = "https://raw.githubusercontent.com/hgvuyguyg/jjjjjjjjj/main/加一跳墙"},
        {name = "按一个键帽", desc = "点击执行", icon = "🍅", url = "https://raw.githubusercontent.com/hgvuyguyg/jjjjjjjjj/main/按键帽"},
        {name = "在51区生存真相", desc = "点击执行", icon = "🤫", url = "https://raw.githubusercontent.com/hgvuyguyg/jjjjjjjjj/main/51真相"},
        {name = "每步减重", desc = "点击执行", icon = "🦵", url = "https://raw.githubusercontent.com/hgvuyguyg/jjjjjjjjj/main/走路减重"},
        {name = "矿井", desc = "点击执行", icon = "🛶", url = "https://raw.githubusercontent.com/hgvuyguyg/jjjjjjjjj/main/矿井"},
        {name = "神秘的杀手", desc = "点击执行", icon = "👹", url = "https://raw.githubusercontent.com/hgvuyguyg/jjjjjjjjj/main/神秘的杀手"},
        {name = "寻找菜鸟并变身", desc = "点击执行", icon = "🍸", url = "https://raw.githubusercontent.com/hgvuyguyg/jjjjjjjjj/main/寻找菜鸟"},
        {name = "加一技能点传奇", desc = "点击执行", icon = "⚔️", url = "https://raw.githubusercontent.com/hgvuyguyg/jjjjjjjjj/main/加一技能点"},
        {name = "加一忍者键盘逃脱", desc = "点击执行", icon = "🌑", url = "https://raw.githubusercontent.com/hgvuyguyg/jjjjjjjjj/main/加一忍者"},
        {name = "破碎之梦", desc = "点击执行", icon = "❤️", url = "https://raw.githubusercontent.com/hgvuyguyg/sbqr/main/破碎"},
        {name = "钓鱼换取垃圾", desc = "点击执行", icon = "🐡", url = "https://raw.githubusercontent.com/hgvuyguyg/jjjjjjjjj/main/钓鱼垃圾"},
        {name = "新手间接式", desc = "点击执行", icon = "🤨", url = "https://raw.githubusercontent.com/hgvuyguyg/jjjjjjjjj/main/新手间接式"},
        {name = "烤或死", desc = "点击执行", icon = "🍖", url = "https://raw.githubusercontent.com/hgvuyguyg/jjjjjjjjj/main/烤活死"},
        {name = "加一跳跃", desc = "点击执行", icon = "🦘", url = "https://raw.githubusercontent.com/hgvuyguyg/jjjjjjjjj/main/加一跳跃逃脱"},
        {name = "挖掘以逃脱", desc = "点击执行", icon = "🎃", url = "https://raw.githubusercontent.com/hgvuyguyg/jjjjjjjjj/main/挖掘逃出监狱"},
        {name = "飞行世界", desc = "点击执行", icon = "✈️", url = "https://raw.githubusercontent.com/hgvuyguyg/jjjjjjjjj/main/飞行世界"},
        {name = "空乘模拟器", desc = "点击执行", icon = "🛫", url = "https://raw.githubusercontent.com/hgvuyguyg/jjjjjjjjj/main/空乘模拟机"},
        {name = "埃尔帕索边境角色扮演", desc = "点击执行", icon = "🤑", url = "https://raw.githubusercontent.com/hgvuyguyg/jjjjjjjjj/main/帕索角色扮演"},
        {name = "加一玩具长臂逃脱", desc = "点击执行", icon = "🤳", url = "https://raw.githubusercontent.com/hgvuyguyg/jjjjjjjjj/main/玩具长臂"},
        {name = "墨水(别催了)", desc = "点击执行", icon = "😢", url = "https://raw.githubusercontent.com/hgvuyguyg/inkgames.github.io/refs/heads/main/ringta.lua"},
        {name = "无尽旅馆", desc = "点击执行", icon = "😎", url = "https://raw.githubusercontent.com/hgvuyguyg/jjjjjjjjj/main/k"},
        {name = "力量传奇", desc = "点击执行", icon = "💪🏼", url = "https://raw.githubusercontent.com/hgvuyguyg/jjjjjjjjj/main/力量"},
        {name = "路线06", desc = "点击执行", icon = "🐍", url = "https://raw.githubusercontent.com/hgvuyguyg/sbqr/main/路线"},
        {name = "军事军队大亨", desc = "点击执行", icon = "🤠", url = "https://raw.githubusercontent.com/hgvuyguyg/sbqr/main/战斗大亨"},
        {name = "偷走巴掌", desc = "点击执行", icon = "🖐🏻️", url = "https://raw.githubusercontent.com/hgvuyguyg/sbqr/main/1巴掌"},
    }
}

pageContents["国内脚本"] = {
    type = "buttons",
    items = {
        {name = "小皮脚本", desc = "拉完了", icon = "🇨🇳", url = "https://raw.githubusercontent.com/xiaopi77/xiaopi77/main/QQ1002100032-Roblox-Pi-script.lua"},
        {name = "黑洞脚本", desc = "BS脚本", icon = "🕳️", url = "https://gitee.com/BS_script/script/raw/master/BS_Script.Luau"},
        {name = "ROB脚本", desc = "ROB.V3", icon = "🤖", url = "https://raw.githubusercontent.com/idrobsc/rob_script/refs/heads/main/rob.v4"},
        {name = "黄某脚本", desc = "拉完了缝合", icon = "😞", url = "https://rawscripts.net/raw/Universal-Script-HMscript-50384"},
        {name = "Loarder脚本", desc = "拉完了", icon = "🤔", url = "https://raw.githubusercontent.com/Jilxi/123/refs/heads/main/Loader.lua"},
    }
}
-- 第8段：收集功能 + 页面生成 + 搜索框

local allFunctionItems = {}
local function collectFunctionItems(pageName, items)
    for _, item in ipairs(items) do
        table.insert(allFunctionItems, {
            page = pageName,
            name = item.name,
            desc = item.desc,
            icon = item.icon,
            type = item.type or "button",
            data = item
        })
    end
end

for pageName, contentData in pairs(pageContents) do
    if contentData.items then
        collectFunctionItems(pageName, contentData.items)
    end
end

for pageName, contentData in pairs(pageContents) do
    if pageName == "设置" then continue end
    local Page = Instance.new("ScrollingFrame")
    Page.Size = UDim2.new(1, 0, 1, 0); Page.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Page.BorderSizePixel = 0; Page.ScrollBarThickness = 4; Page.ScrollBarImageColor3 = Color3.fromRGB(180, 180, 180)
    Page.CanvasSize = UDim2.new(0, 0, 0, 0); Page.AutomaticCanvasSize = Enum.AutomaticSize.Y
    Page.Visible = false; Page.ZIndex = 7; Page.Parent = ContentArea
    local PageList = Instance.new("UIListLayout"); PageList.Padding = UDim.new(0, 6); PageList.Parent = Page
    local TopSpacer = Instance.new("Frame")
    TopSpacer.Size = UDim2.new(1, 0, 0, 6); TopSpacer.BackgroundTransparency = 1; TopSpacer.Parent = Page

    if pageName == "公告" then
        local searchFrame = Instance.new("Frame")
        searchFrame.Size = UDim2.new(1, -16, 0, 36)
        searchFrame.Position = UDim2.new(0, 8, 0, 6)
        searchFrame.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
        searchFrame.BorderSizePixel = 0
        searchFrame.ZIndex = 8
        searchFrame.Parent = Page
        local searchCorner = Instance.new("UICorner")
        searchCorner.CornerRadius = UDim.new(0, 8)
        searchCorner.Parent = searchFrame

        local searchIcon = Instance.new("TextLabel")
        searchIcon.Size = UDim2.new(0, 30, 1, 0)
        searchIcon.Text = "🔍"
        searchIcon.TextSize = 14
        searchIcon.BackgroundTransparency = 1
        searchIcon.ZIndex = 9
        searchIcon.Parent = searchFrame

        local searchBox = Instance.new("TextBox")
        searchBox.Size = UDim2.new(1, -34, 1, 0)
        searchBox.Position = UDim2.new(0, 34, 0, 0)
        searchBox.PlaceholderText = "搜索功能... (按空格搜索)"
        searchBox.Text = ""
        searchBox.TextColor3 = Color3.fromRGB(50, 50, 50)
        searchBox.Font = Enum.Font.Gotham
        searchBox.TextSize = 13
        searchBox.BackgroundTransparency = 1
        searchBox.ZIndex = 9
        searchBox.Parent = searchFrame

        announcementTextBox = Instance.new("TextLabel")
        announcementTextBox.Size = UDim2.new(1, -20, 0, 440)
        announcementTextBox.Position = UDim2.new(0, 10, 0, 48)
        announcementTextBox.TextColor3 = Color3.fromRGB(70, 70, 70)
        announcementTextBox.Font = Enum.Font.Gotham
        announcementTextBox.TextSize = 11
        announcementTextBox.BackgroundTransparency = 1
        announcementTextBox.TextXAlignment = Enum.TextXAlignment.Left
        announcementTextBox.TextYAlignment = Enum.TextYAlignment.Top
        announcementTextBox.TextWrapped = true
        announcementTextBox.LineHeight = 1.5
        announcementTextBox.ZIndex = 8
        announcementTextBox.Parent = Page
        updateTime()

        local searchResultContainer = Instance.new("ScrollingFrame")
        searchResultContainer.Size = UDim2.new(1, -16, 0, 0)
        searchResultContainer.Position = UDim2.new(0, 8, 0, 48)
        searchResultContainer.BackgroundTransparency = 1
        searchResultContainer.BorderSizePixel = 0
        searchResultContainer.ScrollBarThickness = 3
        searchResultContainer.CanvasSize = UDim2.new(0, 0, 0, 0)
        searchResultContainer.AutomaticCanvasSize = Enum.AutomaticSize.Y
        searchResultContainer.Visible = false
        searchResultContainer.ZIndex = 8
        searchResultContainer.Parent = Page

        local resultLayout = Instance.new("UIListLayout")
        resultLayout.Padding = UDim.new(0, 4)
        resultLayout.Parent = searchResultContainer

        local function doSearch(query)
            for _, child in ipairs(searchResultContainer:GetChildren()) do
                if child ~= resultLayout then child:Destroy() end
            end
            if query == "" or #query < 1 then
                searchResultContainer.Visible = false
                searchResultContainer.Size = UDim2.new(1, -16, 0, 0)
                announcementTextBox.Visible = true
                return
            end
            announcementTextBox.Visible = false
            searchResultContainer.Visible = true

            local results = {}
            local lowerQuery = query:lower()
            for _, item in ipairs(allFunctionItems) do
                if item.name:lower():find(lowerQuery) or (item.desc and item.desc:lower():find(lowerQuery)) then
                    table.insert(results, item)
                end
            end

            if #results == 0 then
                local noResult = Instance.new("TextLabel")
                noResult.Size = UDim2.new(1, 0, 0, 40)
                noResult.Text = "❌ 没有找到匹配的功能"
                noResult.TextColor3 = Color3.fromRGB(150, 150, 150)
                noResult.Font = Enum.Font.Gotham
                noResult.TextSize = 14
                noResult.BackgroundTransparency = 1
                noResult.ZIndex = 9
                noResult.Parent = searchResultContainer
                searchResultContainer.Size = UDim2.new(1, -16, 0, 40)
                return
            end

            searchResultContainer.Size = UDim2.new(1, -16, 0, math.min(#results * 48 + 10, 300))

            for _, item in ipairs(results) do
                local resultCard = Instance.new("Frame")
                resultCard.Size = UDim2.new(1, 0, 0, 44)
                resultCard.BackgroundColor3 = Color3.fromRGB(250, 250, 250)
                resultCard.BorderSizePixel = 0
                resultCard.ZIndex = 9
                resultCard.Parent = searchResultContainer
                local resultCorner = Instance.new("UICorner")
                resultCorner.CornerRadius = UDim.new(0, 8)
                resultCorner.Parent = resultCard
                local stroke = Instance.new("UIStroke")
                stroke.Color = Color3.fromRGB(220, 220, 220)
                stroke.Thickness = 1
                stroke.Parent = resultCard

                local iconLbl = Instance.new("TextLabel")
                iconLbl.Size = UDim2.new(0, 30, 1, 0)
                iconLbl.Text = item.icon
                iconLbl.TextSize = 14
                iconLbl.BackgroundTransparency = 1
                iconLbl.ZIndex = 10
                iconLbl.Parent = resultCard

                local nameLbl = Instance.new("TextLabel")
                nameLbl.Size = UDim2.new(0, 180, 0, 16)
                nameLbl.Position = UDim2.new(0, 34, 0, 4)
                nameLbl.Text = item.name
                nameLbl.TextColor3 = Color3.fromRGB(50, 50, 50)
                nameLbl.Font = Enum.Font.GothamBold
                nameLbl.TextSize = 12
                nameLbl.BackgroundTransparency = 1
                nameLbl.TextXAlignment = Enum.TextXAlignment.Left
                nameLbl.ZIndex = 10
                nameLbl.Parent = resultCard

                local pageLbl = Instance.new("TextLabel")
                pageLbl.Size = UDim2.new(0, 100, 0, 14)
                pageLbl.Position = UDim2.new(0, 34, 0, 22)
                pageLbl.Text = "📁 " .. item.page .. " | " .. (item.desc or "")
                pageLbl.TextColor3 = Color3.fromRGB(150, 150, 150)
                pageLbl.Font = Enum.Font.Gotham
                pageLbl.TextSize = 10
                pageLbl.BackgroundTransparency = 1
                pageLbl.TextXAlignment = Enum.TextXAlignment.Left
                pageLbl.ZIndex = 10
                pageLbl.Parent = resultCard

                if item.type == "button" then
                    local goBtn = Instance.new("TextButton")
                    goBtn.Size = UDim2.new(0, 50, 0, 22)
                    goBtn.Position = UDim2.new(1, -56, 0, 11)
                    goBtn.Text = "执行"
                    goBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
                    goBtn.Font = Enum.Font.GothamBold
                    goBtn.TextSize = 10
                    goBtn.BackgroundColor3 = Color3.fromRGB(255, 140, 0)
                    goBtn.BorderSizePixel = 0
                    goBtn.ZIndex = 10
                    goBtn.AutoButtonColor = false
                    goBtn.Parent = resultCard
                    local goCorner = Instance.new("UICorner")
                    goCorner.CornerRadius = UDim.new(0, 5)
                    goCorner.Parent = goBtn
                    goBtn.MouseButton1Click:Connect(function()
                        goBtn.BackgroundColor3 = Color3.fromRGB(76, 175, 80)
                        if item.data.url == "teleport" or item.data.url == "follow" then
                            for _, nav in ipairs(navButtons) do
                                if nav.name == item.page then selectNav(nav.button, item.page) break end
                            end
                        elseif item.data.url == "home" then
                            if homePosition then
                                local c = Players.LocalPlayer.Character
                                if c and c:FindFirstChild("HumanoidRootPart") then c.HumanoidRootPart.CFrame = homePosition end
                            end
                        else
                            task.spawn(function() pcall(function() loadstring(game:HttpGet(item.data.url))() end) end)
                        end
                        wait(0.3)
                        goBtn.BackgroundColor3 = Color3.fromRGB(255, 140, 0)
                    end)

                elseif item.type == "toggle" then
                    local toggleBtn = Instance.new("TextButton")
                    toggleBtn.Size = UDim2.new(0, 36, 0, 20)
                    toggleBtn.Position = UDim2.new(1, -42, 0, 12)
                    toggleBtn.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
                    toggleBtn.Text = ""
                    toggleBtn.BorderSizePixel = 0
                    toggleBtn.ZIndex = 10
                    toggleBtn.AutoButtonColor = false
                    toggleBtn.Parent = resultCard
                    local tgCorner = Instance.new("UICorner")
                    tgCorner.CornerRadius = UDim.new(1, 0)
                    tgCorner.Parent = toggleBtn
                    local knob = Instance.new("Frame")
                    knob.Size = UDim2.new(0, 16, 0, 16)
                    knob.Position = UDim2.new(0, 2, 0, 2)
                    knob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    knob.BorderSizePixel = 0
                    knob.ZIndex = 11
                    knob.Parent = toggleBtn
                    local knCorner = Instance.new("UICorner")
                    knCorner.CornerRadius = UDim.new(1, 0)
                    knCorner.Parent = knob
                    local tgState = false
                    toggleBtn.MouseButton1Click:Connect(function()
                        tgState = not tgState
                        toggleBtn.BackgroundColor3 = tgState and Color3.fromRGB(255, 140, 0) or Color3.fromRGB(200, 200, 200)
                        knob:TweenPosition(tgState and UDim2.new(1, -18, 0, 2) or UDim2.new(0, 2, 0, 2), "Out", "Quad", 0.15)
                        if tgState then
                            local code = item.data.code
                            if code == "god" then
                                local c = Players.LocalPlayer.Character
                                if c and c:FindFirstChild("Humanoid") then c.Humanoid.MaxHealth = 99999; c.Humanoid.Health = 99999 end
                            elseif code == "superspeed" then
                                local c = Players.LocalPlayer.Character
                                if c and c:FindFirstChild("Humanoid") then c.Humanoid.WalkSpeed = 1000 end
                            elseif code == "fulllight" then
                                Lighting.Brightness = 5; Lighting.ClockTime = 14; Lighting.FogEnd = 100000
                            elseif code == "clearfog" then
                                Lighting.FogEnd = 100000; Lighting.FogStart = 50000
                            else
                                for _, nav in ipairs(navButtons) do
                                    if nav.name == item.page then selectNav(nav.button, item.page) break end
                                end
                            end
                        end
                    end)

                elseif item.type == "input" then
                    local inputBox = Instance.new("Frame")
                    inputBox.Size = UDim2.new(0, 55, 0, 20)
                    inputBox.Position = UDim2.new(1, -128, 0, 12)
                    inputBox.BackgroundColor3 = Color3.fromRGB(235, 235, 235)
                    inputBox.BorderSizePixel = 0
                    inputBox.ZIndex = 10
                    inputBox.Parent = resultCard
                    local ibCorner = Instance.new("UICorner")
                    ibCorner.CornerRadius = UDim.new(0, 5)
                    ibCorner.Parent = inputBox
                    local inputField = Instance.new("TextBox")
                    inputField.Size = UDim2.new(1, -6, 1, 0)
                    inputField.Position = UDim2.new(0, 3, 0, 0)
                    inputField.Text = item.data.default or ""
                    inputField.TextColor3 = Color3.fromRGB(50, 50, 50)
                    inputField.Font = Enum.Font.Gotham
                    inputField.TextSize = 11
                    inputField.BackgroundTransparency = 1
                    inputField.ZIndex = 11
                    inputField.Parent = inputBox
                    local execBtn = Instance.new("TextButton")
                    execBtn.Size = UDim2.new(0, 40, 0, 20)
                    execBtn.Position = UDim2.new(1, -46, 0, 12)
                    execBtn.Text = "设置"
                    execBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
                    execBtn.Font = Enum.Font.GothamBold
                    execBtn.TextSize = 10
                    execBtn.BackgroundColor3 = Color3.fromRGB(255, 140, 0)
                    execBtn.BorderSizePixel = 0
                    execBtn.ZIndex = 10
                    execBtn.AutoButtonColor = false
                    execBtn.Parent = resultCard
                    local ebCorner = Instance.new("UICorner")
                    ebCorner.CornerRadius = UDim.new(0, 5)
                    ebCorner.Parent = execBtn
                    execBtn.MouseButton1Click:Connect(function()
                        local value = tonumber(inputField.Text)
                        if value and item.data.execute then
                            local success = item.data.execute(value)
                            execBtn.BackgroundColor3 = success and Color3.fromRGB(76, 175, 80) or Color3.fromRGB(244, 67, 54)
                        else
                            execBtn.BackgroundColor3 = Color3.fromRGB(244, 67, 54)
                        end
                        wait(0.3)
                        execBtn.BackgroundColor3 = Color3.fromRGB(255, 140, 0)
                    end)

                elseif item.type == "music" then
                    local playBtn = Instance.new("TextButton")
                    playBtn.Size = UDim2.new(0, 50, 0, 22)
                    playBtn.Position = UDim2.new(1, -56, 0, 11)
                    playBtn.Text = "播放"
                    playBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
                    playBtn.Font = Enum.Font.GothamBold
                    playBtn.TextSize = 10
                    playBtn.BackgroundColor3 = Color3.fromRGB(255, 140, 0)
                    playBtn.BorderSizePixel = 0
                    playBtn.ZIndex = 10
                    playBtn.AutoButtonColor = false
                    playBtn.Parent = resultCard
                    local pbCorner = Instance.new("UICorner")
                    pbCorner.CornerRadius = UDim.new(0, 5)
                    pbCorner.Parent = playBtn
                    local sound = nil
                    local isPlaying = false
                    playBtn.MouseButton1Click:Connect(function()
                        if isPlaying then
                            if sound then sound:Stop(); sound:Destroy(); sound = nil end
                            isPlaying = false
                            playBtn.Text = "播放"
                            playBtn.BackgroundColor3 = Color3.fromRGB(255, 140, 0)
                        else
                            sound = Instance.new("Sound")
                            sound.SoundId = "rbxassetid://" .. (item.data.soundId or "")
                            sound.Volume = 1
                            sound.Parent = workspace
                            sound:Play()
                            sound.Ended:Connect(function()
                                if sound then sound:Destroy() end
                                sound = nil
                                isPlaying = false
                                playBtn.Text = "播放"
                                playBtn.BackgroundColor3 = Color3.fromRGB(255, 140, 0)
                            end)
                            isPlaying = true
                            playBtn.Text = "停止"
                            playBtn.BackgroundColor3 = Color3.fromRGB(244, 67, 54)
                        end
                    end)
                end
            end
        end

        searchBox.FocusLost:Connect(function(enterPressed)
            if enterPressed then doSearch(searchBox.Text) end
        end)

        UserInputService.InputBegan:Connect(function(input, gp)
            if gp then return end
            if input.KeyCode == Enum.KeyCode.Space and searchBox:IsFocused() then
                doSearch(searchBox.Text)
            end
        end)

    elseif contentData.type == "toggles" then
        for _, item in ipairs(contentData.items) do
            if item.type == "button" then createButtonCard(Page, item.name, item.desc, item.icon, item.url)
            elseif item.type == "toggle" then createFeatureToggle(Page, item.name, item.desc, item.icon, item.code)
            elseif item.type == "input" then createInputCard(Page, item.name, item.desc, item.icon, item.default, item.execute) end
        end
    elseif contentData.type == "buttons" then
        for _, item in ipairs(contentData.items) do
            createButtonCard(Page, item.name, item.desc, item.icon, item.url)
        end
    elseif contentData.type == "music" then
        for _, item in ipairs(contentData.items) do
            createMusicCard(Page, item.name, item.desc, item.icon, item.soundId)
        end
    end
    contentPages[pageName] = Page
end
-- 第9段：设置页

local settingsPage = Instance.new("ScrollingFrame")
settingsPage.Size = UDim2.new(1, 0, 1, 0); settingsPage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
settingsPage.BorderSizePixel = 0; settingsPage.ScrollBarThickness = 4; settingsPage.ScrollBarImageColor3 = Color3.fromRGB(200, 200, 200)
settingsPage.CanvasSize = UDim2.new(0, 0, 0, 0); settingsPage.AutomaticCanvasSize = Enum.AutomaticSize.Y
settingsPage.Visible = false; settingsPage.ZIndex = 7; settingsPage.Parent = ContentArea
local settingsList = Instance.new("UIListLayout"); settingsList.Padding = UDim.new(0, 6); settingsList.Parent = settingsPage
local settingsSpacer = Instance.new("Frame"); settingsSpacer.Size = UDim2.new(1, 0, 0, 6); settingsSpacer.BackgroundTransparency = 1; settingsSpacer.Parent = settingsPage
contentPages["设置"] = settingsPage

local settingsItems = {
    {type = "color", name = "边框颜色", desc = "切换面板边框颜色（含彩虹）", icon = "🎨", colors = {"金色", "红色", "蓝色", "绿色", "紫色", "粉色", "青色", "白色", "彩虹色"}},
    {type = "size", name = "面板比例", desc = "切换平板/手机尺寸", icon = "📱", modes = {"平板", "手机"}},
    {type = "toggle", name = "透视作者", desc = "开启或关闭作者ESP", icon = "👑", code = "authoresp"},
}

local function createSettingsCard(parent, item)
    local Card = Instance.new("Frame")
    Card.Size = UDim2.new(1, -16, 0, 46); Card.Position = UDim2.new(0, 8, 0, 0)
    Card.BackgroundColor3 = Color3.fromRGB(252, 252, 252); Card.BorderSizePixel = 0; Card.ZIndex = 7; Card.Parent = parent
    local CardCorner = Instance.new("UICorner"); CardCorner.CornerRadius = UDim.new(0, 10); CardCorner.Parent = Card
    local CardStroke = Instance.new("UIStroke"); CardStroke.Color = Color3.fromRGB(230, 230, 230); CardStroke.Thickness = 1; CardStroke.Parent = Card
    
    local IconFrame = Instance.new("Frame")
    IconFrame.Size = UDim2.new(0, 26, 0, 26); IconFrame.Position = UDim2.new(0, 10, 0, 10)
    IconFrame.BackgroundColor3 = Color3.fromRGB(240, 240, 240); IconFrame.BorderSizePixel = 0; IconFrame.ZIndex = 8; IconFrame.Parent = Card
    local IconCorner = Instance.new("UICorner"); IconCorner.CornerRadius = UDim.new(0, 6); IconCorner.Parent = IconFrame
    local IconText = Instance.new("TextLabel")
    IconText.Size = UDim2.new(1, 0, 1, 0); IconText.Text = item.icon; IconText.TextSize = 11
    IconText.BackgroundTransparency = 1; IconText.ZIndex = 9; IconText.Parent = IconFrame
    
    local TitleText = Instance.new("TextLabel")
    TitleText.Size = UDim2.new(0, 160, 0, 15); TitleText.Position = UDim2.new(0, 44, 0, 5)
    TitleText.Text = item.name; TitleText.TextColor3 = Color3.fromRGB(50, 50, 50)
    TitleText.Font = Enum.Font.GothamSemibold; TitleText.TextSize = 11
    TitleText.BackgroundTransparency = 1; TitleText.TextXAlignment = Enum.TextXAlignment.Left; TitleText.ZIndex = 8; TitleText.Parent = Card
    
    local DescText = Instance.new("TextLabel")
    DescText.Size = UDim2.new(1, -140, 0, 13); DescText.Position = UDim2.new(0, 44, 0, 22)
    DescText.Text = item.desc; DescText.TextColor3 = Color3.fromRGB(130, 130, 130)
    DescText.Font = Enum.Font.Gotham; DescText.TextSize = 9; DescText.BackgroundTransparency = 1
    DescText.TextXAlignment = Enum.TextXAlignment.Left; DescText.ZIndex = 8; DescText.Parent = Card
    
    if item.type == "color" then
        local btnGroup = Instance.new("Frame")
        btnGroup.Size = UDim2.new(0, 170, 0, 26)
        btnGroup.Position = UDim2.new(1, -180, 0, 10)
        btnGroup.BackgroundTransparency = 1
        btnGroup.ZIndex = 9
        btnGroup.Parent = Card
        
        local colorBtns = {}
        for i, colorName in ipairs(item.colors) do
            local colorBtn = Instance.new("TextButton")
            colorBtn.Size = UDim2.new(0, 26, 0, 26)
            colorBtn.Position = UDim2.new(0, (i-1) * 28, 0, 0)
            if colorName == "彩虹色" then
                colorBtn.BackgroundColor3 = Color3.fromRGB(200, 100, 255)
                local rainbowOverlay = Instance.new("TextLabel")
                rainbowOverlay.Size = UDim2.new(1, 0, 1, 0)
                rainbowOverlay.Text = "🌈"
                rainbowOverlay.TextSize = 14
                rainbowOverlay.BackgroundTransparency = 1
                rainbowOverlay.ZIndex = 11
                rainbowOverlay.Parent = colorBtn
            else
                colorBtn.BackgroundColor3 = borderColors[colorName]
            end
            colorBtn.BorderSizePixel = 1
            colorBtn.BorderColor3 = (colorName == currentBorderColor or (colorName == "彩虹色" and isRainbowBorder)) and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(200, 200, 200)
            colorBtn.Text = ""
            colorBtn.ZIndex = 10
            colorBtn.AutoButtonColor = false
            colorBtn.Parent = btnGroup
            local corner = Instance.new("UICorner"); corner.CornerRadius = UDim.new(1, 0); corner.Parent = colorBtn
            
            colorBtn.MouseButton1Click:Connect(function()
                setBorderColor(colorName)
                for _, btn in ipairs(colorBtns) do
                    btn.BorderColor3 = Color3.fromRGB(200, 200, 200)
                end
                colorBtn.BorderColor3 = Color3.fromRGB(255, 255, 255)
            end)
            table.insert(colorBtns, colorBtn)
        end
        
    elseif item.type == "size" then
        local sizeGroup = Instance.new("Frame")
        sizeGroup.Size = UDim2.new(0, 120, 0, 26)
        sizeGroup.Position = UDim2.new(1, -130, 0, 10)
        sizeGroup.BackgroundTransparency = 1
        sizeGroup.ZIndex = 9
        sizeGroup.Parent = Card
        
        for i, mode in ipairs(item.modes) do
            local modeBtn = Instance.new("TextButton")
            modeBtn.Size = UDim2.new(0, 56, 0, 26)
            modeBtn.Position = UDim2.new(0, (i-1) * 60, 0, 0)
            modeBtn.Text = mode
            modeBtn.TextColor3 = mode == panelMode and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(80, 80, 80)
            modeBtn.Font = Enum.Font.GothamBold
            modeBtn.TextSize = 10
            modeBtn.BackgroundColor3 = mode == panelMode and Color3.fromRGB(255, 140, 0) or Color3.fromRGB(230, 230, 230)
            modeBtn.BorderSizePixel = 0
            modeBtn.ZIndex = 10
            modeBtn.AutoButtonColor = false
            modeBtn.Parent = sizeGroup
            local corner = Instance.new("UICorner"); corner.CornerRadius = UDim.new(0, 4); corner.Parent = modeBtn
            
            modeBtn.MouseButton1Click:Connect(function()
                panelMode = mode
                applyPanelSize()
                for _, child in ipairs(sizeGroup:GetChildren()) do
                    if child:IsA("TextButton") then
                        child.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
                        child.TextColor3 = Color3.fromRGB(80, 80, 80)
                    end
                end
                modeBtn.BackgroundColor3 = Color3.fromRGB(255, 140, 0)
                modeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
            end)
        end
        
    elseif item.type == "toggle" then
        local isOn = false
        if item.code == "authoresp" then isOn = authorEspEnabled end
        
        local Toggle = Instance.new("TextButton")
        Toggle.Size = UDim2.new(0, 36, 0, 20); Toggle.Position = UDim2.new(1, -46, 0, 13)
        Toggle.BackgroundColor3 = isOn and Color3.fromRGB(255, 140, 0) or Color3.fromRGB(200, 200, 200)
        Toggle.Text = ""; Toggle.BorderSizePixel = 0; Toggle.ZIndex = 8; Toggle.AutoButtonColor = false; Toggle.Parent = Card
        local ToggleCorner = Instance.new("UICorner"); ToggleCorner.CornerRadius = UDim.new(1, 0); ToggleCorner.Parent = Toggle
        local ToggleKnob = Instance.new("Frame")
        ToggleKnob.Size = UDim2.new(0, 16, 0, 16)
        ToggleKnob.Position = isOn and UDim2.new(1, -18, 0, 2) or UDim2.new(0, 2, 0, 2)
        ToggleKnob.BackgroundColor3 = Color3.fromRGB(255, 255, 255); ToggleKnob.BorderSizePixel = 0; ToggleKnob.ZIndex = 9; ToggleKnob.Parent = Toggle
        local KnobCorner = Instance.new("UICorner"); KnobCorner.CornerRadius = UDim.new(1, 0); KnobCorner.Parent = ToggleKnob
        
        Toggle.MouseButton1Click:Connect(function()
            if item.code == "authoresp" and isOn == true then
                local confirmGui = Instance.new("ScreenGui")
                confirmGui.Parent = PlayerGui
                local bg = Instance.new("Frame")
                bg.Size = UDim2.new(1, 0, 1, 0)
                bg.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                bg.BackgroundTransparency = 0.5
                bg.ZIndex = 999
                bg.Parent = confirmGui
                local popup = Instance.new("Frame")
                popup.Size = UDim2.new(0, 320, 0, 180)
                popup.Position = UDim2.new(0.5, -160, 0.5, -90)
                popup.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                popup.BorderSizePixel = 0
                popup.ZIndex = 1000
                popup.Parent = confirmGui
                local popupCorner = Instance.new("UICorner"); popupCorner.CornerRadius = UDim.new(0, 12); popupCorner.Parent = popup
                local title = Instance.new("TextLabel")
                title.Size = UDim2.new(1, 0, 0, 40); title.Position = UDim2.new(0, 0, 0, 10)
                title.Text = "确认关闭"; title.TextColor3 = Color3.fromRGB(255, 255, 255)
                title.Font = Enum.Font.GothamBold; title.TextSize = 18; title.BackgroundTransparency = 1
                title.ZIndex = 1001; title.Parent = popup
                local desc = Instance.new("TextLabel")
                desc.Size = UDim2.new(1, -20, 0, 40); desc.Position = UDim2.new(0, 10, 0, 50)
                desc.Text = "二次验证：请输入数字 1 或 2"
                desc.TextColor3 = Color3.fromRGB(200, 200, 200)
                desc.Font = Enum.Font.Gotham; desc.TextSize = 14; desc.BackgroundTransparency = 1
                desc.ZIndex = 1001; desc.Parent = popup
                local btn1 = Instance.new("TextButton")
                btn1.Size = UDim2.new(0, 80, 0, 40); btn1.Position = UDim2.new(0.5, -90, 0, 110)
                btn1.Text = "1"; btn1.TextColor3 = Color3.fromRGB(255, 255, 255)
                btn1.Font = Enum.Font.GothamBold; btn1.TextSize = 20; btn1.BackgroundColor3 = Color3.fromRGB(255, 140, 0)
                btn1.BorderSizePixel = 0; btn1.ZIndex = 1001; btn1.AutoButtonColor = false; btn1.Parent = popup
                local btn1Corner = Instance.new("UICorner"); btn1Corner.CornerRadius = UDim.new(0, 8); btn1Corner.Parent = btn1
                local btn2 = Instance.new("TextButton")
                btn2.Size = UDim2.new(0, 80, 0, 40); btn2.Position = UDim2.new(0.5, 10, 0, 110)
                btn2.Text = "2"; btn2.TextColor3 = Color3.fromRGB(255, 255, 255)
                btn2.Font = Enum.Font.GothamBold; btn2.TextSize = 20; btn2.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
                btn2.BorderSizePixel = 0; btn2.ZIndex = 1001; btn2.AutoButtonColor = false; btn2.Parent = popup
                local btn2Corner = Instance.new("UICorner"); btn2Corner.CornerRadius = UDim.new(0, 8); btn2Corner.Parent = btn2
                local resultLabel = Instance.new("TextLabel")
                resultLabel.Size = UDim2.new(1, -20, 0, 30); resultLabel.Position = UDim2.new(0, 10, 0, 155)
                resultLabel.Text = ""; resultLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
                resultLabel.Font = Enum.Font.Gotham; resultLabel.TextSize = 12; resultLabel.BackgroundTransparency = 1
                resultLabel.ZIndex = 1001; resultLabel.Parent = popup
                btn1.MouseButton1Click:Connect(function()
                    resultLabel.Text = "验证成功，已关闭透视作者"
                    resultLabel.TextColor3 = Color3.fromRGB(100, 255, 100)
                    isOn = false
                    Toggle.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
                    ToggleKnob:TweenPosition(UDim2.new(0, 2, 0, 2), "Out", "Quad", 0.15)
                    disableAuthorESP()
                    wait(0.8)
                    confirmGui:Destroy()
                end)
                btn2.MouseButton1Click:Connect(function()
                    resultLabel.Text = "验证失败，关闭此功能失败"
                    resultLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
                    wait(0.8)
                    confirmGui:Destroy()
                end)
                return
            end
            if item.code == "authoresp" then
                isOn = not isOn
                Toggle.BackgroundColor3 = isOn and Color3.fromRGB(255, 140, 0) or Color3.fromRGB(200, 200, 200)
                ToggleKnob:TweenPosition(isOn and UDim2.new(1, -18, 0, 2) or UDim2.new(0, 2, 0, 2), "Out", "Quad", 0.15)
                if isOn then enableAuthorESP() else disableAuthorESP() end
            end
        end)
    end
end

for _, item in ipairs(settingsItems) do
    createSettingsCard(settingsPage, item)
end
-- 第10段：删除脚本按钮 + 初始化

CloseButton.MouseButton1Click:Connect(function()
    local confirmGui = Instance.new("ScreenGui")
    confirmGui.Parent = PlayerGui
    local bg = Instance.new("Frame")
    bg.Size = UDim2.new(1, 0, 1, 0)
    bg.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    bg.BackgroundTransparency = 0.5
    bg.ZIndex = 999
    bg.Parent = confirmGui
    
    local popup = Instance.new("Frame")
    popup.Size = UDim2.new(0, 320, 0, 180)
    popup.Position = UDim2.new(0.5, -160, 0.5, -90)
    popup.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    popup.BorderSizePixel = 0
    popup.ZIndex = 1000
    popup.Parent = confirmGui
    local popupCorner = Instance.new("UICorner"); popupCorner.CornerRadius = UDim.new(0, 12); popupCorner.Parent = popup
    
    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 40); title.Position = UDim2.new(0, 0, 0, 10)
    title.Text = "确认删除脚本"; title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.Font = Enum.Font.GothamBold; title.TextSize = 18; title.BackgroundTransparency = 1
    title.ZIndex = 1001; title.Parent = popup
    
    local desc = Instance.new("TextLabel")
    desc.Size = UDim2.new(1, -20, 0, 40); desc.Position = UDim2.new(0, 10, 0, 50)
    desc.Text = "确定要删除黑脚本吗？"
    desc.TextColor3 = Color3.fromRGB(200, 200, 200)
    desc.Font = Enum.Font.Gotham; desc.TextSize = 14; desc.BackgroundTransparency = 1
    desc.ZIndex = 1001; desc.Parent = popup
    
    local btn1 = Instance.new("TextButton")
    btn1.Size = UDim2.new(0, 80, 0, 40); btn1.Position = UDim2.new(0.5, -90, 0, 110)
    btn1.Text = "确定"; btn1.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn1.Font = Enum.Font.GothamBold; btn1.TextSize = 14; btn1.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
    btn1.BorderSizePixel = 0; btn1.ZIndex = 1001; btn1.AutoButtonColor = false; btn1.Parent = popup
    local btn1Corner = Instance.new("UICorner"); btn1Corner.CornerRadius = UDim.new(0, 8); btn1Corner.Parent = btn1
    
    local btn2 = Instance.new("TextButton")
    btn2.Size = UDim2.new(0, 80, 0, 40); btn2.Position = UDim2.new(0.5, 10, 0, 110)
    btn2.Text = "取消"; btn2.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn2.Font = Enum.Font.GothamBold; btn2.TextSize = 14; btn2.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
    btn2.BorderSizePixel = 0; btn2.ZIndex = 1001; btn2.AutoButtonColor = false; btn2.Parent = popup
    local btn2Corner = Instance.new("UICorner"); btn2Corner.CornerRadius = UDim.new(0, 8); btn2Corner.Parent = btn2
    
    local resultLabel = Instance.new("TextLabel")
    resultLabel.Size = UDim2.new(1, -20, 0, 30); resultLabel.Position = UDim2.new(0, 10, 0, 155)
    resultLabel.Text = ""; resultLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
    resultLabel.Font = Enum.Font.Gotham; resultLabel.TextSize = 12; resultLabel.BackgroundTransparency = 1
    resultLabel.ZIndex = 1001; resultLabel.Parent = popup
    
    btn2.MouseButton1Click:Connect(function()
        confirmGui:Destroy()
    end)
    
    btn1.MouseButton1Click:Connect(function()
        resultLabel.Text = ""
        local step2 = Instance.new("TextLabel")
        step2.Size = UDim2.new(1, -20, 0, 30); step2.Position = UDim2.new(0, 10, 0, 50)
        step2.Text = "二次验证：请输入 1 或 2"
        step2.TextColor3 = Color3.fromRGB(200, 200, 200)
        step2.Font = Enum.Font.Gotham; step2.TextSize = 14; step2.BackgroundTransparency = 1
        step2.ZIndex = 1001; step2.Parent = popup
        desc.Visible = false
        
        local vbtn1 = Instance.new("TextButton")
        vbtn1.Size = UDim2.new(0, 80, 0, 40); vbtn1.Position = UDim2.new(0.5, -90, 0, 110)
        vbtn1.Text = "1"; vbtn1.TextColor3 = Color3.fromRGB(255, 255, 255)
        vbtn1.Font = Enum.Font.GothamBold; vbtn1.TextSize = 20; vbtn1.BackgroundColor3 = Color3.fromRGB(255, 140, 0)
        vbtn1.BorderSizePixel = 0; vbtn1.ZIndex = 1001; vbtn1.AutoButtonColor = false; vbtn1.Parent = popup
        local vbtn1Corner = Instance.new("UICorner"); vbtn1Corner.CornerRadius = UDim.new(0, 8); vbtn1Corner.Parent = vbtn1
        
        local vbtn2 = Instance.new("TextButton")
        vbtn2.Size = UDim2.new(0, 80, 0, 40); vbtn2.Position = UDim2.new(0.5, 10, 0, 110)
        vbtn2.Text = "2"; vbtn2.TextColor3 = Color3.fromRGB(255, 255, 255)
        vbtn2.Font = Enum.Font.GothamBold; vbtn2.TextSize = 20; vbtn2.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
        vbtn2.BorderSizePixel = 0; vbtn2.ZIndex = 1001; vbtn2.AutoButtonColor = false; vbtn2.Parent = popup
        local vbtn2Corner = Instance.new("UICorner"); vbtn2Corner.CornerRadius = UDim.new(0, 8); vbtn2Corner.Parent = vbtn2
        
        btn1.Visible = false
        btn2.Visible = false
        
        vbtn1.MouseButton1Click:Connect(function()
            resultLabel.Text = "验证失败，无法删除脚本"
            resultLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
            wait(0.8)
            confirmGui:Destroy()
        end)
        
        vbtn2.MouseButton1Click:Connect(function()
            confirmGui:Destroy()
            if ScreenGui then ScreenGui:Destroy() end
        end)
    end)
end)

contentPages["公告"].Visible = true
selectNav(navButtons[1].button, "公告")

print("黑脚本·管理员版 V2.0 已加载完成")
