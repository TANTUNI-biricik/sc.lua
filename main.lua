-- TANTUNI Ultimate Modern Dashboard (Güncellenmiş Sürüm)
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local MarketplaceService = game:GetService("MarketplaceService")
local TextService = game:GetService("TextService")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

-- Önceki kalıntıları temizle
if CoreGui:FindFirstChild("TantuniLoader") then CoreGui.TantuniLoader:Destroy() end
if CoreGui:FindFirstChild("TantuniMenu") then CoreGui.TantuniMenu:Destroy() end

-- 1. LOADER (YÜKLEME EKRANI)
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
    task.wait(0.012)
end
task.wait(0.2)
LoaderGui:Destroy()

-- 2. ANA MENÜ
local MenuGui = Instance.new("ScreenGui")
MenuGui.Name = "TantuniMenu"
MenuGui.Parent = CoreGui

local MainContainer = Instance.new("Frame")
MainContainer.Size = UDim2.new(0, 680, 0, 460)
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

-- Üst Bilgi Satırı
local WelcomeText = Instance.new("TextLabel")
WelcomeText.Size = UDim2.new(0, 400, 0, 24)
WelcomeText.Position = UDim2.new(0, 25, 0, 18)
WelcomeText.BackgroundTransparency = 1
WelcomeText.Text = "Welcome home, " .. LocalPlayer.Name
WelcomeText.TextColor3 = Color3.fromRGB(255, 255, 255)
WelcomeText.TextSize = 16
WelcomeText.Font = Enum.Font.GothamBold
WelcomeText.TextXAlignment = Enum.TextXAlignment.Left
WelcomeText.Parent = MainContainer

local SubText = Instance.new("TextLabel")
SubText.Size = UDim2.new(0, 400, 0, 16)
SubText.Position = UDim2.new(0, 25, 0, 42)
SubText.BackgroundTransparency = 1
SubText.Text = "Novoline"
SubText.TextColor3 = Color3.fromRGB(180, 170, 200)
SubText.TextSize = 11
SubText.Font = Enum.Font.Gotham
SubText.TextXAlignment = Enum.TextXAlignment.Left
SubText.Parent = MainContainer

-- Sağ Üst Saat Göstergesi
local ClockLabel = Instance.new("TextLabel")
ClockLabel.Size = UDim2.new(0, 100, 0, 30)
ClockLabel.Position = UDim2.new(1, -125, 0, 24)
ClockLabel.BackgroundTransparency = 1
ClockLabel.TextColor3 = Color3.fromRGB(240, 240, 255)
ClockLabel.TextSize = 13
ClockLabel.Font = Enum.Font.GothamBold
ClockLabel.TextXAlignment = Enum.TextXAlignment.Right
ClockLabel.Parent = MainContainer

task.spawn(function()
    while true do
        local date = os.date("*t")
        local hour = string.format("%02d", date.hour)
        local min = string.format("%02d", date.min)
        ClockLabel.Text = "🕒 " .. hour .. ":" .. min
        task.wait(1)
    end
end)

-- Üst 3'lü Şerit (Fly - Bypasser - ESP)
local TopPanel = Instance.new("Frame")
TopPanel.Size = UDim2.new(1, -50, 0, 68)
TopPanel.Position = UDim2.new(0, 25, 0, 70)
TopPanel.BackgroundColor3 = Color3.fromRGB(26, 15, 44)
TopPanel.BackgroundTransparency = 0.4
TopPanel.BorderSizePixel = 0
TopPanel.Parent = MainContainer

local TopPanelCorner = Instance.new("UICorner")
TopPanelCorner.CornerRadius = UDim.new(0, 10)
TopPanelCorner.Parent = TopPanel

-- 1. Fly Kutusu
local FlyBox = Instance.new("Frame")
FlyBox.Size = UDim2.new(0.32, -6, 1, -14)
FlyBox.Position = UDim2.new(0, 7, 0, 7)
FlyBox.BackgroundColor3 = Color3.fromRGB(40, 22, 68)
FlyBox.BackgroundTransparency = 0.3
FlyBox.BorderSizePixel = 0
FlyBox.Parent = TopPanel

local FlyCorner = Instance.new("UICorner")
FlyCorner.CornerRadius = UDim.new(0, 8)
FlyCorner.Parent = FlyBox

