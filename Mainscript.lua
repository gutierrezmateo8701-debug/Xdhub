--// Librería de UI Ofuscada Suave - Con Minimizar y Eliminar UI
--// GitHub Ready

local _sCore = game:GetService("CoreGui")
local _sUser = game:GetService("UserInputService")
local _sTween = game:GetService("TweenService")
local _sPlayers = game:GetService("Players").LocalPlayer

local _HubLib = {}
_HubLib.__index = _HubLib

local _Themes = {
    Dark = {
        Main = Color3.fromRGB(20, 20, 20),
        Secondary = Color3.fromRGB(30, 30, 30),
        Accent = Color3.fromRGB(0, 162, 255),
        Text = Color3.fromRGB(255, 255, 255)
    },
    Light = {
        Main = Color3.fromRGB(240, 240, 240),
        Secondary = Color3.fromRGB(220, 220, 220),
        Accent = Color3.fromRGB(0, 120, 215),
        Text = Color3.fromRGB(20, 20, 20)
    }
}

function _HubLib:CrearHub(_titulo, _currTheme)
    local _self = setmetatable({}, _HubLib)
    local _th = _Themes[_currTheme] or _Themes.Dark
    
    local _ScreenGui = Instance.new("ScreenGui")
    _ScreenGui.Name = "\0"
    _ScreenGui.Parent = _sCore
    _ScreenGui.ResetOnSpawn = false
    _self.Gui = _ScreenGui

    -- Key System
    local _KeyFrame = Instance.new("Frame")
    _KeyFrame.Size = UDim2.new(0, 300, 0, 180)
    _KeyFrame.Position = UDim2.new(0.5, -150, 0.5, -90)
    _KeyFrame.BackgroundColor3 = _th.Main
    _KeyFrame.BorderSizePixel = 0
    _KeyFrame.Parent = _ScreenGui
    
    local _KeyCorner = Instance.new("UICorner")
    _KeyCorner.CornerRadius = UDim.new(0, 8)
    _KeyCorner.Parent = _KeyFrame

    local _KeyTitle = Instance.new("TextLabel")
    _KeyTitle.Size = UDim2.new(1, 0, 0, 40)
    _KeyTitle.BackgroundTransparency = 1
    _KeyTitle.Text = "Sistema de Clave"
    _KeyTitle.TextColor3 = _th.Text
    _KeyTitle.TextSize = 18
    _KeyTitle.Font = Enum.Font.GothamBold
    _KeyTitle.Parent = _KeyFrame

    local _KeyBox = Instance.new("TextBox")
    _KeyBox.Size = UDim2.new(0.8, 0, 0, 40)
    _KeyBox.Position = UDim2.new(0.1, 0, 0.35, 0)
    _KeyBox.BackgroundColor3 = _th.Secondary
    _KeyBox.TextColor3 = _th.Text
    _KeyBox.PlaceholderText = "Ingresa la clave..."
    _KeyBox.Text = ""
    _KeyBox.TextSize = 14
    _KeyBox.Font = Enum.Font.Gotham
    _KeyBox.Parent = _KeyFrame
    
    local _BoxCorner = Instance.new("UICorner")
    _BoxCorner.CornerRadius = UDim.new(0, 6)
    _BoxCorner.Parent = _KeyBox

    local _KeyBtn = Instance.new("TextButton")
    _KeyBtn.Size = UDim2.new(0.8, 0, 0, 35)
    _KeyBtn.Position = UDim2.new(0.1, 0, 0.7, 0)
    _KeyBtn.BackgroundColor3 = _th.Accent
    _KeyBtn.Text = "Verificar"
    _KeyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    _KeyBtn.TextSize = 14
    _KeyBtn.Font = Enum.Font.GothamBold
    _KeyBtn.Parent = _KeyFrame
    
    local _BtnCorner = Instance.new("UICorner")
    _BtnCorner.CornerRadius = UDim.new(0, 6)
    _BtnCorner.Parent = _KeyBtn

    -- Main Frame
    local _MainFrame = Instance.new("Frame")
    _MainFrame.Size = UDim2.new(0, 500, 0, 350)
    _MainFrame.Position = UDim2.new(0.5, -250, 0.5, -175)
    _MainFrame.BackgroundColor3 = _th.Main
    _MainFrame.BorderSizePixel = 0
    _MainFrame.Visible = false
    _MainFrame.Parent = _ScreenGui

    local _MainCorner = Instance.new("UICorner")
    _MainCorner.CornerRadius = UDim.new(0, 10)
    _MainCorner.Parent = _MainFrame

    -- Título del Hub Principal
    local _HubTitle = Instance.new("TextLabel")
    _HubTitle.Size = UDim2.new(0, 250, 0, 35)
    _HubTitle.Position = UDim2.new(0, 10, 0, 5)
    _HubTitle.BackgroundTransparency = 1
    _HubTitle.Text = "  " .. _titulo
    _HubTitle.TextColor3 = _th.Text
    _HubTitle.TextSize = 15
    _HubTitle.Font = Enum.Font.GothamBold
    _HubTitle.TextXAlignment = Enum.TextXAlignment.Left
    _HubTitle.Parent = _MainFrame

    -- Botón de Minimizar (-) en la esquina superior derecha del Hub
    local _MinBtn = Instance.new("TextButton")
    _MinBtn.Size = UDim2.new(0, 30, 0, 30)
    _MinBtn.Position = UDim2.new(1, -70, 0, 5)
    _MinBtn.BackgroundColor3 = _th.Secondary
    _MinBtn.Text = "-"
    _MinBtn.TextColor3 = _th.Text
    _MinBtn.TextSize = 18
    _MinBtn.Font = Enum.Font.GothamBold
    _MinBtn.Parent = _MainFrame

    local _MinCorner = Instance.new("UICorner")
    _MinCorner.CornerRadius = UDim.new(0, 6)
    _MinCorner.Parent = _MinBtn

    -- Botón de Cerrar/Eliminar (X) en la esquina superior derecha del Hub
    local _CloseBtn = Instance.new("TextButton")
    _CloseBtn.Size = UDim2.new(0, 30, 0, 30)
    _CloseBtn.Position = UDim2.new(1, -35, 0, 5)
    _CloseBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
    _CloseBtn.Text = "X"
    _CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    _CloseBtn.TextSize = 14
    _CloseBtn.Font = Enum.Font.GothamBold
    _CloseBtn.Parent = _MainFrame

    local _CloseCorner = Instance.new("UICorner")
    _CloseCorner.CornerRadius = UDim.new(0, 6)
    _CloseCorner.Parent = _CloseBtn

    _KeyBtn.MouseButton1Click:Connect(function()
        if _KeyBox.Text == "1234" then
            _KeyFrame:Destroy()
            _MainFrame.Visible = true
            _ToggleBtn.Visible = true
        else
            _KeyBox.Text = ""
            _KeyBox.PlaceholderText = "¡Clave Incorrecta!"
        end
    end)

    -- Draggable
    local _drag, _dragInput, _dragStart, _startPos
    _MainFrame.InputBegan:Connect(function(_input)
        if _input.UserInputType == Enum.UserInputType.MouseButton1 or _input.UserInputType == Enum.UserInputType.Touch then
            _drag = true
            _dragStart = _input.Position
            _startPos = _MainFrame.Position
            _input.Changed:Connect(function()
                if _input.UserInputState == Enum.UserInputState.End then
                    _drag = false
                end
            end)
        end
    end)

    _sUser.InputChanged:Connect(function(_input)
        if _input.UserInputType == Enum.UserInputType.MouseButton1 or _input.UserInputType == Enum.UserInputType.Touch then
            _dragInput = _input
        end
    end)

    game:GetService("RunService").RenderStepped:Connect(function()
        if _drag and _dragInput then
            local _delta = _dragInput.Position - _dragStart
            _MainFrame.Position = UDim2.new(_startPos.X.Scale, _startPos.X.Offset + _delta.X, _startPos.Y.Scale, _startPos.Y.Offset + _delta.Y)
        end
    end)

    -- Botón flotante "UI" (Gui Chica para abrir/cerrar o restaurar)
    local _ToggleBtn = Instance.new("TextButton")
    _ToggleBtn.Size = UDim2.new(0, 40, 0, 40)
    _ToggleBtn.Position = UDim2.new(0, 10, 0.5, -20)
    _ToggleBtn.BackgroundColor3 = _th.Accent
    _ToggleBtn.Text = "UI"
    _ToggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    _ToggleBtn.TextSize = 14
    _ToggleBtn.Font = Enum.Font.GothamBold
    _ToggleBtn.Visible = false -- Oculto hasta pasar la key
    _ToggleBtn.Parent = _ScreenGui
    
    local _SmallCorner = Instance.new("UICorner")
    _SmallCorner.CornerRadius = UDim.new(1, 0)
    _SmallCorner.Parent = _ToggleBtn

    local _min = false
    _ToggleBtn.MouseButton1Click:Connect(function()
        _min = not _min
        _MainFrame.Visible = not _min
    end)

    _MinBtn.MouseButton1Click:Connect(function()
        _min = true
        _MainFrame.Visible = false
    end)

    -- Eliminar UI por completo (Destruye el ScreenGui de la memoria)
    _CloseBtn.MouseButton1Click:Connect(function()
        _ScreenGui:Destroy()
    end)

    local _TabContainer = Instance.new("ScrollingFrame")
    _TabContainer.Size = UDim2.new(0, 130, 1, -55)
    _TabContainer.Position = UDim2.new(0, 10, 0, 45)
    _TabContainer.BackgroundTransparency = 1
    _TabContainer.CanvasSize = UDim2.new(0, 0, 2, 0)
    _TabContainer.Parent = _MainFrame

    local _ListTabs = Instance.new("UIListLayout")
    _ListTabs.SortOrder = Enum.SortOrder.LayoutOrder
    _ListTabs.Padding = UDim.new(0, 5)
    _ListTabs.Parent = _TabContainer

    local _PagesFolder = Instance.new("Folder")
    _PagesFolder.Name = "\0"
    _PagesFolder.Parent = _MainFrame

    _self.MainFrame = _MainFrame
    _self.TabButtonContainer = _TabContainer
    _self.PagesContainer = _PagesFolder
    _self.Theme = _th

    return _self
