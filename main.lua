-- TANTUNI Multi-Purpose Menu | Dinamik Hesap & TANTUNI Başlıklı
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Önceki kalıntıları temizle
if CoreGui:FindFirstChild("TantuniLoader") then CoreGui.TantuniLoader:Destroy() end
if CoreGui:FindFirstChild("TantuniMenu") then CoreGui.TantuniMenu:Destroy() end

-- 1. LOADER (YÜKLEME EKRANI - TANTUNI İsimli)
local LoaderGui = Instance.new("ScreenGui")
LoaderGui.Name = "TantuniLoader"
LoaderGui.Parent = CoreGui

local LoaderFrame = Instance.new("Frame")
LoaderFrame.Size = UDim2.new(0, 420, 0, 160)
LoaderFrame.Position = UDim2.new(0.5, -210, 0.5, -80)
LoaderFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
LoaderFrame.BorderSizePixel = 0
LoaderFrame.Parent = LoaderGui

local LoaderCorner = Instance.new("UICorner")
LoaderCorner.CornerRadius = UDim.new(0, 12)
LoaderCorner.Parent = LoaderFrame

local LoaderStroke = Instance.new("UIStroke")
LoaderStroke.Color = Color3.fromRGB(120, 60, 200)
LoaderStroke.Transparency = 0.5
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
LoaderSub.Text = "T A N T U N I" -- Burası değiştirildi
LoaderSub.TextColor3 = Color3.fromRGB(180, 100, 255)
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
BarBg.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
BarBg.BorderSizePixel = 0
BarBg.Parent = LoaderFrame

local BarBgCorner = Instance.new("UICorner")
BarBgCorner.CornerRadius = UDim.new(1, 0)
BarBgCorner.Parent = BarBg

local BarFill = Instance.new("Frame")
BarFill.Size = UDim2.new(0, 0, 1, 0)
BarFill.BackgroundColor3 = Color3.fromRGB(147, 51, 234)
BarFill.BorderSizePixel = 0
BarFill.Parent = BarBg

local BarFillCorner = Instance.new("UICorner")
BarFillCorner.CornerRadius = UDim.new(1, 0)
BarFillCorner.Parent = BarFill

-- Yükleme Animasyonu
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
MainContainer.BackgroundColor3 = Color3.fromRGB(12, 12, 16)
MainContainer.BorderSizePixel = 0
MainContainer.Parent = MenuGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 12)
MainCorner.Parent = MainContainer

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(110, 40, 180)
MainStroke.Transparency = 0.4
MainStroke.Parent = MainContainer

-- Üst Bilgi Satırı (Dinamik Hesap İsmi)
local WelcomeText = Instance.new("TextLabel")
WelcomeText.Size = UDim2.new(1, -150, 0, 30)
WelcomeText.Position = UDim2.new(0, 25, 0, 20)
WelcomeText.BackgroundTransparency = 1
WelcomeText.Text = "Welcome home, " .. LocalPlayer.Name -- Oyuna kim girerse onun adı yazar
WelcomeText.TextColor3 = Color3.fromRGB(255, 255, 255)
WelcomeText.TextSize = 18
WelcomeText.Font = Enum.Font.GothamBold
WelcomeText.TextXAlignment = Enum.TextXAlignment.Left
WelcomeText.Parent = MainContainer

local SubText = Instance.new("TextLabel")
SubText.Size = UDim2.new(1, -150, 0, 20)
SubText.Position = UDim2.new(0, 25, 0, 45)
SubText.BackgroundTransparency = 1
SubText.Text = "T A N T U N I" -- Burası da TANTUNI yapıldı
SubText.TextColor3 = Color3.fromRGB(180, 100, 255)
SubText.TextSize = 12
SubText.Font = Enum.Font.GothamBold
SubText.TextXAlignment = Enum.TextXAlignment.Left
SubText.Parent = MainContainer

