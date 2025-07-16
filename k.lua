-- UI Library starts here
local function LoadUI(scriptName, subtitleText)
  local Players = game:GetService("Players")
  local UserInputService = game:GetService("UserInputService")

  local LocalPlayer = Players.LocalPlayer

  local ScreenGui = Instance.new("ScreenGui")
  ScreenGui.Name = "CustomUILibrary"
  ScreenGui.ResetOnSpawn = false
  ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Global

  local MainFrame = Instance.new("Frame")
  MainFrame.Name = "MainFrame"
  MainFrame.Size = UDim2.new(0, 350, 0, 500)
  MainFrame.Position = UDim2.new(0.5, -175, 0.5, -250)
  MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
  MainFrame.BorderSizePixel = 0
  MainFrame.Active = true
  MainFrame.Draggable = true
  MainFrame.Parent = ScreenGui

  local UICornerMain = Instance.new("UICorner")
  UICornerMain.CornerRadius = UDim.new(0, 8)
  UICornerMain.Parent = MainFrame

  local UIStrokeMain = Instance.new("UIStroke")
  UIStrokeMain.Color = Color3.fromRGB(45, 45, 45)
  UIStrokeMain.Thickness = 1.5
  UIStrokeMain.Transparency = 0.5
  UIStrokeMain.Parent = MainFrame

  local TitleBar = Instance.new("Frame")
  TitleBar.Name = "TitleBar"
  TitleBar.Size = UDim2.new(1, 0, 0, 35)
  TitleBar.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
  TitleBar.BorderSizePixel = 0
  TitleBar.Parent = MainFrame

  local UICornerTitle = Instance.new("UICorner")
  UICornerTitle.CornerRadius = UDim.new(0, 8)
  UICornerTitle.Parent = TitleBar

  local UIGradientTitle = Instance.new("UIGradient")
  UIGradientTitle.Color = ColorSequence.new(
    Color3.fromRGB(120, 0, 200),
    Color3.fromRGB(80, 0, 150)
  )
  UIGradientTitle.Rotation = 90
  UIGradientTitle.Parent = TitleBar

  local TitleLabel = Instance.new("TextLabel")
  TitleLabel.Name = "TitleLabel"
  TitleLabel.Size = UDim2.new(1, -35, 1, 0)
  TitleLabel.Position = UDim2.new(0, 5, 0, 0)
  TitleLabel.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
  TitleLabel.BackgroundTransparency = 1
  TitleLabel.Text = scriptName or "UI Library"
  TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
  TitleLabel.Font = Enum.Font.SourceSansBold
  TitleLabel.TextSize = 18
  TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
  TitleLabel.Parent = TitleBar

  local CloseButton = Instance.new("TextButton")
  CloseButton.Name = "CloseButton"
  CloseButton.Size = UDim2.new(0, 30, 1, 0)
  CloseButton.Position = UDim2.new(1, -30, 0, 0)
  CloseButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
  CloseButton.Text = "X"
  CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
  CloseButton.Font = Enum.Font.SourceSansBold
  CloseButton.TextSize = 18
  CloseButton.Parent = TitleBar

  local UICornerClose = Instance.new("UICorner")
  UICornerClose.CornerRadius = UDim.new(0, 5)
  UICornerClose.Parent = CloseButton

  CloseButton.MouseButton1Click:Connect(function()
    ScreenGui.Enabled = false
  end)

  local TabFrame = Instance.new("Frame")
  TabFrame.Name = "TabFrame"
  TabFrame.Size = UDim2.new(0.28, 0, 1, -35)
  TabFrame.Position = UDim2.new(0, 0, 0, 35)
  TabFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
  TabFrame.BorderSizePixel = 0
  TabFrame.Parent = MainFrame

  local UIPaddingTabFrame = Instance.new("UIPadding")
  UIPaddingTabFrame.PaddingLeft = UDim.new(0, 8)
  UIPaddingTabFrame.PaddingRight = UDim.new(0, 8)
  UIPaddingTabFrame.PaddingTop = UDim.new(0, 8)
  UIPaddingTabFrame.Parent = TabFrame

  local TabContentFrame = Instance.new("ScrollingFrame")
  TabContentFrame.Name = "TabContentFrame"
  TabContentFrame.Size = UDim2.new(0.72, 0, 1, -35)
  TabContentFrame.Position = UDim2.new(0.28, 0, 0, 35)
  TabContentFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
  TabContentFrame.BorderSizePixel = 0
  TabContentFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
  TabContentFrame.Parent = MainFrame

  local UICornerContent = Instance.new("UICorner")
  UICornerContent.CornerRadius = UDim.new(0, 8)
  UICornerContent.Parent = TabContentFrame

  local UIListLayoutContent = Instance.new("UIListLayout")
  UIListLayoutContent.FillDirection = Enum.FillDirection.Vertical
  UIListLayoutContent.HorizontalAlignment = Enum.HorizontalAlignment.Center
  UIListLayoutContent.Padding = UDim.new(0, 10)
  UIListLayoutContent.Parent = TabContentFrame

  local UIPaddingContent = Instance.new("UIPadding")
  UIPaddingContent.PaddingLeft = UDim.new(0, 10)
  UIPaddingContent.PaddingRight = UDim.new(0, 10)
  UIPaddingContent.PaddingTop = UDim.new(0, 10)
  UIPaddingContent.PaddingBottom = UDim.new(0, 10)
  UIPaddingContent.Parent = TabContentFrame

  local TabListLayout = Instance.new("UIListLayout")
  TabListLayout.Name = "TabListLayout"
  TabListLayout.FillDirection = Enum.FillDirection.Vertical
  TabListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
  TabListLayout.Padding = UDim.new(0, 8)
  TabListLayout.Parent = TabFrame

  local CurrentActiveTab = nil

  local UI_API = {}
  UI_API.Tabs = {}

  function UI_API.CreateTab(name)
    local Button = Instance.new("TextButton")
    Button.Name = name .. "TabButton"
    Button.Size = UDim2.new(1, 0, 0, 45)
    Button.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    Button.Text = name
    Button.TextColor3 = Color3.fromRGB(200, 200, 200)
    Button.TextSize = 16
    Button.Parent = TabFrame

    local UICornerButton = Instance.new("UICorner")
    UICornerButton.CornerRadius = UDim.new(0, 6)
    UICornerButton.Parent = Button

    local TabContent = Instance.new("Frame")
    TabContent.Name = name .. "TabContent"
    TabContent.Size = UDim2.new(1, 0, 0, 0)
    TabContent.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    TabContent.BackgroundTransparency = 1
    TabContent.Parent = TabContentFrame
    TabContent.Visible = false

    local ContentListLayout = Instance.new("UIListLayout")
    ContentListLayout.Name = "ContentListLayout"
    ContentListLayout.FillDirection = Enum.FillDirection.Vertical
    ContentListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    ContentListLayout.Padding = UDim.new(0, 8)
    ContentListLayout.Parent = TabContent

    Button.MouseButton1Click:Connect(function()
      if CurrentActiveTab then
        CurrentActiveTab.Visible = false
        MainFrame:FindFirstChild("TabFrame"):FindFirstChild(
          CurrentActiveTab.Name:gsub("Content", "Button")
        ).BackgroundColor3 = Color3.fromRGB(35, 35, 35)
        MainFrame:FindFirstChild("TabFrame"):FindFirstChild(
          CurrentActiveTab.Name:gsub("Content", "Button")
        ).TextColor3 = Color3.fromRGB(200, 200, 200)
      end
      TabContent.Visible = true
      Button.BackgroundColor3 = Color3.fromRGB(80, 0, 150)
      Button.TextColor3 = Color3.fromRGB(255, 255, 255)
      CurrentActiveTab = TabContent
    end)

    UI_API.Tabs[name] = TabContent
    return TabContent
  end

  function UI_API.CreateSlider(parent, config)
    local Container = Instance.new("Frame")
    Container.Size = UDim2.new(1, 0, 0, 60)
    Container.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    Container.BorderSizePixel = 0
    Container.Parent = parent

    local UICornerContainer = Instance.new("UICorner")
    UICornerContainer.CornerRadius = UDim.new(0, 6)
    UICornerContainer.Parent = Container

    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(1, -20, 0, 20)
    Label.Position = UDim2.new(0, 10, 0, 5)
    Label.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    Label.BackgroundTransparency = 1
    Label.Text =
      config.Name ..
      ": " ..
      tostring(config.CurrentValue) ..
      (config.Suffix or "")
    Label.TextColor3 = Color3.fromRGB(255, 255, 255)
    Label.Font = Enum.Font.SourceSansSemibold
    Label.TextSize = 14
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = Container

    local SliderFrame = Instance.new("Frame")
    SliderFrame.Size = UDim2.new(1, -20, 0, 15)
    SliderFrame.Position = UDim2.new(0, 10, 0, 30)
    SliderFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    SliderFrame.BorderSizePixel = 0
    SliderFrame.Parent = Container

    local UICornerSlider = Instance.new("UICorner")
    UICornerSlider.CornerRadius = UDim.new(0, 5)
    UICornerSlider.Parent = SliderFrame

    local SliderFill = Instance.new("Frame")
    SliderFill.Size = UDim2.new(
      (config.CurrentValue - config.Range[1]) / (config.Range[2] - config.Range[1]),
      0,
      1,
      0
    )
    SliderFill.BackgroundColor3 = Color3.fromRGB(150, 0, 255)
    SliderFill.BorderSizePixel = 0
    SliderFill.Parent = SliderFrame

    local UICornerFill = Instance.new("UICorner")
    UICornerFill.CornerRadius = UDim.new(0, 5)
    UICornerFill.Parent = SliderFill

    local function updateSlider(xPos)
      local normalizedX = math.clamp(xPos / SliderFrame.AbsoluteSize.X, 0, 1)
      local value = config.Range[1] + (config.Range[2] - config.Range[1]) * normalizedX
      value = math.floor(value / config.Increment) * config.Increment
      value = math.clamp(value, config.Range[1], config.Range[2])

      config.CurrentValue = value
      Label.Text =
        config.Name ..
        ": " ..
        tostring(math.floor(value * 10) / 10) ..
        (config.Suffix or "")
      SliderFill.Size = UDim2.new(
        (value - config.Range[1]) / (config.Range[2] - config.Range[1]),
        0,
        1,
        0
      )
      if config.Callback then
        config.Callback(value)
      end
    end

    SliderFrame.InputBegan:Connect(function(input)
      if input.UserInputType == Enum.UserInputType.MouseButton1 then
        local mousePos = UserInputService:GetMouseLocation()
        updateSlider(mousePos.X - SliderFrame.AbsolutePosition.X)
      end
    end)

    SliderFrame.InputChanged:Connect(function(input)
      if UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) then
        local mousePos = UserInputService:GetMouseLocation()
        updateSlider(mousePos.X - SliderFrame.AbsolutePosition.X)
      end
    end)
  end

  function UI_API.CreateToggle(parent, config)
    local Container = Instance.new("Frame")
    Container.Size = UDim2.new(1, 0, 0, 40)
    Container.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    Container.BorderSizePixel = 0
    Container.Parent = parent

    local UICornerContainer = Instance.new("UICorner")
    UICornerContainer.CornerRadius = UDim.new(0, 6)
    UICornerContainer.Parent = Container

    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(1, -70, 1, 0)
    Label.Position = UDim2.new(0, 10, 0, 0)
    Label.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    Label.BackgroundTransparency = 1
    Label.Text = config.Name
    Label.TextColor3 = Color3.fromRGB(255, 255, 255)
    Label.Font = Enum.Font.SourceSansSemibold
    Label.TextSize = 15
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = Container

    local ToggleButton = Instance.new("TextButton")
    ToggleButton.Size = UDim2.new(0, 50, 0, 25)
    ToggleButton.Position = UDim2.new(1, -60, 0.5, -12.5)
    ToggleButton.BackgroundColor3 =
      config.CurrentValue and Color3.fromRGB(0, 180, 0) or Color3.fromRGB(180, 0, 0)
    ToggleButton.Text = config.CurrentValue and "ON" or "OFF"
    ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    ToggleButton.Font = Enum.Font.SourceSansBold
    ToggleButton.TextSize = 13
    ToggleButton.Parent = Container

    local UICornerToggle = Instance.new("UICorner")
    UICornerToggle.CornerRadius = UDim.new(0, 5)
    UICornerToggle.Parent = ToggleButton

    ToggleButton.MouseButton1Click:Connect(function()
      config.CurrentValue = not config.CurrentValue
      ToggleButton.BackgroundColor3 =
        config.CurrentValue and Color3.fromRGB(0, 180, 0) or Color3.fromRGB(180, 0, 0)
      ToggleButton.Text = config.CurrentValue and "ON" or "OFF"
      if config.Callback then
        config.Callback(config.CurrentValue)
      end
    end)
  end

  function UI_API.CreateInput(parent, config)
    local Container = Instance.new("Frame")
    Container.Size = UDim2.new(1, 0, 0, 65)
    Container.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    Container.BorderSizePixel = 0
    Container.Parent = parent

    local UICornerContainer = Instance.new("UICorner")
    UICornerContainer.CornerRadius = UDim.new(0, 6)
    UICornerContainer.Parent = Container

    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(1, -20, 0, 20)
    Label.Position = UDim2.new(0, 10, 0, 5)
    Label.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    Label.BackgroundTransparency = 1
    Label.Text = config.Name
    Label.TextColor3 = Color3.fromRGB(255, 255, 255)
    Label.Font = Enum.Font.SourceSansSemibold
    Label.TextSize = 14
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = Container

    local TextBox = Instance.new("TextBox")
    TextBox.Size = UDim2.new(1, -20, 0, 28)
    TextBox.Position = UDim2.new(0, 10, 0, 30)
    TextBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextBox.Font = Enum.Font.SourceSans
    TextBox.TextSize = 14
    TextBox.PlaceholderText = config.PlaceholderText
    TextBox.Text = config.CurrentValue or ""
    TextBox.ClearTextOnFocus = false
    TextBox.Parent = Container

    local UICornerTextBox = Instance.new("UICorner")
    UICornerTextBox.CornerRadius = UDim.new(0, 5)
    UICornerTextBox.Parent = TextBox

    TextBox.FocusLost:Connect(function(enterPressed)
      if enterPressed then
        if config.Callback then
          config.Callback(TextBox.Text)
        end
      end
    end)
  end

  function UI_API.CreateLabel(parent, text)
    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(1, 0, 0, 20)
    Label.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    Label.BackgroundTransparency = 1
    Label.Text = text
    Label.TextColor3 = Color3.fromRGB(200, 200, 200)
    Label.Font = Enum.Font.SourceSans
    Label.TextSize = 14
    Label.TextWrapped = true
    Label.Parent = parent
  end

  function UI_API.CreateButton(parent, config)
    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(1, 0, 0, 40)
    Button.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
    Button.Text = config.Name
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button.Font = Enum.Font.SourceSansBold
    Button.TextSize = 16
    Button.Parent = parent

    local UICornerButton = Instance.new("UICorner")
    UICornerButton.CornerRadius = UDim.new(0, 6)
    UICornerButton.Parent = Button

    Button.MouseButton1Click:Connect(function()
      if config.Callback then
        config.Callback()
      end
    end)
  end

  function UI_API.CreateKeybind(parent, config)
    local Container = Instance.new("Frame")
    Container.Size = UDim2.new(1, 0, 0, 40)
    Container.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    Container.BorderSizePixel = 0
    Container.Parent = parent

    local UICornerContainer = Instance.new("UICorner")
    UICornerContainer.CornerRadius = UDim.new(0, 6)
    UICornerContainer.Parent = Container

    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(1, -70, 1, 0)
    Label.Position = UDim2.new(0, 10, 0, 0)
    Label.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    Label.BackgroundTransparency = 1
    Label.Text = config.Name
    Label.TextColor3 = Color3.fromRGB(255, 255, 255)
    Label.Font = Enum.Font.SourceSansSemibold
    Label.TextSize = 15
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = Container

    local KeybindButton = Instance.new("TextButton")
    KeybindButton.Size = UDim2.new(0, 60, 0, 25)
    KeybindButton.Position = UDim2.new(1, -70, 0.5, -12.5)
    KeybindButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    KeybindButton.Text = config.CurrentKeybind or "NONE"
    KeybindButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    KeybindButton.Font = Enum.Font.SourceSansBold
    KeybindButton.TextSize = 13
    KeybindButton.Parent = Container

    local UICornerKeybind = Instance.new("UICorner")
    UICornerKeybind.CornerRadius = UDim.new(0, 5)
    UICornerKeybind.Parent = KeybindButton

    local isListening = false
    local connection = nil

    KeybindButton.MouseButton1Click:Connect(function()
      if isListening then
        return
      end
      isListening = true
      KeybindButton.Text = "Press Key..."
      KeybindButton.BackgroundColor3 = Color3.fromRGB(150, 150, 0)

      connection = UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if gameProcessed then
          return
        end
        if
          input.UserInputType == Enum.UserInputType.Keyboard or
          input.UserInputType == Enum.UserInputType.MouseButton1 or
          input.UserInputType == Enum.UserInputType.MouseButton2
        then
          local keyName = input.KeyCode.Name ~= "Unknown" and input.KeyCode.Name or input.UserInputType.Name
          if keyName == "MouseButton1" then
            keyName = "LMB"
          elseif keyName == "MouseButton2" then
            keyName = "RMB"
          end

          config.CurrentKeybind = keyName
          KeybindButton.Text = keyName
          KeybindButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
          isListening = false
          if connection then
            connection:Disconnect()
            connection = nil
          end
        end
      end)
    end)

    UserInputService.InputBegan:Connect(function(input, gameProcessed)
      if
        not gameProcessed and
        not isListening and
        input.KeyCode.Name == (config.CurrentKeybind or "")
      then
        if config.Callback then
          config.Callback(input.KeyCode.Name)
        end
      end
    end)
  end

  function UI_API.CreateDropdown(parent, config)
    local Container = Instance.new("Frame")
    Container.Size = UDim2.new(1, 0, 0, 40)
    Container.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    Container.BorderSizePixel = 0
    Container.Parent = parent

    local UICornerContainer = Instance.new("UICorner")
    UICornerContainer.CornerRadius = UDim.new(0, 6)
    UICornerContainer.Parent = Container

    local DropdownButton = Instance.new("TextButton")
    DropdownButton.Size = UDim2.new(1, 0, 1, 0)
    DropdownButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    DropdownButton.Text =
      (config.CurrentSelection and tostring(config.CurrentSelection)) or "Select Option"
    DropdownButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    DropdownButton.Font = Enum.Font.SourceSansBold
    DropdownButton.TextSize = 14
    DropdownButton.TextXAlignment = Enum.TextXAlignment.Left
    DropdownButton.TextWrapped = true
    DropdownButton.Parent = Container

    local UICornerDropdownButton = Instance.new("UICorner")
    UICornerDropdownButton.CornerRadius = UDim.new(0, 5)
    UICornerDropdownButton.Parent = DropdownButton

    local OptionsFrame = Instance.new("Frame")
    OptionsFrame.Name = "OptionsFrame"
    OptionsFrame.Size = UDim2.new(1, 0, 0, 0)
    OptionsFrame.Position = UDim2.new(0, 0, 1, 0)
    OptionsFrame.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    OptionsFrame.BorderSizePixel = 0
    OptionsFrame.Visible = false
    OptionsFrame.ZIndex = 2
    OptionsFrame.Parent = Container

    local UICornerOptionsFrame = Instance.new("UICorner")
    UICornerOptionsFrame.CornerRadius = UDim.new(0, 5)
    UICornerOptionsFrame.Parent = OptionsFrame

    local OptionsListLayout = Instance.new("UIListLayout")
    OptionsListLayout.FillDirection = Enum.FillDirection.Vertical
    OptionsListLayout.Padding = UDim.new(0, 2)
    OptionsListLayout.Parent = OptionsFrame

    local CurrentSelectedOptions = {}
    if config.CurrentSelection then
      if type(config.CurrentSelection) == "table" then
        CurrentSelectedOptions = table.clone(config.CurrentSelection)
      else
        table.insert(CurrentSelectedOptions, config.CurrentSelection)
      end
    end

    local function updateButtonText()
      if #CurrentSelectedOptions > 0 then
        DropdownButton.Text = table.concat(CurrentSelectedOptions, ", ")
      else
        DropdownButton.Text = "Select Option"
      end
    end

    for _, option in ipairs(config.Options) do
      local OptionButton = Instance.new("TextButton")
      OptionButton.Size = UDim2.new(1, 0, 0, 25)
      OptionButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
      OptionButton.Text = option
      OptionButton.TextColor3 = Color3.fromRGB(255, 255, 255)
      OptionButton.Font = Enum.Font.SourceSans
      OptionButton.TextSize = 14
      OptionButton.TextXAlignment = Enum.TextXAlignment.Left
      OptionButton.Parent = OptionsFrame

      if table.find(CurrentSelectedOptions, option) then
        OptionButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
      end

      OptionButton.MouseButton1Click:Connect(function()
        if config.MultipleOptions then
          local index = table.find(CurrentSelectedOptions, option)
          if index then
            table.remove(CurrentSelectedOptions, index)
            OptionButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
          else
            table.insert(CurrentSelectedOptions, option)
            OptionButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
          end
        else
          CurrentSelectedOptions = { option }
          for _, btn in ipairs(OptionsFrame:GetChildren()) do
            if btn:IsA("TextButton") then
              btn.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
            end
          end
          OptionButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
          OptionsFrame.Visible = false
        end
        updateButtonText()
        if config.Callback then
          if config.MultipleOptions then
            config.Callback(CurrentSelectedOptions)
          else
            config.Callback(CurrentSelectedOptions[1])
          end
        end
      end)
    end

    OptionsFrame.Size = UDim2.new(1, 0, 0, #config.Options * 27)

    DropdownButton.MouseButton1Click:Connect(function()
      OptionsFrame.Visible = not OptionsFrame.Visible
    end)

    UserInputService.InputBegan:Connect(function(input, gameProcessed)
      if
        input.UserInputType == Enum.UserInputType.MouseButton1 and
        not gameProcessed and
        OptionsFrame.Visible and
        not input.Target:IsDescendantOf(OptionsFrame) and
        not input.Target:IsDescendantOf(DropdownButton)
      then
        OptionsFrame.Visible = false
      end
    end)
  end

  return ScreenGui, UI_API
end
