-- TANTUNI Ultimate Modern Dashboard (Normal Fly & No Notification)
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local MarketplaceService = game:GetService("MarketplaceService")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

if CoreGui:FindFirstChild("TantuniLoader") then CoreGui.TantuniLoader:Destroy() end
if CoreGui:FindFirstChild("TantuniMenu") then CoreGui.TantuniMenu:Destroy() end

local function tween(object, info, goals)
    local t = TweenService:Create(object, TweenInfo.new(unpack(info)), goals)
    t:Play()
    return t
end

-- 1. LOADER
local LoaderGui = Instance.new("ScreenGui")
LoaderGui.Name = "TantuniLoader"
LoaderGui.Parent = CoreGui

local LoaderFrame = Instance.new("Frame")
LoaderFrame.Size = UDim2.new(0, 420, 0, 160)
LoaderFrame.Position = UDim2.new(0.5, -210, 0.5, -80)
LoaderFrame.BackgroundColor3 = Color3.fromRGB(20, 12, 35)
LoaderFrame.BackgroundTransparency = 0.15
LoaderFrame.BorderSizePixel = 0
LoaderFrame.Parent = LoaderGui

local LoaderCorner = Instance.new("UICorner")
LoaderCorner.CornerRadius = UDim.new(0, 12)
LoaderCorner.Parent = LoaderFrame

local LoaderStroke = Instance.new("UIStroke")
LoaderStroke.Color = Color3.fromRGB(160, 80, 255)
LoaderStroke.Transparency = 0.3
LoaderStroke.Parent = LoaderFrame

local LoaderTitle = Instance.new("TextLabel")
LoaderTitle.Size = UDim2.new(1, -40, 0, 30)
LoaderTitle.Position = UDim2.new(0, 20, 0, 20)
LoaderTitle.BackgroundTransparency = 1
LoaderTitle.Text = "Yükleniyor"
LoaderTitle.TextColor3 = Color3.fromRGB(240, 240, 255)
LoaderTitle.TextSize = 18
LoaderTitle.Font = Enum.Font.GothamBold
LoaderTitle.TextXAlignment = Enum.TextXAlignment.Left
LoaderTitle.Parent = LoaderFrame

local LoaderSub = Instance.new("TextLabel")
LoaderSub.Size = UDim2.new(1, -40, 0, 20)
LoaderSub.Position = UDim2.new(0, 20, 0, 45)
LoaderSub.BackgroundTransparency = 1
LoaderSub.Text = "T A N T U N I"
LoaderSub.TextColor3 = Color3.fromRGB(190, 120, 255)
LoaderSub.TextSize = 12
LoaderSub.Font = Enum.Font.GothamBold
LoaderSub.TextXAlignment = Enum.TextXAlignment.Left
LoaderSub.Parent = LoaderFrame

local StatusText = Instance.new("TextLabel")
StatusText.Size = UDim2.new(1, -40, 0, 25)
StatusText.Position = UDim2.new(0, 20, 0, 80)
StatusText.BackgroundTransparency = 1
StatusText.Text = "Authorizing Dashboard..."
StatusText.TextColor3 = Color3.fromRGB(200, 200, 210)
StatusText.TextSize = 13
StatusText.Font = Enum.Font.GothamMedium
StatusText.TextXAlignment = Enum.TextXAlignment.Left
StatusText.Parent = LoaderFrame

local BarBg = Instance.new("Frame")
BarBg.Size = UDim2.new(1, -40, 0, 6)
BarBg.Position = UDim2.new(0, 20, 0, 115)
BarBg.BackgroundColor3 = Color3.fromRGB(40, 20, 70)
BarBg.BorderSizePixel = 0
BarBg.Parent = LoaderFrame

local BarBgCorner = Instance.new("UICorner")
BarBgCorner.CornerRadius = UDim.new(1, 0)
BarBgCorner.Parent = BarBg

local BarFill = Instance.new("Frame")
BarFill.Size = UDim2.new(0, 0, 1, 0)
BarFill.BackgroundColor3 = Color3.fromRGB(168, 85, 247)
BarFill.BorderSizePixel = 0
BarFill.Parent = BarBg

local BarFillCorner = Instance.new("UICorner")
BarFillCorner.CornerRadius = UDim.new(1, 0)
BarFillCorner.Parent = BarFill

for i = 1, 100 do
    BarFill.Size = UDim2.new(i / 100, 0, 1, 0)
    task.wait(0.005)
end
task.wait(0.1)
LoaderGui:Destroy()

-- 2. ANA MENÜ GUI
local MenuGui = Instance.new("ScreenGui")
MenuGui.Name = "TantuniMenu"
MenuGui.ResetOnSpawn = false
MenuGui.Parent = CoreGui

local MainContainer = Instance.new("Frame")
MainContainer.Size = UDim2.new(0, 680, 0, 420)
MainContainer.Position = UDim2.new(0.5, -340, 0.5, -230)
MainContainer.BackgroundColor3 = Color3.fromRGB(14, 8, 24)
MainContainer.BackgroundTransparency = 0.1
MainContainer.BorderSizePixel = 0
MainContainer.ClipsDescendants = true
MainContainer.Parent = MenuGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 12)
MainCorner.Parent = MainContainer

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(160, 70, 255)
MainStroke.Transparency = 0.25
MainStroke.Parent = MainContainer

local WelcomeText = Instance.new("TextLabel")
WelcomeText.Size = UDim2.new(0, 400, 0, 20)
WelcomeText.Position = UDim2.new(0, 20, 0, 14)
WelcomeText.BackgroundTransparency = 1
WelcomeText.Text = "Welcome home, " .. tostring(LocalPlayer.Name)
WelcomeText.TextColor3 = Color3.fromRGB(255, 255, 255)
WelcomeText.TextSize = 15
WelcomeText.Font = Enum.Font.GothamBold
WelcomeText.TextXAlignment = Enum.TextXAlignment.Left
WelcomeText.Parent = MainContainer

