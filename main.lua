-- TANTUNI Multi-Purpose Menu Base | v3.0 (Fixed Draggable & Clean Purple Theme)
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")

-- Önceki kalıntıları temizle
if CoreGui:FindFirstChild("TantuniLoader") then CoreGui.TantuniLoader:Destroy() end
if CoreGui:FindFirstChild("TantuniMenu") then CoreGui.TantuniMenu:Destroy() end

-- Renk Paleti (Mor & Koyu Tema)
local Colors = {
    primary = Color3.fromRGB(150, 80, 220),      -- Canlı Mor
    bg = Color3.fromRGB(18, 18, 22),              -- Ana Arkaplan (Çok Koyu Gri/Siyah)
    title_bg = Color3.fromRGB(45, 25, 75),       -- Başlık Çubuğu (Koyu Mor Arkaplan)
    text = Color3.fromRGB(255, 255, 255),        -- Beyaz Metin
    text_muted = Color3.fromRGB(180, 180, 190)   -- Soluk Metin
}

-- 1. LOADER (YÜKLEME EKRANI)
local LoaderGui = Instance.new("ScreenGui")
LoaderGui.Name = "TantuniLoader"
LoaderGui.Parent = CoreGui

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 320, 0, 160)
MainFrame.Position = UDim2.new(0.5, -160, 0.5, -80)
MainFrame.BackgroundColor3 = Colors.bg
MainFrame.BorderSizePixel = 0
MainFrame.Parent = LoaderGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 50)
Title.Position = UDim2.new(0, 0, 0, 15)
Title.BackgroundTransparency = 1
Title.Text = "T A N T U N I"
Title.TextColor3 = Colors.primary
Title.TextSize = 24
Title.Font = Enum.Font.GothamBold
Title.Parent = MainFrame

local PercentText = Instance.new("TextLabel")
PercentText.Size = UDim2.new(1, 0, 0, 30)
PercentText.Position = UDim2.new(0, 0, 0, 65)
PercentText.BackgroundTransparency = 1
PercentText.Text = "Sistemler Yükleniyor... %0"
PercentText.TextColor3 = Colors.text_muted
PercentText.TextSize = 14
PercentText.Font = Enum.Font.Gotham
PercentText.Parent = MainFrame

local BarBg = Instance.new("Frame")
BarBg.Size = UDim2.new(0, 260, 0, 8)
BarBg.Position = UDim2.new(0.5, -130, 0, 115)
BarBg.BackgroundColor3 = Color3.fromRGB(30, 30, 38)
BarBg.BorderSizePixel = 0
BarBg.Parent = MainFrame

local BarBgCorner = Instance.new("UICorner")
BarBgCorner.CornerRadius = UDim.new(1, 0)
BarBgCorner.Parent = BarBg

local BarFill = Instance.new("Frame")
BarFill.Size = UDim2.new(0, 0, 1, 0)
BarFill.BackgroundColor3 = Colors.primary
BarFill.BorderSizePixel = 0
BarFill.Parent = BarBg

local BarFillCorner = Instance.new("UICorner")
BarFillCorner.CornerRadius = UDim.new(1, 0)
BarFillCorner.Parent = BarFill

-- Yükleme Animasyonu
for i = 1, 100 do
    PercentText.Text = "Yükleniyor... %" .. i
    BarFill.Size = UDim2.new(i / 100, 0, 1, 0)
    task.wait(0.012)
end

PercentText.Text = "Hazır! Menü Açılıyor..."
task.wait(0.4)
LoaderGui:Destroy()

-- 2. ANA MENÜ
local MenuGui = Instance.new("ScreenGui")
MenuGui.Name = "TantuniMenu"
MenuGui.Parent = CoreGui

local Window = Instance.new("Frame")
Window.Size = UDim2.new(0, 450, 0, 300)
Window.Position = UDim2.new(0.5, -225, 0.5, -150)
Window.BackgroundColor3 = Colors.bg
Window.BorderSizePixel = 0
Window.Parent = MenuGui
Window.Visible = true

local WindowCorner = Instance.new("UICorner")
WindowCorner.CornerRadius = UDim.new(0, 8)
WindowCorner.Parent = Window

-- Menü Başlığı (Mor Arkaplan)
local MenuTitle = Instance.new("TextLabel")
MenuTitle.Size = UDim2.new(1, 0, 0, 42)
MenuTitle.Position = UDim2.new(0, 0, 0, 0)
MenuTitle.BackgroundColor3 = Colors.title_bg
MenuTitle.Text = "  TANTUNI | Çok Amaçlı Kontrol Paneli"
MenuTitle.TextColor3 = Colors.text
MenuTitle.TextSize = 14
MenuTitle.Font = Enum.Font.GothamBold
MenuTitle.TextXAlignment = Enum.TextXAlignment.Left
MenuTitle.Parent = Window

local MenuTitleCorner = Instance.new("UICorner")
MenuTitleCorner.CornerRadius = UDim.new(0, 8)
MenuTitleCorner.Parent = MenuTitle

-- Başlığın altındaki köşeli kısımları düzeltmek için küçük hile (Görsel bütünlük için)
local FixFrame = Instance.new("Frame")
FixFrame.Size = UDim2.new(1, 0, 0, 10)
FixFrame.Position = UDim2.new(0, 0, 1, -10)
FixFrame.BackgroundColor3 = Colors.title_bg
FixFrame.BorderSizePixel = 0
FixFrame.Parent = MenuTitle

-- İçerik Yazısı
local InfoLabel = Instance.new("TextLabel")
InfoLabel.Size = UDim2.new(1, -40, 1, -80)
InfoLabel.Position = UDim2.new(0, 20, 0, 55)
InfoLabel.BackgroundTransparency = 1
InfoLabel.Text = "Üstteki mor başlıktan tutarak menüyü dilediğin gibi sürükleyebilirsin.\n\nMenüyü gizlemek / açmak için [Delete] tuşunu kullanabilirsin."
InfoLabel.TextColor3 = Colors.text_muted
InfoLabel.TextSize = 14
InfoLabel.Font = Enum.Font.Gotham
InfoLabel.TextWrapped = true
InfoLabel.Parent = Window

-- --- KUSURSUZ SÜRÜKLE-BIRAK (DRAGGABLE) SİSTEMİ ---
local dragging, dragInput, mousePos, framePos

MenuTitle.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        mousePos = input.Position
        framePos = Window.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

MenuTitle.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - mousePos
        Window.Position = UDim2.new(
            framePos.X.Scale, 
            framePos.X.Offset + delta.X, 
            framePos.Y.Scale, 
            framePos.Y.Offset + delta.Y
        )
    end
end)

-- --- DELETE TUŞU İLE GİZLE/GÖSTER ---
local isOpen = true
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.Delete then
        isOpen = not isOpen
        Window.Visible = isOpen
    end
end)
