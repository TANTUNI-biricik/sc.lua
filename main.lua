-- TANTUNI Smart Activity UI v3 (Gelişmiş Arkadaş Oyun İsmi Çözücü)
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local MarketplaceService = game:GetService("MarketplaceService")
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
StatusText.Text = "Authorizing..."
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
    task.wait(0.015)
end
task.wait(0.3)
LoaderGui:Destroy()

-- 2. ANA MENÜ
local MenuGui = Instance.new("ScreenGui")
MenuGui.Name = "TantuniMenu"
MenuGui.Parent = CoreGui

local MainContainer = Instance.new("Frame")
MainContainer.Size = UDim2.new(0, 650, 0, 420)
MainContainer.Position = UDim2.new(0.5, -325, 0.5, -210)
MainContainer.BackgroundColor3 = Color3.fromRGB(16, 10, 28)
MainContainer.BackgroundTransparency = 0.15
MainContainer.BorderSizePixel = 0
MainContainer.ClipsDescendants = true
MainContainer.Parent = MenuGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 12)
MainCorner.Parent = MainContainer

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(160, 70, 255)
MainStroke.Transparency = 0.3
MainStroke.Parent = MainContainer

-- Üst Bilgi Satırı
local WelcomeText = Instance.new("TextLabel")
WelcomeText.Size = UDim2.new(1, -150, 0, 30)
WelcomeText.Position = UDim2.new(0, 25, 0, 20)
WelcomeText.BackgroundTransparency = 1
WelcomeText.Text = "Welcome home, " .. LocalPlayer.Name
WelcomeText.TextColor3 = Color3.fromRGB(255, 255, 255)
WelcomeText.TextSize = 18
WelcomeText.Font = Enum.Font.GothamBold
WelcomeText.TextXAlignment = Enum.TextXAlignment.Left
WelcomeText.Parent = MainContainer

local SubText = Instance.new("TextLabel")
SubText.Size = UDim2.new(1, -150, 0, 20)
SubText.Position = UDim2.new(0, 25, 0, 45)
SubText.BackgroundTransparency = 1
SubText.Text = "T A N T U N I"
SubText.TextColor3 = Color3.fromRGB(190, 120, 255)
SubText.TextSize = 12
SubText.Font = Enum.Font.GothamBold
SubText.TextXAlignment = Enum.TextXAlignment.Left
SubText.Parent = MainContainer

-- Üst Panel (Fly / ESP)
local TopPanel = Instance.new("Frame")
TopPanel.Size = UDim2.new(1, -50, 0, 75)
TopPanel.Position = UDim2.new(0, 25, 0, 80)
TopPanel.BackgroundColor3 = Color3.fromRGB(30, 18, 50)
TopPanel.BackgroundTransparency = 0.3
TopPanel.BorderSizePixel = 0
TopPanel.Parent = MainContainer

local TopPanelCorner = Instance.new("UICorner")
TopPanelCorner.CornerRadius = UDim.new(0, 10)
TopPanelCorner.Parent = TopPanel

-- Fly Kutusu
local FlyBox = Instance.new("Frame")
FlyBox.Size = UDim2.new(0.47, 0, 1, -16)
FlyBox.Position = UDim2.new(0, 8, 0, 8)
FlyBox.BackgroundColor3 = Color3.fromRGB(45, 25, 75)
FlyBox.BackgroundTransparency = 0.2
FlyBox.BorderSizePixel = 0
FlyBox.Parent = TopPanel

local FlyCorner = Instance.new("UICorner")
FlyCorner.CornerRadius = UDim.new(0, 8)
FlyCorner.Parent = FlyBox

local FlyTitle = Instance.new("TextLabel")
FlyTitle.Size = UDim2.new(1, 0, 0, 25)
FlyTitle.Position = UDim2.new(0, 0, 0, 10)
FlyTitle.BackgroundTransparency = 1
FlyTitle.Text = "Fly"
FlyTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
FlyTitle.TextSize = 14
FlyTitle.Font = Enum.Font.GothamBold
FlyTitle.Parent = FlyBox

local FlySub = Instance.new("TextLabel")
FlySub.Size = UDim2.new(1, 0, 0, 20)
FlySub.Position = UDim2.new(0, 0, 0, 32)
FlySub.BackgroundTransparency = 1
FlySub.Text = "Kapalı"
FlySub.TextColor3 = Color3.fromRGB(180, 170, 200)
FlySub.TextSize = 11
FlySub.Font = Enum.Font.Gotham
FlySub.Parent = FlyBox

-- ESP Kutusu
local EspBox = Instance.new("Frame")
EspBox.Size = UDim2.new(0.47, 0, 1, -16)
EspBox.Position = UDim2.new(0.53, -4, 0, 8)
EspBox.BackgroundColor3 = Color3.fromRGB(45, 25, 75)
EspBox.BackgroundTransparency = 0.2
EspBox.BorderSizePixel = 0
EspBox.Parent = TopPanel

local EspCorner = Instance.new("UICorner")
EspCorner.CornerRadius = UDim.new(0, 8)
EspCorner.Parent = EspBox