local SubText = Instance.new("TextLabel")
SubText.Size = UDim2.new(0, 400, 0, 14)
SubText.Position = UDim2.new(0, 20, 0, 34)
SubText.BackgroundTransparency = 1
SubText.Text = "Tantuni"
SubText.TextColor3 = Color3.fromRGB(180, 170, 200)
SubText.TextSize = 10
SubText.Font = Enum.Font.Gotham
SubText.TextXAlignment = Enum.TextXAlignment.Left
SubText.Parent = MainContainer

local ClockLabel = Instance.new("TextLabel")
ClockLabel.Size = UDim2.new(0, 120, 0, 24)
ClockLabel.Position = UDim2.new(1, -135, 0, 16)
ClockLabel.BackgroundTransparency = 1
ClockLabel.TextColor3 = Color3.fromRGB(240, 240, 255)
ClockLabel.TextSize = 12
ClockLabel.Font = Enum.Font.GothamBold
ClockLabel.TextXAlignment = Enum.TextXAlignment.Right
ClockLabel.Parent = MainContainer

task.spawn(function()
    while true do
        local date = os.date("*t")
        ClockLabel.Text = "🕒 " .. string.format("%02d", date.hour) .. ":" .. string.format("%02d", date.min)
        task.wait(1)
    end
end)

local ContentHolder = Instance.new("Folder")
ContentHolder.Name = "ContentHolder"
ContentHolder.Parent = MainContainer

local function applyHoverEffect(box)
    box.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            tween(box, {0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out}, {BackgroundColor3 = Color3.fromRGB(55, 30, 95)})
        end
    end)
    box.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            tween(box, {0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out}, {BackgroundColor3 = Color3.fromRGB(40, 22, 68)})
        end
    end)
end

-- === 1. SEKME: ANA SAYFA ===
local HomeTab = Instance.new("Frame")
HomeTab.Name = "HomeTab"
HomeTab.Size = UDim2.new(1, 0, 1, -56)
HomeTab.Position = UDim2.new(0, 0, 0, 56)
HomeTab.BackgroundTransparency = 1
HomeTab.Visible = true
HomeTab.Parent = ContentHolder

local TopPanel = Instance.new("Frame")
TopPanel.Size = UDim2.new(1, -40, 0, 56)
TopPanel.Position = UDim2.new(0, 20, 0, 0)
TopPanel.BackgroundColor3 = Color3.fromRGB(26, 15, 44)
TopPanel.BackgroundTransparency = 0.4
TopPanel.BorderSizePixel = 0
TopPanel.Parent = HomeTab

local TopPanelCorner = Instance.new("UICorner")
TopPanelCorner.CornerRadius = UDim.new(0, 8)
TopPanelCorner.Parent = TopPanel

local FlyBox = Instance.new("Frame")
FlyBox.Size = UDim2.new(0.32, -5, 1, -10)
FlyBox.Position = UDim2.new(0, 5, 0, 5)
FlyBox.BackgroundColor3 = Color3.fromRGB(40, 22, 68)
FlyBox.BackgroundTransparency = 0.3
FlyBox.BorderSizePixel = 0
FlyBox.Parent = TopPanel
applyHoverEffect(FlyBox)

local FlyCorner = Instance.new("UICorner")
FlyCorner.CornerRadius = UDim.new(0, 6)
FlyCorner.Parent = FlyBox

local FlyTitle = Instance.new("TextLabel")
FlyTitle.Size = UDim2.new(1, 0, 0, 18)
FlyTitle.Position = UDim2.new(0, 0, 0, 8)
FlyTitle.BackgroundTransparency = 1
FlyTitle.Text = "Fly"
FlyTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
FlyTitle.TextSize = 12
FlyTitle.Font = Enum.Font.GothamBold
FlyTitle.Parent = FlyBox

local FlySub = Instance.new("TextLabel")
FlySub.Size = UDim2.new(1, 0, 0, 14)
FlySub.Position = UDim2.new(0, 0, 0, 25)
FlySub.BackgroundTransparency = 1
FlySub.Text = "Kapalı"
FlySub.TextColor3 = Color3.fromRGB(180, 170, 200)
FlySub.TextSize = 10
FlySub.Font = Enum.Font.Gotham
FlySub.Parent = FlyBox

local BypassBox = Instance.new("Frame")
BypassBox.Size = UDim2.new(0.32, -5, 1, -10)
BypassBox.Position = UDim2.new(0.34, 0, 0, 5)
BypassBox.BackgroundColor3 = Color3.fromRGB(40, 22, 68)
BypassBox.BackgroundTransparency = 0.3
BypassBox.BorderSizePixel = 0
BypassBox.Parent = TopPanel
applyHoverEffect(BypassBox)

local BypassCorner = Instance.new("UICorner")
BypassCorner.CornerRadius = UDim.new(0, 6)
BypassCorner.Parent = BypassBox

local BypassTitle = Instance.new("TextLabel")
BypassTitle.Size = UDim2.new(1, 0, 0, 18)
BypassTitle.Position = UDim2.new(0, 0, 0, 8)
BypassTitle.BackgroundTransparency = 1
BypassTitle.Text = "🎙️ Bypasser"
BypassTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
BypassTitle.TextSize = 12
BypassTitle.Font = Enum.Font.GothamBold
BypassTitle.Parent = BypassBox

local BypassSub = Instance.new("TextLabel")
BypassSub.Size = UDim2.new(1, 0, 0, 14)
BypassSub.Position = UDim2.new(0, 0, 0, 25)
BypassSub.BackgroundTransparency = 1
BypassSub.Text = "Bypasser"
BypassSub.TextColor3 = Color3.fromRGB(180, 170, 200)
BypassSub.TextSize = 10
BypassSub.Font = Enum.Font.Gotham
BypassSub.Parent = BypassBox

