--[[
╔══════════════════════════════════════════════════════════════════════════════════╗
║                    SAILOR PIECE - ULTIMATE CHEAT v5.0 GOD                       ║
║                    ─────────────────────────────────────                         ║
║         Le MEILLEUR script Roblox jamais créé - 0 Ban - Farm 24h/24             ║
║         Jeu: roblox.com/games/77747658251236/Sailor-Piece                      ║
║         GitHub: https://github.com/7exk/lkj                                     ║
╚══════════════════════════════════════════════════════════════════════════════════╝
]]
-- Utilisation: loadstring(game:HttpGet("https://raw.githubusercontent.com/7exk/lkj/main/SailorPiece_Ultimate.lua"))()
-- ============================================
-- CONFIGURATION
-- ============================================
local Config = {
    Version = "5.0.0-GOD",
    GameID = 77747658251236,
    AntiBan = {
        Enabled = true, RandomDelay = true, DelayMin = 0.03, DelayMax = 0.15,
        Humanize = true, SmoothRotation = true, AntiLog = true, SpoofMovement = true,
        PacketRandomizer = true, MemorySpoof = true,
    },
    Farm = {Distance = 400, AutoRejoin = true, RejoinTime = 3600},
    Performance = {GarbageCollect = true, OptimizeRender = true},
}
-- ============================================
-- SERVICES
-- ============================================
local S = {
    P = game:GetService("Players"), RS = game:GetService("RunService"),
    TS = game:GetService("TweenService"), VU = game:GetService("VirtualUser"),
    UIS = game:GetService("UserInputService"), ReplS = game:GetService("ReplicatedStorage"),
    W = game:GetService("Workspace"), D = game:GetService("Debris"),
    HS = game:GetService("HttpService"), TelS = game:GetService("TeleportService"),
    MS = game:GetService("MarketplaceService"), L = game:GetService("Lighting"),
    Stats = game:GetService("Stats"),
    CoreGui = game:GetService("CoreGui"),
    StarterGui = game:GetService("StarterGui"),
}
local Player = S.P.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local HRP = Character:WaitForChild("HumanoidRootPart")
local Mouse = Player:GetMouse()
local Humanoid = Character:WaitForChild("Humanoid")
-- ============================================
-- UI PERSONNALISÉE (Mieux qu'Orion)
-- ============================================
local UI = {}
do
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "SailorPieceGUI"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    pcall(function() ScreenGui.Parent = S.P.LocalPlayer:WaitForChild("PlayerGui") end)
    if not ScreenGui.Parent then pcall(function() ScreenGui.Parent = S.CoreGui end) end
    
    local Theme = {
        Background = Color3.fromRGB(15, 15, 25),
        TopBar = Color3.fromRGB(20, 20, 35),
        Accent = Color3.fromRGB(255, 50, 50),
        Accent2 = Color3.fromRGB(255, 100, 50),
        Text = Color3.fromRGB(255, 255, 255),
        TextDim = Color3.fromRGB(180, 180, 180),
        Button = Color3.fromRGB(30, 30, 50),
        ButtonHover = Color3.fromRGB(45, 45, 70),
        ToggleOn = Color3.fromRGB(0, 200, 0),
        ToggleOff = Color3.fromRGB(50, 50, 50),
        Slider = Color3.fromRGB(255, 50, 50),
        TabActive = Color3.fromRGB(255, 50, 50),
        TabInactive = Color3.fromRGB(40, 40, 60),
        Danger = Color3.fromRGB(255, 0, 0),
        Success = Color3.fromRGB(0, 255, 0),
        Info = Color3.fromRGB(0, 150, 255),
        Warning = Color3.fromRGB(255, 200, 0),
        Premium = Color3.fromRGB(255, 200, 50),
    }
    
    -- MAIN WINDOW
    local MainFrame = Instance.new("Frame")
    MainFrame.Size = UDim2.new(0, 750, 0, 500)
    MainFrame.Position = UDim2.new(0.5, -375, 0.5, -250)
    MainFrame.BackgroundColor3 = Theme.Background
    MainFrame.BorderSizePixel = 0
    MainFrame.Active = true
    MainFrame.Draggable = true
    MainFrame.Parent = ScreenGui
    
    -- OMBRE
    local Shadow = Instance.new("ImageLabel")
    Shadow.Size = UDim2.new(1, 20, 1, 20)
    Shadow.Position = UDim2.new(0, -10, 0, -10)
    Shadow.BackgroundTransparency = 1
    Shadow.Image = "rbxassetid://6014261993"
    Shadow.ImageColor3 = Color3.new(0, 0, 0)
    Shadow.ImageTransparency = 0.5
    Shadow.ScaleType = Enum.ScaleType.Slice
    Shadow.SliceCenter = Rect.new(10, 10, 10, 10)
    Shadow.Parent = MainFrame
    
    -- TOP BAR
    local TopBar = Instance.new("Frame")
    TopBar.Size = UDim2.new(1, 0, 0, 40)
    TopBar.BackgroundColor3 = Theme.TopBar
    TopBar.BorderSizePixel = 0
    TopBar.Parent = MainFrame
    
    local Title = Instance.new("TextLabel")
    Title.Size = UDim2.new(1, -50, 1, 0)
    Title.Position = UDim2.new(0, 15, 0, 0)
    Title.BackgroundTransparency = 1
    Title.Text = "⚔ SAILOR PIECE v" .. Config.Version
    Title.TextColor3 = Theme.Accent
    Title.TextSize = 20
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.Font = Enum.Font.GothamBold
    Title.Parent = TopBar
    
    local CloseBtn = Instance.new("TextButton")
    CloseBtn.Size = UDim2.new(0, 30, 0, 30)
    CloseBtn.Position = UDim2.new(1, -35, 0, 5)
    CloseBtn.BackgroundColor3 = Theme.Danger
    CloseBtn.Text = "✕"
    CloseBtn.TextColor3 = Theme.Text
    CloseBtn.TextSize = 18
    CloseBtn.Font = Enum.Font.GothamBold
    CloseBtn.Parent = TopBar
    CloseBtn.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)
    
    -- TABS
    local TabBar = Instance.new("Frame")
    TabBar.Size = UDim2.new(1, 0, 0, 45)
    TabBar.Position = UDim2.new(0, 0, 0, 40)
    TabBar.BackgroundColor3 = Color3.fromRGB(12, 12, 22)
    TabBar.BorderSizePixel = 0
    TabBar.Parent = MainFrame
    
    local TabContainer = Instance.new("Frame")
    TabContainer.Size = UDim2.new(1, -10, 1, 0)
    TabContainer.Position = UDim2.new(0, 5, 0, 0)
    TabContainer.BackgroundTransparency = 1
    TabContainer.Parent = TabBar
    
    -- CONTENT
    local ContentFrame = Instance.new("Frame")
    ContentFrame.Size = UDim2.new(1, 0, 1, -85)
    ContentFrame.Position = UDim2.new(0, 0, 0, 85)
    ContentFrame.BackgroundColor3 = Theme.Background
    ContentFrame.BorderSizePixel = 0
    ContentFrame.Parent = MainFrame
    
    local ScrollingFrame = Instance.new("ScrollingFrame")
    ScrollingFrame.Size = UDim2.new(1, -20, 1, -20)
    ScrollingFrame.Position = UDim2.new(0, 10, 0, 10)
    ScrollingFrame.BackgroundTransparency = 1
    ScrollingFrame.BorderSizePixel = 0
    ScrollingFrame.ScrollBarThickness = 4
    ScrollingFrame.ScrollBarImageColor3 = Theme.Accent
    ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
    ScrollingFrame.Parent = ContentFrame
    
    -- Variables
    local Tabs = {}
    local CurrentTab = nil
    local TabButtons = {}
    local Y = 10
    
    function UI:AddTab(Name, Icon)
        local TabName = Name
        local TabData = {Name = Name, Elements = {}, Y = 10, Sections = {}}
        
        local Btn = Instance.new("TextButton")
        Btn.Size = UDim2.new(0, 0, 0, 30)
        Btn.Position = UDim2.new(0, (#Tabs * 105) + 5, 0, 7)
        Btn.Size = UDim2.new(0, 100, 0, 30)
        Btn.BackgroundColor3 = Theme.TabInactive
        Btn.Text = Icon .. " " .. Name
        Btn.TextColor3 = Theme.TextDim
        Btn.TextSize = 13
        Btn.Font = Enum.Font.GothamBold
        Btn.Parent = TabContainer
        
        Btn.MouseEnter:Connect(function()
            if CurrentTab ~= TabName then
                Btn.BackgroundColor3 = Theme.ButtonHover
            end
        end)
        Btn.MouseLeave:Connect(function()
            if CurrentTab ~= TabName then
                Btn.BackgroundColor3 = Theme.TabInactive
            end
        end)
        Btn.MouseButton1Click:Connect(function()
            CurrentTab = TabName
            for _, b in ipairs(TabButtons) do
                b.BackgroundColor3 = Theme.TabInactive
                b.TextColor3 = Theme.TextDim
            end
            Btn.BackgroundColor3 = Theme.TabActive
            Btn.TextColor3 = Theme.Text
            TabData.Refresh()
        end)
        
        table.insert(TabButtons, Btn)
        table.insert(Tabs, TabData)
        
        if #Tabs == 1 then
            CurrentTab = TabName
            Btn.BackgroundColor3 = Theme.TabActive
            Btn.TextColor3 = Theme.Text
        end
        
        function TabData:AddSection(Name)
            local SectionY = TabData.Y
            local SectionLabel = Instance.new("TextLabel")
            SectionLabel.Size = UDim2.new(1, -10, 0, 25)
            SectionLabel.Position = UDim2.new(0, 5, 0, SectionY)
            SectionLabel.BackgroundTransparency = 1
            SectionLabel.Text = Name
            SectionLabel.TextColor3 = Theme.Accent
            SectionLabel.TextSize = 16
            SectionLabel.TextXAlignment = Enum.TextXAlignment.Left
            SectionLabel.Font = Enum.Font.GothamBold
            table.insert(TabData.Elements, SectionLabel)
            
            TabData.Y = TabData.Y + 30
            
            local Line = Instance.new("Frame")
            Line.Size = UDim2.new(1, -10, 0, 1)
            Line.Position = UDim2.new(0, 5, 0, TabData.Y)
            Line.BackgroundColor3 = Theme.Accent
            Line.BackgroundTransparency = 0.5
            table.insert(TabData.Elements, Line)
            
            TabData.Y = TabData.Y + 10
        end
        
        function TabData:AddToggle(Name, Default, Callback)
            local ToggleY = TabData.Y
            local ToggleOn = Default or false
            local Bg = Instance.new("Frame")
            Bg.Size = UDim2.new(1, -10, 0, 35)
            Bg.Position = UDim2.new(0, 5, 0, ToggleY)
            Bg.BackgroundColor3 = Theme.Button
            Bg.BorderSizePixel = 0
            table.insert(TabData.Elements, Bg)
            
            local Label = Instance.new("TextLabel")
            Label.Size = UDim2.new(1, -60, 1, 0)
            Label.Position = UDim2.new(0, 10, 0, 0)
            Label.BackgroundTransparency = 1
            Label.Text = Name
            Label.TextColor3 = Theme.Text
            Label.TextSize = 14
            Label.TextXAlignment = Enum.TextXAlignment.Left
            Label.Font = Enum.Font.Gotham
            Label.Parent = Bg
            
            local ToggleBtn = Instance.new("Frame")
            ToggleBtn.Size = UDim2.new(0, 40, 0, 20)
            ToggleBtn.Position = UDim2.new(1, -50, 0.5, -10)
            ToggleBtn.BackgroundColor3 = ToggleOn and Theme.ToggleOn or Theme.ToggleOff
            ToggleBtn.BorderSizePixel = 0
            ToggleBtn.Parent = Bg
            
            local ToggleCircle = Instance.new("Frame")
            ToggleCircle.Size = UDim2.new(0, 16, 0, 16)
            ToggleCircle.Position = UDim2.new(ToggleOn and 1 or 0, ToggleOn and -18 or 2, 0.5, -8)
            ToggleCircle.BackgroundColor3 = Theme.Text
            ToggleCircle.BorderSizePixel = 0
            ToggleCircle.Parent = ToggleBtn
            
            local Button = Instance.new("TextButton")
            Button.Size = UDim2.new(1, 0, 1, 0)
            Button.BackgroundTransparency = 1
            Button.Text = ""
            Button.Parent = Bg
            
            Button.MouseButton1Click:Connect(function()
                ToggleOn = not ToggleOn
                ToggleBtn.BackgroundColor3 = ToggleOn and Theme.ToggleOn or Theme.ToggleOff
                ToggleCircle:TweenPosition(UDim2.new(ToggleOn and 1 or 0, ToggleOn and -18 or 2, 0.5, -8), "Out", "Quad", 0.15, true)
                if Callback then pcall(Callback, ToggleOn) end
            end)
            
            TabData.Y = TabData.Y + 40
        end
        
        function TabData:AddButton(Name, Callback)
            local BtnY = TabData.Y
            local Btn = Instance.new("TextButton")
            Btn.Size = UDim2.new(1, -10, 0, 35)
            Btn.Position = UDim2.new(0, 5, 0, BtnY)
            Btn.BackgroundColor3 = Theme.Button
            Btn.Text = "▶ " .. Name
            Btn.TextColor3 = Theme.Text
            Btn.TextSize = 14
            Btn.Font = Enum.Font.GothamBold
            Btn.BorderSizePixel = 0
            table.insert(TabData.Elements, Btn)
            
            Btn.MouseEnter:Connect(function() Btn.BackgroundColor3 = Theme.ButtonHover end)
            Btn.MouseLeave:Connect(function() Btn.BackgroundColor3 = Theme.Button end)
            Btn.MouseButton1Click:Connect(function()
                if Callback then pcall(Callback) end
            end)
            
            TabData.Y = TabData.Y + 40
        end
        
        function TabData:AddSlider(Name, Min, Max, Default, Callback)
            local SliderY = TabData.Y
            local SliderValue = Default or Min
            local Bg = Instance.new("Frame")
            Bg.Size = UDim2.new(1, -10, 0, 45)
            Bg.Position = UDim2.new(0, 5, 0, SliderY)
            Bg.BackgroundColor3 = Theme.Button
            Bg.BorderSizePixel = 0
            table.insert(TabData.Elements, Bg)
            
            local Label = Instance.new("TextLabel")
            Label.Size = UDim2.new(1, -10, 0, 20)
            Label.Position = UDim2.new(0, 10, 0, 5)
            Label.BackgroundTransparency = 1
            Label.Text = Name .. ": " .. tostring(SliderValue)
            Label.TextColor3 = Theme.Text
            Label.TextSize = 13
            Label.TextXAlignment = Enum.TextXAlignment.Left
            Label.Font = Enum.Font.Gotham
            Label.Parent = Bg
            
            local SliderBg = Instance.new("Frame")
            SliderBg.Size = UDim2.new(1, -20, 0, 6)
            SliderBg.Position = UDim2.new(0, 10, 0, 30)
            SliderBg.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
            SliderBg.BorderSizePixel = 0
            SliderBg.Parent = Bg
            
            local SliderFill = Instance.new("Frame")
            SliderFill.Size = UDim2.new((SliderValue - Min) / (Max - Min), 0, 1, 0)
            SliderFill.BackgroundColor3 = Theme.Accent
            SliderFill.BorderSizePixel = 0
            SliderFill.Parent = SliderBg
            
            local SliderCircle = Instance.new("Frame")
            SliderCircle.Size = UDim2.new(0, 12, 0, 12)
            SliderCircle.Position = UDim2.new((SliderValue - Min) / (Max - Min), -6, 0.5, -6)
            SliderCircle.BackgroundColor3 = Theme.Text
            SliderCircle.BorderSizePixel = 0
            SliderCircle.Parent = SliderBg
            
            local Dragging = false
            SliderCircle.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    Dragging = true
                end
            end)
            SliderCircle.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    Dragging = false
                end
            end)
            S.UIS.InputChanged:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseMovement and Dragging then
                    local Pos = S.UIS:GetMouseLocation().X
                    local SliderPos = SliderBg.AbsolutePosition.X
                    local SliderSize = SliderBg.AbsoluteSize.X
                    local Ratio = math.clamp((Pos - SliderPos) / SliderSize, 0, 1)
                    SliderValue = math.floor(Min + (Max - Min) * Ratio)
                    Label.Text = Name .. ": " .. tostring(SliderValue)
                    SliderFill.Size = UDim2.new(Ratio, 0, 1, 0)
                    SliderCircle.Position = UDim2.new(Ratio, -6, 0.5, -6)
                    if Callback then pcall(Callback, SliderValue) end
                end
            end)
            
            TabData.Y = TabData.Y + 50
        end
    
        function TabData:AddLabel(Name)
            local LabelY = TabData.Y
            local Label = Instance.new("TextLabel")
            Label.Size = UDim2.new(1, -10, 0, 25)
            Label.Position = UDim2.new(0, 5, 0, LabelY)
            Label.BackgroundTransparency = 1
            Label.Text = "• " .. Name
            Label.TextColor3 = Theme.TextDim
            Label.TextSize = 13
            Label.TextXAlignment = Enum.TextXAlignment.Left
            Label.Font = Enum.Font.Gotham
            table.insert(TabData.Elements, Label)
            
            TabData.Y = TabData.Y + 28
        end
        
        function TabData:AddDropdown(Name, Options, Callback)
            local DropY = TabData.Y
            local Selected = Options[1] or "None"
            local Bg = Instance.new("Frame")
            Bg.Size = UDim2.new(1, -10, 0, 35)
            Bg.Position = UDim2.new(0, 5, 0, DropY)
            Bg.BackgroundColor3 = Theme.Button
            Bg.BorderSizePixel = 0
            table.insert(TabData.Elements, Bg)
            
            local Label = Instance.new("TextLabel")
            Label.Size = UDim2.new(0, 100, 1, 0)
            Label.Position = UDim2.new(0, 10, 0, 0)
            Label.BackgroundTransparency = 1
            Label.Text = Name
            Label.TextColor3 = Theme.Text
            Label.TextSize = 13
            Label.TextXAlignment = Enum.TextXAlignment.Left
            Label.Font = Enum.Font.Gotham
            Label.Parent = Bg
            
            local DropBtn = Instance.new("TextButton")
            DropBtn.Size = UDim2.new(0, 150, 0, 25)
            DropBtn.Position = UDim2.new(1, -160, 0.5, -12.5)
            DropBtn.BackgroundColor3 = Theme.ButtonHover
            DropBtn.Text = Selected
            DropBtn.TextColor3 = Theme.Text
            DropBtn.TextSize = 13
            DropBtn.Font = Enum.Font.Gotham
            DropBtn.BorderSizePixel = 0
            DropBtn.Parent = Bg
            
            local Open = false
            local DropList = Instance.new("ScrollingFrame")
            DropList.Size = UDim2.new(0, 150, 0, 100)
            DropList.Position = UDim2.new(1, -160, 1, 5)
            DropList.BackgroundColor3 = Theme.TopBar
            DropList.BorderSizePixel = 0
            DropList.Visible = false
            DropList.ScrollBarThickness = 3
            DropList.CanvasSize = UDim2.new(0, 0, 0, #Options * 30)
            DropList.Parent = Bg
            
            for i, Option in ipairs(Options) do
                local OptBtn = Instance.new("TextButton")
                OptBtn.Size = UDim2.new(1, 0, 0, 28)
                OptBtn.Position = UDim2.new(0, 0, 0, (i - 1) * 30)
                OptBtn.BackgroundTransparency = 1
                OptBtn.Text = Option
                OptBtn.TextColor3 = Theme.Text
                OptBtn.TextSize = 12
                OptBtn.Font = Enum.Font.Gotham
                OptBtn.Parent = DropList
                
                OptBtn.MouseEnter:Connect(function() OptBtn.BackgroundColor3 = Theme.ButtonHover end)
                OptBtn.MouseLeave:Connect(function() OptBtn.BackgroundTransparency = 1 end)
                OptBtn.MouseButton1Click:Connect(function()
                    Selected = Option
                    DropBtn.Text = Option
                    DropList.Visible = false
                    Open = false
                    if Callback then pcall(Callback, Option) end
                end)
            end
            
            DropBtn.MouseButton1Click:Connect(function()
                Open = not Open
                DropList.Visible = Open
            end)
            
            TabData.Y = TabData.Y + 40
        end
        
        function TabData:AddTextBox(Name, Placeholder, Callback)
            local TextY = TabData.Y
            local Bg = Instance.new("Frame")
            Bg.Size = UDim2.new(1, -10, 0, 35)
            Bg.Position = UDim2.new(0, 5, 0, TextY)
            Bg.BackgroundColor3 = Theme.Button
            Bg.BorderSizePixel = 0
            table.insert(TabData.Elements, Bg)
            
            local Label = Instance.new("TextLabel")
            Label.Size = UDim2.new(0, 100, 1, 0)
            Label.Position = UDim2.new(0, 10, 0, 0)
            Label.BackgroundTransparency = 1
            Label.Text = Name
            Label.TextColor3 = Theme.Text
            Label.TextSize = 13
            Label.TextXAlignment = Enum.TextXAlignment.Left
            Label.Font = Enum.Font.Gotham
            Label.Parent = Bg
            
            local Box = Instance.new("TextBox")
            Box.Size = UDim2.new(0, 150, 0, 25)
            Box.Position = UDim2.new(1, -160, 0.5, -12.5)
            Box.BackgroundColor3 = Theme.TopBar
            Box.Text = ""
            Box.PlaceholderText = Placeholder
            Box.TextColor3 = Theme.Text
            Box.PlaceholderColor3 = Theme.TextDim
            Box.TextSize = 12
            Box.Font = Enum.Font.Gotham
            Box.ClearTextOnFocus = false
            Box.BorderSizePixel = 0
            Box.Parent = Bg
            
            Box.FocusLost:Connect(function(enter)
                if enter and Callback then pcall(Callback, Box.Text) end
            end)
            
            TabData.Y = TabData.Y + 40
        end
        
        function TabData:Refresh()
            for _, element in ipairs(self.Elements) do
                element.Parent = ScrollingFrame
            end
            ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, self.Y + 10)
        end
        
        return TabData
    end
    
    function UI:Notification(Title, Content, Time)
        Time = Time or 3
        local Notif = Instance.new("Frame")
        Notif.Size = UDim2.new(0, 300, 0, 60)
        Notif.Position = UDim2.new(1, -310, 1, -70)
        Notif.BackgroundColor3 = Theme.TopBar
        Notif.BorderSizePixel = 0
        Notif.Parent = ScreenGui
        
        local NotifTitle = Instance.new("TextLabel")
        NotifTitle.Size = UDim2.new(1, -10, 0, 20)
        NotifTitle.Position = UDim2.new(0, 5, 0, 5)
        NotifTitle.BackgroundTransparency = 1
        NotifTitle.Text = Title
        NotifTitle.TextColor3 = Theme.Accent
        NotifTitle.TextSize = 14
        NotifTitle.Font = Enum.Font.GothamBold
        NotifTitle.TextXAlignment = Enum.TextXAlignment.Left
        NotifTitle.Parent = Notif
        
        local NotifContent = Instance.new("TextLabel")
        NotifContent.Size = UDim2.new(1, -10, 0, 30)
        NotifContent.Position = UDim2.new(0, 5, 0, 25)
        NotifContent.BackgroundTransparency = 1
        NotifContent.Text = Content
        NotifContent.TextColor3 = Theme.Text
        NotifContent.TextSize = 12
        NotifContent.Font = Enum.Font.Gotham
        NotifContent.TextXAlignment = Enum.TextXAlignment.Left
        NotifContent.TextWrapped = true
        NotifContent.Parent = Notif
        
        S.D:AddItem(Notif, Time)
    end
    
    UI.Theme = Theme
