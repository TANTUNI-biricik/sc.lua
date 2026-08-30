-- TANTUNI Chat Logger
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")
local TextChatService = game:GetService("TextChatService")
local LocalPlayer = Players.LocalPlayer

if CoreGui:FindFirstChild("TantuniLoader") then CoreGui.TantuniLoader:Destroy() end
if CoreGui:FindFirstChild("TantuniMenu") then CoreGui.TantuniMenu:Destroy() end

local function tween(object, info, goals)
    local t = TweenService:Create(object, TweenInfo.new(unpack(info)), goals)
    t:Play()
    return t
end

-- LOADER
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

-- ANA MENÜ
local MenuGui = Instance.new("ScreenGui")
MenuGui.Name = "TantuniMenu"
MenuGui.ResetOnSpawn = false
MenuGui.Parent = CoreGui

local MainContainer = Instance.new("Frame")
MainContainer.Size = UDim2.new(0, 480, 0, 320)
MainContainer.Position = UDim2.new(0.5, -240, 0.5, -180)
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

-- Başlık
local WelcomeText = Instance.new("TextLabel")
WelcomeText.Size = UDim2.new(1, -20, 0, 20)
WelcomeText.Position = UDim2.new(0, 20, 0, 14)
WelcomeText.BackgroundTransparency = 1
WelcomeText.Text = "Welcome home, " .. tostring(LocalPlayer.Name)
WelcomeText.TextColor3 = Color3.fromRGB(255, 255, 255)
WelcomeText.TextSize = 15
WelcomeText.Font = Enum.Font.GothamBold
WelcomeText.TextXAlignment = Enum.TextXAlignment.Left
WelcomeText.Parent = MainContainer

local SubText = Instance.new("TextLabel")
SubText.Size = UDim2.new(1, -20, 0, 14)
SubText.Position = UDim2.new(0, 20, 0, 34)
SubText.BackgroundTransparency = 1
SubText.Text = "Chat Logger"
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

-- İçerik alanı
local Inner = Instance.new("Frame")
Inner.Size = UDim2.new(1, -40, 1, -65)
Inner.Position = UDim2.new(0, 20, 0, 58)
Inner.BackgroundTransparency = 1
Inner.Parent = MainContainer

-- Webhook label
local WebhookLabel = Instance.new("TextLabel")
WebhookLabel.Size = UDim2.new(1, 0, 0, 18)
WebhookLabel.Position = UDim2.new(0, 0, 0, 0)
WebhookLabel.BackgroundTransparency = 1
WebhookLabel.Text = "Discord Webhook URL"
WebhookLabel.TextColor3 = Color3.fromRGB(180, 170, 200)
WebhookLabel.TextSize = 11
WebhookLabel.Font = Enum.Font.GothamBold
WebhookLabel.TextXAlignment = Enum.TextXAlignment.Left
WebhookLabel.Parent = Inner

-- Webhook input kutusu
local WebhookInputBg = Instance.new("Frame")
WebhookInputBg.Size = UDim2.new(1, 0, 0, 38)
WebhookInputBg.Position = UDim2.new(0, 0, 0, 22)
WebhookInputBg.BackgroundColor3 = Color3.fromRGB(26, 15, 44)
WebhookInputBg.BackgroundTransparency = 0.3
WebhookInputBg.BorderSizePixel = 0
WebhookInputBg.Parent = Inner

local WebhookInputCorner = Instance.new("UICorner")
WebhookInputCorner.CornerRadius = UDim.new(0, 6)
WebhookInputCorner.Parent = WebhookInputBg

local WebhookInputStroke = Instance.new("UIStroke")
WebhookInputStroke.Color = Color3.fromRGB(100, 50, 180)
WebhookInputStroke.Transparency = 0.5
WebhookInputStroke.Parent = WebhookInputBg

