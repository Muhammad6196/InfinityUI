```markdown
🎨 Project WD UI Library

Version: 1.0.0
License: MIT
Roblox UI Library

A modern, responsive UI library for Roblox exploits with shadcn/ui-inspired design aesthetics.

Discord: https://discord.gg/88gR5XUpkC

---

## ✨ Features

- 🎨 **Modern Design** - Inspired by shadcn/ui with clean aesthetics
- 📱 **Responsive** - Adapts to mobile, tablet, and desktop screens automatically
- 🎭 **Rich Text** - Full rich text support with gradients and formatting
- 🔔 **Notifications** - Beautiful, animated notification system with action buttons
- 🎯 **Easy to Use** - Simple API with fluent design patterns
- 🌈 **Customizable** - Complete color theming support
- ⚡ **Performant** - Optimized with TweenService animations
- 🔒 **Protected** - Built-in GUI protection for supported executors

---

## 📦 Installation

### Quick Start

```lua
-- Load the library
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Muhammad6196/InfinityUI/refs/heads/main/NewInfinityUI.lua"))()

-- Create a window
local Window = library:Window("Project WD", nil, Enum.KeyCode.RightControl, {
    Color3.fromRGB(59, 130, 246),
    Color3.fromRGB(139, 92, 246)
}, Color3.fromRGB(59, 130, 246))

-- Create a tab
local MainTab = Window:Tab("Main")
```

---

## 📚 API Reference

### Window Creation

```lua
library:Window(title, logo, keybind, gradientColors, accentColor)
```

| Parameter | Type | Description |
|-----------|------|-------------|
| `title` | `string` | Window title |
| `logo` | `optional` | Logo asset ID (reserved) |
| `keybind` | `optional` | Keybind to toggle UI (default: RightControl) |
| `gradientColors` | `optional` | Table of Color3 values for title gradient |
| `accentColor` | `optional` | Custom accent color (default: blue) |

---

### 📍 Tab Methods

#### Button

```lua
local button = tab:Button("Click Me", function()
    print("Button clicked!")
end)

-- Fluent methods
button:Set("New Text", newCallback)
button:SetColor(Color3.fromRGB(255, 0, 0))
button:SetAccentColor(Color3.fromRGB(0, 255, 0))
button:SetEnabled(false)
button:GetText()
```

#### Toggle

```lua
local toggle = tab:Toggle("Enable Feature", false, function(state)
    print("Toggle state:", state)
end)

toggle:Set(true, "New Label")
```

#### Slider

```lua
local slider = tab:Slider("Volume", 0, 100, 50, function(value)
    print("Volume:", value)
end)
```

#### Dropdown

```lua
-- Single-select dropdown
local dropdown = tab:Dropdown("Select Option", "Option 1", 
    {"Option 1", "Option 2", "Option 3"}, 
    "single", 
    function(value)
        print("Selected:", value)
    end
)

-- Multi-select dropdown
local multiDropdown = tab:Dropdown("Select Options", {"Option 1"}, 
    {"Option 1", "Option 2", "Option 3"}, 
    "multi", 
    function(values)
        print("Selected:", table.concat(values, ", "))
    end
)

-- Dropdown API
dropdown:Get()               -- Get current value(s)
dropdown:Set("New Value")    -- Set value
dropdown:Add("New Option")   -- Add option
dropdown:Remove("Option")    -- Remove option
dropdown:Clear()             -- Clear all options
dropdown:Refresh()           -- Refresh options list
dropdown:GetOptions()        -- Get all options
```

#### Textbox

```lua
local textbox = tab:Textbox("Username", "Enter username...", function(text)
    print("Input:", text)
end)

textbox:Set("JohnDoe")
textbox:Get()
textbox:SetPlaceholder("Type here...")
textbox:Clear()
textbox:Focus()
textbox:SetTextColor(Color3.fromRGB(255, 255, 255))
textbox:SetPlaceholderColor(Color3.fromRGB(128, 128, 128))
```

#### Rich Paragraph

```lua
local paragraph = tab:RichParagraph(
    "This is a rich text paragraph with **bold** and *italic* text.", 
    {
        TextSize = 13,
        LineHeight = 1.4,
        RichText = true,
        MaxHeight = 300
    }, 
    Color3.fromRGB(30, 30, 30)
)