local EspBox = Instance.new("Frame")
EspBox.Size = UDim2.new(0.32, -5, 1, -10)
EspBox.Position = UDim2.new(0.68, 0, 0, 5)
EspBox.BackgroundColor3 = Color3.fromRGB(40, 22, 68)
EspBox.BackgroundTransparency = 0.3
EspBox.BorderSizePixel = 0
EspBox.Parent = TopPanel
applyHoverEffect(EspBox)

local EspCorner = Instance.new("UICorner")
EspCorner.CornerRadius = UDim.new(0, 6)
EspCorner.Parent = EspBox

local EspTitle = Instance.new("TextLabel")
EspTitle.Size = UDim2.new(1, 0, 0, 18)
EspTitle.Position = UDim2.new(0, 0, 0, 8)
EspTitle.BackgroundTransparency = 1
EspTitle.Text = "ESP"
EspTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
EspTitle.TextSize = 12
EspTitle.Font = Enum.Font.GothamBold
EspTitle.Parent = EspBox

local EspSub = Instance.new("TextLabel")
EspSub.Size = UDim2.new(1, 0, 0, 14)
EspSub.Position = UDim2.new(0, 0, 0, 25)
EspSub.BackgroundTransparency = 1
EspSub.Text = "Panel"
EspSub.TextColor3 = Color3.fromRGB(180, 170, 200)
EspSub.TextSize = 10
EspSub.Font = Enum.Font.Gotham
EspSub.Parent = EspBox

local ProfileCard = Instance.new("Frame")
ProfileCard.Size = UDim2.new(0.48, 0, 0, 200)
ProfileCard.Position = UDim2.new(0, 20, 0, 66)
ProfileCard.BackgroundColor3 = Color3.fromRGB(26, 15, 44)
ProfileCard.BackgroundTransparency = 0.4
ProfileCard.BorderSizePixel = 0
ProfileCard.Parent = HomeTab

local ProfileCorner = Instance.new("UICorner")
ProfileCorner.CornerRadius = UDim.new(0, 8)
ProfileCorner.Parent = ProfileCard

local AvatarImage = Instance.new("ImageLabel")
AvatarImage.Size = UDim2.new(0, 50, 0, 50)
AvatarImage.Position = UDim2.new(0.5, -25, 0, 12)
AvatarImage.BackgroundTransparency = 1
pcall(function()
    AvatarImage.Image = Players:GetUserThumbnailAsync(LocalPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size150x150)
end)
AvatarImage.Parent = ProfileCard

local AvatarCorner = Instance.new("UICorner")
AvatarCorner.CornerRadius = UDim.new(1, 0)
AvatarCorner.Parent = AvatarImage

local AvatarStroke = Instance.new("UIStroke")
AvatarStroke.Color = Color3.fromRGB(168, 85, 247)
AvatarStroke.Thickness = 2
AvatarStroke.Parent = AvatarImage

local OnlineDot = Instance.new("Frame")
OnlineDot.Size = UDim2.new(0, 10, 0, 10)
OnlineDot.Position = UDim2.new(0.58, 0, 0, 48)
OnlineDot.BackgroundColor3 = Color3.fromRGB(74, 222, 128)
OnlineDot.BorderSizePixel = 0
OnlineDot.Parent = ProfileCard
local DotCorner = Instance.new("UICorner")
DotCorner.CornerRadius = UDim.new(1, 0)
DotCorner.Parent = OnlineDot

local NameLabel = Instance.new("TextLabel")
NameLabel.Size = UDim2.new(1, 0, 0, 18)
NameLabel.Position = UDim2.new(0, 0, 0, 68)
NameLabel.BackgroundTransparency = 1
NameLabel.Text = tostring(LocalPlayer.Name)
NameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
NameLabel.TextSize = 12
NameLabel.Font = Enum.Font.GothamBold
NameLabel.Parent = ProfileCard

local TagLabel = Instance.new("TextLabel")
TagLabel.Size = UDim2.new(1, 0, 0, 14)
TagLabel.Position = UDim2.new(0, 0, 0, 86)
TagLabel.BackgroundTransparency = 1
TagLabel.Text = "@" .. tostring(LocalPlayer.Name)
TagLabel.TextColor3 = Color3.fromRGB(160, 150, 185)
TagLabel.TextSize = 10
TagLabel.Font = Enum.Font.Gotham
TagLabel.Parent = ProfileCard

local ChatBox = Instance.new("Frame")
ChatBox.Size = UDim2.new(1, -20, 0, 32)
ChatBox.Position = UDim2.new(0, 10, 0, 154)
ChatBox.BackgroundColor3 = Color3.fromRGB(35, 20, 60)
ChatBox.BackgroundTransparency = 0.3
ChatBox.BorderSizePixel = 0
ChatBox.Parent = ProfileCard

local ChatCorner = Instance.new("UICorner")
ChatCorner.CornerRadius = UDim.new(0, 6)
ChatCorner.Parent = ChatBox

local ChatPlaceholder = Instance.new("TextLabel")
ChatPlaceholder.Size = UDim2.new(1, -30, 1, 0)
ChatPlaceholder.Position = UDim2.new(0, 30, 0, 0)
ChatPlaceholder.BackgroundTransparency = 1
ChatPlaceholder.Text = "Chat..."
ChatPlaceholder.TextColor3 = Color3.fromRGB(150, 140, 175)
ChatPlaceholder.TextSize = 11
ChatPlaceholder.Font = Enum.Font.Gotham
ChatPlaceholder.TextXAlignment = Enum.TextXAlignment.Left
ChatPlaceholder.Parent = ChatBox

local ChatIcon = Instance.new("TextLabel")
ChatIcon.Size = UDim2.new(0, 24, 1, 0)
ChatIcon.Position = UDim2.new(0, 6, 0, 0)
ChatIcon.BackgroundTransparency = 1
ChatIcon.Text = "💬"
ChatIcon.TextSize = 12
ChatIcon.Parent = ChatBox

local RightContainer = Instance.new("Frame")
RightContainer.Size = UDim2.new(0.48, 0, 0, 200)
RightContainer.Position = UDim2.new(0.52, 0, 0, 66)
RightContainer.BackgroundTransparency = 1
RightContainer.BorderSizePixel = 0
RightContainer.Parent = HomeTab

