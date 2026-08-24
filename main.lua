-- TANTUNI Multi-Purpose Menu Base
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

-- Önceki kalıntıları temizle (Çift çalışmayı önler)
if CoreGui:FindFirstChild("TantuniLoader") then CoreGui.TantuniLoader:Destroy() end
if CoreGui:FindFirstChild("TantuniMenu") then CoreGui.TantuniMenu:Destroy() end

-- 1. LOADER (YÜKLEME EKRANI)
local LoaderGui = Instance.new("ScreenGui")
LoaderGui.Name = "TantuniLoader"
LoaderGui.Parent = CoreGui

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 320, 0, 160)
MainFrame.Position = UDim2.new(0.5, -160, 0.5, -80)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = LoaderGui

-- Köşeleri yuvarlatma
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = MainFrame

-- Başlık: T A N T U N I
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 50)
Title.Position = UDim2.new(0, 0, 0, 15)
Title.BackgroundTransparency = 1
Title.Text = "T A N T U N I"
Title.TextColor3 = Color3.fromRGB(255, 100, 100)
Title.TextSize = 24
Title.Font = Enum.Font.GothamBold
Title.Parent = MainFrame

-- Yüzde Yazısı
local PercentText = Instance.new("TextLabel")
PercentText.Size = UDim2.new(1, 0, 0, 30)
PercentText.Position = UDim2.new(0, 0, 0, 65)
PercentText.BackgroundTransparency = 1
PercentText.Text = "Lua Hazırlanıyor... %0"
PercentText.TextColor3 = Color3.fromRGB(200, 200, 200)
PercentText.TextSize = 14
PercentText.Font = Enum.Font.Gotham
PercentText.Parent = MainFrame

-- Yükleme Barı Arka Planı
local BarBg = Instance.new("Frame")
BarBg.Size = UDim2.new(0, 260, 0, 8)
BarBg.Position = UDim2.new(0.5, -130, 0, 115)
BarBg.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
BarBg.BorderSizePixel = 0
BarBg.Parent = MainFrame

local BarBgCorner = Instance.new("UICorner")
BarBgCorner.CornerRadius = UDim.new(1, 0)
BarBgCorner.Parent = BarBg

-- Dolan Yükleme Barı
local BarFill = Instance.new("Frame")
BarFill.Size = UDim2.new(0, 0, 1, 0)
BarFill.BackgroundColor3 = Color3.fromRGB(255, 100, 100)
BarFill.BorderSizePixel = 0
BarFill.Parent = BarBg

local BarFillCorner = Instance.new("UICorner")
BarFillCorner.CornerRadius = UDim.new(1, 0)
BarFillCorner.Parent = BarFill

-- Yükleme Simülasyonu (0'dan 100'e)
for i = 1, 100 do
    PercentText.Text = "Lua Yükleniyor... %" .. i
    BarFill.Size = UDim2.new(i / 100, 0, 1, 0)
    task.wait(0.015) -- Yükleme hızını buradan ayarlayabilirsin
end

PercentText.Text = "Lua Hazır! Menü Açılıyor..."
task.wait(0.5)

-- Loader'ı yok et
LoaderGui:Destroy()

-- 2. ANA MENÜ (DELETE İLE KONTROL EDİLEN)
local MenuGui = Instance.new("ScreenGui")
MenuGui.Name = "TantuniMenu"
MenuGui.Parent = CoreGui

local Window = Instance.new("Frame")
Window.Size = UDim2.new(0, 450, 0, 300)
Window.Position = UDim2.new(0.5, -225, 0.5, -150)
Window.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
Window.BorderSizePixel = 0
Window.Parent = MenuGui

local WindowCorner = Instance.new("UICorner")
WindowCorner.CornerRadius = UDim.new(0, 8)
WindowCorner.Parent = Window

-- Menü Başlığı
local MenuTitle = Instance.new("TextLabel")
MenuTitle.Size = UDim2.new(1, 0, 0, 40)
MenuTitle.Position = UDim2.new(0, 0, 0, 0)
MenuTitle.BackgroundColor3 = Color3.fromRGB(35, 35, 42)
MenuTitle.Text = "  TANTUNI | Çok Amaçlı Kontrol Paneli"
MenuTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
MenuTitle.TextSize = 15
MenuTitle.Font = Enum.Font.GothamBold
MenuTitle.TextXAlignment = Enum.TextXAlignment.Left
MenuTitle.Parent = Window

local MenuTitleCorner = Instance.new("UICorner")
MenuTitleCorner.CornerRadius = UDim.new(0, 8)
MenuTitleCorner.Parent = MenuTitle

-- Bilgi Notu / İçerik Alanı
local InfoLabel = Instance.new("TextLabel")
InfoLabel.Size = UDim2.new(1, -40, 1, -80)
InfoLabel.Position = UDim2.new(0, 20, 0, 55)
InfoLabel.BackgroundTransparency = 1
InfoLabel.Text = "Menüyü kapatıp açmak için klavyeden [Delete] tuşunu kullanabilirsin.\n\nBuraya dilediğin gibi ek özellikler, butonlar ve toggle'lar ekleyebilirsin!"
InfoLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
InfoLabel.TextSize = 14
InfoLabel.Font = Enum.Font.Gotham
InfoLabel.TextWrapped = true
InfoLabel.Parent = Window

-- Delete Tuşu ile Menüyü Gizleme / Açma Mekanizması
local isOpen = true
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if input.KeyCode == Enum.KeyCode.Delete then
        isOpen = not isOpen
        Window.Visible = isOpen
    end
end)