-- Fluent methods
paragraph:Set("New content")
paragraph:Get()
paragraph:SetColor(Color3.fromRGB(255, 255, 255))
paragraph:SetTextSize(14)
paragraph:SetLineHeight(1.5)
paragraph:SetRichText(true)
paragraph:AddText(" appended text")
paragraph:Clear()
paragraph:SetBackgroundColor(Color3.fromRGB(20, 20, 20))
paragraph:SetMaxHeight(400)
paragraph:AddHeader("Section Title", 1)
paragraph:AddListItem("Bullet point")
paragraph:AddLineBreak()
paragraph:AddSeparator()
paragraph:AddCode("print('Hello World')")
paragraph:AddWarning("This is a warning")
paragraph:AddSuccess("Operation successful")
paragraph:AddError("Something went wrong")
```

#### Label

```lua
local label = tab:Label("Static Text")
label:Set("Updated Text")
label:Get()
```

#### Separator

```lua
tab:Seperator("Section Title")
```

---

### 🔔 Notification System

```lua
-- Basic notification
library:Notify({
    Title = "Success!",
    Content = "Operation completed successfully",
    Duration = 3,
    Type = "success"
})

-- Notification with actions
local notification = library:Notify({
    Title = "Confirm Action",
    Content = "Are you sure?",
    Duration = 5,
    Type = "warning",
    Actions = {
        {
            Name = "Confirm",
            Callback = function()
                print("Confirmed!")
            end
        },
        {
            Name = "Cancel", 
            Callback = function()
                print("Cancelled!")
            end
        }
    }
})

-- Close specific notification
notification:Close()

-- Close all notifications
library:CloseAllNotifications()
```

**Notification Types:**
| Type | Description | Color |
|------|-------------|-------|
| `info` | General information | Blue accent |
| `success` | Successful operation | Green accent |
| `warning` | Warning message | Orange accent |
| `error` | Error message | Red accent |

---

### 🎨 Global Color Configuration

```lua
_G.Color = Color3.fromRGB(59, 130, 246)      -- Primary accent
_G.BGColor = Color3.fromRGB(10, 10, 10)       -- Background
_G.Surface = Color3.fromRGB(23, 23, 23)       -- Surface/element background
_G.Border = Color3.fromRGB(38, 38, 38)        -- Border color
_G.TextPrimary = Color3.fromRGB(248, 250, 252) -- Primary text
_G.TextSecondary = Color3.fromRGB(156, 163, 175) -- Secondary text
_G.Accent = Color3.fromRGB(59, 130, 246)      -- Accent color
```

---

### 🎭 Rich Text Formatting

The library supports Roblox rich text with additional gradient features:

```lua
-- Gradient text in window title
local Window = library:Window("Gradient Title", nil, Enum.KeyCode.RightControl, {
    Color3.fromRGB(59, 130, 246),  -- Blue
    Color3.fromRGB(139, 92, 246),  -- Purple
    Color3.fromRGB(236, 72, 153)   -- Pink
})

-- Gradient backgrounds for paragraphs
paragraph:SetGradient({
    Color3.fromRGB(30, 30, 30),
    Color3.fromRGB(40, 40, 40)
}, 90)
```

**Supported Rich Text Tags:**
- `<b>bold</b>` - Bold text
- `<i>italic</i>` - Italic text
- `<font color="#RRGGBB">color</font>` - Colored text
- `<font size="14">size</font>` - Font size
- `<u>underline</u>` - Underlined text
- `<s>strikethrough</s>` - Strikethrough text

---

## 💡 Complete Example

```lua
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/your-repo/project-wd/main/source.lua"))()

-- Create main window with gradient title
local Window = library:Window("Project WD", nil, Enum.KeyCode.RightControl, {
    Color3.fromRGB(59, 130, 246),
    Color3.fromRGB(139, 92, 246),
    Color3.fromRGB(236, 72, 153)
})

-- Settings Tab
local SettingsTab = Window:Tab("Settings")

-- Toggle example
local enabled = SettingsTab:Toggle("Enable Script", false, function(state)
    if state then
        library:Notify({
            Title = "Script Enabled",
            Content = "The script has been activated",
            Type = "success",
            Duration = 2
        })
    else
        library:Notify({
            Title = "Script Disabled",
            Content = "The script has been deactivated", 
            Type = "warning",
            Duration = 2
        })
    end
end)

-- Slider example
local speed = SettingsTab:Slider("Speed", 1, 100, 50, function(value)
    print("Speed set to:", value)
end)

