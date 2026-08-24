-- TANTUNI Ultimate Modern Dashboard
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local MarketplaceService = game:GetService("MarketplaceService")

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
MainContainer.Size = UDim2.new(0, 680, 0, 420)
MainContainer.Position = UDim2.new(0.5, -340, 0.5, -230)
MainContainer.BackgroundColor3 = Color3.fromRGB(14, 8, 24)
MainContainer.BackgroundTransparency = 0.1
MainContainer.BorderSizePixel = 0
MainContainer.ClipsDescendants = false
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
SubText.Text = "Tantuni" -- Burası Tantuni olarak düzeltildi
SubText.TextColor3 = Color3.fromRGB(180, 170, 200)
SubText.TextSize = 10
SubText.Font = Enum.Font.Gotham
SubText.TextXAlignment = Enum.TextXAlignment.Left
SubText.Parent = MainContainer

-- Sağ Üst Saat
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

-- SEKME İÇERİK TAŞIYICISI
local ContentHolder = Instance.new("Folder")
ContentHolder.Name = "ContentHolder"
ContentHolder.Parent = MainContainer

-- === 1. SEKME: ANA SAYFA ===
local HomeTab = Instance.new("Folder")
HomeTab.Name = "HomeTab"
HomeTab.Parent = ContentHolder

-- Üst 3'lü Şerit
local TopPanel = Instance.new("Frame")
TopPanel.Size = UDim2.new(1, -40, 0, 56)
TopPanel.Position = UDim2.new(0, 20, 0, 56)
TopPanel.BackgroundColor3 = Color3.fromRGB(26, 15, 44)
TopPanel.BackgroundTransparency = 0.4
TopPanel.BorderSizePixel = 0
TopPanel.Parent = HomeTab

local TopPanelCorner = Instance.new("UICorner")
TopPanelCorner.CornerRadius = UDim.new(0, 8)
TopPanelCorner.Parent = TopPanel

-- 1. Fly Kutusu
local FlyBox = Instance.new("Frame")
FlyBox.Size = UDim2.new(0.32, -5, 1, -10)
FlyBox.Position = UDim2.new(0, 5, 0, 5)
FlyBox.BackgroundColor3 = Color3.fromRGB(40, 22, 68)
FlyBox.BackgroundTransparency = 0.3
FlyBox.BorderSizePixel = 0
FlyBox.Parent = TopPanel

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

-- 2. Bypasser Kutusu
local BypassBox = Instance.new("Frame")
BypassBox.Size = UDim2.new(0.32, -5, 1, -10)
BypassBox.Position = UDim2.new(0.34, 0, 0, 5)
BypassBox.BackgroundColor3 = Color3.fromRGB(40, 22, 68)
BypassBox.BackgroundTransparency = 0.3
BypassBox.BorderSizePixel = 0
BypassBox.Parent = TopPanel

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

-- 3. ESP Kutusu
local EspBox = Instance.new("Frame")
EspBox.Size = UDim2.new(0.32, -5, 1, -10)
EspBox.Position = UDim2.new(0.68, 0, 0, 5)
EspBox.BackgroundColor3 = Color3.fromRGB(40, 22, 68)
EspBox.BackgroundTransparency = 0.3
EspBox.BorderSizePixel = 0
EspBox.Parent = TopPanel

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

-- SOL PROFİL KARTI
local ProfileCard = Instance.new("Frame")
ProfileCard.Size = UDim2.new(0.48, 0, 0, 224)
ProfileCard.Position = UDim2.new(0, 20, 0, 122)
ProfileCard.BackgroundColor3 = Color3.fromRGB(26, 15, 44)
ProfileCard.BackgroundTransparency = 0.4
ProfileCard.BorderSizePixel = 0
ProfileCard.Parent = HomeTab

local ProfileCorner = Instance.new("UICorner")
ProfileCorner.CornerRadius = UDim.new(0, 8)
ProfileCorner.Parent = ProfileCard