local FlyTitle = Instance.new("TextLabel")
FlyTitle.Size = UDim2.new(1, 0, 0, 22)
FlyTitle.Position = UDim2.new(0, 0, 0, 8)
FlyTitle.BackgroundTransparency = 1
FlyTitle.Text = "Fly"
FlyTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
FlyTitle.TextSize = 13
FlyTitle.Font = Enum.Font.GothamBold
FlyTitle.Parent = FlyBox

local FlySub = Instance.new("TextLabel")
FlySub.Size = UDim2.new(1, 0, 0, 18)
FlySub.Position = UDim2.new(0, 0, 0, 28)
FlySub.BackgroundTransparency = 1
FlySub.Text = "Kapalı"
FlySub.TextColor3 = Color3.fromRGB(180, 170, 200)
FlySub.TextSize = 10
FlySub.Font = Enum.Font.Gotham
FlySub.Parent = FlyBox

-- 2. Bypasser Kutusu (Emojili ve 'Bypasser' yazılı)
local BypassBox = Instance.new("Frame")
BypassBox.Size = UDim2.new(0.32, -6, 1, -14)
BypassBox.Position = UDim2.new(0.34, 0, 0, 7)
BypassBox.BackgroundColor3 = Color3.fromRGB(40, 22, 68)
BypassBox.BackgroundTransparency = 0.3
BypassBox.BorderSizePixel = 0
BypassBox.Parent = TopPanel

local BypassCorner = Instance.new("UICorner")
BypassCorner.CornerRadius = UDim.new(0, 8)
BypassCorner.Parent = BypassBox

local BypassTitle = Instance.new("TextLabel")
BypassTitle.Size = UDim2.new(1, 0, 0, 22)
BypassTitle.Position = UDim2.new(0, 0, 0, 8)
BypassTitle.BackgroundTransparency = 1
BypassTitle.Text = "🎙️ Bypasser"
BypassTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
BypassTitle.TextSize = 13
BypassTitle.Font = Enum.Font.GothamBold
BypassTitle.Parent = BypassBox

local BypassSub = Instance.new("TextLabel")
BypassSub.Size = UDim2.new(1, 0, 0, 18)
BypassSub.Position = UDim2.new(0, 0, 0, 28)
BypassSub.BackgroundTransparency = 1
BypassSub.Text = "Bypasser"
BypassSub.TextColor3 = Color3.fromRGB(180, 170, 200)
BypassSub.TextSize = 10
BypassSub.Font = Enum.Font.Gotham
BypassSub.Parent = BypassBox

-- 3. ESP Kutusu
local EspBox = Instance.new("Frame")
EspBox.Size = UDim2.new(0.32, -6, 1, -14)
EspBox.Position = UDim2.new(0.68, 0, 0, 7)
EspBox.BackgroundColor3 = Color3.fromRGB(40, 22, 68)
EspBox.BackgroundTransparency = 0.3
EspBox.BorderSizePixel = 0
EspBox.Parent = TopPanel

local EspCorner = Instance.new("UICorner")
EspCorner.CornerRadius = UDim.new(0, 8)
EspCorner.Parent = EspBox

local EspTitle = Instance.new("TextLabel")
EspTitle.Size = UDim2.new(1, 0, 0, 22)
EspTitle.Position = UDim2.new(0, 0, 0, 8)
EspTitle.BackgroundTransparency = 1
EspTitle.Text = "ESP"
EspTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
EspTitle.TextSize = 13
EspTitle.Font = Enum.Font.GothamBold
EspTitle.Parent = EspBox

local EspSub = Instance.new("TextLabel")
EspSub.Size = UDim2.new(1, 0, 0, 18)
EspSub.Position = UDim2.new(0, 0, 0, 28)
EspSub.BackgroundTransparency = 1
EspSub.Text = "Panel"
EspSub.TextColor3 = Color3.fromRGB(180, 170, 200)
EspSub.TextSize = 10
EspSub.Font = Enum.Font.Gotham
EspSub.Parent = EspBox

-- SOL PROFİL KARTI
local ProfileCard = Instance.new("Frame")
ProfileCard.Size = UDim2.new(0.48, 0, 0, 235)
ProfileCard.Position = UDim2.new(0, 25, 0, 148)
ProfileCard.BackgroundColor3 = Color3.fromRGB(26, 15, 44)
ProfileCard.BackgroundTransparency = 0.4
ProfileCard.BorderSizePixel = 0
ProfileCard.Parent = MainContainer