local CurrentGameCard = Instance.new("Frame")
CurrentGameCard.Size = UDim2.new(1, 0, 0, 58)
CurrentGameCard.Position = UDim2.new(0, 0, 0, 0)
CurrentGameCard.BackgroundColor3 = Color3.fromRGB(26, 15, 44)
CurrentGameCard.BackgroundTransparency = 0.4
CurrentGameCard.BorderSizePixel = 0
CurrentGameCard.Parent = RightContainer

local CGCardCorner = Instance.new("UICorner")
CGCardCorner.CornerRadius = UDim.new(0, 8)
CGCardCorner.Parent = CurrentGameCard

local CGTitle = Instance.new("TextLabel")
CGTitle.Size = UDim2.new(1, -20, 0, 16)
CGTitle.Position = UDim2.new(0, 10, 0, 6)
CGTitle.BackgroundTransparency = 1
CGTitle.Text = "Şu Anda Oynanan"
CGTitle.TextColor3 = Color3.fromRGB(220, 220, 240)
CGTitle.TextSize = 10
CGTitle.Font = Enum.Font.GothamBold
CGTitle.TextXAlignment = Enum.TextXAlignment.Left
CGTitle.Parent = CurrentGameCard

local CGName = Instance.new("TextLabel")
CGName.Size = UDim2.new(1, -20, 0, 22)
CGName.Position = UDim2.new(0, 10, 0, 24)
CGName.BackgroundTransparency = 1
CGName.TextColor3 = Color3.fromRGB(255, 255, 255)
CGName.TextSize = 11
CGName.Font = Enum.Font.GothamBold
CGName.TextXAlignment = Enum.TextXAlignment.Left
CGName.Parent = CurrentGameCard

task.spawn(function()
    local success, gameName = pcall(function()
        return MarketplaceService:GetProductInfo(game.PlaceId).Name
    end)
    CGName.Text = success and gameName or "Roblox Oyunu"
end)

local FriendActivityCard = Instance.new("Frame")
FriendActivityCard.Size = UDim2.new(1, 0, 0, 134)
FriendActivityCard.Position = UDim2.new(0, 0, 0, 66)
FriendActivityCard.BackgroundColor3 = Color3.fromRGB(26, 15, 44)
FriendActivityCard.BackgroundTransparency = 0.4
FriendActivityCard.BorderSizePixel = 0
FriendActivityCard.Parent = RightContainer

local FACardCorner = Instance.new("UICorner")
FACardCorner.CornerRadius = UDim.new(0, 8)
FACardCorner.Parent = FriendActivityCard

local FriendActivityTitle = Instance.new("TextLabel")
FriendActivityTitle.Size = UDim2.new(1, -20, 0, 16)
FriendActivityTitle.Position = UDim2.new(0, 10, 0, 6)
FriendActivityTitle.BackgroundTransparency = 1
FriendActivityTitle.Text = "Arkadaş Aktivitesi"
FriendActivityTitle.TextColor3 = Color3.fromRGB(220, 220, 240)
FriendActivityTitle.TextSize = 10
FriendActivityTitle.Font = Enum.Font.GothamBold
FriendActivityTitle.TextXAlignment = Enum.TextXAlignment.Left
FriendActivityTitle.Parent = FriendActivityCard

local FriendScroll = Instance.new("ScrollingFrame")
FriendScroll.Size = UDim2.new(1, -12, 1, -26)
FriendScroll.Position = UDim2.new(0, 6, 0, 22)
FriendScroll.BackgroundTransparency = 1
FriendScroll.BorderSizePixel = 0
FriendScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
FriendScroll.ScrollBarThickness = 3
FriendScroll.Parent = FriendActivityCard

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 4)
UIListLayout.Parent = FriendScroll

local function updateFriends()
    for _, child in ipairs(FriendScroll:GetChildren()) do
        if child:IsA("Frame") then child:Destroy() end
    end
    
    local success, pages = pcall(function()
        return LocalPlayer:GetFriendsOnline()
    end)
    
    local count = 0
    if success and pages then
        for _, friend in ipairs(pages) do
            count = count + 1
            local fFrame = Instance.new("Frame")
            fFrame.Size = UDim2.new(1, 0, 0, 32)
            fFrame.BackgroundColor3 = Color3.fromRGB(35, 20, 60)
            fFrame.BackgroundTransparency = 0.3
            fFrame.BorderSizePixel = 0
            fFrame.Parent = FriendScroll
            
            local fCorner = Instance.new("UICorner")
            fCorner.CornerRadius = UDim.new(0, 6)
            fCorner.Parent = fFrame
            
            local fAvatar = Instance.new("ImageLabel")
            fAvatar.Size = UDim2.new(0, 20, 0, 20)
            fAvatar.Position = UDim2.new(0, 6, 0.5, -10)
            fAvatar.BackgroundTransparency = 1
            pcall(function()
                fAvatar.Image = Players:GetUserThumbnailAsync(friend.VisitorId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size100x100)
            end)
            fAvatar.Parent = fFrame
            
            local fAvatarCorner = Instance.new("UICorner")
            fAvatarCorner.CornerRadius = UDim.new(1, 0)
            fAvatarCorner.Parent = fAvatar
            
            local fName = Instance.new("TextLabel")
            fName.Size = UDim2.new(1, -32, 0, 14)
            fName.Position = UDim2.new(0, 32, 0, 2)
            fName.BackgroundTransparency = 1
            fName.Text = tostring(friend.UserName or "Bilinmeyen")
            fName.TextColor3 = Color3.fromRGB(240, 240, 255)
            fName.TextSize = 10
            fName.Font = Enum.Font.GothamBold
            fName.TextXAlignment = Enum.TextXAlignment.Left
            fName.Parent = fFrame
            
            local fGame = Instance.new("TextLabel")
            fGame.Size = UDim2.new(1, -32, 0, 12)
            fGame.Position = UDim2.new(0, 32, 0, 16)
            fGame.BackgroundTransparency = 1
            fGame.Text = tostring(friend.Location ~= "" and friend.Location or "Aktif")
            fGame.TextColor3 = Color3.fromRGB(170, 160, 200)
            fGame.TextSize = 9
            fGame.Font = Enum.Font.Gotham
            fGame.TextXAlignment = Enum.TextXAlignment.Left
            fGame.Parent = fFrame
        end
    end
    FriendScroll.CanvasSize = UDim2.new(0, 0, 0, count * 36)