local WebhookInput = Instance.new("TextBox")
WebhookInput.Size = UDim2.new(1, -16, 1, 0)
WebhookInput.Position = UDim2.new(0, 8, 0, 0)
WebhookInput.BackgroundTransparency = 1
WebhookInput.PlaceholderText = "https://discord.com/api/webhooks/..."
WebhookInput.PlaceholderColor3 = Color3.fromRGB(120, 110, 150)
WebhookInput.Text = ""
WebhookInput.TextColor3 = Color3.fromRGB(255, 255, 255)
WebhookInput.TextSize = 11
WebhookInput.Font = Enum.Font.Gotham
WebhookInput.TextXAlignment = Enum.TextXAlignment.Left
WebhookInput.ClearTextOnFocus = false
WebhookInput.Parent = WebhookInputBg

-- Durum etiketi
local StatusLabel = Instance.new("TextLabel")
StatusLabel.Size = UDim2.new(1, 0, 0, 20)
StatusLabel.Position = UDim2.new(0, 0, 0, 72)
StatusLabel.BackgroundTransparency = 1
StatusLabel.Text = "● Durum: Bekliyor"
StatusLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
StatusLabel.TextSize = 11
StatusLabel.Font = Enum.Font.GothamBold
StatusLabel.TextXAlignment = Enum.TextXAlignment.Left
StatusLabel.Parent = Inner

-- Başlat butonu
local StartBtnBg = Instance.new("Frame")
StartBtnBg.Size = UDim2.new(1, 0, 0, 42)
StartBtnBg.Position = UDim2.new(0, 0, 0, 100)
StartBtnBg.BackgroundColor3 = Color3.fromRGB(40, 22, 68)
StartBtnBg.BackgroundTransparency = 0.3
StartBtnBg.BorderSizePixel = 0
StartBtnBg.Parent = Inner

local StartBtnCorner = Instance.new("UICorner")
StartBtnCorner.CornerRadius = UDim.new(0, 6)
StartBtnCorner.Parent = StartBtnBg

local StartBtn = Instance.new("TextButton")
StartBtn.Size = UDim2.new(1, 0, 1, 0)
StartBtn.BackgroundTransparency = 1
StartBtn.Text = "🚀  LOGLAMAYI BAŞLAT"
StartBtn.TextColor3 = Color3.fromRGB(200, 160, 255)
StartBtn.TextSize = 13
StartBtn.Font = Enum.Font.GothamBold
StartBtn.Parent = StartBtnBg

-- Durdur butonu
local StopBtnBg = Instance.new("Frame")
StopBtnBg.Size = UDim2.new(1, 0, 0, 42)
StopBtnBg.Position = UDim2.new(0, 0, 0, 150)
StopBtnBg.BackgroundColor3 = Color3.fromRGB(40, 22, 68)
StopBtnBg.BackgroundTransparency = 0.3
StopBtnBg.BorderSizePixel = 0
StopBtnBg.Visible = false
StopBtnBg.Parent = Inner

local StopBtnCorner = Instance.new("UICorner")
StopBtnCorner.CornerRadius = UDim.new(0, 6)
StopBtnCorner.Parent = StopBtnBg

local StopBtn = Instance.new("TextButton")
StopBtn.Size = UDim2.new(1, 0, 1, 0)
StopBtn.BackgroundTransparency = 1
StopBtn.Text = "⛔  LOGLAMAYI DURDUR"
StopBtn.TextColor3 = Color3.fromRGB(255, 120, 120)
StopBtn.TextSize = 13
StopBtn.Font = Enum.Font.GothamBold
StopBtn.Parent = StopBtnBg

-- Hover efekti
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

applyHoverEffect(StartBtnBg)
applyHoverEffect(StopBtnBg)

-- Alt bar
local BottomNav = Instance.new("Frame")
BottomNav.Size = UDim2.new(0, 480, 0, 36)
BottomNav.Position = UDim2.new(0.5, -240, 0.5, 145)
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