local ProfileCorner = Instance.new("UICorner")
ProfileCorner.CornerRadius = UDim.new(0, 10)
ProfileCorner.Parent = ProfileCard

local AvatarImage = Instance.new("ImageLabel")
AvatarImage.Size = UDim2.new(0, 65, 0, 65)
AvatarImage.Position = UDim2.new(0.5, -32, 0, 18)
AvatarImage.BackgroundTransparency = 1
AvatarImage.Image = Players:GetUserThumbnailAsync(LocalPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size150x150)
AvatarImage.Parent = ProfileCard

local AvatarCorner = Instance.new("UICorner")
AvatarCorner.CornerRadius = UDim.new(1, 0)
AvatarCorner.Parent = AvatarImage

local AvatarStroke = Instance.new("UIStroke")
AvatarStroke.Color = Color3.fromRGB(168, 85, 247)
AvatarStroke.Thickness = 2
AvatarStroke.Parent = AvatarImage

local OnlineDot = Instance.new("Frame")
OnlineDot.Size = UDim2.new(0, 14, 0, 14)
OnlineDot.Position = UDim2.new(0.62, 0, 0, 58)
OnlineDot.BackgroundColor3 = Color3.fromRGB(74, 222, 128)
OnlineDot.BorderSizePixel = 0
OnlineDot.Parent = ProfileCard
local DotCorner = Instance.new("UICorner")
DotCorner.CornerRadius = UDim.new(1, 0)
DotCorner.Parent = OnlineDot

local NameLabel = Instance.new("TextLabel")
NameLabel.Size = UDim2.new(1, 0, 0, 22)
NameLabel.Position = UDim2.new(0, 0, 0, 90)
NameLabel.BackgroundTransparency = 1
NameLabel.Text = LocalPlayer.Name
NameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
NameLabel.TextSize = 13
NameLabel.Font = Enum.Font.GothamBold
NameLabel.Parent = ProfileCard

local TagLabel = Instance.new("TextLabel")
TagLabel.Size = UDim2.new(1, 0, 0, 16)
TagLabel.Position = UDim2.new(0, 0, 0, 110)
TagLabel.BackgroundTransparency = 1
TagLabel.Text = "@" .. LocalPlayer.Name
TagLabel.TextColor3 = Color3.fromRGB(160, 150, 185)
TagLabel.TextSize = 10
TagLabel.Font = Enum.Font.Gotham
TagLabel.Parent = ProfileCard

-- Sol alttaki Chat Kutusu
local ChatBox = Instance.new("Frame")
ChatBox.Size = UDim2.new(1, -24, 0, 38)
ChatBox.Position = UDim2.new(0, 12, 0, 180)
ChatBox.BackgroundColor3 = Color3.fromRGB(35, 20, 60)
ChatBox.BackgroundTransparency = 0.3
ChatBox.BorderSizePixel = 0
ChatBox.Parent = ProfileCard

local ChatCorner = Instance.new("UICorner")
ChatCorner.CornerRadius = UDim.new(0, 8)
ChatCorner.Parent = ChatBox

local ChatIcon = Instance.new("TextLabel")
ChatIcon.Size = UDim2.new(0, 30, 1, 0)
ChatIcon.Position = UDim2.new(0, 6, 0, 0)
ChatIcon.BackgroundTransparency = 1
ChatIcon.Text = "💬"
ChatIcon.TextSize = 13
ChatIcon.Parent = ChatBox

local ChatPlaceholder = Instance.new("TextLabel")
ChatPlaceholder.Size = UDim2.new(1, -40, 1, 0)
ChatPlaceholder.Position = UDim2.new(0, 34, 0, 0)
ChatPlaceholder.BackgroundTransparency = 1
ChatPlaceholder.Text = "Chat..."
ChatPlaceholder.TextColor3 = Color3.fromRGB(150, 140, 175)
ChatPlaceholder.TextSize = 11
ChatPlaceholder.Font = Enum.Font.Gotham
ChatPlaceholder.TextXAlignment = Enum.TextXAlignment.Left
ChatPlaceholder.Parent = ChatBox


-- SAĞ AKTİVİTE KUTUSU (Arkadaş Aktivitesi ve Kendi Oyunumuz)
local ActivityCard = Instance.new("Frame")
ActivityCard.Size = UDim2.new(0.48, 0, 0, 235)
ActivityCard.Position = UDim2.new(0.52, 0, 0, 148)
ActivityCard.BackgroundColor3 = Color3.fromRGB(26, 15, 44)
ActivityCard.BackgroundTransparency = 0.4
ActivityCard.BorderSizePixel = 0
ActivityCard.Parent = MainContainer

