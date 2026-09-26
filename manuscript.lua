local p=game.Players.LocalPlayer
if p.PlayerGui:FindFirstChild("ManuscriptHub") then p.PlayerGui.ManuscriptHub:Destroy() end
local g=Instance.new("ScreenGui",p.PlayerGui) g.Name="ManuscriptHub" g.ResetOnSpawn=false

-- BOTON ABRIR BONITO
local open=Instance.new("TextButton",g) open.Size=UDim2.new(0,130,0,42) open.Position=UDim2.new(0,10,0.5,0) open.Text=" MANUSCRIPT HUB" open.TextSize=11 open.Font=Enum.Font.GothamBold open.BackgroundColor3=Color3.fromRGB(130,0,255) open.TextColor3=Color3.new(1,1,1) open.Active=true open.Draggable=true Instance.new("UICorner",open).CornerRadius=UDim.new(0,10)
local icon=Instance.new("TextLabel",open) icon.Size=UDim2.new(0,30,1,0) icon.Text="🥚" icon.BackgroundTransparency=1 icon.TextSize=18

-- VENTANA PRINCIPAL
local main=Instance.new("Frame",g) main.Size=UDim2.new(0,340,0,480) main.Position=UDim2.new(0.5,-170,0.5,-240) main.BackgroundColor3=Color3.fromRGB(15,15,15) main.Active=true main.Draggable=true
Instance.new("UICorner",main).CornerRadius=UDim.new(0,14)
local stroke=Instance.new("UIStroke",main) stroke.Color=Color3.fromRGB(130,0,255) stroke.Thickness=2.5 stroke.ApplyStrokeMode=Enum.ApplyStrokeMode.Border
local grad=Instance.new("UIGradient",main) grad.Color=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(20,20,20)), ColorSequenceKeypoint.new(1,Color3.fromRGB(10,10,10))} grad.Rotation=90

local top=Instance.new("Frame",main) top.Size=UDim2.new(1,0,0,55) top.BackgroundColor3=Color3.fromRGB(130,0,255) Instance.new("UICorner",top).CornerRadius=UDim.new(0,14)
local fix=Instance.new("Frame",top) fix.Size=UDim2.new(1,0,0,20) fix.Position=UDim2.new(0,0,1,-10) fix.BackgroundColor3=Color3.fromRGB(130,0,255) fix.BorderSizePixel=0

local title=Instance.new("TextLabel",top) title.Size=UDim2.new(1,-50,1,0) title.Position=UDim2.new(0,15,0,0) title.BackgroundTransparency=1 title.Text="🥚 MANUSCRIPT HUB | ROBA UN HUEVO" title.Font=Enum.Font.GothamBold title.TextSize=13 title.TextColor3=Color3.new(1,1,1) title.TextXAlignment=Enum.TextXAlignment.Left

local close=Instance.new("TextButton",top) close.Size=UDim2.new(0,30,0,30) close.Position=UDim2.new(1,-40,0,12) close.Text="X" close.BackgroundColor3=Color3.fromRGB(0,0,0) close.TextColor3=Color3.new(1,1,1) close.Font=Enum.Font.GothamBold Instance.new("UICorner",close).CornerRadius=UDim.new(1,0)

-- SCROLL PARA OPCIONES
local scroll=Instance.new("ScrollingFrame",main) scroll.Size=UDim2.new(1,-10,1,-65) scroll.Position=UDim2.new(0,5,0,60) scroll.BackgroundTransparency=1 scroll.ScrollBarThickness=2 scroll.CanvasSize=UDim2.new(0,0,0,600)
local list=Instance.new("UIListLayout",scroll) list.Padding=UDim.new(0,8) list.SortOrder=Enum.SortOrder.LayoutOrder
local pad=Instance.new("UIPadding",scroll) pad.PaddingTop=UDim.new(0,5) pad.PaddingLeft=UDim.new(0,5) pad.PaddingRight=UDim.new(0,5)

local function createToggle(text)
	local f=Instance.new("Frame",scroll) f.Size=UDim2.new(1,-10,0,40) f.BackgroundColor3=Color3.fromRGB(28,28,28) Instance.new("UICorner",f).CornerRadius=UDim.new(0,8)
	local t=Instance.new("TextLabel",f) t.Size=UDim2.new(0.7,0,1,0) t.Position=UDim2.new(0,10,0,0) t.BackgroundTransparency=1 t.Text=text t.TextColor3=Color3.new(1,1,1) t.Font=Enum.Font.Gotham t.TextSize=11 t.TextXAlignment=Enum.TextXAlignment.Left
	local b=Instance.new("TextButton",f) b.Size=UDim2.new(0,60,0,26) b.Position=UDim2.new(1,-70,0.5,-13) b.Text="OFF" b.BackgroundColor3=Color3.fromRGB(60,60,60) b.TextColor3=Color3.new(1,1,1) b.Font=Enum.Font.GothamBold b.TextSize=11 Instance.new("UICorner",b).CornerRadius=UDim.new(0,8)
	return b