local NavInfo = Instance.new("TextLabel")
NavInfo.Size = UDim2.new(1, 0, 1, 0)
NavInfo.BackgroundTransparency = 1
NavInfo.Text = "DELETE → Menüyü Gizle/Aç"
NavInfo.TextColor3 = Color3.fromRGB(140, 130, 170)
NavInfo.TextSize = 11
NavInfo.Font = Enum.Font.Gotham
NavInfo.Parent = BottomNav

-- LOGLAMA MANTIĞI
local loggingActive = false
local currentWebhook = ""
local sentMessages = {}

local function sendToWebhook(player, message)
    if not loggingActive or currentWebhook == "" then return end
    if not player or not message or message == "" then return end

    -- Duplikat önleme
    local sig = tostring(player.UserId) .. "_" .. message
    if sentMessages[sig] then return end
    sentMessages[sig] = true
    task.delay(2, function() sentMessages[sig] = nil end)

    -- Webhook ismi: oyuncunun Roblox adı
    local data = {
        ["username"] = player.Name .. " (@" .. player.DisplayName .. ")",
        ["content"] = message
    }

    local ok, encoded = pcall(function()
        return HttpService:JSONEncode(data)
    end)
    if not ok then return end

    pcall(function()
        if syn and syn.request then
            syn.request({
                Url = currentWebhook,
                Method = "POST",
                Headers = {["Content-Type"] = "application/json"},
                Body = encoded
            })
        elseif http and http.request then
            http.request({
                Url = currentWebhook,
                Method = "POST",
                Headers = {["Content-Type"] = "application/json"},
                Body = encoded
            })
        elseif request then
            request({
                Url = currentWebhook,
                Method = "POST",
                Headers = {["Content-Type"] = "application/json"},
                Body = encoded
            })
        end
    end)
end

-- Oyuncuları dinle (Klasik yöntem)
local function hookPlayer(player)
    player.Chatted:Connect(function(msg)
        sendToWebhook(player, msg)
    end)
end

for _, p in ipairs(Players:GetPlayers()) do
    hookPlayer(p)
end
Players.PlayerAdded:Connect(hookPlayer)

-- Yeni TextChatService yöntemi (modern oyunlar için)
pcall(function()
    TextChatService.MessageReceived:Connect(function(msg)
        if not msg.TextSource then return end
        local player = Players:GetPlayerByUserId(msg.TextSource.UserId)
        if player then
            sendToWebhook(player, msg.Text)
        end
    end)
end)

-- Buton mantığı
StartBtn.MouseButton1Click:Connect(function()
    local url = WebhookInput.Text
    if url == "" or not string.find(url, "discord.com/api/webhooks") then
        StatusLabel.Text = "● Durum: Geçersiz Webhook URL!"
        StatusLabel.TextColor3 = Color3.fromRGB(255, 80, 80)
        tween(MainStroke, {0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out}, {Color = Color3.fromRGB(255, 80, 80)})
        return
    end

    currentWebhook = url
    loggingActive = true

    StatusLabel.Text = "● Durum: Aktif — Mesajlar loglanıyor"
    StatusLabel.TextColor3 = Color3.fromRGB(80, 255, 140)
    tween(MainStroke, {0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out}, {Color = Color3.fromRGB(80, 255, 140)})
    StartBtnBg.Visible = false
    StopBtnBg.Visible = true
end)

StopBtn.MouseButton1Click:Connect(function()
    loggingActive = false
    currentWebhook = ""

    StatusLabel.Text = "● Durum: Durduruldu"
    StatusLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
    tween(MainStroke, {0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out}, {Color = Color3.fromRGB(160, 70, 255)})
    StopBtnBg.Visible = false
    StartBtnBg.Visible = true
end)

-- Sürükle-bırak
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

-- DELETE ile aç/kapa
local isOpen = true
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.Delete then
        isOpen = not isOpen
        MainContainer.Visible = isOpen
        BottomNav.Visible = isOpen
    end
end)