end

task.spawn(updateFriends)

-- === 2. SEKME: COMMANDS ===
local CommandsTab = Instance.new("Frame")
CommandsTab.Name = "CommandsTab"
CommandsTab.Size = UDim2.new(1, 0, 1, -56)
CommandsTab.Position = UDim2.new(0, 0, 0, 56)
CommandsTab.BackgroundTransparency = 1
CommandsTab.Visible = false
CommandsTab.Parent = ContentHolder

local CmdInner = Instance.new("Frame")
CmdInner.Size = UDim2.new(1, -40, 1, -20)
CmdInner.Position = UDim2.new(0, 20, 0, 10)
CmdInner.BackgroundTransparency = 1
CmdInner.Parent = CommandsTab

local CmdHeader = Instance.new("TextLabel")
CmdHeader.Size = UDim2.new(1, 0, 0, 22)
CmdHeader.Position = UDim2.new(0, 0, 0, 0)
CmdHeader.BackgroundTransparency = 1
CmdHeader.Text = "Komutlar"
CmdHeader.TextColor3 = Color3.fromRGB(255, 255, 255)
CmdHeader.TextSize = 15
CmdHeader.Font = Enum.Font.GothamBold
CmdHeader.TextXAlignment = Enum.TextXAlignment.Left
CmdHeader.Parent = CmdInner

local CmdSub = Instance.new("TextLabel")
CmdSub.Size = UDim2.new(1, 0, 0, 16)
CmdSub.Position = UDim2.new(0, 0, 0, 22)
CmdSub.BackgroundTransparency = 1
CmdSub.Text = "Commands List"
CmdSub.TextColor3 = Color3.fromRGB(160, 150, 185)
CmdSub.TextSize = 11
CmdSub.Font = Enum.Font.Gotham
CmdSub.TextXAlignment = Enum.TextXAlignment.Left
CmdSub.Parent = CmdInner

local FilterBar = Instance.new("Frame")
FilterBar.Size = UDim2.new(1, 0, 0, 30)
FilterBar.Position = UDim2.new(0, 0, 0, 42)
FilterBar.BackgroundColor3 = Color3.fromRGB(24, 13, 40)
FilterBar.BackgroundTransparency = 0.5
FilterBar.BorderSizePixel = 0
FilterBar.Parent = CmdInner

local FilterCorner = Instance.new("UICorner")
FilterCorner.CornerRadius = UDim.new(0, 6)
FilterCorner.Parent = FilterBar

local categories = {"All", "Character", "Movement", "Troll", "Exploit", "Çeşitli", "Özel"}
local catWidth = 1 / #categories

for cIdx, catName in ipairs(categories) do
    local cBtn = Instance.new("TextButton")
    cBtn.Size = UDim2.new(catWidth, 0, 1, 0)
    cBtn.Position = UDim2.new((cIdx - 1) * catWidth, 0, 0, 0)
    cBtn.BackgroundTransparency = 1
    cBtn.Text = catName
    cBtn.TextColor3 = (cIdx == 1) and Color3.new(1, 1, 1) or Color3.fromRGB(160, 150, 185)
    cBtn.TextSize = 10
    cBtn.Font = Enum.Font.GothamBold
    cBtn.Parent = FilterBar
end

local SearchBox = Instance.new("Frame")
SearchBox.Size = UDim2.new(1, 0, 0, 30)
SearchBox.Position = UDim2.new(0, 0, 0, 78)
SearchBox.BackgroundColor3 = Color3.fromRGB(24, 13, 40)
SearchBox.BackgroundTransparency = 0.5
SearchBox.BorderSizePixel = 0
SearchBox.Parent = CmdInner

local SearchCorner = Instance.new("UICorner")
SearchCorner.CornerRadius = UDim.new(0, 6)
SearchCorner.Parent = SearchBox

local SearchText = Instance.new("TextLabel")
SearchText.Size = UDim2.new(1, -16, 1, 0)
SearchText.Position = UDim2.new(0, 12, 0, 0)
SearchText.BackgroundTransparency = 1
SearchText.Text = "Search / Execute"
SearchText.TextColor3 = Color3.fromRGB(140, 130, 165)
SearchText.TextSize = 11
SearchText.Font = Enum.Font.Gotham
SearchText.TextXAlignment = Enum.TextXAlignment.Left
SearchText.Parent = SearchBox

local CmdScroll = Instance.new("ScrollingFrame")
CmdScroll.Size = UDim2.new(1, 0, 1, -114)
CmdScroll.Position = UDim2.new(0, 0, 0, 114)
CmdScroll.BackgroundTransparency = 1
CmdScroll.BorderSizePixel = 0
CmdScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
CmdScroll.ScrollBarThickness = 3
CmdScroll.Parent = CmdInner

local CmdListLayout = Instance.new("UIListLayout")
CmdListLayout.SortOrder = Enum.SortOrder.LayoutOrder
CmdListLayout.Padding = UDim.new(0, 5)
CmdListLayout.Parent = CmdScroll

-- NORMAL FLY SİSTEMİ (Bozulmayan, sade ve temiz)
local flyEnabled = false
local flySpeed = 50
local bg, bv

