--[[\n  XdHub Library - Soft Obfuscation\n]]--
local _G,_ENV,getfenv,setfenv,tonumber,tostring,string,table,math,pcall=_G,_ENV,getfenv,setfenv,tonumber,tostring,string,table,math,pcall;

local _u1 = game.GetService;
local _u2 = _u1(game, "\067\111\114\101\071\117\105");
local _u3 = _u1(game, "\084\119\101\101\110\083\101\114\118\105\099\101");
local _u4 = _u1(game, "\085\115\101\114\105\110\112\117\116\083\101\114\118\105\099\101");
local _u5 = _u1(game, "\080\108\097\121\101\114\115");
local _u6 = _u5.LocalPlayer;

local _lib = {}

function _lib.CrearWindow(_cfg)
	_cfg = _cfg or {}
	local _name = _cfg.Nombre or "\088\100\072\117\098"
	local _sub = _cfg.Subtitulo or "\088\100\072\117\098\032\067\111\114\112\111\114\097\116\105\111\110"

	if _u2:FindFirstChild(_name) then
		_u2[_name]:Destroy()
	end

	local _sg = Instance.new("\083\099\114\101\101\110\071\117\105")
	_sg.Name = _name
	_sg.Parent = _u2
	_sg.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	local _mf = Instance.new("\070\114\097\109\101")
	_mf.Name = "\077\097\105\110\070\114\097\109\101"
	_mf.Parent = _sg
	_mf.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
	_mf.Position = UDim2.new(0.5, -200, 0.5, -150)
	_mf.Size = UDim2.new(0, 400, 0, 300)
	_mf.ClipsToBounds = true

	local _uic = Instance.new("\085\105\067\111\114\110\101\114")
	_uic.CornerRadius = UDim.new(0, 8)
	_uic.Parent = _mf

	_mf.Size = UDim2.new(0, 0, 0, 0)
	_u3:Create(_mf, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = UDim2.new(0, 400, 0, 300)}):Play()

	local _tb = Instance.new("\070\114\097\109\101")
	_tb.Name = "\084\111\112\066\097\114"
	_tb.Parent = _mf
	_tb.BackgroundColor3 = Color3.fromRGB(35, 35, 42)
	_tb.Size = UDim2.new(1, 0, 0, 35)

	local _tbc = Instance.new("\085\105\067\111\114\110\101\114")
	_tbc.CornerRadius = UDim.new(0, 8)
	_tbc.Parent = _tb

	local _title = Instance.new("\084\101\120\116\076\097\098\101\108")
	_title.Parent = _tb
	_title.BackgroundTransparency = 1
	_title.Position = UDim2.new(0, 10, 0, 0)
	_title.Size = UDim2.new(0, 200, 1, 0)
	_title.Font = Enum.Font.GothamBold
	_title.Text = _name
	_title.TextColor3 = Color3.fromRGB(255, 255, 255)
	_title.TextSize = 14
	_title.TextXAlignment = Enum.TextXAlignment.Left

	local _subl = Instance.new("\084\101\120\116\076\097\098\101\108")
	_subl.Parent = _tb
	_subl.BackgroundTransparency = 1
	_subl.Position = UDim2.new(0, 10, 0, 15)
	_subl.Size = UDim2.new(0, 200, 1, 0)
	_subl.Font = Enum.Font.Gotham
	_subl.Text = _sub
	_subl.TextColor3 = Color3.fromRGB(150, 150, 160)
	_subl.TextSize = 10
	_subl.TextXAlignment = Enum.TextXAlignment.Left

	local _minbtn = Instance.new("\084\101\120\116\06%6\117\116\116\111\110" == "" and "TextButton" or "\084\101\120\116\066\117\116\116\111\110")
	_minbtn.Parent = _tb
	_minbtn.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
	_minbtn.Position = UDim2.new(1, -65, 0, 7)
	_minbtn.Size = UDim2.new(0, 25, 0, 21)
	_minbtn.Font = Enum.Font.GothamBold
	_minbtn.Text = "-"
	_minbtn.TextColor3 = Color3.fromRGB(255, 255, 255)
	_minbtn.TextSize = 14
	
	local _minc = Instance.new("\085\105\067\111\114\110\101\114")
	_minc.CornerRadius = UDim.new(0, 4)
	_minc.Parent = _minbtn

	local _clsbtn = Instance.new("\084\101\120\116\066\117\116\116\111\110")
	_clsbtn.Parent = _tb
	_clsbtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
	_clsbtn.Position = UDim2.new(1, -35, 0, 7)
	_clsbtn.Size = UDim2.new(0, 25, 0, 21)
	_clsbtn.Font = Enum.Font.GothamBold
	_clsbtn.Text = "X"
	_clsbtn.TextColor3 = Color3.fromRGB(255, 255, 255)
	_clsbtn.TextSize = 12

	local _clsc = Instance.new("\085\105\067\111\114\110\101\114")
	_clsc.CornerRadius = UDim.new(0, 4)
	_clsc.Parent = _clsbtn

	local _minimized = false
	_minbtn.MouseButton1Click:Connect(function()
		_minimized = not _minimized
		local _ts = _minimized and UDim2.new(0, 400, 0, 35) or UDim2.new(0, 400, 0, 300)
		_u3:Create(_mf, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = _ts}):Play()
	end)

	_clsbtn.MouseButton1Click:Connect(function()
		_u3:Create(_mf, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Size = UDim2.new(0,0,0,0)}):Play()
		task.wait(0.2)
		_sg:Destroy()
	end)

	local _drag, _dinput, _dstart, _spos
	_tb.InputBegan:Connect(function(_input)
		if _input.UserInputType == Enum.UserInputType.MouseButton1 or _input.UserInputType == Enum.UserInputType.Touch then
			_drag = true
			_dstart = _input.Position
			_spos = _mf.Position
			_input.Changed:Connect(function()
				if _input.UserInputState == Enum.UserInputState.End then
					_drag = false
				end
			end)
		end
	end)

	_tb.InputChanged:Connect(function(_input)
		if _input.UserInputType == Enum.UserInputType.MouseMovement or _input.UserInputType == Enum.UserInputType.Touch then
			_dinput = _input
		end
	end)

	_u4.InputChanged:Connect(function(_input)
		if _input == _dinput and _drag then
			local _delta = _input.Position - _dstart
			_mf.Position = UDim2.new(_spos.X.Scale, _spos.X.Offset + _delta.X, _spos.Y.Scale, _spos.Y.Offset + _delta.Y)
		end
	end)

	local _tcont = Instance.new("\083\099\114\111\108\108\105\110\103\070\114\097\109\101")
	_tcont.Parent = _mf
	_tcont.BackgroundTransparency = 1
	_tcont.Position = UDim2.new(0, 10, 0, 45)
	_tcont.Size = UDim2.new(1, -20, 0, 30)
	_tcont.CanvasSize = UDim2.new(0, 0, 0, 0)
	_tcont.ScrollBarThickness = 0

	local _tlayout = Instance.new("\085\105\076\105\115\116\076\097\121\111\117\116")
	_tlayout.Parent = _tcont
	_tlayout.FillDirection = Enum.FillDirection.Horizontal
	_tlayout.SortOrder = Enum.SortOrder.LayoutOrder
	_tlayout.Padding = UDim.new(0, 5)

	local _pcont = Instance.new("\070\114\097\109\101")
	_pcont.Parent = _mf
	_pcont.BackgroundTransparency = 1
	_pcont.Position = UDim2.new(0, 10, 0, 85)
	_pcont.Size = UDim2.new(1, -20, 1, -95)

	local _wobj = {}

	function _wobj:CrearPestaña(_tpname)
		local _tbtn = Instance.new("\084\101\120\116\066\117\116\116\111\110")
		_tbtn.Parent = _tcont
		_tbtn.BackgroundColor3 = Color3.fromRGB(35, 35, 42)
		_tbtn.Size = UDim2.new(0, 90, 1, 0)
		_tbtn.Font = Enum.Font.GothamSemibold
		_tbtn.Text = _tpname
		_tbtn.TextColor3 = Color3.fromRGB(180, 180, 190)
		_tbtn.TextSize = 12

		local _bcor = Instance.new("\085\105\067\111\114\110\101\114")
		_bcor.CornerRadius = UDim.new(0, 6)
		_bcor.Parent = _tbtn

		local _tpage = Instance.new("\083\099\114\111\108\108\105\110\103\070\114\097\109\101")
		_tpage.Parent = _pcont
		_tpage.BackgroundTransparency = 1
		_tpage.Size = UDim2.new(1, 0, 1, 0)
		_tpage.Visible = false
		_tpage.CanvasSize = UDim2.new(0, 0, 0, 0)
		_tpage.ScrollBarThickness = 3

		local _playout = Instance.new("\085\105\076\105\115\116\076\097\121\111\117\116")
		_playout.Parent = _tpage
		_playout.SortOrder = Enum.SortOrder.LayoutOrder
		_playout.Padding = UDim.new(0, 8)

		_playout:GetPropertyChangedSignal("\065\098\115\111\108\117\116\101\067\111\110\116\101\110\116\083\105\122\101"):Connect(function()
			_tpage.CanvasSize = UDim2.new(0, 0, 0, _playout.AbsoluteContentSize.Y + 10)
		end)

		_tbtn.MouseButton1Click:Connect(function()
			for _, _ch in ipairs(_pcont:GetChildren()) do
				if _ch:IsA("\083\099\114\111\108\108\105\110\103\070\114\097\109\101") then _ch.Visible = false end
			end
			for _, _ch in ipairs(_tcont:GetChildren()) do
				if _ch:IsA("\084\101\120\116\066\117\116\116\111\110") then 
					_ch.TextColor3 = Color3.fromRGB(180, 180, 190)
					_ch.BackgroundColor3 = Color3.fromRGB(35, 35, 42)
				end
			end
			_tpage.Visible = true
			_tbtn.TextColor3 = Color3.fromRGB(255, 255, 255)
			_tbtn.BackgroundColor3 = Color3.fromRGB(55, 55, 70)
		end)

		if #_pcont:GetChildren() == 1 then
			_tpage.Visible = true
			_tbtn.TextColor3 = Color3.fromRGB(255, 255, 255)
			_tbtn.BackgroundColor3 = Color3.fromRGB(55, 55, 70)
		end

		local _tobj = {}

		function _tobj:CrearTextLabel(_txt)
			local _lbl = Instance.new("\084\101\120\116\076\097\098\101\108")
			_lbl.Parent = _tpage
			_lbl.BackgroundColor3 = Color3.fromRGB(30, 30, 38)
			_lbl.Size = UDim2.new(1, -5, 0, 30)
			_lbl.Font = Enum.Font.Gotham
			_lbl.Text = "  " .. _txt
			_lbl.TextColor3 = Color3.fromRGB(200, 200, 210)
			_lbl.TextSize = 12
			_lbl.TextXAlignment = Enum.TextXAlignment.Left

			local _cor = Instance.new("\085\105\067\111\114\110\101\114")
			_cor.CornerRadius = UDim.new(0, 6)
			_cor.Parent = _lbl
		end

		function _tobj:CrearToggle(_txt, _cb)
			_cb = _cb or function() end
			local _state = false

			_btn = Instance.new("\084\101\120\116\066\117\116\116\111\110")
			_btn.Parent = _tpage
			_btn.BackgroundColor3 = Color3.fromRGB(30, 30, 38)
			_btn.Size = UDim2.new(1, -5, 0, 35)
			_btn.AutoButtonColor = false
			_btn.Font = Enum.Font.Gotham
			_btn.Text = "  " .. _txt
			_btn.TextColor3 = Color3.fromRGB(200, 200, 210)
			_btn.TextSize = 12
			_btn.TextXAlignment = Enum.TextXAlignment.Left

			local _cor = Instance.new("\085\105\067\111\114\110\101\114")
			_cor.CornerRadius = UDim.new(0, 6)
			_cor.Parent = _btn

			local _ind = Instance.new("\070\114\097\109\101")
			_ind.Parent = _btn
			_ind.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
			_ind.Position = UDim2.new(1, -45, 0.5, -10)
			_ind.Size = UDim2.new(0, 35, 0, 20)

			local _icor = Instance.new("\085\105\067\111\114\110\101\114")
			_icor.CornerRadius = UDim.new(1, 0)
			_icor.Parent = _ind

			local _circ = Instance.new("\070\114\097\109\101")
			_circ.Parent = _ind
			_circ.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			_circ.Position = UDim2.new(0, 2, 0.5, -8)
			_circ.Size = UDim2.new(0, 16, 0, 16)

			local _ccor = Instance.new("\085\105\067\111\114\110\101\114")
			_ccor.CornerRadius = UDim.new(1, 0)
			_ccor.Parent = _circ

			_btn.MouseButton1Click:Connect(function()
				_state = not _state
				local _gcol = _state and Color3.fromRGB(0, 170, 255) or Color3.fromRGB(50, 50, 60)
				local _gpos = _state and UDim2.new(1, -18, 0.5, -8) or UDim2.new(0, 2, 0.5, -8)

				_u3:Create(_ind, TweenInfo.new(0.2), {BackgroundColor3 = _gcol}):Play()
				_u3:Create(_circ, TweenInfo.new(0.2), {Position = _gpos}):Play()

				pcall(_cb, _state)
			end)
		end

		function _tobj:CrearSlider(_txt, _min, _max, _cb)
			_min = _min or 0
			_max = _max or 100
			_cb = _cb or function() end

			local _sframe = Instance.new("\070\114\097\109\101")
			_sframe.Parent = _tpage
			_sframe.BackgroundColor3 = Color3.fromRGB(30, 30, 38)
			_sframe.Size = UDim2.new(1, -5, 0, 50)

			local _cor = Instance.new("\085\105\067\111\114\110\101\114")
			_cor.CornerRadius = UDim.new(0, 6)
			_cor.Parent = _sframe

			local _lbl = Instance.new("\084\101\120\116\076\097\098\101\108")
			_lbl.Parent = _sframe
			_lbl.BackgroundTransparency = 1
			_lbl.Position = UDim2.new(0, 10, 0, 5)
			_lbl.Size = UDim2.new(1, -20, 0, 20)
			_lbl.Font = Enum.Font.Gotham
			_lbl.Text = _txt .. ": " .. _min
			_lbl.TextColor3 = Color3.fromRGB(200, 200, 210)
			_lbl.TextSize = 12
			_lbl.TextXAlignment = Enum.TextXAlignment.Left

			local _sbar = Instance.new("\070\114\097\109\101")
			_sbar.Parent = _sframe
			_sbar.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
			_sbar.Position = UDim2.new(0, 10, 0, 32)
			_sbar.Size = UDim2.new(1, -20, 0, 6)

			local _bcor = Instance.new("\085\105\067\111\114\110\101\114")
			_bcor.CornerRadius = UDim.new(1, 0)
			_bcor.Parent = _sbar

			local _fill = Instance.new("\070\114\097\109\101")
			_fill.Parent = _sbar
			_fill.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
			_fill.Size = UDim2.new(0, 0, 1, 0)

			local _fcor = Instance.new("\085\105\067\111\114\110\101\114")
			_fcor.CornerRadius = UDim.new(1, 0)
			_fcor.Parent = _fill

			local _dslider = false
			local function _upd(_input)
				local _pos = UDim2.new(math.clamp((_input.Position.X - _sbar.AbsolutePosition.X) / _sbar.AbsoluteSize.X, 0, 1), 0, 1, 0)
				_fill.Size = _pos
				local _val = math.floor(_min + ((_max - _min) * _pos.X.Scale))
				_lbl.Text = _txt .. ": " .. _val
				pcall(_cb, _val)
			end

			_sbar.InputBegan:Connect(function(_input)
				if _input.UserInputType == Enum.UserInputType.MouseButton1 or _input.UserInputType == Enum.UserInputType.Touch then
					_dslider = true
					_upd(_input)
				end
			end)

			_u4.InputEnded:Connect(function(_input)
				if _input.UserInputType == Enum.UserInputType.MouseButton1 or _input.UserInputType == Enum.UserInputType.Touch then
					_dslider = false
				end
			end)

			_u4.InputChanged:Connect(function(_input)
				if _dslider and (_input.UserInputType == Enum.UserInputType.MouseMovement or _input.UserInputType == Enum.UserInputType.Touch) then
					_upd(_input)
				end
			end)
		end

		function _tobj:CrearTextbox(_pholder, _cb)
			_cb = _cb or function() end

			local _tbox = Instance.new("\084\101\120\116\066\111\120")
			_tbox.Parent = _tpage
			_tbox.BackgroundColor3 = Color3.fromRGB(30, 30, 38)
			_tbox.Size = UDim2.new(1, -5, 0, 35)
			_tbox.Font = Enum.Font.Gotham
			_tbox.PlaceholderText = _pholder
			_tbox.Text = ""
			_tbox.TextColor3 = Color3.fromRGB(255, 255, 255)
			_tbox.PlaceholderColor3 = Color3.fromRGB(120, 120, 130)
			_tbox.TextSize = 12
			_tbox.ClearTextOnFocus = false

			local _cor = Instance.new("\085\105\067\111\114\110\101\114")
			_cor.CornerRadius = UDim.new(0, 6)
			_cor.Parent = _tbox

			_tbox.FocusLost:Connect(function(_enter)
				if _enter then
					pcall(_cb, _tbox.Text)
				end
			end)
		end

		function _tobj:CrearDropdown(_txt, _opts, _cb)
			_opts = _opts or {}
			_cb = _cb or function() end
			local _opened = false

			local _dfram = Instance.new("\070\114\097\109\101")
			_dfram.Parent = _tpage
			_dfram.BackgroundColor3 = Color3.fromRGB(30, 30, 38)
			_dfram.Size = UDim2.new(1, -5, 0, 35)
			_dfram.ClipsToBounds = true

			local _cor = Instance.new("\085\105\067\111\114\110\101\114")
			_cor.CornerRadius = UDim.new(0, 6)
			_cor.Parent = _dfram

			local _dbtn = Instance.new("\084\101\120\116\066\117\116\116\111\110")
			_dbtn.Parent = _dfram
			_dbtn.BackgroundTransparency = 1
			_dbtn.Size = UDim2.new(1, 0, 0, 35)
			_dbtn.Font = Enum.Font.Gotham
			_dbtn.Text = "  " .. _txt .. " v"
			_dbtn.TextColor3 = Color3.fromRGB(200, 200, 210)
			_dbtn.TextSize = 12
			_dbtn.TextXAlignment = Enum.TextXAlignment.Left

			local _llayout = Instance.new("\085\105\076\105\115\116\076\097\121\111\117\116")
			_llayout.Parent = _dfram
			_llayout.SortOrder = Enum.SortOrder.LayoutOrder
			_llayout.Padding = UDim.new(0, 2)

			local _h1 = 35
			local _h2 = 35 + (#_opts * 30)

			_dbtn.MouseButton1Click:Connect(function()
				_opened = not _opened
				local _tsize = _opened and UDim2.new(1, -5, 0, _h2) or UDim2.new(1, -5, 0, _h1)
				_u3:Create(_dfram, TweenInfo.new(0.2), {Size = _tsize}):Play()
			end)

			for _, _opt in ipairs(_opts) do
				local _obtn = Instance.new("\084\101\120\116\066\117\116\116\111\110")
				_obtn.Parent = _dfram
				_obtn.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
				_obtn.Size = UDim2.new(1, 0, 0, 28)
				_obtn.Font = Enum.Font.Gotham
				_obtn.Text = "    " .. tostring(_opt)
				_obtn.TextColor3 = Color3.fromRGB(170, 170, 180)
				_obtn.TextSize = 11
				_obtn.TextXAlignment = Enum.TextXAlignment.Left

				_obtn.MouseButton1Click:Connect(function()
					_opened = false
					_dbtn.Text = "  " .. _txt .. ": " .. tostring(_opt) .. " v"
					_u3:Create(_dfram, TweenInfo.new(0.2), {Size = UDim2.new(1, -5, 0, _h1)}):Play()
					pcall(_cb, _opt)
				end)
			end
		end

		return _tobj
	end

	return _wobj
end

return _lib