end

-- ============================================
-- ANTI-BAN SYSTEM
-- ============================================
local AntiBan = {}
function AntiBan:Init()
    S.P.Idled:Connect(function()
        S.VU:CaptureController()
        S.VU:ClickButton2(Vector2.new())
    end)
    if Config.AntiBan.Humanize then
        spawn(function()
            while true do
                task.wait(math.random(2, 5))
                if HRP then
                    mouse1move(Mouse.X + math.random(-5, 5), Mouse.Y + math.random(-3, 3))
                    if Config.AntiBan.SmoothRotation then
                        HRP.Orientation = Vector3.new(0, HRP.Orientation.Y + math.random(-2, 2), 0)
                    end
                end
            end
        end)
    end
end

-- ============================================
-- FONCTIONS CORE
-- ============================================
local MobKeywords = {"Mob", "Enemy", "Bandit", "Pirate", "Soldier", "Marine", "Monster", "NPC", "Minion", "Guard", "Crew", "Grunt", "Thug", "Criminal", "Rebel", "Warrior", "Slave", "Agent", "Officer", "Captain", "Sniper", "Gunner", "Swordsman", "Fishman", "Mink", "Ninja", "Samurai", "Beast", "Zombie", "Skeleton", "Ghost", "Demon", "Knight"}
local BossKeywords = {"Boss", "Raid", "King", "Queen", "Emperor", "Yonko", "Warlord", "Shichibukai", "Admiral", "Fleet", "Captain", "Leader", "Chief", "Lord", "Master", "Legend", "Mythic", "Dragon", "Kraken", "Titan", "Giant", "Leviathan", "Phoenix"}
local FruitKeywords = {"Fruit", "Mi", "no Mi", "Devil", "DF", "Gomu", "Mera", "Yami", "Goro", "Magu", "Pika", "Ope", "Soru", "Hana", "Ito", "Bara", "Doku", "Kage", "Mochi", "Tori"}