local function toggleFly()
    flyEnabled = not flyEnabled
    local char = LocalPlayer.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end
    local rootPart = char.HumanoidRootPart
    local humanoid = char:FindFirstChildOfClass("Humanoid")

    if flyEnabled then
        FlySub.Text = "Açık"
        
        bg = Instance.new("BodyGyro")
        bg.P = 9e4
        bg.maxTorque = Vector3.new(9e4, 9e4, 9e4)
        bg.Parent = rootPart

        bv = Instance.new("BodyVelocity")
        bv.velocity = Vector3.new(0, 0, 0)
        bv.maxForce = Vector3.new(9e4, 9e4, 9e4)
        bv.Parent = rootPart

        if humanoid then humanoid.PlatformStand = true end

        task.spawn(function()
            while flyEnabled and char and rootPart.Parent do
                local cam = workspace.CurrentCamera
                local moveDir = Vector3.new()
                
                if UserInputService:IsKeyDown(Enum.KeyCode.W) then
                    moveDir = moveDir + cam.CFrame.LookVector
                end
                if UserInputService:IsKeyDown(Enum.KeyCode.S) then
                    moveDir = moveDir - cam.CFrame.LookVector
                end
                if UserInputService:IsKeyDown(Enum.KeyCode.A) then
                    moveDir = moveDir - cam.CFrame.RightVector
                end
                if UserInputService:IsKeyDown(Enum.KeyCode.D) then
                    moveDir = moveDir + cam.CFrame.RightVector
                end
                if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
                    moveDir = moveDir + Vector3.new(0, 1, 0)
                end
                if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
                    moveDir = moveDir - Vector3.new(0, 1, 0)
                end

                if bv and bg then
                    bv.velocity = moveDir * flySpeed
                    bg.cframe = cam.CFrame
                end
                RunService.RenderStepped:Wait()
            end
        end)
    else
        FlySub.Text = "Kapalı"
        if bg then bg:Destroy() end
        if bv then bv:Destroy() end
        
        if humanoid then
            humanoid.PlatformStand = false
            pcall(function()
                humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
            end)
        end
        
        pcall(function()
            rootPart.Velocity = Vector3.new(0, 0, 0)
        end)
    end
end

-- Komut Listesi
local cmdData = {
    {name = "noclip", desc = "Duvarların içinden geçmenizi sağlar", isFav = false, action = function() end},
    {name = "fly", desc = "Normal düz uçmanızı sağlar", isFav = false, action = function() toggleFly() end},
    {name = "airwalk", desc = "Havada yürümenizi sağlar", isFav = false, action = function() end},
}

local activeBinds = {}

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed then
        local boundFunc = activeBinds[input.KeyCode]
        if boundFunc then
            pcall(boundFunc)
        end
    end
end)