local EspTitle = Instance.new("TextLabel")
EspTitle.Size = UDim2.new(1, 0, 0, 25)
EspTitle.Position = UDim2.new(0, 0, 0, 10)
EspTitle.BackgroundTransparency = 1
EspTitle.Text = "ESP"
EspTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
EspTitle.TextSize = 14
EspTitle.Font = Enum.Font.GothamBold
EspTitle.Parent = EspBox

local EspSub = Instance.new("TextLabel")
EspSub.Size = UDim2.new(1, 0, 0, 20)
EspSub.Position = UDim2.new(0, 0, 0, 32)
EspSub.BackgroundTransparency = 1
EspSub.Text = "Panel"
EspSub.TextColor3 = Color3.fromRGB(180, 170, 200)
EspSub.TextSize = 11
EspSub.Font = Enum.Font.Gotham
EspSub.Parent = EspBox

-- Sol Profil Kartı
local ProfileCard = Instance.new("Frame")
ProfileCard.Size = UDim2.new(0.47, 0, 0, 210)
ProfileCard.Position = UDim2.new(0, 25, 0, 170)
ProfileCard.BackgroundColor3 = Color3.fromRGB(30, 18, 50)
ProfileCard.BackgroundTransparency = 0.3
ProfileCard.BorderSizePixel = 0
ProfileCard.Parent = MainContainer

local ProfileCorner = Instance.new("UICorner")
ProfileCorner.CornerRadius = UDim.new(0, 10)
ProfileCorner.Parent = ProfileCard

local AvatarImage = Instance.new("ImageLabel")
AvatarImage.Size = UDim2.new(0, 70, 0, 70)
AvatarImage.Position = UDim2.new(0.5, -35, 0, 25)
AvatarImage.BackgroundTransparency = 1
AvatarImage.Image = Players:GetUserThumbnailAsync(LocalPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size150x150)
AvatarImage.Parent = ProfileCard

local AvatarCorner = Instance.new("UICorner")
AvatarCorner.CornerRadius = UDim.new(1, 0)
AvatarCorner.Parent = AvatarImage

local NameLabel = Instance.new("TextLabel")
NameLabel.Size = UDim2.new(1, 0, 0, 25)
NameLabel.Position = UDim2.new(0, 0, 0, 105)
NameLabel.BackgroundTransparency = 1
NameLabel.Text = LocalPlayer.Name
NameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
NameLabel.TextSize = 14
NameLabel.Font = Enum.Font.GothamBold
NameLabel.Parent = ProfileCard

local TagLabel = Instance.new("TextLabel")
TagLabel.Size = UDim2.new(1, 0, 0, 20)
TagLabel.Position = UDim2.new(0, 0, 0, 125)
TagLabel.BackgroundTransparency = 1
TagLabel.Text = "@" .. LocalPlayer.Name
TagLabel.TextColor3 = Color3.fromRGB(180, 170, 200)
TagLabel.TextSize = 11
TagLabel.Font = Enum.Font.Gotham
TagLabel.Parent = ProfileCard

-- SAĞ AKTİVİTE PANELİ (Aktif Oyun & Arkadaş Aktifliği)
local ActivityCard = Instance.new("Frame")
ActivityCard.Size = UDim2.new(0.47, 0, 0, 210)
ActivityCard.Position = UDim2.new(0.53, -4, 0, 170)
ActivityCard.BackgroundColor3 = Color3.fromRGB(30, 18, 50)
ActivityCard.BackgroundTransparency = 0.3
ActivityCard.BorderSizePixel = 0
ActivityCard.Parent = MainContainer

local ActivityCorner = Instance.new("UICorner")
ActivityCorner.CornerRadius = UDim.new(0, 10)
ActivityCorner.Parent = ActivityCard

-- 1. Kısım: Aktif Oyun (Senin Oynadığın Oyun)
local CurrentGameTitle = Instance.new("TextLabel")
CurrentGameTitle.Size = UDim2.new(1, -20, 0, 18)
CurrentGameTitle.Position = UDim2.new(0, 15, 0, 12)
CurrentGameTitle.BackgroundTransparency = 1
CurrentGameTitle.Text = "Aktif Oyun"
CurrentGameTitle.TextColor3 = Color3.fromRGB(190, 120, 255)
CurrentGameTitle.TextSize = 12
CurrentGameTitle.Font = Enum.Font.GothamBold
CurrentGameTitle.TextXAlignment = Enum.TextXAlignment.Left
CurrentGameTitle.Parent = ActivityCard

local CurrentGameName = Instance.new("TextLabel")
CurrentGameName.Size = UDim2.new(1, -20, 0, 20)
CurrentGameName.Position = UDim2.new(0, 15, 0, 28)
CurrentGameName.BackgroundTransparency = 1
CurrentGameName.TextColor3 = Color3.fromRGB(255, 255, 255)
CurrentGameName.TextSize = 11
CurrentGameName.Font = Enum.Font.GothamMedium
CurrentGameName.TextXAlignment = Enum.TextXAlignment.Left
CurrentGameName.Parent = ActivityCard