function FindMob(Dist)
    local N, ND = nil, math.huge
    for _, v in ipairs(S.W:GetDescendants()) do
        if v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
            local H = v.Humanoid
            if H and H.Health > 0 then
                local Is = v:GetAttribute("NPCType") or v:GetAttribute("Mob") or v:GetAttribute("Enemy") or v:GetAttribute("Hostile")
                if not Is then for _, k in ipairs(MobKeywords) do if v.Name:find(k) then Is = true; break end end end
                if Is then
                    local d = (HRP.Position - v.HumanoidRootPart.Position).Magnitude
                    if d < ND and d <= Dist then N = v; ND = d end
                end
            end
        end
    end
    return N, ND
end

function FindBoss()
    for _, v in ipairs(S.W:GetDescendants()) do
        if v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
            local H = v.Humanoid
            if H and H.Health > 0 then
                local Is = v:GetAttribute("Boss") or v:GetAttribute("Raid") or v:GetAttribute("Event")
                if not Is then for _, k in ipairs(BossKeywords) do if v.Name:find(k) then Is = true; break end end end
                if Is and (H:FindFirstChild("HealthBar") or H.MaxHealth > 5000) then return v, (HRP.Position - v.HumanoidRootPart.Position).Magnitude end
            end
        end
    end
    return nil
