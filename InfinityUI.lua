local function randomString(length)
    local chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
    local str = ""
    for i = 1, length do
        local rand = math.random(1, #chars)
        str = str .. string.sub(chars, rand, rand)
    end
    return str
end

-- Anti-detection measures
local randomUI = randomString(12)
_G.CurrentUIName = randomUI
-- Clean up existing UIs
local function SafeDestroyUI()
    pcall(function()
        local containers = {game:GetService("CoreGui")}
        
        if gethui then
            local altGui = gethui()
            if altGui and altGui ~= game:GetService("CoreGui") then
                table.insert(containers, altGui)
            end
        end
        
        for _, container in pairs(containers) do
            for _, gui in pairs(container:GetChildren()) do
                if gui:IsA("ScreenGui") and (gui.Name == "ProjectWD" or gui:GetAttribute("SecureUI")) then
                    gui:Destroy()
                end
            end
        end
    end)
end

SafeDestroyUI()

if not game:IsLoaded() then game.Loaded:Wait() end
task.wait(1)

-- Secure UI creation
local function GetProtectedGui()
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = randomUI
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.ResetOnSpawn = false
    
    if syn and syn.protect_gui then
        syn.protect_gui(ScreenGui)
    end
    
    local parentContainer = gethui and gethui() or game:GetService("CoreGui")
    ScreenGui.Parent = parentContainer
    ScreenGui:SetAttribute("SecureUI", true)
    
    return ScreenGui
end



_G.Color = Color3.fromRGB(239, 68, 68)
_G.BGColor = Color3.fromRGB(18, 18, 18)
_G.Color = Color3.fromRGB(239, 68, 68)
_G.BGColor = Color3.fromRGB(18, 18, 18)
IKAI = true
if IKAI then
    do
        local ui = game:GetService("CoreGui"):FindFirstChild("ProjectWD")
        if ui then
            ui:Destroy()
        end
    end
    
    local UserInputService = game:GetService("UserInputService")
    local TweenService = game:GetService("TweenService")
    local RunService = game:GetService("RunService")
    local LocalPlayer = game:GetService("Players").LocalPlayer
    local Mouse = LocalPlayer:GetMouse()
    local tween = game:GetService("TweenService")
    local Red = {RainbowColorValue = 0, HueSelectionPosition = 0}
    local LogoButton = [[7040391851]]
    
    
    local function Tween(instance, properties, style, wa)
        if style == nil or "" then
            return Back
        end
        tween:Create(instance, TweenInfo.new(wa, Enum.EasingStyle[style]), {properties}):Play()
    end
    
    local ActualTypes = {
        RoundFrame = "ImageLabel",
        Shadow = "ImageLabel",
        Circle = "ImageLabel",
        CircleButton = "ImageButton",
        Frame = "Frame",
        Label = "TextLabel",
        Button = "TextButton",
        SmoothButton = "ImageButton",
        Box = "TextBox",
        ScrollingFrame = "ScrollingFrame",
        Menu = "ImageButton",
        NavBar = "ImageButton"
    }
    
    local Properties = {
        RoundFrame = {
            BackgroundTransparency = 1,
            
            ScaleType = Enum.ScaleType.Slice,
            SliceCenter = Rect.new(3, 3, 297, 297)
        },
        SmoothButton = {
            AutoButtonColor = false,
            BackgroundTransparency = 1,
            
            ScaleType = Enum.ScaleType.Slice,
            SliceCenter = Rect.new(3, 3, 297, 297)
        },
        Shadow = {
            Name = "Shadow",
            BackgroundTransparency = 1,
            
            ScaleType = Enum.ScaleType.Slice,
            SliceCenter = Rect.new(23, 23, 277, 277),
            Size = UDim2.fromScale(1, 1) + UDim2.fromOffset(30, 30),
            Position = UDim2.fromOffset(-15, -15)
        },
        Circle = {
            BackgroundTransparency = 1,
            
        },
        CircleButton = {
            BackgroundTransparency = 1,
            AutoButtonColor = false,
            
        },
        Frame = {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Size = UDim2.fromScale(1, 1)
        },
        Label = {
            BackgroundTransparency = 1,
            Position = UDim2.fromOffset(5, 0),
            Size = UDim2.fromScale(1, 1) - UDim2.fromOffset(5, 0),
            TextSize = 14,
            TextXAlignment = Enum.TextXAlignment.Left
        },
        Button = {
            BackgroundTransparency = 1,
            Position = UDim2.fromOffset(5, 0),
            Size = UDim2.fromScale(1, 1) - UDim2.fromOffset(5, 0),
            TextSize = 14,
            TextXAlignment = Enum.TextXAlignment.Left
        },
        Box = {
            BackgroundTransparency = 1,
            Position = UDim2.fromOffset(5, 0),
            Size = UDim2.fromScale(1, 1) - UDim2.fromOffset(5, 0),
            TextSize = 14,
            TextXAlignment = Enum.TextXAlignment.Left
        },
        ScrollingFrame = {
            BackgroundTransparency = 1,
            ScrollBarThickness = 0,
            CanvasSize = UDim2.fromScale(0, 0),
            Size = UDim2.fromScale(1, 1)
        },
        Menu = {
            Name = "More",
            AutoButtonColor = false,
            BackgroundTransparency = 1,
            
            Size = UDim2.fromOffset(20, 20),
            Position = UDim2.fromScale(1, 0.5) - UDim2.fromOffset(25, 10)
        },
        NavBar = {
            Name = "SheetToggle",
            
            BackgroundTransparency = 1,
            Size = UDim2.fromOffset(20, 20),
            Position = UDim2.fromOffset(5, 5),
            AutoButtonColor = false
        }
    }
    
    local Types = {
        "RoundFrame",
        "Shadow",
        "Circle",
        "CircleButton",
        "Frame",
        "Label",
        "Button",
        "SmoothButton",
        "Box",
        "ScrollingFrame",
        "Menu",
        "NavBar"
    }
    
    function FindType(String)
        for _, Type in next, Types do
            if Type:sub(1, #String):lower() == String:lower() then
                return Type
            end
        end
        return false
    end
    
    local Objects = {}
    
    function Objects.new(Type)
        local TargetType = FindType(Type)
        if TargetType then
            local NewImage = Instance.new(ActualTypes[TargetType])
            if Properties[TargetType] then
                for Property, Value in next, Properties[TargetType] do
                    NewImage[Property] = Value
                end
            end
            return NewImage
        else
            return Instance.new(Type)
        end
    end
    
    local function GetXY(GuiObject)
        local Max, May = GuiObject.AbsoluteSize.X, GuiObject.AbsoluteSize.Y
        local Px, Py = math.clamp(Mouse.X - GuiObject.AbsolutePosition.X, 0, Max), math.clamp(Mouse.Y - GuiObject.AbsolutePosition.Y, 0, May)
        return Px / Max, Py / May
    end
    
    local function CircleAnim(GuiObject, EndColour, StartColour)
        local PX, PY = GetXY(GuiObject)
        local Circle = Objects.new("Circle")
        Circle.Size = UDim2.fromScale(0, 0)
        Circle.Position = UDim2.fromScale(PX, PY)
        Circle.ImageColor3 = StartColour or GuiObject.ImageColor3
        Circle.ZIndex = 200
        Circle.Parent = GuiObject
        local Size = GuiObject.AbsoluteSize.X
        TweenService:Create(Circle, TweenInfo.new(0.7), {Position = UDim2.fromScale(PX, PY) - UDim2.fromOffset(Size / 2, Size / 2), ImageTransparency = 1, ImageColor3 = EndColour, Size = UDim2.fromOffset(Size, Size)}):Play()
        spawn(function()
            wait(0.5)
            Circle:Destroy()
        end)
    end
    
    
    local function MakeDraggable(topbarobject, object)
        local Dragging = nil
        local DragInput = nil
        local DragStart = nil
        local StartPosition = nil
        
        local function Update(input)
            local Delta = input.Position - DragStart
            local pos =
                UDim2.new(
                    StartPosition.X.Scale,
                    StartPosition.X.Offset + Delta.X,
                    StartPosition.Y.Scale,
                    StartPosition.Y.Offset + Delta.Y
            )
            local Tween = TweenService:Create(object, TweenInfo.new(0.2), {Position = pos})
            Tween:Play()
        end
        
        topbarobject.InputBegan:Connect(
            function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    Dragging = true
                    DragStart = input.Position
                    StartPosition = object.Position
                    
                    input.Changed:Connect(
                        function()
                            if input.UserInputState == Enum.UserInputState.End then
                                Dragging = false
                            end
                        end
                )
                end
            end
        )
        topbarobject.InputChanged:Connect(
            function(input)
                if
                    input.UserInputType == Enum.UserInputType.MouseMovement or
                    input.UserInputType == Enum.UserInputType.Touch
                then
                    DragInput = input
                end
            end
        )
        UserInputService.InputChanged:Connect(
            function(input)
                if input == DragInput and Dragging then
                    Update(input)
                end
            end
    )
    end
    
    library1 = {}
    
    function library1:Window(text, logo, keybind)
        local uihide = false
        local abc = false
        local logo = logo or 0
        local currentpage = ""
        local keybind = keybind or Enum.KeyCode.LeftControl
        local yoo = string.gsub(tostring(keybind), "Enum.KeyCode.", "")
        
        local UserInputService = game:GetService("UserInputService")
        local TweenService = game:GetService("TweenService")

        -- Main UI
        local RippleHUBLIB = GetProtectedGui()
        RippleHUBLIB.Name = _G.CurrentUIName
        RippleHUBLIB.Parent = GetProtectedGui()
        RippleHUBLIB.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

        local Main = Instance.new("Frame")
        Main.Name = "Main"
        Main.Parent = RippleHUBLIB
        Main.AnchorPoint = Vector2.new(0.5, 0.5)
        Main.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
        Main.Position = UDim2.new(0.5, 0, 0.5, 0)
        Main.Size = UDim2.new(0, 600, 0, 300)

        local MCNR = Instance.new("UICorner")
        MCNR.CornerRadius = UDim.new(0, 3)
        MCNR.Parent = Main

        -- Top bar
        local Top = Instance.new("Frame")
        Top.Name = "Top"
        Top.Parent = Main
        Top.BackgroundColor3 = _G.BGColor
        Top.Size = UDim2.new(1, 0, 0, 27)

        local TCNR = Instance.new("UICorner")
        TCNR.CornerRadius = UDim.new(0, 3)
        TCNR.Parent = Top

        -- Title
        local Name = Instance.new("TextLabel")
        Name.Name = "Name"
        Name.Parent = Top
        Name.BackgroundTransparency = 1
        Name.Position = UDim2.new(0, 20, 0, 0)
        Name.Size = UDim2.new(0, 200, 1, 0)
        Name.Font = Enum.Font.GothamSemibold
        Name.Text = text
        Name.TextColor3 = _G.Color
        Name.TextSize = 16
        Name.TextXAlignment = Enum.TextXAlignment.Left

        -- Keybind Label
        local BindButton = Instance.new("TextButton")
        BindButton.Name = "BindButton"
        BindButton.Parent = Top
        BindButton.BackgroundTransparency = 1
        BindButton.Position = UDim2.new(0.75, 0, 0, 0)
        BindButton.Size = UDim2.new(0, 150, 1, 0)
        BindButton.Font = Enum.Font.GothamSemibold
        BindButton.Text = "[ RightControl ]"
        BindButton.TextColor3 = Color3.fromRGB(100, 100, 100)
        BindButton.TextSize = 12

        -- Minimize Button
        local MinimizeBtn = Instance.new("TextButton")
        MinimizeBtn.Parent = Top
        MinimizeBtn.BackgroundTransparency = 1
        MinimizeBtn.Position = UDim2.new(1, -30, 0, 0)
        MinimizeBtn.Size = UDim2.new(0, 30, 1, 0)
        MinimizeBtn.Text = "-"
        MinimizeBtn.Font = Enum.Font.GothamBold
        MinimizeBtn.TextSize = 18
        MinimizeBtn.TextColor3 = Color3.fromRGB(200, 200, 200)

        -- Minimized button (persistent)
        local MiniFrame

        -- Drag handler function
        local function makeDraggable(gui)
            local dragging, dragInput, dragStart, startPos

            local function update(input)
                local delta = input.Position - dragStart
                local newPos = UDim2.new(
                    startPos.X.Scale,
                    startPos.X.Offset + delta.X,
                    startPos.Y.Scale,
                    startPos.Y.Offset + delta.Y
                )
                gui.Position = newPos
            end

            gui.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    dragging = true
                    dragStart = input.Position
                    startPos = gui.Position

                    input.Changed:Connect(function()
                        if input.UserInputState == Enum.UserInputState.End then
                            dragging = false
                        end
                    end)
                end
            end)

            gui.InputChanged:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseMovement then
                    dragInput = input
                end
            end)

            UserInputService.InputChanged:Connect(function(input)
                if input == dragInput and dragging then
                    update(input)
                end
            end)
        end

        local function createMiniFrame()
            if MiniFrame then return MiniFrame end

            MiniFrame = Instance.new("TextButton")
            MiniFrame.Parent = RippleHUBLIB
            MiniFrame.BackgroundColor3 = _G.Color
            MiniFrame.Size = UDim2.new(0, 100, 0, 30)
            MiniFrame.Position = UDim2.new(0.5, -50, 0, 2) -- top center
            MiniFrame.Text = "Open Hub"
            MiniFrame.TextColor3 = Color3.fromRGB(255, 255, 255)
            MiniFrame.Font = Enum.Font.GothamBold
            MiniFrame.TextSize = 14
            MiniFrame.Visible = false

            local corner = Instance.new("UICorner")
            corner.CornerRadius = UDim.new(0, 6)
            corner.Parent = MiniFrame

            makeDraggable(MiniFrame)

            -- Proper click restore (ignores drag)
            local isDragging = false
            MiniFrame.MouseButton1Down:Connect(function()
                isDragging = false
            end)
            MiniFrame.MouseMoved:Connect(function()
                isDragging = true
            end)
            MiniFrame.MouseButton1Up:Connect(function()
                if not isDragging then
                    Main.Visible = true
                    MiniFrame.Visible = false
                end
            end)

            return MiniFrame
        end




        -- Minimize logic
        MinimizeBtn.MouseButton1Click:Connect(function()
            Main.Visible = false
            local mini = createMiniFrame()
            mini.Visible = true
        end)

        
        BindButton.MouseButton1Click:Connect(function()
            BindButton.Text = "[ ... ]"
            local inputwait = game:GetService("UserInputService").InputBegan:wait()
            local shiba = inputwait.KeyCode == Enum.KeyCode.Unknown and inputwait.UserInputType or inputwait.KeyCode
            
            if shiba.Name ~= "Focus" and shiba.Name ~= "MouseMovement" then
                BindButton.Text = "[ " .. shiba.Name .. " ]"
                yoo = shiba.Name
            end
        end)
        
        do end
        
        toggled = false
        UserInputService.InputBegan:Connect(function(input)
            if input.KeyCode == Enum.KeyCode[yoo] then
                if toggled == false then
                    toggled = true
                    -- Use the random UI name instead of "ProjectWD"
                    RippleHUBLIB.Enabled = false
                else
                    toggled = false
                    RippleHUBLIB.Enabled = true
                end
            end
        end)
        
        
        
        
        
        local Tab = Instance.new("Frame")
        Tab.Name = "Tab"
        Tab.Parent = Main
        Tab.BackgroundColor3 = _G.BGColor
        Tab.Position = UDim2.new(0, 5, 0, 30)
        Tab.Size = UDim2.new(0, 140, 0, 265)
        
        local TCNR = Instance.new("UICorner")
        TCNR.Name = "TCNR"
        TCNR.Parent = Tab
        TCNR.CornerRadius = UDim.new(0, 5)
        
        local ScrollTab = Instance.new("ScrollingFrame")
        ScrollTab.Name = "ScrollTab"
        ScrollTab.Parent = Tab
        ScrollTab.Active = true
        ScrollTab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ScrollTab.BackgroundTransparency = 1.000
        ScrollTab.Size = UDim2.new(0, 150, 0, 263)
        ScrollTab.CanvasSize = UDim2.new(0, 0, 0, 0)
        ScrollTab.ScrollBarThickness = 0
        
        local PLL = Instance.new("UIListLayout")
        PLL.Name = "PLL"
        PLL.Parent = ScrollTab
        PLL.SortOrder = Enum.SortOrder.LayoutOrder
        PLL.Padding = UDim.new(0, 1)
        PLL.HorizontalAlignment = "Center"
        local PPD = Instance.new("UIPadding")
        PPD.Name = "PPD"
        PPD.Parent = ScrollTab
        PPD.PaddingLeft = UDim.new(0, 0)
        PPD.PaddingTop = UDim.new(0, 0)
        
        local Page = Instance.new("Frame")
        Page.Name = "Page"
        Page.Parent = Main
        Page.BackgroundColor3 = _G.BGColor
        Page.Position = UDim2.new(0.245426834, 0, 0, 30)
        Page.Size = UDim2.new(0, 450, 0, 265)
        
        
        local PCNR = Instance.new("UICorner")
        PCNR.Name = "PCNR"
        PCNR.Parent = Page
        PCNR.CornerRadius = UDim.new(0, 5)
        local MainPage = Instance.new("Frame")
        MainPage.Name = "MainPage"
        MainPage.Parent = Page
        MainPage.ClipsDescendants = true
        MainPage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        MainPage.BackgroundTransparency = 1.000
        MainPage.Size = UDim2.new(0, 490, 0, 365)
        
        local PageList = Instance.new("Folder")
        PageList.Name = "PageList"
        PageList.Parent = MainPage
        
        local UIPageLayout = Instance.new("UIPageLayout")
        
        UIPageLayout.Parent = PageList
        UIPageLayout.SortOrder = Enum.SortOrder.LayoutOrder
        UIPageLayout.EasingDirection = Enum.EasingDirection.InOut
        UIPageLayout.EasingStyle = Enum.EasingStyle.Quad
        UIPageLayout.FillDirection = Enum.FillDirection.Vertical
        UIPageLayout.Padding = UDim.new(0, 15)
        UIPageLayout.TweenTime = 0.400
        UIPageLayout.GamepadInputEnabled = false
        UIPageLayout.ScrollWheelInputEnabled = false
        UIPageLayout.TouchInputEnabled = false
        
        MakeDraggable(Top, Main)
        
        
        local uitab = {}
        
        function uitab:Tab(text, logo1)
            local TabButton = Instance.new("TextButton")
            TabButton.Parent = ScrollTab
            TabButton.Name = text .. "Server"
            TabButton.Text = text
            TabButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TabButton.BackgroundTransparency = 1.000
            TabButton.Size = UDim2.new(0, 130, 0, 23)
            TabButton.Font = Enum.Font.GothamSemibold
            TabButton.TextColor3 = Color3.fromRGB(225, 225, 225)
            TabButton.TextSize = 15.000
            TabButton.TextTransparency = 0.500
            
            -- local IDK = Instance.new("ImageLabel")
            -- IDK.Name = "LogoIDK"
            -- IDK.Parent = TabButton
            -- IDK.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            -- IDK.BackgroundTransparency = 1.000
            -- IDK.Position = UDim2.new(0, 15 - #text, 0, 1)
            -- IDK.Size = UDim2.new(0, 20, 0, 20)
            -- IDK.Image = "rbxassetid://" .. tostring(logo1)
            
            
            local MainFramePage = Instance.new("ScrollingFrame")
            MainFramePage.Name = text .. "_Page"
            MainFramePage.Parent = PageList
            MainFramePage.Active = true
            MainFramePage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            MainFramePage.BackgroundTransparency = 1.000
            MainFramePage.BorderSizePixel = 0
            MainFramePage.Size = UDim2.new(0, 450, 0, 263)
            MainFramePage.CanvasSize = UDim2.new(0, 0, 0, 0)
            MainFramePage.ScrollBarThickness = 0
            MainFramePage.ClipsDescendants = true

            local UIPadding = Instance.new("UIPadding")
            local UIListLayout = Instance.new("UIListLayout")
            
            UIPadding.Parent = MainFramePage
            UIPadding.PaddingLeft = UDim.new(0, 0)
            UIPadding.PaddingTop = UDim.new(0, 0)
            
            UIListLayout.Padding = UDim.new(0, 4)
            UIListLayout.Parent = MainFramePage
            UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
            UIListLayout.HorizontalAlignment = "Center"
            
            TabButton.MouseButton1Click:Connect(function()
                for i, v in next, ScrollTab:GetChildren() do
                    if v:IsA("TextButton") then
                        TweenService:Create(
                            v,
                            TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {TextTransparency = 0.5}
                        ):Play()
                    end
                    TweenService:Create(
                        TabButton,
                        TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {TextTransparency = 0}
                    ):Play()
                end
                for i, v in next, PageList:GetChildren() do
                    currentpage = string.gsub(TabButton.Name, "Server", "") .. "_Page"
                    if v.Name == currentpage then
                        UIPageLayout:JumpTo(v)
                    end
                end
            end)
            
            if abc == false then
                for i, v in next, ScrollTab:GetChildren() do
                    if v:IsA("TextButton") then
                        TweenService:Create(
                            v,
                            TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {TextTransparency = 0.5}
                        ):Play()
                    end
                    TweenService:Create(
                        TabButton,
                        TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {TextTransparency = 0}
                    ):Play()
                end
                UIPageLayout:JumpToIndex(1)
                abc = true
            end
            
            game:GetService("RunService").Stepped:Connect(function()
                pcall(function()
                    MainFramePage.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y + 20)
                    ScrollTab.CanvasSize = UDim2.new(0, 0, 0, PLL.AbsoluteContentSize.Y + 20)
                end)
            end)
            
            
            local main = {}
            function main:Button(text, callback)
                local Button = Instance.new("Frame")
                local UICorner = Instance.new("UICorner")
                local TextBtn = Instance.new("TextButton")
                local UICorner_2 = Instance.new("UICorner")
                local Black = Instance.new("Frame")
                local UICorner_3 = Instance.new("UICorner")
                local IMGBUTTON = Instance.new("ImageLabel")

                Button.Name = "Button"
                Button.Parent = MainFramePage
                Button.BackgroundColor3 = _G.Color
                Button.Size = UDim2.new(0, 442, 0, 31)

                UICorner.CornerRadius = UDim.new(0, 5)
                UICorner.Parent = Button

                TextBtn.Name = "TextBtn"
                TextBtn.Parent = Button
                TextBtn.BackgroundColor3 = _G.BGColor
                TextBtn.Position = UDim2.new(0, 3, 0, 1)
                TextBtn.Size = UDim2.new(0, 436, 0, 29)
                TextBtn.AutoButtonColor = false
                TextBtn.Font = Enum.Font.GothamSemibold
                TextBtn.Text = text
                TextBtn.TextColor3 = Color3.fromRGB(225, 225, 225)
                TextBtn.TextSize = 15
                TextBtn.ClipsDescendants = true

                UICorner_2.CornerRadius = UDim.new(0, 5)
                UICorner_2.Parent = TextBtn

                IMGBUTTON.Name = "IconB"
                IMGBUTTON.Parent = TextBtn
                IMGBUTTON.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                IMGBUTTON.BackgroundTransparency = 1
                IMGBUTTON.Position = UDim2.new(0, 10, 0, 5)
                IMGBUTTON.Size = UDim2.new(0, 20, 0, 20)
                

                Black.Name = "Black"
                Black.Parent = Button
                Black.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                Black.BackgroundTransparency = 1
                Black.BorderSizePixel = 0
                Black.Position = UDim2.new(0, 1, 0, 1)
                Black.Size = UDim2.new(0, 468, 0, 29)

                UICorner_3.CornerRadius = UDim.new(0, 0)
                UICorner_3.Parent = Black

                TextBtn.MouseEnter:Connect(function()
                    TweenService:Create(Black, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        BackgroundTransparency = 0.7
                    }):Play()
                end)

                TextBtn.MouseLeave:Connect(function()
                    TweenService:Create(Black, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        BackgroundTransparency = 1
                    }):Play()
                end)

                TextBtn.MouseButton1Click:Connect(function()
                    Button.BackgroundColor3 = Color3.fromRGB(42, 235, 68)
                    CircleAnim(TextBtn, Color3.fromRGB(255, 255, 255), Color3.fromRGB(255, 255, 255))
                    TextBtn.TextSize = 1
                    TweenService:Create(TextBtn, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        TextSize = 15
                    }):Play()
                    callback()
                    task.wait(0.3)
                    Button.BackgroundColor3 = _G.Color
                end)

                -- return object with Set function
                local ButtonObject = {}

                function ButtonObject:Set(newText, newCallback)
                    if newText then
                        TextBtn.Text = newText
                    end
                    if newCallback then
                        callback = newCallback -- overwrite callback
                    end
                end

                return ButtonObject
            end

            function main:Toggle(text, Imgidicon, config, callback)
                config = config or false
                local toggled = config

                local Toggle = Instance.new("Frame")
                local UICorner = Instance.new("UICorner")
                local Button = Instance.new("TextButton")
                local UICorner_2 = Instance.new("UICorner")
                local Label = Instance.new("TextLabel")
                local ToggleImage = Instance.new("Frame")
                local UICorner_3 = Instance.new("UICorner")
                local Circle = Instance.new("Frame")
                local UICorner_4 = Instance.new("UICorner")
                local imgLabelIcon = Instance.new("ImageLabel")

                Toggle.Name = "Toggle"
                Toggle.Parent = MainFramePage
                Toggle.BackgroundColor3 = _G.Color
                Toggle.Size = UDim2.new(0, 442, 0, 31)

                UICorner.CornerRadius = UDim.new(0, 5)
                UICorner.Parent = Toggle

                Button.Name = "Button"
                Button.Parent = Toggle
                Button.BackgroundColor3 = _G.BGColor
                Button.Position = UDim2.new(0, 3, 0, 1)
                Button.Size = UDim2.new(0, 436, 0, 29)
                Button.AutoButtonColor = false
                Button.Font = Enum.Font.SourceSans
                Button.Text = ""
                Button.TextColor3 = Color3.fromRGB(0, 0, 0)
                Button.TextSize = 11

                UICorner_2.CornerRadius = UDim.new(0, 5)
                UICorner_2.Parent = Button

                Label.Name = "Label"
                Label.Parent = Toggle
                Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Label.BackgroundTransparency = 1
                Label.Position = UDim2.new(0, 1, 0, 1)
                Label.Size = UDim2.new(0, 440, 0, 29)
                Label.Font = Enum.Font.GothamSemibold
                Label.Text = text
                Label.TextColor3 = Color3.fromRGB(225, 225, 225)
                Label.TextSize = 15

                ToggleImage.Name = "ToggleImage"
                ToggleImage.Parent = Toggle
                ToggleImage.BackgroundColor3 = Color3.fromRGB(225, 225, 225)
                ToggleImage.Position = UDim2.new(0, 390, 0, 5)
                ToggleImage.Size = UDim2.new(0, 45, 0, 20)

                UICorner_3.CornerRadius = UDim.new(0, 5)
                UICorner_3.Parent = ToggleImage

                Circle.Name = "Circle"
                Circle.Parent = ToggleImage
                Circle.BackgroundColor3 = _G.Color
                Circle.Position = UDim2.new(0, 2, 0, 2)
                Circle.Size = UDim2.new(0, 16, 0, 16)

                UICorner_4.CornerRadius = UDim.new(0, 5)
                UICorner_4.Parent = Circle

                imgLabelIcon.Name = "Icon"
                imgLabelIcon.Parent = Toggle
                imgLabelIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                imgLabelIcon.BackgroundTransparency = 1
                imgLabelIcon.Position = UDim2.new(0, 10, 0, 5)
                imgLabelIcon.Size = UDim2.new(0, 20, 0, 20)
                

                -- function to update visuals
                local function updateState(state)
                    toggled = state
                    if toggled then
                        Circle:TweenPosition(UDim2.new(0, 27, 0, 2), "Out", "Sine", 0.2, true)
                        TweenService:Create(Toggle, TweenInfo.new(0.4, Enum.EasingStyle.Quad), {
                            BackgroundColor3 = Color3.fromRGB(42, 235, 68)
                        }):Play()
                        TweenService:Create(Circle, TweenInfo.new(0.4, Enum.EasingStyle.Quad), {
                            BackgroundColor3 = Color3.fromRGB(42, 235, 68)
                        }):Play()
                    else
                        Circle:TweenPosition(UDim2.new(0, 2, 0, 2), "Out", "Sine", 0.2, true)
                        TweenService:Create(Toggle, TweenInfo.new(0.4, Enum.EasingStyle.Quad), {
                            BackgroundColor3 = _G.Color
                        }):Play()
                        TweenService:Create(Circle, TweenInfo.new(0.4, Enum.EasingStyle.Quad), {
                            BackgroundColor3 = _G.Color
                        }):Play()
                    end
                    pcall(callback, toggled)
                end

                Button.MouseButton1Click:Connect(function()
                    updateState(not toggled)
                end)

                -- set initial state
                if config == true then
                    updateState(true)
                end

                -- return object with Set
                local ToggleObject = {}

                function ToggleObject:Set(state, newText, newIcon)
                    if state ~= nil then
                        updateState(state)
                    end
                    if newText then
                        Label.Text = newText
                    end
                    if newIcon then
                        
                    end
                end

                return ToggleObject
            end
            
             function main:Dropdown(text, old, option, mode, callback)
    local isdropping = false
    local selections = {}
    
    local isMulti = (string.lower(mode) == "multi")
    local items = {}
    local allOptions = option

    -- // UI Setup
    local dropmain = Instance.new("Frame")
    dropmain.Name = text
    dropmain.Parent = MainFramePage
    dropmain.BackgroundColor3 = _G.Color
    dropmain.Size = UDim2.new(0, 442, 0, 31)

    local UICornerdrop = Instance.new("UICorner")
    UICornerdrop.CornerRadius = UDim.new(0, 5)
    UICornerdrop.Parent = dropmain

    local Dropdown = Instance.new("Frame")
    Dropdown.Name = "Dropdown"
    Dropdown.Parent = dropmain
    Dropdown.BackgroundColor3 = _G.BGColor
    Dropdown.ClipsDescendants = true
    Dropdown.Size = UDim2.new(0, 436, 0, 29)
    Dropdown.Position = UDim2.new(0, 3, 0, 1)

    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 5)
    UICorner.Parent = Dropdown

    local DropTitle = Instance.new("TextLabel")
    DropTitle.Name = "DropTitle"
    DropTitle.Parent = Dropdown
    DropTitle.BackgroundTransparency = 1
    DropTitle.Size = UDim2.new(0, 436, 0, 29)
    DropTitle.Font = Enum.Font.GothamSemibold
    DropTitle.TextColor3 = Color3.fromRGB(225, 225, 225)
    DropTitle.TextSize = 15
    DropTitle.Text = text .. " : "

    local DropScroll = Instance.new("ScrollingFrame")
    DropScroll.Name = "DropScroll"
    DropScroll.Parent = Dropdown
    DropScroll.Active = true
    DropScroll.BackgroundTransparency = 1
    DropScroll.BorderSizePixel = 0
    DropScroll.Position = UDim2.new(0, 0, 0, 31)
    DropScroll.Size = UDim2.new(0, 436, 0, 100)
    DropScroll.ScrollBarThickness = 3
    DropScroll.CanvasSize = UDim2.new(0, 0, 0, 0)

    local UIListLayout = Instance.new("UIListLayout")
    UIListLayout.Parent = DropScroll
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

    local UIPadding = Instance.new("UIPadding")
    UIPadding.Parent = DropScroll
    UIPadding.PaddingTop = UDim.new(0, 2)
    UIPadding.PaddingBottom = UDim.new(0, 2)

    local DropImage = Instance.new("ImageLabel")
    DropImage.Name = "DropImage"
    DropImage.Parent = Dropdown
    DropImage.BackgroundTransparency = 1
    DropImage.Position = UDim2.new(0, 410, 0, 4)
    DropImage.Rotation = -90
    DropImage.Size = UDim2.new(0, 20, 0, 20)
    DropImage.Image = 'rbxassetid://6031090990'

    local DropButton = Instance.new("TextButton")
    DropButton.Name = "DropButton"
    DropButton.Parent = Dropdown
    DropButton.BackgroundTransparency = 1
    DropButton.Size = UDim2.new(0, 436, 0, 29)
    DropButton.Text = ""

    local Dropsearch = Instance.new("Frame")
    Dropsearch.Name = "Drop_Search"
    Dropsearch.Parent = Dropdown
    Dropsearch.BackgroundColor3 = _G.Color
    Dropsearch.Position = UDim2.new(0, 20, 0, 6)
    Dropsearch.Size = UDim2.new(0, 65, 0, 18)

    local Dropsearchcor = Instance.new("UICorner")
    Dropsearchcor.CornerRadius = UDim.new(0, 5)
    Dropsearchcor.Parent = Dropsearch

    local TextBox = Instance.new("TextBox")
    TextBox.Parent = Dropsearch
    TextBox.BackgroundColor3 = _G.BGColor
    TextBox.Position = UDim2.new(0, 1, 0, 1)
    TextBox.Size = UDim2.new(0, 63, 0, 16)
    TextBox.Font = Enum.Font.GothamSemibold
    TextBox.TextColor3 = Color3.fromRGB(225, 225, 225)
    TextBox.TextSize = 9
    TextBox.Text = "Search"

    local UICorner_2 = Instance.new("UICorner")
    UICorner_2.CornerRadius = UDim.new(0, 5)
    UICorner_2.Parent = TextBox

    -- Auto resize Canvas
    local function UpdateCanvasSize()
        DropScroll.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y + 4)
    end
    UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(UpdateCanvasSize)

    -- // Preselect
    if old then
        if isMulti then
            selections = typeof(old) == "table" and old or {old}
        else
            selections = old
        end
    end

    -- // Update title
    local function RefreshTitle()
        if isMulti then
            if #selections == 1 then
                DropTitle.Text = text .. " : " .. selections[1]
            elseif #selections > 1 then
                DropTitle.Text = text .. " : Various"
            else
                DropTitle.Text = text .. " : "
            end
        else
            DropTitle.Text = text .. " : " .. selections
        end
    end

    local function RefreshVisuals()
        for _, item in pairs(items) do
            local v = item.Value
            local selected = isMulti and table.find(selections, v) or (selections == v)

            if selected then
                item.Button.TextColor3 = Color3.fromRGB(239, 68, 68)
                item.Button.TextTransparency = 0
            else
                item.Button.TextColor3 = Color3.fromRGB(200, 200, 200)
                item.Button.TextTransparency = 0.5
            end
        end
    end

    local function ClearUI()
        for _, v in ipairs(DropScroll:GetChildren()) do
            if v:IsA("TextButton") then v:Destroy() end
        end
        items = {}
        UpdateCanvasSize()
    end

    -- // Create Item
    local function CreateItem(v)
        local Item = Instance.new("TextButton")
        Item.Name = "Item"
        Item.Parent = DropScroll
        Item.BackgroundTransparency = 1
        Item.Size = UDim2.new(0, 436, 0, 26)
        Item.Font = Enum.Font.GothamSemibold
        Item.Text = tostring(v)
        Item.TextColor3 = Color3.fromRGB(200, 200, 200)
        Item.TextSize = 13
        Item.TextTransparency = 0.5
        Item.ZIndex = 2

        local SelectedBG = Instance.new("Frame")
        SelectedBG.Parent = Item
        SelectedBG.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
        SelectedBG.Size = UDim2.new(1, 0, 1, 0)
        SelectedBG.Visible = false
        SelectedBG.ZIndex = 1

        local UICorner = Instance.new("UICorner")
        UICorner.CornerRadius = UDim.new(0, 4)
        UICorner.Parent = SelectedBG

        Item.MouseButton1Click:Connect(function()
            if isMulti then
                local idx = table.find(selections, v)
                if idx then
                    table.remove(selections, idx)
                else
                    table.insert(selections, v)
                end
                callback(selections)
            else
                selections = v
                callback(selections)
                isdropping = false
                Dropdown:TweenSize(UDim2.new(0, 436, 0, 29), "Out", "Quad", 0.3, true)
                dropmain:TweenSize(UDim2.new(0, 442, 0, 31), "Out", "Quad", 0.3, true)
                DropImage.Rotation = -90
            end
            RefreshTitle()
            RefreshVisuals()
        end)

        table.insert(items, {Button = Item, SelectedBG = SelectedBG, Value = v})
        UpdateCanvasSize()
    end

    -- // Refresh options by filter
    local function RefreshOptions(filter)
        ClearUI()
        for _, v in ipairs(allOptions) do
            if not filter or string.find(string.lower(v), string.lower(filter)) then
                CreateItem(v)
            end
        end
        RefreshVisuals()
    end

    -- // Search Hook
    TextBox:GetPropertyChangedSignal("Text"):Connect(function()
        if TextBox.Text == "" or TextBox.Text == "Search" then
            RefreshOptions()
        else
            RefreshOptions(TextBox.Text)
        end
    end)

    -- // Initial
    RefreshTitle()
    RefreshOptions()

    -- Toggle dropdown
    DropButton.MouseButton1Click:Connect(function()
        if not isdropping then
            isdropping = true
            Dropdown:TweenSize(UDim2.new(0, 436, 0, 131), "Out", "Quad", 0.3, true)
            dropmain:TweenSize(UDim2.new(0, 442, 0, 133), "Out", "Quad", 0.3, true)
            DropImage.Rotation = 180
        else
            isdropping = false
            Dropdown:TweenSize(UDim2.new(0, 436, 0, 29), "Out", "Quad", 0.3, true)
            dropmain:TweenSize(UDim2.new(0, 442, 0, 31), "Out", "Quad", 0.3, true)
            DropImage.Rotation = -90
        end
    end)

    -- // Functions
    local dropfunc = {}

    function dropfunc:Set(val)
        if isMulti then
            selections = typeof(val) == "table" and val or {val}
        else
            selections = val
        end
        RefreshTitle()
        RefreshVisuals()
    end

    function dropfunc:Add(v)
        table.insert(allOptions, v)
        RefreshOptions()
    end

    function dropfunc:Clear()
        selections = isMulti and {} or nil
        RefreshTitle()
        ClearUI()
        allOptions = {}
    end

    function dropfunc:Refresh(newOptions)
        -- Store current dropdown state
        local wasDropping = isdropping
        local currentSearch = TextBox.Text
        
        -- Update options if provided
        if newOptions then
            allOptions = newOptions
        end
        
        -- Refresh with current search filter
        if currentSearch == "" or currentSearch == "Search" then
            RefreshOptions()
        else
            RefreshOptions(currentSearch)
        end
        
        -- Maintain dropdown state - don't change open/close state
        -- The dropdown stays exactly as it was before refresh
    end

    return dropfunc