-- Dropdown example
local mode = SettingsTab:Dropdown("Mode", "Normal", 
    {"Normal", "Advanced", "Expert"}, 
    "single", 
    function(value)
        print("Mode changed to:", value)
    end
)

-- Textbox example
local username = SettingsTab:Textbox("Username", "Enter name...", function(text)
    print("Username set to:", text)
end)

-- Rich text example
SettingsTab:RichParagraph([[
Welcome to <font color="#3B82F6"><b>Project WD</b></font>!

This UI library features:
• <font color="#22C55E">Modern design</font>
• <font color="#F97316">Responsive layouts</font>
• <font color="#A855F7">Rich text support</font>

<font color="#EC489A"><i>Enjoy the smooth experience!</i></font>
]], {
    TextSize = 13,
    LineHeight = 1.4,
    MaxHeight = 250
})

-- Button example
SettingsTab:Button("Show Notification", function()
    library:Notify({
        Title = "Hello!",
        Content = "Thanks for using Project WD!",
        Type = "info",
        Duration = 3
    })
end)

-- About Tab
local AboutTab = Window:Tab("About")

AboutTab:RichParagraph([[
<font size="18"><b>Project WD UI Library</b></font>

<font color="#3B82F6">Version:</font> 1.0.0
<font color="#3B82F6">Framework:</font> shadcn/ui inspired
<font color="#3B82F6">Features:</font> 10+ UI components
<font color="#3B82F6">Performance:</font> Optimized animations

<font size="14"><b>Credits</b></font>
Design inspired by modern UI principles
Created for the Roblox community

<font color="#F59E0B">Join our Discord for updates and support!</font>
]], {
    TextSize = 12,
    LineHeight = 1.5,
    MaxHeight = 400
})
```

---

## 🎯 Best Practices

### 1. **Organize by Tabs**
```lua
local MainTab = Window:Tab("Main")
local SettingsTab = Window:Tab("Settings")
local AboutTab = Window:Tab("About")
```

### 2. **Use Descriptive Labels**
```lua
SettingsTab:Slider("Movement Speed", 0, 100, 50, function(v) end)
SettingsTab:Toggle("Auto Farm", false, function(s) end)
```

### 3. **Handle Callbacks Properly**
```lua
local isEnabled = false
local toggle = SettingsTab:Toggle("Feature", false, function(state)
    isEnabled = state
    if state then
        -- Start feature
        startFeature()
    else
        -- Stop feature
        stopFeature()
    end
end)
```

### 4. **Use Notifications for Feedback**
```lua
button:Button("Save Settings", function()
    saveSettings()
    library:Notify({
        Title = "Settings Saved",
        Content = "Your settings have been saved successfully",
        Type = "success",
        Duration = 2
    })
end)
```

---

## 🔧 Troubleshooting

### Common Issues

**Issue:** UI doesn't appear
- Check if your executor supports CoreGui modifications
- Ensure no conflicting UIs are present (the library auto-cleans)
- Verify the keybind is not already in use

**Issue:** Notifications not showing
- Check if notifications are being blocked by other UI elements
- Ensure the notification container isn't being destroyed
- Verify duration is set to a positive number

**Issue:** Gradient text not working
- Ensure rich text is enabled (`RichText = true`)
- Verify gradient colors are valid Color3 values
- Check that you're using proper HTML color tags

---

## 📝 Notes

- The library automatically cleans up existing Project WD UIs
- Mobile and tablet devices have optimized layouts
- Some executors may require `syn.protect_gui()` for full functionality
- All animations use TweenService for smooth transitions
- The UI is fully responsive and adapts to different screen sizes
- The library includes a notification system with action buttons
- Rich text supports HTML-like formatting tags
- Gradient colors can be applied to both text and backgrounds

---

## 👥 Contributing

Feel free to contribute to the project by:
1. Reporting bugs
2. Suggesting new features
3. Improving documentation
4. Sharing examples

---

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

---

## 🙏 Credits

- Design inspiration: shadcn/ui
- Icons: Roblox built-in assets
- Created for the Roblox exploiting community

---

<div align="center">

**Made with ❤️ for the Roblox Community**

[![Discord](https://img.shields.io/badge/Join_Discord-7289DA?style=for-the-badge&logo=discord&logoColor=white)](https://discord.gg/88gR5XUpkC)

</div>