local function rebuildCommandList()
    for _, child in ipairs(CmdScroll:GetChildren()) do
        if child:IsA("Frame") or child:IsA("TextLabel") then 
            child:Destroy() 
        end
    end

    local favHeader = Instance.new("TextLabel")
    favHeader.Size = UDim2.new(1, 0, 0, 18)
    favHeader.BackgroundTransparency = 1
    favHeader.Text = "⭐ Favoriler"
    favHeader.TextColor3 = Color3.fromRGB(250, 204, 21)
    favHeader.TextSize = 11
    favHeader.Font = Enum.Font.GothamBold
    favHeader.TextXAlignment = Enum.TextXAlignment.Left
    favHeader.Parent = CmdScroll

    local favoritesContainer = Instance.new("Frame")
    favoritesContainer.Name = "FavoritesFolder"
    favoritesContainer.Size = UDim2.new(1, 0, 0, 0)
    favoritesContainer.BackgroundTransparency = 1
    favoritesContainer.Parent = CmdScroll
    
    local favLayout = Instance.new("UIListLayout")
    favLayout.SortOrder = Enum.SortOrder.LayoutOrder
    favLayout.Padding = UDim.new(0, 5)
    favLayout.Parent = favoritesContainer

    local otherHeader = Instance.new("TextLabel")
    otherHeader.Size = UDim2.new(1, 0, 0, 18)
    otherHeader.BackgroundTransparency = 1
    otherHeader.Text = "📌 Bütün Komutlar"
    otherHeader.TextColor3 = Color3.fromRGB(150, 110, 220)
    otherHeader.TextSize = 11
    otherHeader.Font = Enum.Font.GothamBold
    otherHeader.TextXAlignment = Enum.TextXAlignment.Left
    otherHeader.Parent = CmdScroll

    local othersContainer = Instance.new("Frame")
    othersContainer.Name = "OthersFolder"
    othersContainer.Size = UDim2.new(1, 0, 0, 0)
    othersContainer.BackgroundTransparency = 1
    othersContainer.Parent = CmdScroll

    local otherLayout = Instance.new("UIListLayout")
    otherLayout.SortOrder = Enum.SortOrder.LayoutOrder
    otherLayout.Padding = UDim.new(0, 5)
    otherLayout.Parent = othersContainer

    local favCount = 0
    local otherCount = 0

    for _, data in ipairs(cmdData) do
        if data.isFav then
            favCount = favCount + 1
            local cItem = Instance.new("Frame")
            cItem.Size = UDim2.new(1, 0, 0, 32)
            cItem.BackgroundColor3 = Color3.fromRGB(26, 15, 44)
            cItem.BackgroundTransparency = 0.4
            cItem.BorderSizePixel = 0
            cItem.Parent = favoritesContainer
            applyHoverEffect(cItem)
            
            local cItemCorner = Instance.new("UICorner")
            cItemCorner.CornerRadius = UDim.new(0, 6)
            cItemCorner.Parent = cItem
            
            local cName = Instance.new("TextLabel")
            cName.Size = UDim2.new(0.6, 0, 0, 14)
            cName.Position = UDim2.new(0, 10, 0, 2)
            cName.BackgroundTransparency = 1
            cName.Text = data.name
            cName.TextColor3 = Color3.fromRGB(255, 255, 255)
            cName.TextSize = 11
            cName.Font = Enum.Font.GothamBold
            cName.TextXAlignment = Enum.TextXAlignment.Left
            cName.Parent = cItem
            
            local cDesc = Instance.new("TextLabel")
            cDesc.Size = UDim2.new(0.6, 0, 0, 14)
            cDesc.Position = UDim2.new(0, 10, 0, 16)
            cDesc.BackgroundTransparency = 1
            cDesc.Text = data.desc
            cDesc.TextColor3 = Color3.fromRGB(160, 150, 185)
            cDesc.TextSize = 9
            cDesc.Font = Enum.Font.Gotham
            cDesc.TextXAlignment = Enum.TextXAlignment.Left
            cDesc.Parent = cItem

            local cBind = Instance.new("TextButton")
            cBind.Size = UDim2.new(0.3, 0, 1, 0)
            cBind.Position = UDim2.new(0.62, -10, 0, 0)
            cBind.BackgroundTransparency = 1
            cBind.Text = data.bindText or "+ bind"
            cBind.TextColor3 = Color3.fromRGB(160, 150, 185)
            cBind.TextSize = 10
            cBind.Font = Enum.Font.Gotham
            cBind.TextXAlignment = Enum.TextXAlignment.Right
            cBind.Parent = cItem

            cBind.MouseButton1Click:Connect(function()
                cBind.Text = "...tuşa basın"
                local connection
                connection = UserInputService.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.Keyboard then
                        connection:Disconnect()
                        local keyName = input.KeyCode.Name
                        data.bindText = keyName
                        cBind.Text = keyName
                        
                        for k, v in pairs(activeBinds) do
                            if v == data.action then activeBinds[k] = nil end
                        end
                        activeBinds[input.KeyCode] = data.action
                    end
                end)
            end)

            local cFavBtn = Instance.new("TextButton")
            cFavBtn.Size = UDim2.new(0, 24, 1, 0)
            cFavBtn.Position = UDim2.new(1, -26, 0, 0)
            cFavBtn.BackgroundTransparency = 1
            cFavBtn.Text = "★"
            cFavBtn.TextColor3 = Color3.fromRGB(250, 204, 21)
            cFavBtn.TextSize = 14
            cFavBtn.Parent = cItem

            cFavBtn.MouseButton1Click:Connect(function()
                data.isFav = false
                rebuildCommandList()
            end)
        end

        otherCount = otherCount + 1
        local oItem = Instance.new("Frame")
        oItem.Size = UDim2.new(1, 0, 0, 32)
        oItem.BackgroundColor3 = Color3.fromRGB(26, 15, 44)
        oItem.BackgroundTransparency = 0.4
        oItem.BorderSizePixel = 0
        oItem.Parent = othersContainer
        applyHoverEffect(oItem)
        
        local oItemCorner = Instance.new("UICorner")
        oItemCorner.CornerRadius = UDim.new(0, 6)
        oItemCorner.Parent = oItem
        
        local oName = Instance.new("TextLabel")
        oName.Size = UDim2.new(0.6, 0, 0, 14)
        oName.Position = UDim2.new(0, 10, 0, 2)
        oName.BackgroundTransparency = 1
        oName.Text = data.name
        oName.TextColor3 = Color3.fromRGB(255, 255, 255)
        oName.TextSize = 11
        oName.Font = Enum.Font.GothamBold
        oName.TextXAlignment = Enum.TextXAlignment.Left
        oName.Parent = oItem
        
        local oDesc = Instance.new("TextLabel")
        oDesc.Size = UDim2.new(0.6, 0, 0, 14)
        oDesc.Position = UDim2.new(0, 10, 0, 16)
        oDesc.BackgroundTransparency = 1
        oDesc.Text = data.desc
        oDesc.TextColor3 = Color3.fromRGB(160, 150, 185)
        oDesc.TextSize = 9
        oDesc.Font = Enum.Font.Gotham
        oDesc.TextXAlignment = Enum.TextXAlignment.Left
        oDesc.Parent = oItem

        local oBind = Instance.new("TextButton")
        oBind.Size = UDim2.new(0.3, 0, 1, 0)
        oBind.Position = UDim2.new(0.62, -10, 0, 0)
        oBind.BackgroundTransparency = 1
        oBind.Text = data.bindText or "+ bind"
        oBind.TextColor3 = Color3.fromRGB(160, 150, 185)
        oBind.TextSize = 10
        oBind.Font = Enum.Font.Gotham
        oBind.TextXAlignment = Enum.TextXAlignment.Right
        oBind.Parent = oItem

        oBind.MouseButton1Click:Connect(function()
            oBind.Text = "...tuşa basın"
            local connection
            connection = UserInputService.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.Keyboard then
                    connection:Disconnect()
                    local keyName = input.KeyCode.Name
                    data.bindText = keyName
                    oBind.Text = keyName
                    
                    for k, v in pairs(activeBinds) do
                        if v == data.action then activeBinds[k] = nil end
                    end
                    activeBinds[input.KeyCode] = data.action
                end
            end)
        end)

        local oFavBtn = Instance.new("TextButton")
        oFavBtn.Size = UDim2.new(0, 24, 1, 0)
        oFavBtn.Position = UDim2.new(1, -26, 0, 0)
        oFavBtn.BackgroundTransparency = 1
        oFavBtn.Text = "★"
        oFavBtn.TextColor3 = data.isFav and Color3.fromRGB(250, 204, 21) or Color3.fromRGB(100, 90, 130)
        oFavBtn.TextSize = 14
        oFavBtn.Parent = oItem

        oFavBtn.MouseButton1Click:Connect(function()
            data.isFav = not data.isFav
            rebuildCommandList()
        end)
    end

    favoritesContainer.Size = UDim2.new(1, 0, 0, favCount * 37)
    othersContainer.Size = UDim2.new(1, 0, 0, otherCount * 37)
    
    favHeader.Visible = (favCount > 0)
    favoritesContainer.Visible = (favCount > 0)

    CmdScroll.CanvasSize = UDim2.new(0, 0, 0, (favCount * 37) + (otherCount * 37) + 60)
