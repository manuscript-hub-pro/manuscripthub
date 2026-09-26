local p=game.Players.LocalPlayer if p.PlayerGui:FindFirstChild("ManuscriptHub") then p.PlayerGui.ManuscriptHub:Destroy() end
local g=Instance.new("ScreenGui",p.PlayerGui) g.Name="ManuscriptHub" g.ResetOnSpawn=false
local m=Instance.new("Frame",g) m.Size=UDim2.new(0,270,0,360) m.Position=UDim2.new(0.5,-135,0.5,-180) m.BackgroundColor3=Color3.fromRGB(10,10,10) m.Active=true m.Draggable=true Instance.new("UICorner",m).CornerRadius=UDim.new(0,12)
local s=Instance.new("UIStroke",m) s.Color=Color3.fromRGB(130,0,255) s.Thickness=2.5
local t=Instance.new("TextLabel",m) t.Size=UDim2.new(1,0,0,50) t.BackgroundTransparency=1 t.Text="MANUSCRIPT HUB" t.TextColor3=Color3.fromRGB(130,0,255) t.Font=Enum.Font.GothamBold t.TextSize=14
print("Manuscript Hub Cargado ✅")