local AvatarImage = Instance.new("ImageLabel")
AvatarImage.Size = UDim2.new(0, 56, 0, 56)
AvatarImage.Position = UDim2.new(0.5, -28, 0, 14)
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
OnlineDot.Size = UDim2.new(0, 12, 0, 12)
OnlineDot.Position = UDim2.new(0.6, 0, 0, 52)
OnlineDot.BackgroundColor3 = Color3.fromRGB(74, 222, 128)
OnlineDot.BorderSizePixel = 0
OnlineDot.Parent = ProfileCard
local DotCorner = Instance.new("UICorner")
DotCorner.CornerRadius = UDim.new(1, 0)
DotCorner.Parent = OnlineDot

local NameLabel = Instance.new("TextLabel")
NameLabel.Size = UDim2.new(1, 0, 0, 20)
NameLabel.Position = UDim2.new(0, 0, 0, 76)
NameLabel.BackgroundTransparency = 1
NameLabel.Text = tostring(LocalPlayer.Name)
NameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
NameLabel.TextSize = 12
NameLabel.Font = Enum.Font.GothamBold
NameLabel.Parent = ProfileCard

local TagLabel = Instance.new("TextLabel")
TagLabel.Size = UDim2.new(1, 0, 0, 14)
TagLabel.Position = UDim2.new(0, 0, 0, 94)
TagLabel.BackgroundTransparency = 1
TagLabel.Text = "@" .. tostring(LocalPlayer.Name)
TagLabel.TextColor3 = Color3.fromRGB(160, 150, 185)
TagLabel.TextSize = 10
TagLabel.Font = Enum.Font.Gotham
TagLabel.Parent = ProfileCard

-- Sol alttaki Chat Kutusu
local ChatBox = Instance.new("Frame")
ChatBox.Size = UDim2.new(1, -20, 0, 34)
ChatBox.Position = UDim2.new(0, 10, 0, 172)
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

-- SAĞ TARAF: BÖLMELİ YAPI
local RightContainer = Instance.new("Frame")
RightContainer.Size = UDim2.new(0.48, 0, 0, 224)
RightContainer.Position = UDim2.new(0.52, 0, 0, 122)
RightContainer.BackgroundTransparency = 1
RightContainer.BorderSizePixel = 0
RightContainer.Parent = HomeTab

-- 1. ÜST KISIM: Şu Anda Oynanan Oyun Kutusu
local CurrentGameCard = Instance.new("Frame")
CurrentGameCard.Size = UDim2.new(1, 0, 0, 66)
CurrentGameCard.Position = UDim2.new(0, 0, 0, 0)
CurrentGameCard.BackgroundColor3 = Color3.fromRGB(26, 15, 44)
CurrentGameCard.BackgroundTransparency = 0.4
CurrentGameCard.BorderSizePixel = 0
CurrentGameCard.Parent = RightContainer

local CGCardCorner = Instance.new("UICorner")
CGCardCorner.CornerRadius = UDim.new(0, 8)
CGCardCorner.Parent = CurrentGameCard

local CGTitle = Instance.new("TextLabel")
CGTitle.Size = UDim2.new(1, -20, 0, 18)
CGTitle.Position = UDim2.new(0, 10, 0, 6)
CGTitle.BackgroundTransparency = 1
CGTitle.Text = "Şu Anda Oynanan"
CGTitle.TextColor3 = Color3.fromRGB(220, 220, 240)
CGTitle.TextSize = 10
CGTitle.Font = Enum.Font.GothamBold
CGTitle.TextXAlignment = Enum.TextXAlignment.Left
CGTitle.Parent = CurrentGameCard

local CGName = Instance.new("TextLabel")
CGName.Size = UDim2.new(1, -20, 0, 24)
CGName.Position = UDim2.new(0, 10, 0, 26)
CGName.BackgroundTransparency = 1
CGName.TextColor3 = Color3.fromRGB(255, 255, 255)
CGName.TextSize = 12
CGName.Font = Enum.Font.GothamBold
CGName.TextXAlignment = Enum.TextXAlignment.Left
CGName.Parent = CurrentGameCard