local ActivityCorner = Instance.new("UICorner")
ActivityCorner.CornerRadius = UDim.new(0, 10)
ActivityCorner.Parent = ActivityCard

local FriendActivityTitle = Instance.new("TextLabel")
FriendActivityTitle.Size = UDim2.new(1, -20, 0, 24)
FriendActivityTitle.Position = UDim2.new(0, 12, 0, 10)
FriendActivityTitle.BackgroundTransparency = 1
FriendActivityTitle.Text = "Arkadaş Aktivitesi" -- Türkçeleştirildi
FriendActivityTitle.TextColor3 = Color3.fromRGB(220, 220, 240)
FriendActivityTitle.TextSize = 12
FriendActivityTitle.Font = Enum.Font.GothamBold
FriendActivityTitle.TextXAlignment = Enum.TextXAlignment.Left
FriendActivityTitle.Parent = ActivityCard

local FriendScroll = Instance.new("ScrollingFrame")
FriendScroll.Size = UDim2.new(1, -20, 1, -42)
FriendScroll.Position = UDim2.new(0, 10, 0, 35)
FriendScroll.BackgroundTransparency = 1
FriendScroll.BorderSizePixel = 0
FriendScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
FriendScroll.ScrollBarThickness = 3
FriendScroll.Parent = ActivityCard

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 6)
UIListLayout.Parent = FriendScroll

local function updateFriends()
    for _, child in ipairs(FriendScroll:GetChildren()) do
        if child:IsA("Frame") then child:Destroy() end
    end
    
    -- ÖNCE KENDİ OYUNUMUZU EN ÜSTE EKLEYELİM
    local customGameFrame = Instance.new("Frame")
    customGameFrame.Size = UDim2.new(1, 0, 0, 42)
    customGameFrame.BackgroundColor3 = Color3.fromRGB(45, 25, 75) -- Farklı özel renk vurgusu
    customGameFrame.BackgroundTransparency = 0.2
    customGameFrame.BorderSizePixel = 0
    customGameFrame.Parent = FriendScroll
    
    local cgCorner = Instance.new("UICorner")
    cgCorner.CornerRadius = UDim.new(0, 8)
    cgCorner.Parent = customGameFrame
    
    local cgIcon = Instance.new("TextLabel")
    cgIcon.Size = UDim2.new(0, 28, 0, 28)
    cgIcon.Position = UDim2.new(0, 8, 0.5, -14)
    cgIcon.BackgroundTransparency = 1
    cgIcon.Text = "⚡"
    cgIcon.TextSize = 16
    cgIcon.Parent = customGameFrame
    
    local cgName = Instance.new("TextLabel")
    cgName.Size = UDim2.new(1, -45, 0, 16)
    cgName.Position = UDim2.new(0, 42, 0, 5)
    cgName.BackgroundTransparency = 1
    cgName.Text = "Tantuni Project (Bizim Oyun)"
    cgName.TextColor3 = Color3.fromRGB(255, 200, 255)
    cgName.TextSize = 11
    cgName.Font = Enum.Font.GothamBold
    cgName.TextXAlignment = Enum.TextXAlignment.Left
    cgName.Parent = customGameFrame
    
    local cgStatus = Instance.new("TextLabel")
    cgStatus.Size = UDim2.new(1, -45, 0, 14)
    cgStatus.Position = UDim2.new(0, 42, 0, 21)
    cgStatus.BackgroundTransparency = 1
    cgStatus.Text = "Aktif • Geliştirme Aşamasında"
    cgStatus.TextColor3 = Color3.fromRGB(180, 150, 220)
    cgStatus.TextSize = 10
    cgStatus.Font = Enum.Font.Gotham
    cgStatus.TextXAlignment = Enum.TextXAlignment.Left
    cgStatus.Parent = customGameFrame

    -- ARKADAŞLARI LİSTELE
    local success, pages = pcall(function()
        return LocalPlayer:GetFriendsOnline()
    end)
    
    local count = 1
    if success and pages then
        for _, friend in ipairs(pages) do
            count = count + 1
            local fFrame = Instance.new("Frame")
            fFrame.Size = UDim2.new(1, 0, 0, 42)
            fFrame.BackgroundColor3 = Color3.fromRGB(35, 20, 60)
            fFrame.BackgroundTransparency = 0.3
            fFrame.BorderSizePixel = 0
            fFrame.Parent = FriendScroll
            
            local fCorner = Instance.new("UICorner")
            fCorner.CornerRadius = UDim.new(0, 8)
            fCorner.Parent = fFrame
            
            local fAvatar = Instance.new("ImageLabel")
            fAvatar.Size = UDim2.new(0, 28, 0, 28)
            fAvatar.Position = UDim2.new(0, 8, 0.5, -14)
            fAvatar.BackgroundTransparency = 1
            local thumbSuccess, thumbImg = pcall(function()
                return Players:GetUserThumbnailAsync(friend.VisitorId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size100x100)
            end)
            fAvatar.Image = thumbSuccess and thumbImg or ""
            fAvatar.Parent = fFrame
            
            local fAvatarCorner = Instance.new("UICorner")
            fAvatarCorner.CornerRadius = UDim.new(1, 0)
            fAvatarCorner.Parent = fAvatar
            
            local fName = Instance.new("TextLabel")
            fName.Size = UDim2.new(1, -45, 0, 16)
            fName.Position = UDim2.new(0, 42, 0, 5)
            fName.BackgroundTransparency = 1
            fName.Text = friend.UserName
            fName.TextColor3 = Color3.fromRGB(240, 240, 255)
            fName.TextSize = 11
            fName.Font = Enum.Font.GothamBold
            fName.TextXAlignment = Enum.TextXAlignment.Left
            fName.Parent = fFrame
            
            local fGame = Instance.new("TextLabel")
            fGame.Size = UDim2.new(1, -45, 0, 14)
            fGame.Position = UDim2.new(0, 42, 0, 21)
            fGame.BackgroundTransparency = 1
            fGame.Text = friend.Location ~= "" and friend.Location or "Oyunda"
            fGame.TextColor3 = Color3.fromRGB(170, 160, 200)
            fGame.TextSize = 10
            fGame.Font = Enum.Font.Gotham
            fGame.TextXAlignment = Enum.TextXAlignment.Left
            fGame.Parent = fFrame
        end
    end
    FriendScroll.CanvasSize = UDim2.new(0, 0, 0, count * 48)