end

rebuildCommandList()

-- Diğer sekmeler
local tabNames = {"Arkadaşlar", "Müzik / Sesler", "Dosya Yöneticisi", "Ayarlar", "Bulut / Cloud"}
local otherTabs = {}

for i = 3, 7 do
    local tFrame = Instance.new("Frame")
    tFrame.Name = "Tab_" .. i
    tFrame.Size = UDim2.new(1, 0, 1, -56)
    tFrame.Position = UDim2.new(0, 0, 0, 56)
    tFrame.BackgroundTransparency = 1
    tFrame.Visible = false
    tFrame.Parent = ContentHolder
    
    local tInner = Instance.new("Frame")
    tInner.Size = UDim2.new(1, -40, 1, -20)
    tInner.Position = UDim2.new(0, 20, 0, 10)
    tInner.BackgroundTransparency = 1
    tInner.Parent = tFrame
    
    local tTitle = Instance.new("TextLabel")
    tTitle.Size = UDim2.new(1, 0, 0, 30)
    tTitle.Position = UDim2.new(0, 0, 0, 10)
    tTitle.BackgroundTransparency = 1
    tTitle.Text = "📂 " .. tabNames[i-2]
    tTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    tTitle.TextSize = 16
    tTitle.Font = Enum.Font.GothamBold
    tTitle.TextXAlignment = Enum.TextXAlignment.Left
    tTitle.Parent = tInner
    
    local tSub = Instance.new("TextLabel")
    tSub.Size = UDim2.new(1, 0, 0, 20)
    tSub.Position = UDim2.new(0, 0, 0, 40)
    tSub.BackgroundTransparency = 1
    tSub.Text = "Bu sekme içeriği yakında eklenecek."
    tSub.TextColor3 = Color3.fromRGB(160, 150, 185)
    tSub.TextSize = 12
    tSub.Font = Enum.Font.Gotham
    tSub.TextXAlignment = Enum.TextXAlignment.Left
    tSub.Parent = tInner
    
    table.insert(otherTabs, tFrame)
end

-- === ALT NAVİGASYON ŞERİDİ ===
local BottomNav = Instance.new("Frame")
BottomNav.Size = UDim2.new(0, 680, 0, 42)
BottomNav.Position = UDim2.new(0.5, -340, 0.5, 195)
BottomNav.BackgroundColor3 = Color3.fromRGB(14, 8, 24)
BottomNav.BackgroundTransparency = 0.1
BottomNav.BorderSizePixel = 0
BottomNav.ZIndex = 5
BottomNav.Parent = MenuGui

local NavCorner = Instance.new("UICorner")
NavCorner.CornerRadius = UDim.new(0, 12)
NavCorner.Parent = BottomNav

local NavStroke = Instance.new("UIStroke")
NavStroke.Color = Color3.fromRGB(160, 70, 255)
NavStroke.Transparency = 0.25
NavStroke.Parent = BottomNav

local emojiList = {"👤", "</>", "👥", "🎵", "📁", "⚙️", "☁️"}
local totalWidth = 680
local iconWidth = totalWidth / #emojiList

local ActiveIndicator = Instance.new("Frame")
ActiveIndicator.Size = UDim2.new(0, iconWidth, 1, 0)
ActiveIndicator.Position = UDim2.new(0, 0, 0, 0)
ActiveIndicator.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ActiveIndicator.BackgroundTransparency = 0.85
ActiveIndicator.BorderSizePixel = 0
ActiveIndicator.Parent = BottomNav

local ActiveCorner = Instance.new("UICorner")
ActiveCorner.CornerRadius = UDim.new(0, 8)
ActiveCorner.Parent = ActiveIndicator

local emojiButtons = {}

for i, emojiStr in ipairs(emojiList) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, iconWidth, 1, 0)
    btn.Position = UDim2.new(0, (i - 1) * iconWidth, 0, 0)
    btn.BackgroundTransparency = 1
    btn.Text = emojiStr
    btn.TextSize = 15
    btn.TextColor3 = (i == 1) and Color3.new(1, 1, 1) or Color3.fromRGB(140, 130, 170)
    btn.Font = Enum.Font.GothamBold
    btn.ZIndex = 6
    btn.Parent = BottomNav
    
    table.insert(emojiButtons, btn)
    
    btn.MouseButton1Click:Connect(function()
        tween(ActiveIndicator, {0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out}, {Position = UDim2.new(0, (i - 1) * iconWidth, 0, 0)})
        
        for index, b in ipairs(emojiButtons) do
            if index == i then
                tween(b, {0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out}, {TextColor3 = Color3.new(1, 1, 1)})
            else
                tween(b, {0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out}, {TextColor3 = Color3.fromRGB(140, 130, 170)})
            end
        end
        
        HomeTab.Visible = (i == 1)
        CommandsTab.Visible = (i == 2)
        
        for idx, tab in ipairs(otherTabs) do
            tab.Visible = (idx + 2 == i)
        end
    end)
end

-- --- SÜRÜKLE-BIRAK ---
local dragging, dragInput, mousePos, mainPos, navPos

local function updatePosition(delta)
    MainContainer.Position = UDim2.new(mainPos.X.Scale, mainPos.X.Offset + delta.X, mainPos.Y.Scale, mainPos.Y.Offset + delta.Y)
    BottomNav.Position = UDim2.new(navPos.X.Scale, navPos.X.Offset + delta.X, navPos.Y.Scale, navPos.Y.Offset + delta.Y)
end

local function setupDrag(item)
    item.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            mousePos = input.Position
            mainPos = MainContainer.Position
            navPos = BottomNav.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    item.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)
end

setupDrag(MainContainer)
setupDrag(BottomNav)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - mousePos
        updatePosition(delta)
    end
end)

-- --- DELETE İLE AÇ/KAPA ---
local isOpen = true
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.Delete then
        isOpen = not isOpen
        MainContainer.Visible = isOpen
        BottomNav.Visible = isOpen
    end
end)
