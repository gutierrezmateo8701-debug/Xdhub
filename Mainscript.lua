local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local XdHubLib = {}

function XdHubLib.CrearWindow(config)
	config = config or {}
	local Nombre = config.Nombre or "XdHub"
	local Subtitulo = config.Subtitulo or "XdHub Corporation"

	if CoreGui:FindFirstChild(Nombre) then
		CoreGui[Nombre]:Destroy()
	end

	local ScreenGui = Instance.new("ScreenGui")
	ScreenGui.Name = Nombre
	ScreenGui.Parent = CoreGui
	ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	ScreenGui.ResetOnSpawn = false

	local MainFrame = Instance.new("Frame")
	MainFrame.Name = "MainFrame"
	MainFrame.Parent = ScreenGui
	MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
	MainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
	MainFrame.Size = UDim2.new(0, 400, 0, 300)
	MainFrame.ClipsToBounds = true

	local UICorner = Instance.new("UICorner")
	UICorner.CornerRadius = UDim.new(0, 8)
	UICorner.Parent = MainFrame

	-- Animación de apertura
	MainFrame.Size = UDim2.new(0, 0, 0, 0)
	TweenService:Create(MainFrame, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = UDim2.new(0, 400, 0, 300)}):Play()

	local TopBar = Instance.new("Frame")
	TopBar.Name = "TopBar"
	TopBar.Parent = MainFrame
	TopBar.BackgroundColor3 = Color3.fromRGB(35, 35, 42)
	TopBar.Size = UDim2.new(1, 0, 0, 35)

	local TopCorner = Instance.new("UICorner")
	TopCorner.CornerRadius = UDim.new(0, 8)
	TopCorner.Parent = TopBar

	local Title = Instance.new("TextLabel")
	Title.Parent = TopBar
	Title.BackgroundTransparency = 1
	Title.Position = UDim2.new(0, 10, 0, 0)
	Title.Size = UDim2.new(0, 200, 1, 0)
	Title.Font = Enum.Font.GothamBold
	Title.Text = Nombre
	Title.TextColor3 = Color3.fromRGB(255, 255, 255)
	Title.TextSize = 14
	Title.TextXAlignment = Enum.TextXAlignment.Left

	local SubTitleLabel = Instance.new("TextLabel")
	SubTitleLabel.Parent = TopBar
	SubTitleLabel.BackgroundTransparency = 1
	SubTitleLabel.Position = UDim2.new(0, 10, 0, 15)
	SubTitleLabel.Size = UDim2.new(0, 200, 1, 0)
	SubTitleLabel.Font = Enum.Font.Gotham
	SubTitleLabel.Text = Subtitulo
	SubTitleLabel.TextColor3 = Color3.fromRGB(150, 150, 160)
	SubTitleLabel.TextSize = 10
	SubTitleLabel.TextXAlignment = Enum.TextXAlignment.Left

	-- Botón Minimizar
	local MinimizeBtn = Instance.new("TextButton")
	MinimizeBtn.Parent = TopBar
	MinimizeBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
	MinimizeBtn.Position = UDim2.new(1, -65, 0, 7)
	MinimizeBtn.Size = UDim2.new(0, 25, 0, 21)
	MinimizeBtn.Font = Enum.Font.GothamBold
	MinimizeBtn.Text = "-"
	MinimizeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
	MinimizeBtn.TextSize = 14
	Instance.new("UICorner", MinimizeBtn).CornerRadius = UDim.new(0, 4)

	-- Botón Cerrar (Eliminar GUI)
	local CloseBtn = Instance.new("TextButton")
	CloseBtn.Parent = TopBar
	CloseBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
	CloseBtn.Position = UDim2.new(1, -35, 0, 7)
	CloseBtn.Size = UDim2.new(0, 25, 0, 21)
	CloseBtn.Font = Enum.Font.GothamBold
	CloseBtn.Text = "X"
	CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
	CloseBtn.TextSize = 12
	Instance.new("UICorner", CloseBtn).CornerRadius = UDim.new(0, 4)

	local minimized = false
	MinimizeBtn.MouseButton1Click:Connect(function()
		minimized = not minimized
		local targetSize = minimized and UDim2.new(0, 400, 0, 35) or UDim2.new(0, 400, 0, 300)
		TweenService:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = targetSize}):Play()
	end)

	CloseBtn.MouseButton1Click:Connect(function()
		TweenService:Create(MainFrame, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Size = UDim2.new(0,0,0,0)}):Play()
		task.wait(0.2)
		ScreenGui:Destroy()
	end)

	-- Arrastre seguro compatible con dispositivos móviles y PC
	local dragging, dragInput, dragStart, startPos
	TopBar.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = MainFrame.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)

	TopBar.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)

	UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			local delta = input.Position - dragStart
			MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		end
	end)

	local TabButtonsContainer = Instance.new("ScrollingFrame")
	TabButtonsContainer.Parent = MainFrame
	TabButtonsContainer.BackgroundTransparency = 1
	TabButtonsContainer.Position = UDim2.new(0, 10, 0, 45)
	TabButtonsContainer.Size = UDim2.new(1, -20, 0, 30)
	TabButtonsContainer.CanvasSize = UDim2.new(0, 0, 0, 0)
	TabButtonsContainer.ScrollBarThickness = 0

	local UIListLayout = Instance.new("UIListLayout")
	UIListLayout.Parent = TabButtonsContainer
	UIListLayout.FillDirection = Enum.FillDirection.Horizontal
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.Padding = UDim.new(0, 5)

	local PagesContainer = Instance.new("Frame")
	PagesContainer.Parent = MainFrame
	PagesContainer.BackgroundTransparency = 1
	PagesContainer.Position = UDim2.new(0, 10, 0, 85)
	PagesContainer.Size = UDim2.new(1, -20, 1, -95)

	local WindowObj = {}

	function WindowObj:CrearPestaña(nombrePestaña)
		local TabButton = Instance.new("TextButton")
		TabButton.Parent = TabButtonsContainer
		TabButton.BackgroundColor3 = Color3.fromRGB(35, 35, 42)
		TabButton.Size = UDim2.new(0, 90, 1, 0)
		TabButton.Font = Enum.Font.GothamSemibold
		TabButton.Text = nombrePestaña
		TabButton.TextColor3 = Color3.fromRGB(180, 180, 190)
		TabButton.TextSize = 12
		Instance.new("UICorner", TabButton).CornerRadius = UDim.new(0, 6)

		local TabPage = Instance.new("ScrollingFrame")
		TabPage.Parent = PagesContainer
		TabPage.BackgroundTransparency = 1
		TabPage.Size = UDim2.new(1, 0, 1, 0)
		TabPage.Visible = false
		TabPage.CanvasSize = UDim2.new(0, 0, 0, 0)
		TabPage.ScrollBarThickness = 3

		local PageLayout = Instance.new("UIListLayout")
		PageLayout.Parent = TabPage
		PageLayout.SortOrder = Enum.SortOrder.LayoutOrder
		PageLayout.Padding = UDim.new(0, 8)

		PageLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
			TabPage.CanvasSize = UDim2.new(0, 0, 0, PageLayout.AbsoluteContentSize.Y + 10)
		end)

		TabButton.MouseButton1Click:Connect(function()
			for _, child in ipairs(PagesContainer:GetChildren()) do
				if child:IsA("ScrollingFrame") then child.Visible = false end
			end
			for _, child in ipairs(TabButtonsContainer:GetChildren()) do
				if child:IsA("TextButton") then 
					child.TextColor3 = Color3.fromRGB(180, 180, 190)
					child.BackgroundColor3 = Color3.fromRGB(35, 35, 42)
				end
			end
			TabPage.Visible = true
			TabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
			TabButton.BackgroundColor3 = Color3.fromRGB(55, 55, 70)
		end)

		if #PagesContainer:GetChildren() == 1 then
			TabPage.Visible = true
			TabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
			TabButton.BackgroundColor3 = Color3.fromRGB(55, 55, 70)
		end

		local TabObj = {}

		function TabObj:CrearTextLabel(texto)
			local Label = Instance.new("TextLabel")
			Label.Parent = TabPage
			Label.BackgroundColor3 = Color3.fromRGB(30, 30, 38)
			Label.Size = UDim2.new(1, -5, 0, 30)
			Label.Font = Enum.Font.Gotham
			Label.Text = "  " .. texto
			Label.TextColor3 = Color3.fromRGB(200, 200, 210)
			Label.TextSize = 12
			Label.TextXAlignment = Enum.TextXAlignment.Left
			Instance.new("UICorner", Label).CornerRadius = UDim.new(0, 6)
		end

		function TabObj:CrearToggle(texto, callback)
			callback = callback or function() end
			local toggled = false

			local ToggleBtn = Instance.new("TextButton")
			ToggleBtn.Parent = TabPage
			ToggleBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 38)
			ToggleBtn.Size = UDim2.new(1, -5, 0, 35)
			ToggleBtn.AutoButtonColor = false
			ToggleBtn.Font = Enum.Font.Gotham
			ToggleBtn.Text = "  " .. texto
			ToggleBtn.TextColor3 = Color3.fromRGB(200, 200, 210)
			ToggleBtn.TextSize = 12
			ToggleBtn.TextXAlignment = Enum.TextXAlignment.Left
			Instance.new("UICorner", ToggleBtn).CornerRadius = UDim.new(0, 6)

			local Indicator = Instance.new("Frame")
			Indicator.Parent = ToggleBtn
			Indicator.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
			Indicator.Position = UDim2.new(1, -45, 0.5, -10)
			Indicator.Size = UDim2.new(0, 35, 0, 20)
			Instance.new("UICorner", Indicator).CornerRadius = UDim.new(1, 0)

			local Circle = Instance.new("Frame")
			Circle.Parent = Indicator
			Circle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Circle.Position = UDim2.new(0, 2, 0.5, -8)
			Circle.Size = UDim2.new(0, 16, 0, 16)
			Instance.new("UICorner", Circle).CornerRadius = UDim.new(1, 0)

			ToggleBtn.MouseButton1Click:Connect(function()
				toggled = not toggled
				local goalColor = toggled and Color3.fromRGB(0, 170, 255) or Color3.fromRGB(50, 50, 60)
				local goalPos = toggled and UDim2.new(1, -18, 0.5, -8) or UDim2.new(0, 2, 0.5, -8)

				TweenService:Create(Indicator, TweenInfo.new(0.2), {BackgroundColor3 = goalColor}):Play()
				TweenService:Create(Circle, TweenInfo.new(0.2), {Position = goalPos}):Play()

				pcall(callback, toggled)
			end)
		end

		function TabObj:CrearSlider(texto, min, max, callback)
			min = min or 0
			max = max or 100
			callback = callback or function() end

			local SliderFrame = Instance.new("Frame")
			SliderFrame.Parent = TabPage
			SliderFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 38)
			SliderFrame.Size = UDim2.new(1, -5, 0, 50)
			Instance.new("UICorner", SliderFrame).CornerRadius = UDim.new(0, 6)

			local Label = Instance.new("TextLabel")
			Label.Parent = SliderFrame
			Label.BackgroundTransparency = 1
			Label.Position = UDim2.new(0, 10, 0, 5)
			Label.Size = UDim2.new(1, -20, 0, 20)
			Label.Font = Enum.Font.Gotham
			Label.Text = texto .. ": " .. min
			Label.TextColor3 = Color3.fromRGB(200, 200, 210)
			Label.TextSize = 12
			Label.TextXAlignment = Enum.TextXAlignment.Left

			local SliderBar = Instance.new("Frame")
			SliderBar.Parent = SliderFrame
			SliderBar.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
			SliderBar.Position = UDim2.new(0, 10, 0, 32)
			SliderBar.Size = UDim2.new(1, -20, 0, 6)
			Instance.new("UICorner", SliderBar).CornerRadius = UDim.new(1, 0)

			local Fill = Instance.new("Frame")
			Fill.Parent = SliderBar
			Fill.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
			Fill.Size = UDim2.new(0, 0, 1, 0)
			Instance.new("UICorner", Fill).CornerRadius = UDim.new(1, 0)

			local draggingSlider = false
			local function updateSlider(input)
				local pos = UDim2.new(math.clamp((input.Position.X - SliderBar.AbsolutePosition.X) / SliderBar.AbsoluteSize.X, 0, 1), 0, 1, 0)
				Fill.Size = pos
				local val = math.floor(min + ((max - min) * pos.X.Scale))
				Label.Text = texto .. ": " .. val
				pcall(callback, val)
			end

			SliderBar.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
					draggingSlider = true
					updateSlider(input)
				end
			end)

			UserInputService.InputEnded:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
					draggingSlider = false
				end
			end)

			UserInputService.InputChanged:Connect(function(input)
				if draggingSlider and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
					updateSlider(input)
				end
			end)
		end

		function TabObj:CrearTextbox(textoPlaceholder, callback)
			callback = callback or function() end

			local TextBox = Instance.new("TextBox")
			TextBox.Parent = TabPage
			TextBox.BackgroundColor3 = Color3.fromRGB(30, 30, 38)
			TextBox.Size = UDim2.new(1, -5, 0, 35)
			TextBox.Font = Enum.Font.Gotham
			TextBox.PlaceholderText = textoPlaceholder
			TextBox.Text = ""
			TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextBox.PlaceholderColor3 = Color3.fromRGB(120, 120, 130)
			TextBox.TextSize = 12
			TextBox.ClearTextOnFocus = false
			Instance.new("UICorner", TextBox).CornerRadius = UDim.new(0, 6)

			TextBox.FocusLost:Connect(function(enterPressed)
				if enterPressed then
					pcall(callback, TextBox.Text)
				end
			end)
		end

		function TabObj:CrearDropdown(texto, opciones, callback)
			opciones = opciones or {}
			callback = callback or function() end
			local opened = false

			local DropFrame = Instance.new("Frame")
			DropFrame.Parent = TabPage
			DropFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 38)
			DropFrame.Size = UDim2.new(1, -5, 0, 35)
			DropFrame.ClipsToBounds = true
			Instance.new("UICorner", DropFrame).CornerRadius = UDim.new(0, 6)

			local DropBtn = Instance.new("TextButton")
			DropBtn.Parent = DropFrame
			DropBtn.BackgroundTransparency = 1
			DropBtn.Size = UDim2.new(1, 0, 0, 35)
			DropBtn.Font = Enum.Font.Gotham
			DropBtn.Text = "  " .. texto .. " v"
			DropBtn.TextColor3 = Color3.fromRGB(200, 200, 210)
			DropBtn.TextSize = 12
			DropBtn.TextXAlignment = Enum.TextXAlignment.Left

			local ListLayout = Instance.new("UIListLayout")
			ListLayout.Parent = DropFrame
			ListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			ListLayout.Padding = UDim.new(0, 2)

			local heightOriginal = 35
			local heightExpanded = 35 + (#opciones * 30)

			DropBtn.MouseButton1Click:Connect(function()
				opened = not opened
				local targetSize = opened and UDim2.new(1, -5, 0, heightExpanded) or UDim2.new(1, -5, 0, heightOriginal)
				TweenService:Create(DropFrame, TweenInfo.new(0.2), {Size = targetSize}):Play()
			end)

			for _, opcion in ipairs(opciones) do
				local OpBtn = Instance.new("TextButton")
				OpBtn.Parent = DropFrame
				OpBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
				OpBtn.Size = UDim2.new(1, 0, 0, 28)
				OpBtn.Font = Enum.Font.Gotham
				OpBtn.Text = "    " .. tostring(opcion)
				OpBtn.TextColor3 = Color3.fromRGB(170, 170, 180)
				OpBtn.TextSize = 11
				OpBtn.TextXAlignment = Enum.TextXAlignment.Left

				OpBtn.MouseButton1Click:Connect(function()
					opened = false
					DropBtn.Text = "  " .. texto .. ": " .. tostring(opcion) .. " v"
					TweenService:Create(DropFrame, TweenInfo.new(0.2), {Size = UDim2.new(1, -5, 0, heightOriginal)}):Play()
					pcall(callback, opcion)
				end)
			end
		end

		return TabObj
	end

	return WindowObj
end

return XdHubLib