end

function _HubLib:CrearPestaña(_nombre)
    local _tab = {}
    
    local _TabBtn = Instance.new("TextButton")
    _TabBtn.Size = UDim2.new(1, 0, 0, 35)
    _TabBtn.BackgroundColor3 = self.Theme.Secondary
    _TabBtn.Text = _nombre
    _TabBtn.TextColor3 = self.Theme.Text
    _TabBtn.TextSize = 13
    _TabBtn.Font = Enum.Font.Gotham
    _TabBtn.Parent = self.TabButtonContainer
    
    local _TabCorner = Instance.new("UICorner")
    _TabCorner.CornerRadius = UDim.new(0, 6)
    _TabCorner.Parent = _TabBtn

    local _Page = Instance.new("ScrollingFrame")
    _Page.Size = UDim2.new(1, -155, 1, -55)
    _Page.Position = UDim2.new(0, 150, 0, 45)
    _Page.BackgroundTransparency = 1
    _Page.CanvasSize = UDim2.new(0, 0, 2, 0)
    _Page.Visible = false
    _Page.Parent = self.PagesContainer

    local _ListPage = Instance.new("UIListLayout")
    _ListPage.SortOrder = Enum.SortOrder.LayoutOrder
    _ListPage.Padding = UDim.new(0, 8)
    _ListPage.Parent = _Page

    _TabBtn.MouseButton1Click:Connect(function()
        for _, _p in pairs(self.PagesContainer:GetChildren()) do
            if _p:IsA("ScrollingFrame") then _p.Visible = false end
        end
        _Page.Visible = true
    end)

    function _tab:CrearToggle(_texto, _cb)
        local _TBtn = Instance.new("TextButton")
        _TBtn.Size = UDim2.new(1, -10, 0, 35)
        _TBtn.BackgroundColor3 = self.Theme.Secondary
        _TBtn.Text = "  " .. _texto
        _TBtn.TextColor3 = self.Theme.Text
        _TBtn.TextSize = 13
        _TBtn.Font = Enum.Font.Gotham
        _TBtn.TextXAlignment = Enum.TextXAlignment.Left
        _TBtn.Parent = _Page

        local _TC = Instance.new("UICorner")
        _TC.CornerRadius = UDim.new(0, 6)
        _TC.Parent = _TBtn

        local _Status = Instance.new("Frame")
        _Status.Size = UDim2.new(0, 20, 0, 20)
        _Status.Position = UDim2.new(1, -25, 0.5, -10)
        _Status.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
        _Status.Parent = _TBtn

        local _SC = Instance.new("UICorner")
        _SC.CornerRadius = UDim.new(1, 0)
        _SC.Parent = _Status

        local _state = false
        _TBtn.MouseButton1Click:Connect(function()
            _state = not _state
            _Status.BackgroundColor3 = _state and Color3.fromRGB(0, 255, 100) or Color3.fromRGB(100, 100, 100)
            pcall(_cb, _state)
        end)
    end

    function _tab:CrearSlider(_texto, _min, _max, _cb)
        local _SFrame = Instance.new("Frame")
        _SFrame.Size = UDim2.new(1, -10, 0, 50)
        _SFrame.BackgroundColor3 = self.Theme.Secondary
        _SFrame.Parent = _Page

        local _SC = Instance.new("UICorner")
        _SC.CornerRadius = UDim.new(0, 6)
        _SC.Parent = _SFrame

        local _Lbl = Instance.new("TextLabel")
        _Lbl.Size = UDim2.new(1, 0, 0, 25)
        _Lbl.BackgroundTransparency = 1
        _Lbl.Text = "  " .. _texto .. ": " .. _min
        _Lbl.TextColor3 = self.Theme.Text
        _Lbl.TextSize = 13
        _Lbl.Font = Enum.Font.Gotham
        _Lbl.TextXAlignment = Enum.TextXAlignment.Left
        _Lbl.Parent = _SFrame

        local _Bar = Instance.new("Frame")
        _Bar.Size = UDim2.new(0.9, 0, 0, 6)
        _Bar.Position = UDim2.new(0.05, 0, 0.7, 0)
        _Bar.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
        _Bar.Parent = _SFrame

        local _Fill = Instance.new("Frame")
        _Fill.Size = UDim2.new(0, 0, 1, 0)
        _Fill.BackgroundColor3 = self.Theme.Accent
        _Fill.Parent = _Bar

        local _dragS = false
        _Bar.InputBegan:Connect(function(_i)
            if _i.UserInputType == Enum.UserInputType.MouseButton1 or _i.UserInputType == Enum.UserInputType.Touch then
                _dragS = true
            end
        end)

        _sUser.InputEnded:Connect(function(_i)
            if _i.UserInputType == Enum.UserInputType.MouseButton1 or _i.UserInputType == Enum.UserInputType.Touch then
                _dragS = false
            end
        end)

        _sUser.InputChanged:Connect(function(_i)
            if _dragS and (_i.UserInputType == Enum.UserInputType.MouseButton1 or _i.UserInputType == Enum.UserInputType.Touch) then
                local _pos = math.clamp((_i.Position.X - _Bar.AbsolutePosition.X) / _Bar.AbsoluteSize.X, 0, 1)
                _Fill.Size = UDim2.new(_pos, 0, 1, 0)
                local _val = math.floor(_min + ((_max - _min) * _pos))
                _Lbl.Text = "  " .. _texto .. ": " .. _val
                pcall(_cb, _val)
            end
        end)
    end

    function _tab:CrearTextbox(_ph, _cb)
        local _TBox = Instance.new("TextBox")
        _TBox.Size = UDim2.new(1, -10, 0, 35)
        _TBox.BackgroundColor3 = self.Theme.Secondary
        _TBox.PlaceholderText = _ph
        _TBox.Text = ""
        _TBox.TextColor3 = self.Theme.Text
        _TBox.TextSize = 13
        _TBox.Font = Enum.Font.Gotham
        _TBox.Parent = _Page

        local _TBC = Instance.new("UICorner")
        _TBC.CornerRadius = UDim.new(0, 6)
        _TBC.Parent = _TBox

        _TBox.FocusLost:Connect(function(_enter)
            if _enter then
                pcall(_cb, _TBox.Text)
            end
        end)
    end

    function _tab:CrearDropdown(_texto, _ops, _cb)
        local _DBtn = Instance.new("TextButton")
        _DBtn.Size = UDim2.new(1, -10, 0, 35)
        _DBtn.BackgroundColor3 = self.Theme.Secondary
        _DBtn.Text = "  " .. _texto .. " v"
        _DBtn.TextColor3 = self.Theme.Text
        _DBtn.TextSize = 13
        _DBtn.Font = Enum.Font.Gotham
        _DBtn.TextXAlignment = Enum.TextXAlignment.Left
        _DBtn.Parent = _Page

        local _DBC = Instance.new("UICorner")
        _DBC.CornerRadius = UDim.new(0, 6)
        _DBC.Parent = _DBtn

        _DBtn.MouseButton1Click:Connect(function()
            pcall(_cb, _ops[1])
        end)
    end

    return _tab
end

return _HubLib