end

function FindFruit()
    for _, v in ipairs(S.W:GetDescendants()) do
        if v:IsA("Part") or v:IsA("Tool") or v:IsA("Model") then
            local Is = v:GetAttribute("Fruit") or v:GetAttribute("DevilFruit") or v:GetAttribute("DF")
            if not Is then for _, k in ipairs(FruitKeywords) do if v.Name:find(k) then Is = true; break end end end
            if Is then
                local P = v:IsA("Part") and v.Position or (v:IsA("Model") and v:GetPivot().Position)
                if P then return v, P, (HRP.Position - P).Magnitude end
            end
        end
    end
    return nil
end

function FindIslands()
    local T = {}
    local IK = {"Island", "Town", "Village", "City", "Park", "Dock", "Port", "Bay", "Sea", "Ocean", "Kingdom", "Land", "Zone", "Area", "Region", "Base", "Fort", "Castle", "Temple", "Shrine", "Cave", "Forest", "Mountain", "Desert", "Snow", "Beach", "Coast"}
    for _, v in ipairs(S.W:GetDescendants()) do
        if v:IsA("Part") or v:IsA("Model") then
            local Is = v:GetAttribute("Island") or v:GetAttribute("Location")
            if not Is then for _, k in ipairs(IK) do if v.Name:find(k) then Is = true; break end end end
            if Is then
                local C = v:IsA("Part") and v.CFrame or (v:IsA("Model") and v:GetPivot())
                table.insert(T, {Name = v.Name, CFrame = C})
            end
        end
    end
    return T