-- Oyun adını otomatik çek
task.spawn(function()
    local success, info = pcall(function()
        return MarketplaceService:GetProductInfo(game.PlaceId)
    end)
    if success and info and info.Name then
        CurrentGameName.Text = info.Name
    else
        CurrentGameName.Text = "Roblox Experience"
    end
end)

-- Ayırıcı Çizgi
local Divider = Instance.new("Frame")
Divider.Size = UDim2.new(1, -30, 0, 1)
Divider.Position = UDim2.new(0, 15, 0, 54)
Divider.BackgroundColor3 = Color3.fromRGB(80, 50, 120)
Divider.BackgroundTransparency = 0.5
Divider.BorderSizePixel = 0
Divider.Parent = ActivityCard

-- 2. Kısım: Arkadaş Aktifliği Başlığı
local FriendActivityTitle = Instance.new("TextLabel")
FriendActivityTitle.Size = UDim2.new(1, -20, 0, 18)
FriendActivityTitle.Position = UDim2.new(0, 15, 0, 60)
FriendActivityTitle.BackgroundTransparency = 1
FriendActivityTitle.Text = "Arkadaş Aktifliği"
FriendActivityTitle.TextColor3 = Color3.fromRGB(190, 120, 255)
FriendActivityTitle.TextSize = 12
FriendActivityTitle.Font = Enum.Font.GothamBold
FriendActivityTitle.TextXAlignment = Enum.TextXAlignment.Left
FriendActivityTitle.Parent = ActivityCard

-- Arkadaşların durumunu listeleyecek Scroll alanı
local FriendScroll = Instance.new("ScrollingFrame")
FriendScroll.Size = UDim2.new(1, -10, 0, 125)
FriendScroll.Position = UDim2.new(0, 5, 0, 80)
FriendScroll.BackgroundTransparency = 1
FriendScroll.BorderSizePixel = 0
FriendScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
FriendScroll.ScrollBarThickness = 3
FriendScroll.Parent = ActivityCard

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 4)
UIListLayout.Parent = FriendScroll

-- Arkadaşları tara ve oyun adlarını çözüp listele
local function updateFriends()
    for _, child in ipairs(FriendScroll:GetChildren()) do
        if child:IsA("Frame") then child:Destroy() end
    end
    
    local success, pages = pcall(function()
        return LocalPlayer:GetFriendsOnline()
    end)
    
    if success and pages then
        local count = 0
        for _, friend in ipairs(pages) do
            count = count + 1
            local fFrame = Instance.new("Frame")
            fFrame.Size = UDim2.new(1, -5, 0, 32)
            fFrame.BackgroundColor3 = Color3.fromRGB(40, 22, 65)
            fFrame.BackgroundTransparency = 0.4
            fFrame.BorderSizePixel = 0
            fFrame.Parent = FriendScroll
            
            local fCorner = Instance.new("UICorner")
            fCorner.CornerRadius = UDim.new(0, 6)
            fCorner.Parent = fFrame
            
            local fName = Instance.new("TextLabel")
            fName.Size = UDim2.new(1, -10, 0, 14)
            fName.Position = UDim2.new(0, 5, 0, 2)
            fName.BackgroundTransparency = 1
            fName.Text = friend.UserName
            fName.TextColor3 = Color3.fromRGB(240, 240, 255)
            fName.TextSize = 11
            fName.Font = Enum.Font.GothamBold
            fName.TextXAlignment = Enum.TextXAlignment.Left
            fName.Parent = fFrame
            
            local fGame = Instance.new("TextLabel")
            fGame.Size = UDim2.new(1, -10, 0, 14)
            fGame.Position = UDim2.new(0, 5, 0, 16)
            fGame.BackgroundTransparency = 1
            fGame.Text = "Yükleniyor..."
            fGame.TextColor3 = Color3.fromRGB(180, 160, 210)
            fGame.TextSize = 10
            fGame.Font = Enum.Font.Gotham
            fGame.TextXAlignment = Enum.TextXAlignment.Left
            fGame.Parent = fFrame

            -- Arkadaşın oynadığı oyunun gerçek adını çöz
            task.spawn(function()
                local gameName = "Oyunda"
                if friend.PlaceId then
                    local pSuccess, pInfo = pcall(function()
                        return MarketplaceService:GetProductInfo(friend.PlaceId)
                    end)
                    if pSuccess and pInfo and pInfo.Name then
                        gameName = pInfo.Name
                    end
                elseif friend.Location and friend.Location ~= "" then
                    gameName = friend.Location
                end
                fGame.Text = gameName
            end)
        end
        FriendScroll.CanvasSize = UDim2.new(0, 0, 0, count * 36)
    end
end

task.spawn(updateFriends)

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

-- --- DELETE TUŞU İLE AÇ/KAPA ---
local isOpen = true
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.Delete then
        isOpen = not isOpen
        MainContainer.Visible = isOpen
    end
end)
