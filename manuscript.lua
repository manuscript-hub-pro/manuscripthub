local p=game.Players.LocalPlayer
if p.PlayerGui:FindFirstChild("ManuscriptHub") then p.PlayerGui.ManuscriptHub:Destroy() end

local g=Instance.new("ScreenGui",p.PlayerGui)
g.Name="ManuscriptHub"
g.ResetOnSpawn=false

local open=Instance.new("TextButton",g)
open.Size=UDim2.new(0,140,0,40)
open.Position=UDim2.new(0,10,0.5,0)
open.Text="🥚 MANUSCRIPT"
open.BackgroundColor3=Color3.fromRGB(130,0,255)
open.TextColor3=Color3.new(1,1,1)
open.Font=Enum.Font.GothamBold
open.TextSize=12
open.Draggable=true
open.Active=true
Instance.new("UICorner",open).CornerRadius=UDim.new(0,10)

local main=Instance.new("Frame",g)
main.Size=UDim2.new(0,320,0,380)
main.Position=UDim2.new(0.5,-160,0.5,-190)
main.BackgroundColor3=Color3.fromRGB(15,15,15)
main.Active=true
main.Draggable=true
Instance.new("UICorner",main).CornerRadius=UDim.new(0,12)
local s=Instance.new("UIStroke",main) s.Color=Color3.fromRGB(130,0,255) s.Thickness=2

local title=Instance.new("TextLabel",main)
title.Size=UDim2.new(1,0,0,45)
title.BackgroundTransparency=1
title.Text="MANUSCRIPT HUB V3"
title.TextColor3=Color3.fromRGB(130,0,255)
title.Font=Enum.Font.GothamBold
title.TextSize=14

local close=Instance.new("TextButton",main)
close.Size=UDim2.new(0,30,0,30)
close.Position=UDim2.new(1,-35,0,7)
close.Text="X"
close.BackgroundColor3=Color3.fromRGB(255,0,0)
close.TextColor3=Color3.new(1,1,1)
Instance.new("UICorner",close)

close.MouseButton1Click:Connect(function() main.Visible=false end)
open.MouseButton1Click:Connect(function() main.Visible=not main.Visible end)

print("Manuscript Cargado ✅")
