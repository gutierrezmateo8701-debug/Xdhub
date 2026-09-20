--[[\n  Protected by XdHub Obfuscator\n  Repository: MateoSaken\n]]--
local _G,_ENV,getfenv,setfenv,tonumber,tostring,string,table,math,pcall=_G,_ENV,getfenv,setfenv,tonumber,tostring,string,table,math,pcall;
local _v1="\010\099\111\109\112\114\101\115\115\101\100\032\115\112\101\099\105\097\108";
local _c={
	"\083\101\114\118\105\099\101\115",
	"\077\111\117\115\101\101\110\010\099\111\109\112\114\101\115\115\101\100\032\115\112\101\099\105\097\108",
	"\067\111\114\101\071\117\105",
	"\084\119\101\101\110\083\101\114\118\105\099\101",
	"\085\115\101\114\105\110\112\117\116\083\101\114\118\105\099\101",
	"\080\108\097\121\101\114\115",
	"\073\110\115\116\097\110\099\101\046\110\101\119",
	"\083\099\114\101\101\110\071\117\105",
	"\070\114\097\109\101",
	"\084\101\120\116\076\09 মেয়ের",
	"\084\101\120\116\066\117\116\116\111\110",
	"\083\099\114\111\108\108\105\110\103\070\114\097\109\101",
	"\084\101\120\116\066\111\120"
};
local function _unpackEncoded(s)
	local res = "";
	for i = 1, #s do
		res = res .. string.char(string.byte(s, i))
	end
	return res
end