end

local function createLabel(text)
	local l=Instance.new("TextLabel",scroll) l.Size=UDim2.new(1,-10,0,20) l.BackgroundTransparency=1 l.Text=text l.TextColor3=Color3.fromRGB(130,0,255) l.Font=Enum.Font.GothamBold l.TextSize=11 l.TextXAlignment=Enum.TextXAlignment.Left return l
end

createLabel(" 🎯 SELECCIONAR HUEVOS A ROBAR")
local eggCommon=createToggle("🥚 Común / Basico")
local eggRare=createToggle("💎 Raro / Epico")
local eggLegend=createToggle("🔥 Legendario")
local eggMythic=createToggle("👑 Mitico / Divino")
createLabel(" ✈️ OPCIONES DE ROBO")
local flyToggle=createToggle("✈️ Volar al Huevo (Rapido)")
local autoRobToggle=createToggle("🥚 Auto Robar Elegidos")
local bypassToggle=createToggle("👻 Bypass Guardias")
createLabel(" 📦 BASE")
local autoPlace=createToggle("📦 Auto Colocar / Incubar")
local autoSpeed=createToggle("🏃 Auto Farm Velocidad")
local antiAfk=createToggle("💤 Anti-AFK")

local toggles={common=false,rare=false,legend=false,mythic=true,fly=false,rob=false,bypass=false,place=false,speed=false,afk=false}
local function setToggle(btn, key)
	btn.MouseButton1Click:Connect(function()
		toggles[key]=not toggles[key]
		btn.Text=toggles[key] and "ON" or "OFF"
		btn.BackgroundColor3=toggles[key] and Color3.fromRGB(130,0,255) or Color3.fromRGB(60,60,60)
	end)
end
setToggle(eggCommon,"common") setToggle(eggRare,"rare") setToggle(eggLegend,"legend") setToggle(eggMythic,"mythic")
setToggle(flyToggle,"fly") setToggle(autoRobToggle,"rob") setToggle(bypassToggle,"bypass")
setToggle(autoPlace,"place") setToggle(autoSpeed,"speed") setToggle(antiAfk,"afk")

close.MouseButton1Click:Connect(function() main.Visible=false end)
open.MouseButton1Click:Connect(function() main.Visible=not main.Visible end)

-- FUNCION VOLAR
local function flyTo(pos)
	if not toggles.fly then p.Character.HumanoidRootPart.CFrame=CFrame.new(pos+Vector3.new(0,5,0)) return end
	local hrp=p.Character.HumanoidRootPart
	local bv=Instance.new("BodyVelocity",hrp) bv.MaxForce=Vector3.new(1e9,1e9,1e9) bv.Velocity=Vector3.new(0,0,0)
	local bg=Instance.new("BodyGyro",hrp) bg.MaxTorque=Vector3.new(1e9,1e9,1e9) bg.CFrame=hrp.CFrame
	for i=0,1,0.02 do
		if not toggles.fly then break end
		local dir=(pos-hrp.Position).Unit
		bv.Velocity=dir*120
		bg.CFrame=CFrame.new(hrp.Position,pos)
		task.wait()
		if (hrp.Position-pos).Magnitude<8 then break end
	end
	bv:Destroy() bg:Destroy()
end

-- LOOP ROBO
task.spawn(function()
	while task.wait(0.3) do
		if toggles.rob then
			pcall(function()
				for _,egg in pairs(workspace:GetDescendants()) do
					if egg:IsA("Model") and egg:FindFirstChild("Egg") or egg.Name:lower():find("egg") then
						local prompt=egg:FindFirstChildOfClass("ProximityPrompt",true)
						if prompt and prompt.Parent then
							local name=egg.Name:lower()
							local should=false
							if toggles.common and (name:find("common") or name:find("basico")) then should=true end
							if toggles.rare and (name:find("rare") or name:find("epic") or name:find("raro")) then should=true end
							if toggles.legend and name:find("legend") then should=true end
							if toggles.mythic then should=true end -- por defecto roba todos si esta activo
							
							if should then
								local pos=prompt.Parent.Position or prompt.Parent:Get
