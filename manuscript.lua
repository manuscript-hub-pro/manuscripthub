local p=game.Players.LocalPlayer
if p.PlayerGui:FindFirstChild("ManuscriptHub") then p.PlayerGui.ManuscriptHub:Destroy() end
local g=Instance.new("ScreenGui",p.PlayerGui) g.Name="ManuscriptHub" g.ResetOnSpawn=false

-- BOTON FLOTANTE PARA ABRIR/CERRAR
local open=Instance.new("TextButton",g) open.Size=UDim2.new(0,55,0,55) open.Position=UDim2.new(0,15,0.5,0) open.Text="🥚" open.TextSize=25 open.BackgroundColor3=Color3.fromRGB(130,0,255) open.TextColor3=Color3.new(1,1,1) Instance.new("UICorner",open).CornerRadius=UDim.new(1,0) open.Active=true open.Draggable=true

local m=Instance.new("Frame",g) m.Size=UDim2.new(0,320,0,430) m.Position=UDim2.new(0.5,-160,0.5,-215) m.BackgroundColor3=Color3.fromRGB(12,12,12) m.Active=true m.Draggable=true Instance.new("UICorner",m).CornerRadius=UDim.new(0,12)
local st=Instance.new("UIStroke",m) st.Color=Color3.fromRGB(130,0,255) st.Thickness=2.5

local title=Instance.new("TextLabel",m) title.Size=UDim2.new(1,0,0,50) title.BackgroundTransparency=1 title.Text="MANUSCRIPT - ROBA UN HUEVO" title.TextColor3=Color3.fromRGB(130,0,255) title.Font=Enum.Font.GothamBold title.TextSize=13

local close=Instance.new("TextButton",m) close.Size=UDim2.new(0,28,0,28) close.Position=UDim2.new(1,-35,0,10) close.Text="X" close.BackgroundColor3=Color3.fromRGB(200,0,0) close.TextColor3=Color3.new(1,1,1) Instance.new("UICorner",close)

local function btn(txt,y)
	local b=Instance.new("TextButton",m) b.Size=UDim2.new(0.9,0,0,38) b.Position=UDim2.new(0.05,0,0,y) b.Text=txt.." [OFF]" b.BackgroundColor3=Color3.fromRGB(30,30,30) b.TextColor3=Color3.new(1,1,1) b.Font=Enum.Font.GothamBold b.TextSize=12 Instance.new("UICorner",b).CornerRadius=UDim.new(0,8) return b
end

local b1=btn("🥚 AUTO ROBAR HUEVO",60)
local b2=btn("📦 AUTO COLOCAR / INCUBAR",110)
local b3=btn("🎉 AUTO EVENTOS / RECOMPENSAS",160)
local b4=btn("🏃 AUTO VELOCIDAD (Treadmill)",210)
local b5=btn("💤 ANTI-AFK",260)
local b6=btn("✨ RECOGER TODO EL MAPA",310)

local toggles={false,false,false,false,false,false}

-- SISTEMA ABRIR/CERRAR
close.MouseButton1Click:Connect(function() m.Visible=false end)
open.MouseButton1Click:Connect(function() m.Visible=not m.Visible end)

-- LOGICA DE TOGGLES
b1.MouseButton1Click:Connect(function() toggles[1]=not toggles[1] b1.Text="🥚 AUTO ROBAR HUEVO ["..(toggles[1] and "ON" or "OFF").."]" b1.BackgroundColor3=toggles[1] and Color3.fromRGB(130,0,255) or Color3.fromRGB(30,30,30) end)
b2.MouseButton1Click:Connect(function() toggles[2]=not toggles[2] b2.Text="📦 AUTO COLOCAR / INCUBAR ["..(toggles[2] and "ON" or "OFF").."]" b2.BackgroundColor3=toggles[2] and Color3.fromRGB(130,0,255) or Color3.fromRGB(30,30,30) end)
b3.MouseButton1Click:Connect(function() toggles[3]=not toggles[3] b3.Text="🎉 AUTO EVENTOS ["..(toggles[3] and "ON" or "OFF").."]" b3.BackgroundColor3=toggles[3] and Color3.fromRGB(130,0,255) or Color3.fromRGB(30,30,30) end)
b4.MouseButton1Click:Connect(function() toggles[4]=not toggles[4] b4.Text="🏃 AUTO VELOCIDAD ["..(toggles[4] and "ON" or "OFF").."]" b4.BackgroundColor3=toggles[4] and Color3.fromRGB(130,0,255) or Color3.fromRGB(30,30,30) end)
b5.MouseButton1Click:Connect(function() toggles[5]=not toggles[5] b5.Text="💤 ANTI-AFK ["..(toggles[5] and "ON" or "OFF").."]" b5.BackgroundColor3=toggles[5] and Color3.fromRGB(130,0,255) or Color3.fromRGB(30,30,30) end)
b6.MouseButton1Click:Connect(function() toggles[6]=not toggles[6] b6.Text="✨ RECOGER TODO ["..(toggles[6] and "ON" or "OFF").."]" b6.BackgroundColor3=toggles[6] and Color3.fromRGB(130,0,255) or Color3.fromRGB(30,30,30) end)

-- LOOP PRINCIPAL
task.spawn(function()
	while task.wait(0.5) do
		pcall(function()
			-- AUTO ROBAR (mantiene E en los huevos cercanos)
			if toggles[1] then
				for _,v in pairs(workspace:GetDescendants()) do
					if v:IsA("ProximityPrompt") and v.ActionText:lower():find("huevo") or v.ObjectText:lower():find("egg") then
						if (p.Character.HumanoidRootPart.Position - v.Parent.Position).Magnitude < 15 then
							fireproximityprompt(v)
						end
					end
				end
			end
			-- AUTO COLOCAR (busca plots)
			if toggles[2] then
				for _,v in pairs(workspace:GetDescendants()) do
					if v:IsA("ProximityPrompt") and (v.ActionText:lower():find("colocar") or v.ActionText:lower():find("incubar") or v.ActionText:lower():find("hatch")) then
						if (p.Character.HumanoidRootPart.Position - v.Parent.Position).Magnitude < 20 then
							fireproximityprompt(v)
						end
					end
				end
			end
		end)
	end
end)

-- ANTI AFK
game.Players.LocalPlayer.Idled:Connect(function() if toggles[5] then game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame) task.wait(1) game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame) end end)

print("Manuscript Hub - Roba un Huevo Cargado ✅")