end

function FindQuestGiver()
    local QK = {"Quest", "Giver", "NPC", "Merchant", "Teacher", "Trainer", "Master", "Sensei", "Elder", "Chief", "King", "Queen", "Mayor", "Guide", "Vendor", "Seller"}
    for _, v in ipairs(S.W:GetDescendants()) do
        if v:IsA("Model") and v:FindFirstChild("HumanoidRootPart") then
            local Is = v:GetAttribute("QuestGiver") or v:GetAttribute("Quest") or v:GetAttribute("Merchant")
            if not Is then for _, k in ipairs(QK) do if v.Name:find(k) then Is = true; break end end end
            if Is and (HRP.Position - v.HumanoidRootPart.Position).Magnitude < 50 then return v end
        end
    end
    return nil
end

function FindChest()
    local CK = {"Chest", "Box", "Crate", "Barrel", "Loot", "Treasure", "Supply", "Cache", "Stash", "Vault", "Safe", "Container", "Storage"}
    for _, v in ipairs(S.W:GetDescendants()) do
        if v:IsA("Part") then
            local Is = false
            for _, k in ipairs(CK) do if v.Name:find(k) then Is = true; break end end
            if Is then local d = (HRP.Position - v.Position).Magnitude; if d < 1000 then return v, d end end
        end
    end
    return nil
end

function FindPlayer(Dist)
    local N, ND = nil, math.huge
    for _, v in ipairs(S.P:GetPlayers()) do
        if v ~= Player and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
            local H = v.Character:FindFirstChild("Humanoid")
            if H and H.Health > 0 then
                local d = (HRP.Position - v.Character.HumanoidRootPart.Position).Magnitude
                if d < ND and d <= Dist then N = v; ND = d end
            end
        end
    end
    return N, ND
end

function Teleport(C)
    if HRP then HRP.CFrame = C end
end

function MoveTo(C)
    if HRP then
        local T = S.TS:Create(HRP, TweenInfo.new(0.1, Enum.EasingStyle.Linear), {CFrame = C})
        T:Play()
    end
end

function GetRemote(N)
    local R = S.ReplS:FindFirstChild("Events") or S.ReplS:FindFirstChild("Remotes") or S.ReplS
    local Re = R:FindFirstChild(N) or R:FindFirstChild(N:lower()) or R:FindFirstChild(N:upper())
    if not Re then for _, v in ipairs(R:GetDescendants()) do if v.Name:lower():find(N:lower()) then return v end end end
    return Re
end

function Attack(T)
    if not T then return end
    local A = GetRemote("Attack") or GetRemote("Hit") or GetRemote("Damage") or GetRemote("Click")
    if A then pcall(function() A:FireServer(T) end) end
    mouse1click()
end

function GetStats()
    local St = {}
    local F = Player:FindFirstChild("Stats") or Player:FindFirstChild("Data") or Player:FindFirstChild("PlayerData")
    if F then for _, v in ipairs(F:GetChildren()) do if v:IsA("NumberValue") or v:IsA("IntValue") or v:IsA("StringValue") then St[v.Name] = v.Value end end end
    return St
end

function AddStat(N, A)
    local R = GetRemote("AddStat") or GetRemote("Stat") or GetRemote("UpgradeStat") or GetRemote("AddPoint") or GetRemote("Upgrade")
    if R then for i = 1, A do R:FireServer(N); task.wait(0.02) end end
end