end

task.spawn(updateFriends)


-- 3. EN ALTTAKİ NAVİGASYON ŞERİDİ
local BottomNav = Instance.new("Frame")
BottomNav.Size = UDim2.new(0, 560, 0, 52)
BottomNav.Position = UDim2.new(0.5, -280, 1, -62)
BottomNav.BackgroundColor3 = Color3.fromRGB(18, 10, 32)
BottomNav.BackgroundTransparency = 0.2
BottomNav.BorderSizePixel = 0
BottomNav.Parent = MenuGui

local NavCorner = Instance.new("UICorner")
NavCorner.CornerRadius = UDim.new(0, 12)
NavCorner.Parent = BottomNav

local NavStroke = Instance.new("UIStroke")
NavStroke.Color = Color3.fromRGB(160, 70, 255)
NavStroke.Transparency = 0.3
NavStroke.Parent = BottomNav

local icons = {"🧭", "💻", "👥", "🎵", "📁", "⚙️", "☁️"}
local iconWidth = 560 / #icons

for i, iconSymbol in ipairs(icons) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, iconWidth, 1, 0)
    btn.Position = UDim2.new(0, (i - 1) * iconWidth, 0, 0)
    btn.BackgroundTransparency = 1
    btn.Text = iconSymbol
    btn.TextSize = 16
    btn.Parent = BottomNav
end


-- --- SÜRÜKLE-BIRAK (ANA MENÜ) ---
local dragging, dragInput, mousePos, framePos

MainContainer.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        mousePos = input.Position
        framePos = MainContainer.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

MainContainer.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - mousePos
        MainContainer.Position = UDim2.new(
            framePos.X.Scale, 
            framePos.X.Offset + delta.X, 
            framePos.Y.Scale, 
            framePos.Y.Offset + delta.Y
        )
    end
end)

-- --- DELETE TUŞU İLE AÇ/KAPA ---
local isOpen = true
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.Delete then
        isOpen = not isOpen
        MainContainer.Visible = isOpen
        BottomNav.Visible = isOpen
    end
end)