-- Üst Panel (Fly / ESP)
local TopPanel = Instance.new("Frame")
TopPanel.Size = UDim2.new(1, -50, 0, 75)
TopPanel.Position = UDim2.new(0, 25, 0, 80)
TopPanel.BackgroundColor3 = Color3.fromRGB(20, 20, 28)
TopPanel.BorderSizePixel = 0
TopPanel.Parent = MainContainer

local TopPanelCorner = Instance.new("UICorner")
TopPanelCorner.CornerRadius = UDim.new(0, 10)
TopPanelCorner.Parent = TopPanel

-- Fly Kutusu
local FlyBox = Instance.new("Frame")
FlyBox.Size = UDim2.new(0.47, 0, 1, -16)
FlyBox.Position = UDim2.new(0, 8, 0, 8)
FlyBox.BackgroundColor3 = Color3.fromRGB(28, 28, 38)
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
FlySub.TextColor3 = Color3.fromRGB(150, 150, 160)
FlySub.TextSize = 11
FlySub.Font = Enum.Font.Gotham
FlySub.Parent = FlyBox

-- ESP Kutusu
local EspBox = Instance.new("Frame")
EspBox.Size = UDim2.new(0.47, 0, 1, -16)
EspBox.Position = UDim2.new(0.53, -4, 0, 8)
EspBox.BackgroundColor3 = Color3.fromRGB(28, 28, 38)
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
EspSub.TextColor3 = Color3.fromRGB(150, 150, 160)
EspSub.TextSize = 11
EspSub.Font = Enum.Font.Gotham
EspSub.Parent = EspBox

-- Sol Profil Kartı (Dinamik İsim)
local ProfileCard = Instance.new("Frame")
ProfileCard.Size = UDim2.new(0.47, 0, 0, 210)
ProfileCard.Position = UDim2.new(0, 25, 0, 170)
ProfileCard.BackgroundColor3 = Color3.fromRGB(20, 20, 28)
ProfileCard.BorderSizePixel = 0
ProfileCard.Parent = MainContainer

local ProfileCorner = Instance.new("UICorner")
ProfileCorner.CornerRadius = UDim.new(0, 10)
ProfileCorner.Parent = ProfileCard

local AvatarCircle = Instance.new("Frame")
AvatarCircle.Size = UDim2.new(0, 70, 0, 70)
AvatarCircle.Position = UDim2.new(0.5, -35, 0, 25)
AvatarCircle.BackgroundColor3 = Color3.fromRGB(130, 50, 210)
AvatarCircle.BorderSizePixel = 0
AvatarCircle.Parent = ProfileCard

local AvatarCorner = Instance.new("UICorner")
AvatarCorner.CornerRadius = UDim.new(1, 0)
AvatarCorner.Parent = AvatarCircle

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
TagLabel.TextColor3 = Color3.fromRGB(140, 140, 160)
TagLabel.TextSize = 11
TagLabel.Font = Enum.Font.Gotham
TagLabel.Parent = ProfileCard

-- Sağ Aktivite Paneli
local ActivityCard = Instance.new("Frame")
ActivityCard.Size = UDim2.new(0.47, 0, 0, 210)
ActivityCard.Position = UDim2.new(0.53, -4, 0, 170)
ActivityCard.BackgroundColor3 = Color3.fromRGB(20, 20, 28)
ActivityCard.BorderSizePixel = 0
ActivityCard.Parent = MainContainer

local ActivityCorner = Instance.new("UICorner")
ActivityCorner.CornerRadius = UDim.new(0, 10)
ActivityCorner.Parent = ActivityCard

local ActivityTitle = Instance.new("TextLabel")
ActivityTitle.Size = UDim2.new(1, -20, 0, 30)
ActivityTitle.Position = UDim2.new(0, 15, 0, 15)
ActivityTitle.BackgroundTransparency = 1
ActivityTitle.Text = "Friend Activity"
ActivityTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
ActivityTitle.TextSize = 14
ActivityTitle.Font = Enum.Font.GothamBold
ActivityTitle.TextXAlignment = Enum.TextXAlignment.Left
ActivityTitle.Parent = ActivityCard

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
        end
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