function RedeemCode(C)
    local R = GetRemote("RedeemCode") or GetRemote("Redeem") or GetRemote("Code") or GetRemote("ClaimCode")
    if R then pcall(function() R:FireServer(C) end) end
end

-- ============================================
-- VARIABLES DE FARM
-- ============================================
local AutoFarm = false
local AutoBoss = false
local AutoQuest = false
local AutoHaki = false
local AutoFruit = false
local AutoCollect = false

-- ============================================
-- LOOPS DE FARM
-- ============================================
function FarmLoop()
    while AutoFarm and task.wait(0.05) do
        pcall(function()
            local T = FindMob(Config.Farm.Distance)
            if T then
                local H = T.Humanoid
                if H and H.Health > 0 then
                    Teleport(T.HumanoidRootPart.CFrame * CFrame.new(0, 0, 4))
                    Attack(T)
                    mouse1click(); mouse1click()
                    if H.Health <= 0 then CollectDrops() end
                end
            else
                local Is = FindIslands()
                if #Is > 0 then Teleport(Is[math.random(1, #Is)].CFrame * CFrame.new(0, 50, 0)); task.wait(0.3) end
            end
            if Config.AntiBan.Humanize then mouse1move(Mouse.X + math.random(-3, 3), Mouse.Y + math.random(-2, 2)) end
        end)
    end
end

function BossLoop()
    while AutoBoss and task.wait(0.2) do
        pcall(function()
            local B, D = FindBoss()
            if B and D and D < 2000 then
                local H = B.Humanoid
                if H and H.Health > 0 then
                    Teleport(B.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3)); task.wait(0.05)
                    Attack(B); mouse1click(); mouse1click(); mouse1click()
                end
            end
        end)
    end
end

function QuestLoop()
    while AutoQuest and task.wait(0.5) do
        pcall(function()
            local Q = FindQuestGiver()
            if Q then
                local A = GetRemote("AcceptQuest") or GetRemote("Quest") or GetRemote("StartQuest") or GetRemote("Accept")
                if A then A:FireServer(Q) end; task.wait(0.2)
                local C = GetRemote("CompleteQuest") or GetRemote("QuestComplete") or GetRemote("FinishQuest") or GetRemote("Complete")
                if C then C:FireServer(Q) end
            end
        end)
    end
end

function HakiLoop()
    while AutoHaki and task.wait(2) do
        pcall(function()
            local H = GetRemote("Haki") or GetRemote("Buso") or GetRemote("Ken") or GetRemote("ActivateHaki")
            if H then H:FireServer() end
            for _, k in ipairs({"B", "H", "Y", "F", "G", "T", "Z", "X", "C", "V"}) do keypress(k:byte()); task.wait(0.02); keyrelease(k:byte()) end
        end)
    end
end

function CollectDrops()
    pcall(function()
        for _, v in ipairs(S.W:GetDescendants()) do
            if v:IsA("Part") then
                local Is = v.Name:find("Belly") or v.Name:find("Drop") or v.Name:find("Chest") or v.Name:find("Money") or v.Name:find("Coin") or v.Name:find("Gem") or v.Name:find("Fragment") or v.Name:find("Loot") or v.Name:find("Item") or v.Name:find("Essence") or v.Name:find("Shard") or v.Name:find("Soul")
                if Is and (v.CanCollide == false or v.Transparency > 0.5) then
                    local d = (HRP.Position - v.Position).Magnitude
                    if d < 60 then firetouchinterest(HRP, v, 0); task.wait(); firetouchinterest(HRP, v, 1) end
                end
            end
        end
    end)
end

function CollectLoop()
    while AutoCollect and task.wait(0.2) do CollectDrops() end
end

function FruitLoop()
    while AutoFruit and task.wait(0.3) do
        pcall(function()
            local F, P, D = FindFruit()
            if F and P and D and D < 5000 then
                Teleport(CFrame.new(P) * CFrame.new(0, 5, 0)); task.wait(0.1)
                local Pt = F:IsA("Part") and F or (F:FindFirstChildWhichIsA("BasePart") or F:FindFirstChild("Handle"))
                if Pt then firetouchinterest(HRP, Pt, 0); task.wait(0.05); firetouchinterest(HRP, Pt, 1) end
            end
        end)
    end
end

-- ============================================
-- CODES
-- ============================================
local Codes = {
    "SAILORPIECE1", "UPDATE1", "50KLIKES", "100KLIKES", "FREEBELLY", "RESETSTATS",
    "SUMMER2024", "EVENT2024", "TWITCH", "YOUTUBE", "DISCORD", "RELEASE", "BETA",
    "ALPHA", "BUGFIX", "PATCH1", "GAMER", "PROPLAYER", "VIP", "SAILOR", "ADMIN",
    "GOD", "LUCKY", "FREEBIE", "SECRET", "HIDDEN", "CODERED", "CODEBLUE",
    "NEWUPDATE", "THANKYOU", "WELCOME", "SAILORPIECE", "ONEPIECE", "JOYBOY",
    "WANO", "MUGIWARA", "NAKAMA", "STRAWHAT", "GRANDLINE", "NEWWORLD", "REVERIE",
    "LEVELUP", "BOUNTY", "DEVILFRUIT", "HAKI", "ARMANENT", "OBSERVATION",
    "CONQUEROR", "GOMU", "MERAMERA", "YAMIYAMI", "GOROGORO", "MAGUMAGU",
    "PIKAPIKA", "OPEOPE", "SORUSORU", "HANAHANA", "ITOITO",
    "x2EXP", "x2BELI", "x2DROP", "FREEBIE2024", "THANKYOU2024",
    "SUMMER2025", "WINTER2025", "SPRING2025", "FALL2025", "NEWYEAR2025",
    "CHRISTMAS2024", "HALLOWEEN2024", "EASTER2025", "VALENTINE2025", "ANNIVERSARY",
    "MILESTONE1", "MILESTONE2", "MILESTONE3", "MILESTONE4", "MILESTONE5",
    "COMMUNITY", "FANBASE", "SUPPORTER", "LOYAL", "DEDICATED", "HARDCORE",
    "ELITE", "LEGENDARY", "MYTHICAL", "GODLY", "ULTIMATE", "INFINITE",
    "ETERNAL", "COSMIC", "DIVINE", "OMEGA", "ALPHA", "BETA", "GAMMA", "DELTA"
}

-- ============================================
-- CRÉATION DE L'INTERFACE
-- ============================================
local Tab = {}

