local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

local Window = Library.CreateLib("Piggy | Dark Hub", "DarkTheme")

local MainTab = Window:NewTab("Main")
local MainSection = MainTab:NewSection("Main")

MainSection:NewToggle("ESP", "Gives ESP", function(state)
    if state then
        local Players = game:GetService("Players")

local function RefreshHighlights()
  for _, Player in pairs(Players:GetPlayers()) do
    if Player ~= Players.LocalPlayer then -- Ignore yourself
      local Character = Player.Character
      if Character then
        local Highlight = Character:FindFirstChildWhichIsA("Highlight")
        if Highlight then
          Highlight:Destroy() -- Remove old highlight if it exists
        end
        local NewHighlight = Instance.new("Highlight")
        NewHighlight.FillColor = Color3.fromRGB(255, 0, 0) -- Red color
        NewHighlight.Parent = Character
      end
    end
  end
end

-- Call the function initially to create highlights
RefreshHighlights()

-- Optionally, call the function repeatedly to keep highlights updated
-- (This is recommended as players join/leave)
task.wait(1) -- Wait for 1 second
RefreshHighlights() -- Call again
    else
        local Players = game:GetService("Players")

local function RefreshHighlights()
  for _, Player in pairs(Players:GetPlayers()) do
    if Player ~= Players.LocalPlayer then -- Ignore yourself
      local Character = Player.Character
      if Character then
        local Highlight = Character:FindFirstChildWhichIsA("Highlight")
        if Highlight then
          Highlight:Destroy() -- Remove old highlight if it exists
        end
        local NewHighlight = Instance.new("Highlight")
        NewHighlight.FillColor = Color3.fromRGB(0, 0, 0) -- Red color
        NewHighlight.Parent = Character
      end
    end
  end
end

-- Call the function initially to create highlights
RefreshHighlights()

-- Optionally, call the function repeatedly to keep highlights updated
-- (This is recommended as players join/leave)
task.wait(1) -- Wait for 1 second
RefreshHighlights() -- Call again
    end
end)

MainSection:NewToggle("God Mode", "gives god mode", function(state)
    if state then
        game.Players.LocalPlayer.Character.Humanoid:Remove()
Instance.new('Humanoid', game.Players.LocalPlayer.Character)
game:GetService("Workspace")[game.Players.LocalPlayer.Name]:FindFirstChildOfClass(
'Humanoid').HipHeight = 2
    else
        game.Players.LocalPlayer.Character.Humanoid:Remove()
Instance.new('Humanoid', game.Players.LocalPlayer.Character)
game:GetService("Workspace")[game.Players.LocalPlayer.Name]:FindFirstChildOfClass(
'Humanoid').HipHeight = 0
    end
end)

MainSection:NewButton("Item Gui", "item gui", function()
    --[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
-- All credits to LeviTheOtaku from v3rmillion.net - https://v3rmillion.net/showthread.php?tid=970595 / https://v3rmillion.net/member.php?action=profile&uid=11841
 
local PiggyGui = Instance.new("ScreenGui")
PiggyGui.Name = "PiggyGui"
PiggyGui.Parent = game.StarterGui
 
local ScrollingFrame = Instance.new("ScrollingFrame", PiggyGui)
ScrollingFrame.BackgroundColor3 = Color3.new(0.15, 0.15, 0.15)
ScrollingFrame.Position = UDim2.new(0.08, 0, 0.42, 0)
ScrollingFrame.Size = UDim2.new(0, 296, 0, 388)
 
 
 
 
local PiggyGui = Instance.new("ScreenGui")
PiggyGui.Name = "PiggyGui"
PiggyGui.Parent = game.CoreGui
 
local ScrollingFrame = Instance.new("ScrollingFrame", PiggyGui)
ScrollingFrame.BackgroundColor3 = Color3.new(0.15, 0.15, 0.15)
ScrollingFrame.Position = UDim2.new(0.08, 0, 0.42, 0)
ScrollingFrame.Size = UDim2.new(0, 296, 0, 388)
 
local UIGridLayout = Instance.new("UIGridLayout", ScrollingFrame)
UIGridLayout.CellSize = UDim2.new(0,90,0,90)
 
while wait(1) do
local a = workspace:getDescendants()
local items = {}
local itemframes = ScrollingFrame:getChildren()
for i=1,#itemframes do
if itemframes[i].ClassName == "TextButton" then
itemframes[i]:remove()
end
end
for i=1,#a do
if a[i].Name == "ItemPickupScript" and a[i].Parent:findFirstChild("ClickDetector") then
table.insert(items, a[i].Parent)
end
end
for i=1,#items do
local ItemFrame = Instance.new("TextButton", ScrollingFrame)
ItemFrame.Name = "ItemFrame"
ItemFrame.BackgroundColor3 = Color3.new(1, 1, 1)
ItemFrame.BackgroundTransparency = 0.95
ItemFrame.Size = UDim2.new(0, 100, 0, 100)
ItemFrame.Text = ""
local View = Instance.new("ViewportFrame", ItemFrame)
View.Name = "View"
View.Size = UDim2.new(1,0,1,0)
View.BackgroundTransparency = 1
View.BorderSizePixel = 0
local object = items[i]
local viewportclone = object:Clone()
viewportclone.Parent = View
local cam = Instance.new("Camera", viewportclone)
cam.CameraType = Enum.CameraType.Fixed
local objectPosition = object.Position
local cameraPosition = objectPosition + Vector3.new(0,3,0)
cam.CoordinateFrame = CFrame.new(cameraPosition, objectPosition)
View.CurrentCamera = cam
 
ItemFrame.MouseButton1Down:connect(function()
if items[i]:findFirstChild("ClickDetector") then
local cpos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = items[i].CFrame
wait(0.1)
fireclickdetector(items[i].ClickDetector)
wait(0.3)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = cpos
end
end)
end
        end
end)

MainSection:NewToggle("Noclip Camera", "noclip camera.", function(state)
    if state then
        --[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
if not game:IsLoaded() then
    game.Loaded:wait()
end

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PopperClient = LocalPlayer:WaitForChild("PlayerScripts").PlayerModule.CameraModule.ZoomController.Popper

for i, v in next, getgc() do
    if getfenv(v).script == PopperClient and typeof(v) == "function" then
        for i2, v2 in next, debug.getconstants(v) do
            if tonumber(v2) == 0.25 then
                debug.setconstant(v, i2, 0)
            elseif tonumber(v2) == 0 then
                debug.setconstant(v, i2, 0.25)
            end
        end
    end
            end
    else
        print("Toggle Off")
    end
end)
