-- TANTUNI Multi-Purpose Menu Base | v2.0 (Draggable & Purple)
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

-- Önceki kalıntıları temizle
if CoreGui:FindFirstChild("TantuniLoader") then CoreGui.TantuniLoader:Destroy() end
if CoreGui:FindFirstChild("TantuniMenu") then CoreGui.TantuniMenu:Destroy() end

-- Renk Paleti (Mor Tema)
local Colors = {
    primary = Color3.fromRGB(147, 112, 219), -- Medium Purple
    accent = Color3.fromRGB(186, 85, 211),  -- Medium Orchid
    bg = Color3.fromRGB(25, 25, 30),         -- Koyu Gri (Ana Arkaplan)
    title_bg = Color3.fromRGB(35, 35, 42),    -- Koyu Gri (Başlık Çubuğu)
    text = Color3.fromRGB(255, 255, 255),
    text_muted = Color3.fromRGB(200, 200, 200)
}

-- 1. LOADER (YÜKLEME EKRANI) - Mor Tema
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
Title.TextColor3 = Colors.primary -- Mor Başlık
Title.TextSize = 24
Title.Font = Enum.Font.GothamBold
Title.Parent = MainFrame

local PercentText = Instance.new("TextLabel")
PercentText.Size = UDim2.new(1, 0, 0, 30)
PercentText.Position = UDim2.new(0, 0, 0, 65)
PercentText.BackgroundTransparency = 1
PercentText.Text = "Başlatılıyor... %0"
PercentText.TextColor3 = Colors.text_muted
PercentText.TextSize = 14
PercentText.Font = Enum.Font.Gotham
PercentText.Parent = MainFrame

local BarBg = Instance.new("Frame")
BarBg.Size = UDim2.new(0, 260, 0, 8)
BarBg.Position = UDim2.new(0.5, -130, 0, 115)
BarBg.BackgroundColor3 = Color3.fromRGB(45, 45, 55) -- Hafif daha açık koyu gri
BarBg.BorderSizePixel = 0
BarBg.Parent = MainFrame

local BarBgCorner = Instance.new("UICorner")
BarBgCorner.CornerRadius = UDim.new(1, 0)
BarBgCorner.Parent = BarBg

local BarFill = Instance.new("Frame")
BarFill.Size = UDim2.new(0, 0, 1, 0)
BarFill.BackgroundColor3 = Colors.primary -- Mor Yükleme Barı
BarFill.BorderSizePixel = 0
BarFill.Parent = BarBg

local BarFillCorner = Instance.new("UICorner")
BarFillCorner.CornerRadius = UDim.new(1, 0)
BarFillCorner.Parent = BarFill

-- Yükleme Animasyonu
for i = 1, 100 do
    PercentText.Text = "Yükleniyor... %" .. i
    BarFill.Size = UDim2.new(i / 100, 0, 1, 0)
    task.wait(0.015)
end

PercentText.Text = "Tantuni Aktif! İyi Eğlenceler..."
task.wait(0.5)
LoaderGui:Destroy()

-- 2. ANA MENÜ (SÜRÜKLENEBİLİR & MOR TEMA)
local MenuGui = Instance.new("ScreenGui")
MenuGui.Name = "TantuniMenu"
MenuGui.Parent = CoreGui

local Window = Instance.new("Frame")
Window.Size = UDim2.new(0, 450, 0, 300)
Window.Position = UDim2.new(0.5, -225, 0.5, -150)
Window.BackgroundColor3 = Colors.bg
Window.BorderSizePixel = 0
Window.Parent = MenuGui
Window.Visible = true -- Başlangıçta görünür

local WindowCorner = Instance.new("UICorner")
WindowCorner.CornerRadius = UDim.new(0, 8)
WindowCorner.Parent = Window

-- Menü Başlığı (Sürükleme Alanı)
local MenuTitle = Instance.new("TextLabel")
MenuTitle.Size = UDim2.new(1, 0, 0, 40)
MenuTitle.Position = UDim2.new(0, 0, 0, 0)
MenuTitle.BackgroundColor3 = Colors.title_bg -- Koyu gri başlık
MenuTitle.Text = "  TANTUNI | Mor Kontrol Paneli"
MenuTitle.TextColor3 = Colors.text
MenuTitle.TextSize = 15
MenuTitle.Font = Enum.Font.GothamBold
MenuTitle.TextXAlignment = Enum.TextXAlignment.Left
MenuTitle.Parent = Window

local MenuTitleCorner = Instance.new("UICorner")
MenuTitleCorner.CornerRadius = UDim.new(0, 8)
MenuTitleCorner.Parent = MenuTitle

-- Kapatma Butonu (Opsiyonel ama iyi durur)
local CloseButton = Instance.new("TextButton")
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Position = UDim2.new(1, -35, 0, 5)
CloseButton.BackgroundTransparency = 1
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(200, 200, 200)
CloseButton.TextSize = 18
CloseButton.Font = Enum.Font.GothamBold
CloseButton.Parent = MenuTitle

CloseButton.MouseButton1Click:Connect(function()
    MenuGui:Destroy() -- Menüyü tamamen kapatır (Delete ile tekrar açılmaz)
end)

-- İçerik Alanı
local InfoLabel = Instance.new("TextLabel")
InfoLabel.Size = UDim2.new(1, -40, 1, -80)
InfoLabel.Position = UDim2.new(0, 20, 0, 55)
InfoLabel.BackgroundTransparency = 1
InfoLabel.Text = "Artık bu menüyü başlık kısmından tutarak sürükleyebilirsin!\n\nMenüyü tamamen kapatıp açmak için klavyeden [Delete] tuşunu kullanabilirsin."
InfoLabel.TextColor3 = Colors.text_muted
InfoLabel.TextSize = 14
InfoLabel.Font = Enum.Font.Gotham
InfoLabel.TextWrapped = true
InfoLabel.Parent = Window

-- --- SÜRÜKLE-BIRAK (DRAGGABLE) SCRIPTI ---
local dragging
local dragInput
local dragStart
local startPos

local function update(input)
    local delta = input.Position - dragStart
    local tweenInfo = TweenInfo.new(0.1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out) -- Yumuşak hareket
    local targetPos = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    TweenService:Create(Window, tweenInfo, {Position = targetPos}):Play()
end

MenuTitle.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = Window.Position
        
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
        update(input)
    end
end)

-- --- GİZLE/GÖSTER (DELETE) MEKANİZMASI ---
local isOpen = true
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.Delete then
        isOpen = not isOpen
        Window.Visible = isOpen
    end
end)