-- Núcleo de la librería ofuscada e inyectable
local function _InitXdHubSecure()
	local GS = game.GetService;
	local CG = GS(game, "CoreGui");
	local TS = GS(game, "TweenService");
	local UIS = GS(game, "UserInputService");
	local PLRS = GS(game, "Players");
	local LP = PLRS.LocalPlayer;

	local Lib = {}
	function Lib.CrearWindow(cfg)
		cfg = cfg or {}
		local Name = cfg.Nombre or "XdHub"
		local Sub = cfg.Subtitulo or "XdHub Corporation"
		
		if CG:FindFirstChild(Name) then CG[Name]:Destroy() end
		local SG = Instance.new("ScreenGui")
		SG.Name = Name
		SG.Parent = CG
		
		local MF = Instance.new("Frame")
		MF.Parent = SG
		MF.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
		MF.Position = UDim2.new(0.5, -200, 0.5, -150)
		MF.Size = UDim2.new(0, 400, 0, 300)
		MF.ClipsToBounds = true
		
		local UIC = Instance.new("UICorner")
		UIC.CornerRadius = UDim.new(0, 8)
		UIC.Parent = MF
		
		-- Animación inicial integrada
		MF.Size = UDim2.new(0,0,0,0)
		TS:Create(MF, TweenInfo.new(0.4, Enum.EasingStyle.Back), {Size = UDim2.new(0, 400, 0, 300)}):Play()
		
		local TB = Instance.new("Frame")
		TB.Parent = MF
		TB.BackgroundColor3 = Color3.fromRGB(35, 35, 42)
		TB.Size = UDim2.new(1, 0, 0, 35)
		
		local TBC = Instance.new("UICorner")
		TBC.CornerRadius = UDim.new(0, 8)
		TBC.Parent = TB
		
		local Title = Instance.new("TextLabel")
		Title.Parent = TB
		Title.BackgroundTransparency = 1
		Title.Position = UDim2.new(0, 10, 0, 0)
		Title.Size = UDim2.new(0, 200, 1, 0)
		Title.Font = Enum.Font.GothamBold
		Title.Text = Name
		Title.TextColor3 = Color3.fromRGB(255, 255, 255)
		Title.TextSize = 14
		Title.TextXAlignment = Enum.TextXAlignment.Left

		local SubLabel = Instance.new("TextLabel")
		SubLabel.Parent = TB
		SubLabel.BackgroundTransparency = 1
		SubLabel.Position = UDim2.new(0, 10, 0, 15)
		SubLabel.Size = UDim2.new(0, 200, 1, 0)
		SubLabel.Font = Enum.Font.Gotham
		SubLabel.Text = Sub
		SubLabel.TextColor3 = Color3.fromRGB(150, 150, 160)
		SubLabel.TextSize = 10
		SubLabel.TextXAlignment = Enum.TextXAlignment.Left

		-- Botón Minimizar
		local MinBtn = Instance.new("TextButton")
		MinBtn.Parent = TB
		MinBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
		MinBtn.Position = UDim2.new(1, -65, 0, 7)
		MinBtn.Size = UDim2.new(0, 25, 0, 21)
		MinBtn.Font = Enum.Font.GothamBold
		MinBtn.Text = "-"
		MinBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
		MinBtn.TextSize = 14
		Instance.new("UICorner", MinBtn).CornerRadius = UDim.new(0, 4)

		-- Botón Eliminar / Cerrar GUI
		local CloseBtn = Instance.new("TextButton")
		CloseBtn.Parent = TB
		CloseBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
		CloseBtn.Position = UDim2.new(1, -35, 0, 7)
		CloseBtn.Size = UDim2.new(0, 25, 0, 21)
		CloseBtn.Font = Enum.Font.GothamBold
		CloseBtn.Text = "X"
		CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
		CloseBtn.TextSize = 12
		Instance.new("UICorner", CloseBtn).CornerRadius = UDim.new(0, 4)

		local minimized = false
		MinBtn.MouseButton1Click:Connect(function()
			minimized = not minimized
			local target = minimized and UDim2.new(0, 400, 0, 35) or UDim2.new(0, 400, 0, 300)
			TS:Create(MF, TweenInfo.new(0.3), {Size = target}):Play()
		end)

		CloseBtn.MouseButton1Click:Connect(function()
			TS:Create(MF, TweenInfo.new(0.2), {Size = UDim2.new(0,0,0,0)}):Play()
			task.wait(0.2)
			SG:Destroy()
		end)

		-- Contenedores de Pestañas
		local TabCont = Instance.new("ScrollingFrame")
		TabCont.Parent = MF
		TabCont.BackgroundTransparency = 1
		TabCont.Position = UDim2.new(0, 10, 0, 45)
		TabCont.Size = UDim2.new(1, -20, 0, 30)
		TabCont.CanvasSize = UDim2.new(0,0,0,0)
		TabCont.ScrollBarThickness = 0
		
		local TLayout = Instance.new("UIListLayout")
		TLayout.Parent = TabCont
		TLayout.FillDirection = Enum.FillDirection.Horizontal
		TLayout.Padding = UDim.new(0, 5)

		local Pages = Instance.new("Frame")
		Pages.Parent = MF
		Pages.BackgroundTransparency = 1
		Pages.Position = UDim2.new(0, 10, 0, 85)
		Pages.Size = UDim2.new(1, -20, 1, -95)

		local WindowObj = {}
		function WindowObj:CrearPestaña(name)
			local TBtn = Instance.new("TextButton")
			TBtn.Parent = TabCont
			TBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 42)
			TBtn.Size = UDim2.new(0, 90, 1, 0)
			TBtn.Font = Enum.Font.GothamSemibold
			TBtn.Text = name
			TBtn.TextColor3 = Color3.fromRGB(180, 180, 190)
			TBtn.TextSize = 12
			Instance.new("UICorner", TBtn).CornerRadius = UDim.new(0, 6)

			local Page = Instance.new("ScrollingFrame")
			Page.Parent = Pages
			Page.BackgroundTransparency = 1
			Page.Size = UDim2.new(1, 0, 1, 0)
			Page.Visible = false
			Page.ScrollBarThickness = 3
			
			local PLayout = Instance.new("UIListLayout")
			PLayout.Parent = Page
			PLayout.Padding = UDim.new(0, 8)
			PLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
				Page.CanvasSize = UDim2.new(0, 0, 0, PLayout.AbsoluteContentSize.Y + 10)
			end)

			TBtn.MouseButton1Click:Connect(function()
				for _, v in pairs(Pages:GetChildren()) do if v:IsA("ScrollingFrame") then v.Visible = false end end
				for _, v in pairs(TabCont:GetChildren()) do if v:IsA("TextButton") then v.TextColor3 = Color3.fromRGB(180, 180, 190) end end
				Page.Visible = true
				TBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
			end)

			if #Pages:GetChildren() == 1 then Page.Visible = true end

			local TabObj = {}
			
			function TabObj:CrearTextLabel(txt)
				local lbl = Instance.new("TextLabel", Page)
				lbl.BackgroundColor3 = Color3.fromRGB(30, 30, 38)
				lbl.Size = UDim2.new(1, -5, 0, 30)
				lbl.Font = Enum.Font.Gotham
				lbl.Text = "  " .. txt
				lbl.TextColor3 = Color3.fromRGB(200, 200, 210)
				lbl.TextSize = 12
				lbl.TextXAlignment = Enum.TextXAlignment.Left
				Instance.new("UICorner", lbl).CornerRadius = UDim.new(0, 6)
			end

			function TabObj:CrearToggle(txt, cb)
				cb = cb or function() end
				local state = false
				local btn = Instance.new("TextButton", Page)
				btn.BackgroundColor3 = Color3.fromRGB(30, 30, 38)
				btn.Size = UDim2.new(1, -5, 0, 35)
				btn.Font = Enum.Font.Gotham
				btn.Text = "  " .. txt
				btn.TextColor3 = Color3.fromRGB(200, 200, 210)
				btn.TextSize = 12
				btn.TextXAlignment = Enum.TextXAlignment.Left
				Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)

				local ind = Instance.new("Frame", btn)
				ind.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
				ind.Position = UDim2.new(1, -45, 0.5, -10)
				ind.Size = UDim2.new(0, 35, 0, 20)
				Instance.new("UICorner", ind).CornerRadius = UDim.new(1, 0)

				local circle = Instance.new("Frame", ind)
				circle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				circle.Position = UDim2.new(0, 2, 0.5, -8)
				circle.Size = UDim2.new(0, 16, 0, 16)
				Instance.new("UICorner", circle).CornerRadius = UDim.new(1, 0)

				btn.MouseButton1Click:Connect(function()
					state = not state
					TS:Create(ind, TweenInfo.new(0.2), {BackgroundColor3 = state and Color3.fromRGB(0, 170, 255) or Color3.fromRGB(50, 50, 60)}):Play()
					TS:Create(circle, TweenInfo.new(0.2), {Position = state and UDim2.new(1, -18, 0.5, -8) or UDim2.new(0, 2, 0.5, -8)}):Play()
					pcall(cb, state)
				end)
			end

			function TabObj:CrearSlider(txt, min, max, cb)
				min, max, cb = min or 0, max or 100, cb or function() end
				local sf = Instance.new("Frame", Page)
				sf.BackgroundColor3 = Color3.fromRGB(30, 30, 38)
				sf.Size = UDim2.new(1, -5, 0, 50)
				Instance.new("UICorner", sf).CornerRadius = UDim.new(0, 6)

				local lbl = Instance.new("TextLabel", sf)
				lbl.BackgroundTransparency = 1
				lbl.Position = UDim2.new(0, 10, 0, 5)
				lbl.Size = UDim2.new(1, -20, 0, 20)
				lbl.Font = Enum.Font.Gotham
				lbl.Text = txt .. ": " .. min
				lbl.TextColor3 = Color3.fromRGB(200, 200, 210)
				lbl.TextSize = 12
				lbl.TextXAlignment = Enum.TextXAlignment.Left

				local sbar = Instance.new("Frame", sf)
				sbar.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
				sbar.Position = UDim2.new(0, 10, 0, 32)
				sbar.Size = UDim2.new(1, -20, 0, 6)
				Instance.new("UICorner", sbar).CornerRadius = UDim.new(1, 0)

				local fill = Instance.new("Frame", sbar)
				fill.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
				fill.Size = UDim2.new(0, 0, 1, 0)
				Instance.new("UICorner", fill).CornerRadius = UDim.new(1, 0)

				local dragging = false
				sbar.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
						dragging = true
					end
				end)
				UIS.InputEnded:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
						dragging = false
					end
				end)
				UIS.InputChanged:Connect(function(input)
					if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
						local pos = UDim2.new(math.clamp((input.Position.X - sbar.AbsolutePosition.X) / sbar.AbsoluteSize.X, 0, 1), 0, 1, 0)
						fill.Size = pos
						local val = math.floor(min + ((max - min) * pos.X.Scale))
						lbl.Text = txt .. ": " .. val
						pcall(cb, val)
					end
				end)
			end

			function TabObj:CrearTextbox(placeholder, cb)
				cb = cb or function() end
				local tb = Instance.new("TextBox", Page)
				tb.BackgroundColor3 = Color3.fromRGB(30, 30, 38)
				tb.Size = UDim2.new(1, -5, 0, 35)
				tb.Font = Enum.Font.Gotham
				tb.PlaceholderText = placeholder
				tb.Text = ""
				tb.TextColor3 = Color3.fromRGB(255, 255, 255)
				tb.TextSize = 12
				Instance.new("UICorner", tb).CornerRadius = UDim.new(0, 6)
				tb.FocusLost:Connect(function(enter)
					if enter then pcall(cb, tb.Text) end
				end)
			end

			function TabObj:CrearDropdown(txt, opts, cb)
				opts, cb = opts or {}, cb or function() end
				local opened = false
				local df = Instance.new("Frame", Page)
				df.BackgroundColor3 = Color3.fromRGB(30, 30, 38)
				df.Size = UDim2.new(1, -5, 0, 35)
				df.ClipsToBounds = true
				Instance.new("UICorner", df).CornerRadius = UDim.new(0, 6)

				local dbtn = Instance.new("TextButton", df)
				dbtn.BackgroundTransparency = 1
				dbtn.Size = UDim2.new(1, 0, 0, 35)
				dbtn.Font = Enum.Font.Gotham
				dbtn.Text = "  " .. txt .. " v"
				dbtn.TextColor3 = Color3.fromRGB(200, 200, 210)
				dbtn.TextSize = 12
				dbtn.TextXAlignment = Enum.TextXAlignment.Left

				local layout = Instance.new("UIListLayout", df)
				layout.Padding = UDim.new(0, 2)

				local hOrig, hExp = 35, 35 + (#opts * 30)
				dbtn.MouseButton1Click:Connect(function()
					opened = not opened
					TS:Create(df, TweenInfo.new(0.2), {Size = opened and UDim2.new(1, -5, 0, hExp) or UDim2.new(1, -5, 0, hOrig)}):Play()
				end)

				for _, opt in ipairs(opts) do
					local obtn = Instance.new("TextButton", df)
					obtn.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
					obtn.Size = UDim2.new(1, 0, 0, 28)
					obtn.Font = Enum.Font.Gotham
					obtn.Text = "    " .. tostring(opt)
					obtn.TextColor3 = Color3.fromRGB(170, 170, 180)
					obtn.TextSize = 11
					obtn.TextXAlignment = Enum.TextXAlignment.Left
					obtn.MouseButton1Click:Connect(function()
						opened = false
						dbtn.Text = "  " .. txt .. ": " .. tostring(opt) .. " v"
						TS:Create(df, TweenInfo.new(0.2), {Size = UDim2.new(1, -5, 0, hOrig)}):Play()
						pcall(cb, opt)
					end)
				end
			end

			return TabObj
		end

		return WindowObj
	end

	return Lib
end

return _InitXdHubSecure()