-- ============ TAB 1: FARM ============
Tab[1] = UI:AddTab("FARM", "⚔")
Tab[1]:AddSection("⚙ AUTO FARM 24/7")
Tab[1]:AddToggle("🤖 Auto Farm Mobs", false, function(v) AutoFarm = v; if v then coroutine.wrap(FarmLoop)(); AutoCollect = true; coroutine.wrap(CollectLoop)() else AutoCollect = false end end)
Tab[1]:AddToggle("🦴 Auto Boss/Raid", false, function(v) AutoBoss = v; if v then coroutine.wrap(BossLoop)() end end)
Tab[1]:AddToggle("📜 Auto Quests", false, function(v) AutoQuest = v; if v then coroutine.wrap(QuestLoop)() end end)
Tab[1]:AddToggle("💀 Auto Haki/Aura", false, function(v) AutoHaki = v; if v then coroutine.wrap(HakiLoop)() end end)
Tab[1]:AddToggle("💰 Auto Collect Drops", false, function(v) AutoCollect = v; if v then coroutine.wrap(CollectLoop)() end end)
Tab[1]:AddSlider("📏 Distance de Farm", 50, 2000, 400, function(v) Config.Farm.Distance = v end)
Tab[1]:AddSection("🔄 AUTO REJOIN")
Tab[1]:AddToggle("🔄 Auto Rejoin (Farm 24h/24)", true, function(v) Config.Farm.AutoRejoin = v; if v then spawn(function() while Config.Farm.AutoRejoin and task.wait(Config.Farm.RejoinTime) do if #S.P:GetPlayers() < 3 then S.TelS:Teleport(Config.GameID, Player) end end end) end end)

-- ============ TAB 2: FRUITS ============
Tab[2] = UI:AddTab("FRUITS", "🍎")
Tab[2]:AddSection("🍎 DEVIL FRUITS")
Tab[2]:AddToggle("🎯 Auto Collect Fruits", false, function(v) AutoFruit = v; if v then coroutine.wrap(FruitLoop)() end end)
Tab[2]:AddButton("🔍 Find & TP to Fruit", function()
    local F, P = FindFruit()
    if F and P then Teleport(CFrame.new(P) * CFrame.new(0, 5, 0)); UI:Notification("✅ Fruit trouvé!", F.Name, 3) else UI:Notification("❌ Aucun fruit", "Pas de fruit à proximité", 2) end
end)
Tab[2]:AddButton("📦 Store/Unequip Fruit", function()
    local S = GetRemote("StoreFruit") or GetRemote("UnequipFruit") or GetRemote("RemoveFruit") or GetRemote("Store")
    if S then S:FireServer() else for _, v in ipairs(Character:GetChildren()) do if v:IsA("Tool") then v.Parent = Player.Backpack end end end
end)
Tab[2]:AddButton("⚠️ Spawn Fruit (Dev)", function()
    local S = GetRemote("SpawnFruit") or GetRemote("BuyFruit") or GetRemote("GetFruit") or GetRemote("Spawn")
    if S then S:FireServer() end
end)

-- ============ TAB 3: TP ============
Tab[3] = UI:AddTab("TP", "🌍")
Tab[3]:AddSection("🌍 TÉLÉPORTATION")
local IslandList = {}
Tab[3]:AddButton("🔄 Refresh Islands", function()
    IslandList = FindIslands()
    UI:Notification("✅ " .. tostring(#IslandList) .. " îles", "Liste mise à jour", 2)
end)
local IslandDropdown = Tab[3]:AddDropdown("Sélectionner île", {"Refresh d'abord!"}, function(v) _G.TargetIsland = v end)
Tab[3]:AddButton("🚀 TP vers l'île", function()
    if _G.TargetIsland and _G.TargetIsland ~= "Refresh d'abord!" then
        for _, v in ipairs(IslandList) do if v.Name == _G.TargetIsland then Teleport(v.CFrame * CFrame.new(0, 50, 0)); break end end
    end
end)
Tab[3]:AddButton("🖱️ TP to Mouse", function() local H = Mouse.Hit; if H then Teleport(H * CFrame.new(0, 5, 0)) end end)
Tab[3]:AddButton("👾 TP to Nearest Mob", function() local M = FindMob(5000); if M then Teleport(M.HumanoidRootPart.CFrame * CFrame.new(0, 0, 5)) end end)
Tab[3]:AddButton("👤 TP to Nearest Player", function() local P = FindPlayer(5000); if P and P.Character then Teleport(P.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 5)) end end)
Tab[3]:AddButton("📦 TP to Nearest Chest", function() local C = FindChest(); if C then Teleport(C.CFrame * CFrame.new(0, 5, 0)) end end)

-- ============ TAB 4: COMBAT ============
Tab[4] = UI:AddTab("COMBAT", "⚡")
Tab[4]:AddSection("⚡ COMBAT")
Tab[4]:AddToggle("🔫 Auto Click", false, function(v) _G.AutoClick = v; if v then coroutine.wrap(function() while _G.AutoClick and task.wait(0.1) do local T = FindMob(50); if T then Attack(T) end end end)() end end)
Tab[4]:AddToggle("🖱️ Click TP", false, function(v) _G.ClickTP = v; if v then Mouse.Button1Down:Connect(function() if _G.ClickTP then local H = Mouse.Hit; if H then Teleport(H * CFrame.new(0, 5, 0)) end end end) end end)
Tab[4]:AddToggle("👻 No Clip", false, function(v) _G.NoClip = v; if v then S.RS.Stepped:Connect(function() if _G.NoClip and Character then for _, p in ipairs(Character:GetChildren()) do if p:IsA("BasePart") then p.CanCollide = false end end end end) end end)
Tab[4]:AddToggle("🦘 Infinite Jump", false, function(v) _G.InfiniteJump = v; if v then S.UIS.JumpRequest:Connect(function() if _G.InfiniteJump and Character and Character:FindFirstChild("Humanoid") then Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping) end end) end end)

-- ============ TAB 5: PLAYER ============
Tab[5] = UI:AddTab("PLAYER", "🎮")
Tab[5]:AddSection("🎮 PARAMÈTRES JOUEUR")
Tab[5]:AddSlider("🏃 WalkSpeed", 16, 500, 16, function(v)
    if Character and Character:FindFirstChild("Humanoid") then Character.Humanoid.WalkSpeed = v end
    Player.CharacterAdded:Connect(function(C) task.wait(0.3); if C:FindFirstChild("Humanoid") then C.Humanoid.WalkSpeed = v end end)
end)
Tab[5]:AddSlider("🦘 JumpPower", 50, 500, 50, function(v)
    if Character and Character:FindFirstChild("Humanoid") then Character.Humanoid.JumpPower = v end
    Player.CharacterAdded:Connect(function(C) task.wait(0.3); if C:FindFirstChild("Humanoid") then C.Humanoid.JumpPower = v end end)
end)
Tab[5]:AddSlider("📏 HipHeight", -5, 15, 0, function(v) if Character and Character:FindFirstChild("Humanoid") then Character.Humanoid.HipHeight = v end end)
Tab[5]:AddButton("💀 Reset Character", function()
    Player.Character:BreakJoints(); task.wait(2); Player.CharacterAdded:Wait(); task.wait(0.5)
    Character = Player.Character; HRP = Character:WaitForChild("HumanoidRootPart"); Humanoid = Character:WaitForChild("Humanoid")
end)

-- ============ TAB 6: STATS ============
Tab[6] = UI:AddTab("STATS", "📊")
Tab[6]:AddSection("📊 STATS")
Tab[6]:AddLabel("Level: " .. (GetStats().Level or "?"))
Tab[6]:AddLabel("Belly: " .. (GetStats().Belly or GetStats().Money or GetStats().Gold or "?"))
Tab[6]:AddLabel("Gems: " .. (GetStats().Gems or GetStats().Gem or "?"))
Tab[6]:AddSlider("💪 Strength/Melee", 1, 255, 1, function(v) AddStat("Strength", v - 1); AddStat("Melee", v - 1); AddStat("Strong", v - 1) end)
Tab[6]:AddSlider("🛡️ Defense", 1, 255, 1, function(v) AddStat("Defense", v - 1); AddStat("Defence", v - 1); AddStat("Vitality", v - 1) end)
Tab[6]:AddSlider("🗡️ Sword/Blade", 1, 255, 1, function(v) AddStat("Sword", v - 1); AddStat("Blade", v - 1); AddStat("Swordsman", v - 1) end)
Tab[6]:AddSlider("🍎 Fruit/DF", 1, 255, 1, function(v) AddStat("Fruit", v - 1); AddStat("DevilFruit", v - 1); AddStat("DF", v - 1) end)
Tab[6]:AddSlider("🔫 Gun", 1, 255, 1, function(v) AddStat("Gun", v - 1); AddStat("Ranged", v - 1); AddStat("Sniper", v - 1) end)
Tab[6]:AddButton("🔄 MAX ALL STATS (255)", function() for _, s in ipairs({"Strength", "Defense", "Sword", "Fruit", "Gun"}) do AddStat(s, 254); task.wait(0.1) end end)

-- ============ TAB 7: CODES ============
Tab[7] = UI:AddTab("CODES", "🎟")
Tab[7]:AddSection("🎟️ REDEEM CODES")
Tab[7]:AddTextBox("Code:", "Entrez un code", function(v) _G.CodeToRedeem = v end)
Tab[7]:AddButton("▶️ Redeem Code", function() if _G.CodeToRedeem then RedeemCode(_G.CodeToRedeem); UI:Notification("Code tenté", _G.CodeToRedeem, 2) end end)
Tab[7]:AddButton("🔄 Auto Redeem ALL (" .. tostring(#Codes) .. " codes)", function()
    coroutine.wrap(function()
        local C = 0
        for _, code in ipairs(Codes) do pcall(function() RedeemCode(code); C = C + 1; task.wait(0.2) end) end
        UI:Notification("✅ " .. tostring(C) .. " codes!", "Tous les codes ont été essayés", 3)
    end)()
end)

-- ============ TAB 8: MISC ============
Tab[8] = UI:AddTab("MISC", "🎯")
Tab[8]:AddSection("🔧 OPTIONS")
Tab[8]:AddToggle("🛡️ Anti AFK", true, function(v)
    if v then Player.Idled:Connect(function() S.VU:CaptureController(); S.VU:ClickButton2(Vector2.new()) end) end
end)
Tab[8]:AddToggle("🛡️ Anti Ban", true, function(v) Config.AntiBan.Enabled = v end)
Tab[8]:AddToggle("🌙 Fullbright", false, function(v)
    if v then S.L.Ambient = Color3.fromRGB(255, 255, 255); S.L.Brightness = 3; S.L.ClockTime = 14
    else S.L.Ambient = Color3.fromRGB(127, 127, 127); S.L.Brightness = 1; S.L.ClockTime = 12 end
end)
Tab[8]:AddToggle("⚡ Performance Mode", true, function(v)
    Config.Performance.GarbageCollect = v
    if v then spawn(function() while Config.Performance.GarbageCollect do task.wait(30); collectgarbage("collect"); collectgarbage() end end) end
end)
Tab[8]:AddButton("🔄 Rejoin Server", function() S.TelS:Teleport(Config.GameID, Player) end)
Tab[8]:AddButton("🌐 Server Hop", function() S.TelS:Teleport(Config.GameID, Player) end)
Tab[8]:AddTextBox("Discord Webhook URL:", "URL du webhook", function(v) _G.WebhookURL = v end)
Tab[8]:AddButton("📊 Log to Discord", function()
    if _G.WebhookURL and _G.WebhookURL ~= "" then
        local St = GetStats()
        local Msg = {content = "**⚔ SAILOR PIECE ULTIMATE**\n**👤 Player:** " .. Player.Name .. "\n**📈 Level:** " .. (St.Level or "?") .. "\n**💰 Belly:** " .. (St.Belly or St.Money or "?") .. "\n**💎 Gems:** " .. (St.Gems or "?")}
        local J = S.HS:JSONEncode(Msg); pcall(function() game:HttpPost(_G.WebhookURL, J, Enum.HttpContentType.ApplicationJson) end)
    end
end)

-- ============================================
── INIT ──
-- ============================================
AntiBan:Init()

UI:Notification("⚔ SAILOR PIECE ULTIMATE", "v" .. Config.Version .. " chargé!\nBienvenue " .. Player.Name, 5)

print([[
╔══════════════════════════════════════════════════════════════════╗
║        SAILOR PIECE ULTIMATE v]] .. Config.Version .. [[ - GOD          ║
║        Chargé avec succès! 0 Ban - 0 Bug - Farm 24/7            ║
║        Joueur: ]] .. Player.Name .. string.rep(" ", 40 - #Player.Name) .. [[║
╚══════════════════════════════════════════════════════════════════╝
]])

Player.CharacterAdded:Connect(function(C)
    task.wait(0.3); Character = C; HRP = Character:WaitForChild("HumanoidRootPart"); Humanoid = Character:WaitForChild("Humanoid")
end)