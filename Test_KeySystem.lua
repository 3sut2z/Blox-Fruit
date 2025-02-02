local HttpService = game:GetService("HttpService")

local githubRawURL = "https://raw.githubusercontent.com/3sut2z/Key/main/Key"

local correctKey

local success, result = pcall(function()
    return HttpService:GetAsync(githubRawURL)
end)

if success then
    correctKey = result:match("^%s*(.-)%s*$")
    print("Key has been verified:", correctKey)
else
    warn("Unable to verify Key:", result)
end

local player = game.Players.LocalPlayer

local keyScreenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
keyScreenGui.Name = "KeySystemGui"

local frame = Instance.new("Frame", keyScreenGui)
frame.Size = UDim2.new(0.3, 0, 0.3, 0)
frame.Position = UDim2.new(0.35, 0, 0.35, 0)
frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0.2, 0)
title.Position = UDim2.new(0, 0, 0, 0)
title.Text = "Dragon HUB - Key System"
title.TextScaled = true
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.BackgroundTransparency = 1

local Close = Instance.new("TextButton")
Close.Size = UDim2.new(0, 40, 0, 40)
Close.Position = UDim2.new(1, -40, 0, 0)
Close.BackgroundTransparency = 1
Close.Text = "X"
Close.TextScaled = true
Close.TextColor3 = Color3.fromRGB(150, 150, 150)
Close.Parent = Frame
Close.MouseButton1Click:Connect(function()
   ScreenGui:Destroy()
end)

local inputBox = Instance.new("TextBox", frame)
inputBox.Size = UDim2.new(0.8, 0, 0.2, 0)
inputBox.Position = UDim2.new(0.1, 0, 0.4, 0)
inputBox.PlaceholderText = "Enter your key here..."
inputBox.Text = ""
inputBox.TextScaled = true
inputBox.TextColor3 = Color3.fromRGB(0, 0, 0)
inputBox.BackgroundColor3 = Color3.fromRGB(200, 200, 200)

local TextBoxCorner = Instance.new("UICorner")
TextBoxCorner.CornerRadius = UDim.new(0, 5)
TextBoxCorner.Parent = inputBox

local GetKey = Instance.new("TextButton")
GetKey.Size = UDim2.new(0.35, 0, 0.15, 0)
GetKey.Position = UDim2.new(0.1, 0, 0.7, 0)
GetKey.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
GetKey.Text = "Get Key"
GetKey.TextSize = 18
GetKey.TextColor3 = Color3.fromRGB(255, 255, 255)
GetKey.Parent = Frame

local GetKeyCorner = Instance.new("UICorner")
GetKeyCorner.CornerRadius = UDim.new(0, 5)
GetKeyCorner.Parent = GetKey

local submitButton = Instance.new("TextButton", frame)
submitButton.Size = UDim2.new(0.5, 0, 0.2, 0)
submitButton.Position = UDim2.new(0.25, 0, 0.7, 0)
submitButton.Text = "Check Key"
submitButton.TextScaled = true
submitButton.TextColor3 = Color3.fromRGB(255, 255, 255)
submitButton.BackgroundColor3 = Color3.fromRGB(0, 170, 0)

local CheckKeyCorner = Instance.new("UICorner")
CheckKeyCorner.CornerRadius = UDim.new(0, 5)
CheckKeyCorner.Parent = sumitButton

local function showDragonHub()
    local dragonGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
    dragonGui.Name = "DragonHubGui"

    local mainFrame = Instance.new("Frame", dragonGui)
    mainFrame.Size = UDim2.new(0, 0, 0, 0) -- B?t �?u v?i k�ch th�?c 0
    mainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
    mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    mainFrame.BorderSizePixel = 0
    mainFrame.Visible = false

    local titleLabel = Instance.new("TextLabel", dragonGui)
    titleLabel.Size = UDim2.new(0.5, 0, 0.1, 0)
    titleLabel.Position = UDim2.new(0.5, 0, 0.4, 0)
    titleLabel.AnchorPoint = Vector2.new(0.5, 0.5)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = "Dragon HUB"
    titleLabel.TextScaled = true
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.Font = Enum.Font.SourceSansBold
    titleLabel.Visible = false

    local frameTitle = Instance.new("TextLabel", mainFrame)
    frameTitle.Size = UDim2.new(1, 0, 0.2, 0)
    frameTitle.Position = UDim2.new(0, 0, 0, 0)
    frameTitle.BackgroundTransparency = 1
    frameTitle.Text = "Dragon HUB"
    frameTitle.TextScaled = true
    frameTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    frameTitle.Font = Enum.Font.SourceSansBold
    frameTitle.Visible = false

    local TweenService = game:GetService("TweenService")

    titleLabel.Visible = true
    wait(1)

    local hideTextTween = TweenService:Create(
        titleLabel,
        TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {TextTransparency = 1}
    )
    hideTextTween:Play()
    hideTextTween.Completed:Wait()
    titleLabel.Visible = false

    mainFrame.Visible = true
    local expandTween = TweenService:Create(
        mainFrame,
        TweenInfo.new(1, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out),
        {Size = UDim2.new(0.5, 0, 0.5, 0)}
    )
    expandTween:Play()
    expandTween.Completed:Wait()

    frameTitle.Visible = true
end

GetKey.MouseButton1Click:Connect(function()
   setclipboard("https://raw.githubusercontent.com/3sut2z/Key/main/Key")
end)

submitButton.MouseButton1Click:Connect(function()
    if inputBox.Text == correctKey then
        inputBox.PlaceholderText = "Valid Key!"
        keyScreenGui:Destroy()
        showDragonHub()

loadstring(game:HttpGet("https://raw.githubusercontent.com/3sut2z/Blox-Fruit/main/Dragon_HUB.lua"))()

    else
        print("Invalid key. Try again!")
        inputBox.Text = ""
        inputBox.PlaceholderText = "Invalid key. Try again!"
    end
end)