task.spawn(function()
    local success, gameName = pcall(function()
        return MarketplaceService:GetProductInfo(game.PlaceId).Name
    end)
    CGName.Text = success and gameName or "Roblox Oyunu"
end)

-- 2. ALT KISIM: Arkadaş Aktivitesi Kutusu
local FriendActivityCard = Instance.new("Frame")
FriendActivityCard.Size = UDim2.new(1, 0, 0, 150)
FriendActivityCard.Position = UDim2.new(0, 0, 0, 74)
FriendActivityCard.BackgroundColor3 = Color3.fromRGB(26, 15, 44)
FriendActivityCard.BackgroundTransparency = 0.4
FriendActivityCard.BorderSizePixel = 0
FriendActivityCard.Parent = RightContainer

local FACardCorner = Instance.new("UICorner")
FACardCorner.CornerRadius = UDim.new(0, 8)
FACardCorner.Parent = FriendActivityCard

local FriendActivityTitle = Instance.new("TextLabel")
FriendActivityTitle.Size = UDim2.new(1, -20, 0, 18)
FriendActivityTitle.Position = UDim2.new(0, 10, 0, 6)
FriendActivityTitle.BackgroundTransparency = 1
FriendActivityTitle.Text = "Arkadaş Aktivitesi"
FriendActivityTitle.TextColor3 = Color3.fromRGB(220, 220, 240)
FriendActivityTitle.TextSize = 10
FriendActivityTitle.Font = Enum.Font.GothamBold
FriendActivityTitle.TextXAlignment = Enum.TextXAlignment.Left
FriendActivityTitle.Parent = FriendActivityCard

local FriendScroll = Instance.new("ScrollingFrame")
FriendScroll.Size = UDim2.new(1, -12, 1, -28)
FriendScroll.Position = UDim2.new(0, 6, 0, 24)
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
            fFrame.Size = UDim2.new(1, 0, 0, 34)
            fFrame.BackgroundColor3 = Color3.fromRGB(35, 20, 60)
            fFrame.BackgroundTransparency = 0.3
            fFrame.BorderSizePixel = 0
            fFrame.Parent = FriendScroll
            
            local fCorner = Instance.new("UICorner")
            fCorner.CornerRadius = UDim.new(0, 6)
            fCorner.Parent = fFrame
            
            local fAvatar = Instance.new("ImageLabel")
            fAvatar.Size = UDim2.new(0, 22, 0, 22)
            fAvatar.Position = UDim2.new(0, 6, 0.5, -11)
            fAvatar.BackgroundTransparency = 1
            pcall(function()
                fAvatar.Image = Players:GetUserThumbnailAsync(friend.VisitorId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size100x100)
            end)
            fAvatar.Parent = fFrame
            
            local fAvatarCorner = Instance.new("UICorner")
            fAvatarCorner.CornerRadius = UDim.new(1, 0)
            fAvatarCorner.Parent = fAvatar
            
            local fName = Instance.new("TextLabel")
            fName.Size = UDim2.new(1, -34, 0, 14)
            fName.Position = UDim2.new(0, 34, 0, 3)
            fName.BackgroundTransparency = 1
            fName.Text = tostring(friend.UserName or "Bilinmeyen")
            fName.TextColor3 = Color3.fromRGB(240, 240, 255)
            fName.TextSize = 10
            fName.Font = Enum.Font.GothamBold
            fName.TextXAlignment = Enum.TextXAlignment.Left
            fName.Parent = fFrame
            
            local fGame = Instance.new("TextLabel")
            fGame.Size = UDim2.new(1, -34, 0, 12)
            fGame.Position = UDim2.new(0, 34, 0, 17)
            fGame.BackgroundTransparency = 1
            fGame.Text = tostring(friend.Location ~= "" and friend.Location or "Aktif")
            fGame.TextColor3 = Color3.fromRGB(170, 160, 200)
            fGame.TextSize = 9
            fGame.Font = Enum.Font.Gotham
            fGame.TextXAlignment = Enum.TextXAlignment.Left
            fGame.Parent = fFrame
        end
    end
    FriendScroll.CanvasSize = UDim2.new(0, 0, 0, count * 38)