end


            function main:Slider(text, min, max, set, callback)
                local Slider = Instance.new("Frame")
                local slidercorner = Instance.new("UICorner")
                local sliderr = Instance.new("Frame")
                local sliderrcorner = Instance.new("UICorner")
                local SliderLabel = Instance.new("TextLabel")
                local AHEHE = Instance.new("TextButton")
                local bar = Instance.new("Frame")
                local bar1 = Instance.new("Frame")
                local bar1corner = Instance.new("UICorner")
                local barcorner = Instance.new("UICorner")
                local circlebar = Instance.new("Frame")
                local UICorner = Instance.new("UICorner")
                local slidervalue = Instance.new("Frame")
                local valuecorner = Instance.new("UICorner")
                local TextBox = Instance.new("TextBox")
                local UICorner_2 = Instance.new("UICorner")

                -- Main Frame
                Slider.Name = "Slider"
                Slider.Parent = MainFramePage
                Slider.BackgroundColor3 = _G.Color
                Slider.Size = UDim2.new(0, 442, 0, 51)

                slidercorner.CornerRadius = UDim.new(0, 5)
                slidercorner.Parent = Slider

                sliderr.Name = "sliderr"
                sliderr.Parent = Slider
                sliderr.BackgroundColor3 = _G.BGColor
                sliderr.Position = UDim2.new(0, 3, 0, 1)
                sliderr.Size = UDim2.new(0, 436, 0, 49)

                sliderrcorner.CornerRadius = UDim.new(0, 5)
                sliderrcorner.Parent = sliderr

                SliderLabel.Parent = sliderr
                SliderLabel.BackgroundTransparency = 1
                SliderLabel.Position = UDim2.new(0, 7, 0, 0)
                SliderLabel.Size = UDim2.new(0, 180, 0, 26)
                SliderLabel.Font = Enum.Font.GothamSemibold
                SliderLabel.Text = text
                SliderLabel.TextColor3 = Color3.fromRGB(225, 225, 225)
                SliderLabel.TextSize = 16
                SliderLabel.TextXAlignment = Enum.TextXAlignment.Left

                -- Button area
                AHEHE.Parent = sliderr
                AHEHE.BackgroundTransparency = 1
                AHEHE.Position = UDim2.new(0, 10, 0, 35)
                AHEHE.Size = UDim2.new(0, 418, 0, 5)
                AHEHE.Text = ""

                -- Bar
                bar.Parent = AHEHE
                bar.BackgroundColor3 = _G.BGColor
                bar.Size = UDim2.new(1, 0, 0, 5)

                barcorner.CornerRadius = UDim.new(0, 5)
                barcorner.Parent = bar

                -- Fill bar
                bar1.Parent = bar
                bar1.BackgroundColor3 = _G.Color
                bar1.Size = UDim2.new(0, 0, 0, 5)

                bar1corner.CornerRadius = UDim.new(0, 5)
                bar1corner.Parent = bar1

                -- Circle
                circlebar.Parent = bar1
                circlebar.BackgroundColor3 = Color3.fromRGB(225, 225, 225)
                circlebar.Size = UDim2.new(0, 10, 0, 10)

                UICorner.CornerRadius = UDim.new(0, 5)
                UICorner.Parent = circlebar

                -- Value box
                slidervalue.Parent = sliderr
                slidervalue.BackgroundColor3 = _G.Color
                slidervalue.Position = UDim2.new(0, 362, 0, 5)
                slidervalue.Size = UDim2.new(0, 65, 0, 18)

                valuecorner.CornerRadius = UDim.new(0, 5)
                valuecorner.Parent = slidervalue

                TextBox.Parent = slidervalue
                TextBox.BackgroundColor3 = _G.BGColor
                TextBox.Position = UDim2.new(0, 1, 0, 1)
                TextBox.Size = UDim2.new(0, 63, 0, 16)
                TextBox.Font = Enum.Font.GothamSemibold
                TextBox.TextColor3 = Color3.fromRGB(225, 225, 225)
                TextBox.TextSize = 9

                UICorner_2.CornerRadius = UDim.new(0, 5)
                UICorner_2.Parent = TextBox

                -- Slider logic
                local mouse = game.Players.LocalPlayer:GetMouse()
                local uis = game:GetService("UserInputService")
                local Value = set

                local function UpdateSlider(val)
                    val = math.clamp(val, min, max)
                    Value = val
                    TextBox.Text = tostring(val)

                    local percent = (val - min) / (max - min)

                    -- Fill bar
                    bar1.Size = UDim2.new(percent, 0, 1, 0)

                    -- Circle position (centered on bar height, aligned with bar1 end)
                    local circleX = bar.AbsoluteSize.X * percent - (circlebar.AbsoluteSize.X / 2)
                    circlebar.Position = UDim2.new(0, circleX, 0.5, -circlebar.AbsoluteSize.Y / 2)

                    pcall(callback, val)
                end


                -- Init
                UpdateSlider(set)

                -- Dragging
                AHEHE.MouseButton1Down:Connect(function()
                    local moveConnection
                    local releaseConnection

                    moveConnection = mouse.Move:Connect(function()
                        local percent = math.clamp((mouse.X - bar.AbsolutePosition.X) / bar.AbsoluteSize.X, 0, 1)
                        UpdateSlider(math.floor(min + (max - min) * percent))
                    end)

                    releaseConnection = uis.InputEnded:Connect(function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            moveConnection:Disconnect()
                            releaseConnection:Disconnect()
                        end
                    end)
                end)

                -- Textbox
                TextBox.FocusLost:Connect(function()
                    local num = tonumber(TextBox.Text)
                    if num then
                        UpdateSlider(num)
                    else
                        UpdateSlider(Value)
                    end
                end)
            end

            
            function main:Textbox(labelText, defaultText, disappear, callback)
                local Textbox = Instance.new("Frame")
                local TextboxCorner = Instance.new("UICorner")
                local TextboxInner = Instance.new("Frame")
                local TextboxInnerCorner = Instance.new("UICorner")
                local Label = Instance.new("TextLabel")
                local RealTextbox = Instance.new("TextBox")
                local RealCorner = Instance.new("UICorner")
                local BackgroundFrame = Instance.new("Frame")
                local BackgroundCorner = Instance.new("UICorner")

                -- Main Frame
                Textbox.Name = "Textbox"
                Textbox.Parent = MainFramePage
                Textbox.BackgroundColor3 = _G.Color
                Textbox.Size = UDim2.new(0, 440, 0, 31)

                TextboxCorner.CornerRadius = UDim.new(0, 5)
                TextboxCorner.Parent = Textbox

                -- Inner Frame
                TextboxInner.Name = "TextboxInner"
                TextboxInner.Parent = Textbox
                TextboxInner.BackgroundColor3 = _G.BGColor
                TextboxInner.Position = UDim2.new(0, 3, 0, 1)
                TextboxInner.Size = UDim2.new(0, 434, 0, 29)

                TextboxInnerCorner.CornerRadius = UDim.new(0, 5)
                TextboxInnerCorner.Parent = TextboxInner

                -- Label
                Label.Name = "Label"
                Label.Parent = Textbox
                Label.BackgroundTransparency = 1
                Label.Position = UDim2.new(0, 15, 0, 0)
                Label.Size = UDim2.new(0, 145, 0, 31)
                Label.Font = Enum.Font.GothamSemibold
                Label.Text = labelText
                Label.TextColor3 = Color3.fromRGB(225, 225, 225)
                Label.TextSize = 16
                Label.TextXAlignment = Enum.TextXAlignment.Left

                -- Background highlight
                BackgroundFrame.Parent = Textbox
                BackgroundFrame.Name = "BackgroundFrame"
                BackgroundFrame.BackgroundColor3 = _G.Color
                BackgroundFrame.Position = UDim2.new(0, 280, 0, 3)
                BackgroundFrame.Size = UDim2.new(0, 152, 0, 24)

                BackgroundCorner.CornerRadius = UDim.new(0, 5)
                BackgroundCorner.Parent = BackgroundFrame

                -- Real Textbox
                RealTextbox.Name = "RealTextbox"
                RealTextbox.Parent = Textbox
                RealTextbox.BackgroundColor3 = _G.BGColor
                RealTextbox.Position = UDim2.new(0, 281, 0, 5)
                RealTextbox.Size = UDim2.new(0, 150, 0, 20)
                RealTextbox.Font = Enum.Font.GothamSemibold
                RealTextbox.Text = defaultText or ""
                RealTextbox.TextColor3 = Color3.fromRGB(225, 225, 225)
                RealTextbox.TextSize = 11

                RealCorner.CornerRadius = UDim.new(0, 5)
                RealCorner.Parent = RealTextbox

                -- Highlight color change
                RealTextbox:GetPropertyChangedSignal("Text"):Connect(function()
                    if RealTextbox.Text ~= "" then
                        BackgroundFrame.BackgroundColor3 = Color3.fromRGB(42, 235, 68)
                    else
                        BackgroundFrame.BackgroundColor3 = _G.Color
                    end
                end)

                -- Callback + disappear option
                RealTextbox.FocusLost:Connect(function()
                    local text = RealTextbox.Text
                    if string.len(text) > 20 then
                        text = string.sub(text, 1, 20) .. "..." -- truncate
                    end

                    pcall(callback, RealTextbox.Text)

                    if disappear then
                        RealTextbox.Text = ""
                    else
                        RealTextbox.Text = text
                    end
                end)

                -- Return controller
                local TextboxValue = {}

                function TextboxValue:Set(newText)
                    RealTextbox.Text = tostring(newText or "")
                end

                function TextboxValue:Get()
                    return RealTextbox.Text
                end

                return TextboxValue
            end

            function main:Label(text)
                local LabelFrame = Instance.new("Frame")
                local LabelCorner = Instance.new("UICorner")

                local Label = Instance.new("TextLabel")
                local LabelCorner1 = Instance.new("UICorner")
                local PaddingLabel = Instance.new("UIPadding")
                local labell = {}

                LabelFrame.Name = "Label"
                LabelFrame.Parent = MainFramePage
                LabelFrame.BackgroundColor3 = _G.Color
                LabelFrame.Size = UDim2.new(0, 440, 0, 31)

                LabelCorner.CornerRadius = UDim.new(0, 5)
                LabelCorner.Parent = LabelFrame

                Label.Name = "LabelText"
                Label.Parent = LabelFrame
                Label.BackgroundColor3 = _G.BGColor
                Label.Size = UDim2.new(0, 434, 0, 27)
                Label.Font = Enum.Font.GothamSemibold
                Label.TextColor3 = Color3.fromRGB(225, 225, 225)
                Label.TextSize = 16
                Label.Text = text
                Label.TextXAlignment = Enum.TextXAlignment.Center
                Label.Position = UDim2.new(0, 3, 0, 2)

                LabelCorner1.CornerRadius = UDim.new(0, 5)
                LabelCorner1.Parent = Label

                PaddingLabel.PaddingLeft = UDim.new(0, 0)
                PaddingLabel.Parent = Label

                -- Public methods
                function labell:Set(newtext)
                    Label.Text = newtext
                end

                function labell:Get()
                    return Label.Text
                end

                return labell
            end

            function main:LabelP(text)
                local LabelFrame = Instance.new("Frame")
                local LabelCorner = Instance.new("UICorner")

                local Label = Instance.new("TextLabel")
                local LabelCorner1 = Instance.new("UICorner")
                local PaddingLabel = Instance.new("UIPadding")
                local labell = {}

                LabelFrame.Name = "LabelP"
                LabelFrame.Parent = MainFramePage
                LabelFrame.BackgroundColor3 = _G.Color
                LabelFrame.Size = UDim2.new(0, 440, 0, 31)

                LabelCorner.CornerRadius = UDim.new(0, 5)
                LabelCorner.Parent = LabelFrame

                Label.Name = "LabelText"
                Label.Parent = LabelFrame
                Label.BackgroundColor3 = _G.BGColor
                Label.Size = UDim2.new(0, 434, 0, 27)
                Label.Font = Enum.Font.GothamSemibold
                Label.TextColor3 = Color3.fromRGB(225, 225, 225)
                Label.TextSize = 15
                Label.Text = text
                Label.TextXAlignment = Enum.TextXAlignment.Left
                Label.Position = UDim2.new(0, 3, 0, 2)

                LabelCorner1.CornerRadius = UDim.new(0, 5)
                LabelCorner1.Parent = Label

                PaddingLabel.PaddingLeft = UDim.new(0, 8) -- small padding for left text
                PaddingLabel.Parent = Label

                -- Public methods
                function labell:Set(newtext)
                    Label.Text = newtext
                end

                function labell:Get()
                    return Label.Text
                end

                return labell
            end

            function main:Seperator(text)
                local Seperator = Instance.new("Frame")
                local Sep1 = Instance.new("Frame")
                local Sep2 = Instance.new("TextLabel")
                local Sep3 = Instance.new("Frame")
                
                Seperator.Name = "Seperator"
                Seperator.Parent = MainFramePage
                Seperator.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Seperator.BackgroundTransparency = 1.000
                Seperator.Size = UDim2.new(0, 470, 0, 20)
                
                Sep1.Name = "Sep1"
                Sep1.Parent = Seperator
                Sep1.BackgroundColor3 = _G.Color
                Sep1.BorderSizePixel = 0
                Sep1.Position = UDim2.new(0, 17, 0, 10)
                Sep1.Size = UDim2.new(0, 80, 0, 1)
                
                Sep2.Name = "Sep2"
                Sep2.Parent = Seperator
                Sep2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Sep2.BackgroundTransparency = 1.000
                Sep2.Position = UDim2.new(0, 185, 0, 0)
                Sep2.Size = UDim2.new(0, 100, 0, 20)
                Sep2.Font = Enum.Font.GothamSemibold
                Sep2.Text = text
                Sep2.TextColor3 = Color3.fromRGB(255, 255, 255)
                Sep2.TextSize = 14.000
                
                Sep3.Name = "Sep3"
                Sep3.Parent = Seperator
                Sep3.BackgroundColor3 = _G.Color
                Sep3.BorderSizePixel = 0
                Sep3.Position = UDim2.new(0, 373, 0, 10)
                Sep3.Size = UDim2.new(0, 80, 0, 1)
            end
            
            function main:Line()
                local Linee = Instance.new("Frame")
                local Line = Instance.new("Frame")
                
                Linee.Name = "Linee"
                Linee.Parent = MainFramePage
                Linee.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Linee.BackgroundTransparency = 1.000
                Linee.Position = UDim2.new(0, 0, 0.119999997, 0)
                Linee.Size = UDim2.new(0, 470, 0, 20)
                
                Line.Name = "Line"
                Line.Parent = Linee
                Line.BackgroundColor3 = _G.Color
                Line.BorderSizePixel = 0
                Line.Position = UDim2.new(0, 017, 0, 10)
                Line.Size = UDim2.new(0, 435, 0, 1)
            end
            return main
        end
        return uitab
    end
end
return library1
