local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer

if player.PlayerGui:FindFirstChild("AltDetectorGUI") then
	player.PlayerGui.AltDetectorGUI:Destroy()
end

local gui = Instance.new("ScreenGui")
gui.Name = "AltDetectorGUI"
gui.ResetOnSpawn = false
gui.Parent = player.PlayerGui

--------------------------------------------------
-- Glow
--------------------------------------------------

local function AddGlow(frame)

	local glow = Instance.new("Frame")
	glow.Parent = frame
	glow.Size = UDim2.new(1,20,1,20)
	glow.Position = UDim2.new(0,-10,0,-10)
	glow.BackgroundColor3 = Color3.fromRGB(130,80,255)
	glow.BackgroundTransparency = .75
	glow.ZIndex = frame.ZIndex - 1

	local glowCorner = Instance.new("UICorner")
	glowCorner.CornerRadius = UDim.new(0,18)
	glowCorner.Parent = glow

	local stroke = Instance.new("UIStroke")
	stroke.Parent = frame
	stroke.Color = Color3.fromRGB(130,80,255)
	stroke.Thickness = 2

	task.spawn(function()
		while frame.Parent do
			for i=.75,.88,.01 do
				glow.BackgroundTransparency=i
				task.wait(.03)
			end

			for i=.88,.75,-.01 do
				glow.BackgroundTransparency=i
				task.wait(.03)
			end
		end
	end)
end

--------------------------------------------------
-- Loading Screen
--------------------------------------------------

local loadingFrame = Instance.new("Frame")
loadingFrame.Parent = gui
loadingFrame.Size = UDim2.new(0,300,0,140)
loadingFrame.Position = UDim2.new(.5,-150,.5,-70)
loadingFrame.BackgroundColor3 = Color3.fromRGB(20,20,20)
loadingFrame.BorderSizePixel = 0

local loadCorner = Instance.new("UICorner")
loadCorner.CornerRadius = UDim.new(0,18)
loadCorner.Parent = loadingFrame

AddGlow(loadingFrame)

local loadingTitle = Instance.new("TextLabel")
loadingTitle.Parent = loadingFrame
loadingTitle.Size = UDim2.new(1,0,0,40)
loadingTitle.BackgroundTransparency = 1
loadingTitle.Text = "⚡ Syntacht Replicator"
loadingTitle.TextColor3 = Color3.new(1,1,1)
loadingTitle.Font = Enum.Font.GothamBold
loadingTitle.TextSize = 22

local loadingText = Instance.new("TextLabel")
loadingText.Parent = loadingFrame
loadingText.Size = UDim2.new(1,0,0,40)
loadingText.Position = UDim2.new(0,0,.45,0)
loadingText.BackgroundTransparency = 1
loadingText.TextColor3 = Color3.new(1,1,1)
loadingText.Font = Enum.Font.Gotham
loadingText.TextSize = 18

for i=5,1,-1 do
	loadingText.Text = "Scanning profile... ("..i..")"
	task.wait(1)
end

local loadScale = Instance.new("UIScale")
loadScale.Parent = loadingFrame

TweenService:Create(loadScale,TweenInfo.new(.5),{Scale=.85}):Play()
TweenService:Create(loadingFrame,TweenInfo.new(.5),{BackgroundTransparency=1}):Play()
TweenService:Create(loadingTitle,TweenInfo.new(.4),{TextTransparency=1}):Play()
TweenService:Create(loadingText,TweenInfo.new(.4),{TextTransparency=1}):Play()

task.wait(.55)

loadingFrame:Destroy()

--------------------------------------------------
-- Main GUI
--------------------------------------------------

local frame = Instance.new("Frame")
frame.Parent = gui
frame.Size = UDim2.new(0,420,0,260)
frame.Position = UDim2.new(.5,-210,.5,-130)
frame.BackgroundColor3 = Color3.fromRGB(20,20,20)
frame.BorderSizePixel = 0

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0,18)
corner.Parent = frame

AddGlow(frame)

--------------------------------------------------
-- Title
--------------------------------------------------

local title = Instance.new("TextLabel")
title.Parent = frame
title.Size = UDim2.new(1,0,0,45)
title.BackgroundTransparency = 1
title.Text = "⚡ Syntacht Replicator"
title.TextColor3 = Color3.new(1,1,1)
title.Font = Enum.Font.GothamBold
title.TextSize = 24

--------------------------------------------------
-- X Button
--------------------------------------------------

local close = Instance.new("TextButton")
close.Parent = frame
close.Size = UDim2.new(0,38,0,38)
close.Position = UDim2.new(1,-50,0,10)
close.Text = "X"

close.BackgroundColor3 = Color3.fromRGB(130,80,255)
close.TextColor3 = Color3.new(1,1,1)
close.Font = Enum.Font.GothamBold
close.TextSize = 18

local xCorner = Instance.new("UICorner")
xCorner.CornerRadius = UDim.new(1,0)
xCorner.Parent = close

--------------------------------------------------
-- Anime Image
--------------------------------------------------

local animeImage = Instance.new("ImageLabel")
animeImage.Parent = frame
animeImage.Size = UDim2.new(0,70,0,70)
animeImage.Position = UDim2.new(0.05,0,0.23,0)

animeImage.BackgroundTransparency = 1

-- REPLACE THIS LATER
animeImage.Image = "rbxthumb://type=Asset&id=14035312492&w=420&h=420"

animeImage.ScaleType = Enum.ScaleType.Crop

local imgCorner = Instance.new("UICorner")
imgCorner.CornerRadius = UDim.new(1,0)
imgCorner.Parent = animeImage

local imgStroke = Instance.new("UIStroke")
imgStroke.Parent = animeImage
imgStroke.Color = Color3.fromRGB(130,80,255)
imgStroke.Thickness = 2

--------------------------------------------------
-- Text
--------------------------------------------------

local message = Instance.new("TextLabel")
message.Parent = frame
message.Size = UDim2.new(.60,0,.16,0)
message.Position = UDim2.new(.30,0,.30,0)
message.BackgroundTransparency = 1
message.Text = "You are currently on an ALT account. Please return to your main account."
message.TextWrapped = true
message.TextColor3 = Color3.new(1,1,1)
message.Font = Enum.Font.Gotham
message.TextSize = 16

local subText = Instance.new("TextLabel")
subText.Parent = frame
subText.Size = UDim2.new(.60,0,.10,0)
subText.Position = UDim2.new(.30,0,.58,0)
subText.BackgroundTransparency = 1
subText.Text = "If you received this message, it means you are on an ALT account."
subText.TextWrapped = true
subText.TextColor3 = Color3.fromRGB(190,190,190)
subText.Font = Enum.Font.Gotham
subText.TextSize = 12

local contact = Instance.new("TextLabel")
contact.Parent = frame
contact.Size = UDim2.new(.60,0,.10,0)
contact.Position = UDim2.new(.30,0,.72,0)
contact.BackgroundTransparency = 1
contact.Text = "If you still can't access on your main, contact @Syntacht on TikTok."
contact.TextWrapped = true
contact.TextColor3 = Color3.fromRGB(160,160,160)
contact.Font = Enum.Font.Gotham
contact.TextSize = 11

close.MouseButton1Click:Connect(function()
	gui:Destroy()
end)