end

task.spawn(updateFriends)


-- === DİĞER SEKMELER İÇİN SAYFALAR ===
local otherTabs = {}
for i = 2, 7 do
    local tFrame = Instance.new("Frame")
    tFrame.Name = "Tab_" .. i
    tFrame.Size = UDim2.new(1, -40, 1, -140)
    tFrame.Position = UDim2.new(0, 20, 0, 56)
    tFrame.BackgroundTransparency = 1
    tFrame.Visible = false
    tFrame.Parent = ContentHolder
    
    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.new(1, 0, 1, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = "Sekme " .. i .. " İçeriği"
    lbl.TextColor3 = Color3.fromRGB(180, 170, 210)
    lbl.TextSize = 16
    lbl.Font = Enum.Font.GothamBold
    lbl.Parent = tFrame
    
    table.insert(otherTabs, tFrame)
end


-- === ALT NAVİGASYON ŞERİDİ ===
local BottomNav = Instance.new("Frame")
BottomNav.Size = UDim2.new(1, 0, 0, 42)
BottomNav.Position = UDim2.new(0, 0, 1, 10)
BottomNav.BackgroundColor3 = Color3.fromRGB(18, 10, 32)
BottomNav.BackgroundTransparency = 0.15
BottomNav.BorderSizePixel = 0
BottomNav.Parent = MainContainer

local NavCorner = Instance.new("UICorner")
NavCorner.CornerRadius = UDim.new(0, 8)
NavCorner.Parent = BottomNav

local NavStroke = Instance.new("UIStroke")
NavStroke.Color = Color3.fromRGB(160, 70, 255)
NavStroke.Transparency = 0.3
NavStroke.Parent = BottomNav

-- Emojiler
local emojiList = {"👤", "💻", "👥", "🎵", "📁", "⚙️", "☁️"}

local totalWidth = 680
local iconWidth = totalWidth / #emojiList

-- Aktif Sekme Arka Plan Vurgusu
local ActiveIndicator = Instance.new("Frame")
ActiveIndicator.Size = UDim2.new(0, iconWidth, 1, 0)
ActiveIndicator.Position = UDim2.new(0, 0, 0, 0)
ActiveIndicator.BackgroundColor3 = Color3.fromRGB(30, 18, 55)
ActiveIndicator.BackgroundTransparency = 0.2
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
    btn.TextSize = 16
    -- İlk açılışta 1. sekme seçili olduğu için beyaz, diğerleri sönük gri
    btn.TextColor3 = (i == 1) and Color3.new(1, 1, 1) or Color3.fromRGB(110, 100, 140)
    btn.TextTransparency = (i == 1) and 0 or 0.3 -- Roblox metin soluklaşmasını önlemek için eklendi
    btn.Font = Enum.Font.GothamBold
    btn.ZIndex = 2
    btn.Parent = BottomNav
    
    table.insert(emojiButtons, btn)
    
    -- Tıklama ile Sayfa Değiştirme ve Renk Güncelleme
    btn.MouseButton1Click:Connect(function()
        -- Arka plan vurgusunu hareket ettir
        ActiveIndicator:TweenPosition(UDim2.new(0, (i - 1) * iconWidth, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.15, true)
        
        -- Seçilen emoji TAM BEYAZ, diğerleri SÖNÜK GRİ olsun
        for index, b in ipairs(emojiButtons) do
            if index == i then
                b.TextColor3 = Color3.new(1, 1, 1)
                b.TextTransparency = 0
            else
                b.TextColor3 = Color3.fromRGB(110, 100, 140)
                b.TextTransparency = 0.3
            end
        end
        
        -- Sayfaları Aç/Kapat
        HomeTab.Visible = (i == 1)
        for idx, tab in ipairs(otherTabs) do
            tab.Visible = (idx + 1 == i)
        end
    end)
end

-- --- SÜRÜKLE-BIRAK ---
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

-- --- DELETE İLE AÇ/KAPA ---
local isOpen = true
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.Delete then
        isOpen = not isOpen
        MainContainer.Visible = isOpen
    end
end)
