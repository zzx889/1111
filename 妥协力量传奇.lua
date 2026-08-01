local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/refs/heads/main/dist/main.lua"))()
local Confirmed = false

-- 提前定义全局表，防止后续 nil 错误
Interstellar = Interstellar or {}
_G.WindUI_AutoStates = _G.WindUI_AutoStates or {
    AutoKillReport = false,
    AutoKillReport2 = false,
    AutoKillReport3 = false,
    AutoKillReport4 = false,
    AutoKill = false,
    killall = false
}

local gradientColors = {
    "rgb(255, 230, 235)", "rgb(255, 210, 220)", "rgb(255, 190, 205)", "rgb(255, 170, 190)", "rgb(255, 150, 175)",
    "rgb(245, 140, 180)", "rgb(235, 130, 185)", "rgb(225, 120, 190)", "rgb(215, 110, 195)", "rgb(205, 100, 200)"
}

local username = game.Players.LocalPlayer.Name
local coloredUsername = ""
for i = 1, #username do
    local colorIndex = (i - 1) % #gradientColors + 1
    coloredUsername = coloredUsername .. '<font color="' .. gradientColors[colorIndex] .. '">' .. username:sub(i, i) .. '</font>'
end

local version = "v1.2.4"
local coloredVersion = ""
for i = 1, #version do
    local colorIndex = (i - 1) % #gradientColors + 1
    coloredVersion = coloredVersion .. '<font color="' .. gradientColors[colorIndex] .. '">' .. version:sub(i, i) .. '</font>'
end

WindUI:Popup({
    Title = '<font color="' .. gradientColors[1] .. '">T</font><font color="' .. gradientColors[5] .. '">X</font>',
    IconThemed = true,
    Content = "尊敬的用户 " .. coloredUsername .. " \n您使用的 <font color='" .. gradientColors[1] .. "'>妥</font><font color='" .. gradientColors[5] .. "'>协</font> 当前版本型号是: " .. coloredVersion .. "\n现已支持服务器！",
    Buttons = {
        { Title = "取消", Callback = function() end, Variant = "Secondary" },
        { Title = "执行", Icon = "arrow-right", Callback = function() Confirmed = true; createUI() end, Variant = "Primary" }
    }
})

function createUI()
    local Window = WindUI:CreateWindow({
        Title = '妥协', Icon = "heart", IconThemed = true, Author = "v1.2.4", Folder = "CloudHub",
        Size = UDim2.fromOffset(580, 440), Transparent = true, Theme = "Dark", HideSearchBar = false,
        ScrollBarEnabled = true, Resizable = true,
        Background = "https://s41.ax1x.com/2026/08/02/pm45QAg.png",
        BackgroundImageTransparency = 0.5,
        User = {
            Enabled = true,
            Callback = function() WindUI:Notify({ Title = "点击了自己", Content = "没什么", Duration = 1, Icon = "4483362748" }) end,
            Anonymous = false
        },
        SideBarWidth = 250,
        Search = { Enabled = true, Placeholder = "搜索...", Callback = function(searchText) print("搜索内容:", searchText) end },
        SidePanel = { Enabled = true, Content = { { Type = "Button", Text = "妥协", Style = "Subtle", Size = UDim2.new(1, -20, 0, 30), Callback = function() end } } }
    })

    Window:EditOpenButton({ Title = "妥协", Icon = "rbxassetid://105677776902677", CornerRadius = UDim.new(0,16), StrokeThickness = 4, Color = ColorSequence.new(Color3.fromHex("FF6B6B")), Draggable = true })
    Window:Tag({ Title = "力量传奇", Color = Color3.fromHex("#00ffff") })
    Window:EditOpenButton({ Title = "妥协", Icon = "heart", CornerRadius = UDim.new(0,16), StrokeThickness = 4, Color = ColorSequence.new(Color3.fromHex("FF6B6B")), Draggable = true })

    spawn(function()
        while true do
            for hue = 0, 1, 0.01 do
                local color = Color3.fromHSV(hue, 0.8, 1)
                Window:EditOpenButton({ Color = ColorSequence.new(color) })
                wait(0.04)
            end
        end
    end)

    local infoTab = Window:Tab({ Title = "通知", Icon = "layout-grid", Locked = false })
    local infoSection = infoTab:Section({ Title = "详情信息", Icon = "info", Opened = true })
    infoSection:Divider()
    infoSection:Paragraph({ Title = "关于", Desc = "半成品\n国内免费最佳\n成品认准ato", ThumbnailSize = 190 })

    local infoSection2 = infoTab:Section({ Title = "更新公告", Icon = "bell", Opened = true })
    infoSection2:Divider()
    infoSection2:Paragraph({ Title = "12.6提示", Desc = "更新优化\n修复大部分功能 +刷包v3（这时候能刷）", ThumbnailSize = 190 })
    infoSection2:Paragraph({ Title = "11.25提示", Desc = "更新添加\n+自动吃物品 +自动宝箱 +刷包v2(这时候能刷)", ThumbnailSize = 190 })
    infoSection2:Paragraph({ Title = "11.8提示", Desc = "更新添加\n+刷业报 +宠物蛋 +刷包v1(这时候能刷)", ThumbnailSize = 190 })
    infoSection2:Paragraph({ Title = "10.15提示", Desc = "更新添加\n+自动锻炼 +器材锻炼 +跑步机 +打石头", ThumbnailSize = 190 })
    infoTab:Select()

    local LockSection = Window:Section({ Title = "主功能", Opened = true })
    local function AddTab(section, title, icon) return section:Tab({ Title = title, Icon = icon }) end

    local A = AddTab(LockSection, "主要", "rbxassetid://7734068321")
    local B = AddTab(LockSection, "打石头", "rbxassetid://7734068321")
    local C = AddTab(LockSection, "刷业报", "rbxassetid://7734068321")
    local D = AddTab(LockSection, "其他器材", "rbxassetid://7734068321")
    local E = AddTab(LockSection, "重生", "rbxassetid://7734068321")
    local F = AddTab(LockSection, "修改", "rbxassetid://7734068321")
    local G = AddTab(LockSection, "传送", "rbxassetid://7734068321")
    local H = AddTab(LockSection, "收集", "rbxassetid://7734068321")
    local I = AddTab(LockSection, "宠物蛋", "rbxassetid://7734068321")
    local J = AddTab(LockSection, "画质+通用", "rbxassetid://7734068321")
    local K = AddTab(LockSection, "关于包类和训练", "rbxassetid://4483362458")

    -- ==================== 主要 (A) ====================
    local aSection = A:Section({ Title = "比赛类", Opened = true })
    A:Toggle({ Title = "自动比赛开关", Default = false, Callback = function(state)
        getgenv().AutoBrawl = state
        while getgenv().AutoBrawl do wait(2) game:GetService("ReplicatedStorage").rEvents.brawlEvent:FireServer("joinBrawl") wait() end
    end })

    local aTrain = A:Section({ Title = "防打自动训练", Opened = true })
    A:Paragraph({ Title = "关于防打自动锻炼", Desc = "死亡后不会继续\n因为继续会失去道具\n所以我就没弄\n我建议的是不防打和安全点循环传送即可", ThumbnailSize = 190 })

    A:Toggle({ Title = "自动锻炼全部", Default = false, Callback = function(state)
        getgenv().AutoTrainTriple = state
        local oldPos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        local part = Instance.new('Part', workspace); part.Size = Vector3.new(500,20,530.1); part.Position = Vector3.new(0,100000,133.15); part.CanCollide=true; part.Anchored=true
        while getgenv().AutoTrainTriple do wait()
            local char = game.Players.LocalPlayer.Character; if not char then wait(1) continue end
            char.HumanoidRootPart.CFrame = part.CFrame + Vector3.new(0,50,0)
            for _,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                if v:IsA("Tool") and (v.Name=="Handstands" or v.Name=="Situps" or v.Name=="Pushups" or v.Name=="Weight") then
                    if v:FindFirstChildOfClass("NumberValue") then v:FindFirstChildOfClass("NumberValue").Value = 0 end
                    repeat wait() until game.Players.LocalPlayer.Backpack:FindFirstChildOfClass("Tool")
                    char.Humanoid:EquipTool(v); game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep")
                end
            end
        end
        part:Destroy(); if char then char.HumanoidRootPart.CFrame = oldPos; char.Humanoid:UnequipTools() end
    end })

    local defTrainFuncs = {
        Weight = { var = "AutoWeight", name = "Weight" },
        Pushups = { var = "AutoPushup", name = "Pushups" },
        Situps = { var = "AutoSitup", name = "Situps" },
        Handstands = { var = "AutoHandstand", name = "Handstands" }
    }
    for _,info in pairs({"Weight","Pushups","Situps","Handstands"}) do
        local v = defTrainFuncs[info]
        A:Toggle({ Title = "自动"..({"举哑铃","俯卧撑","仰卧起坐","倒立"})[_], Default = false, Callback = function(state)
            getgenv()[v.var] = state
            local oldPos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
            local part = Instance.new('Part', workspace); part.Size = Vector3.new(500,20,530.1); part.Position = Vector3.new(0,100000,133.15); part.CanCollide=true; part.Anchored=true
            while getgenv()[v.var] do wait()
                local char = game.Players.LocalPlayer.Character; if not char then wait(1) continue end
                char.HumanoidRootPart.CFrame = part.CFrame + Vector3.new(0,50,0)
                for _,item in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if item:IsA("Tool") and item.Name == v.name then item.Parent = char end
                end
                game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep")
            end
            part:Destroy(); if char then char.HumanoidRootPart.CFrame = oldPos; char.Humanoid:UnequipTools() end
        end })
    end

    local aTrain2 = A:Section({ Title = "不防打可移动自动训练", Opened = true })
    local moveTrainFuncs = {
        Weight = { var = "AutoWeight", name = "Weight" },
        Pushups = { var = "AutoPushups", name = "Pushups" },
        Situps = { var = "AutoSitups", name = "Situps" },
        Handstands = { var = "AutoHandstands", name = "Handstands" },
        All = { var = "AutoAllTrain", names = {"Weight","Pushups","Situps","Handstands"} }
    }
    for k,info in pairs(moveTrainFuncs) do
        if k == "All" then
            A:Toggle({ Title = "自全锻炼全部", Default = false, Callback = function(state)
                getgenv().AutoAllTrain = state
                spawn(function()
                    while getgenv().AutoAllTrain do
                        pcall(function()
                            local char = game.Players.LocalPlayer.Character; if not char then wait(2) else
                                for _,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                                    if v:IsA("Tool") and table.find(info.names, v.Name) then
                                        v.Parent = char; game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep"); wait(0.02)
                                        v.Parent = game.Players.LocalPlayer.Backpack; wait(0.2)
                                    end
                                end
                            end
                        end); wait()
                    end
                end)
            end })
        else
            local names = {{"举哑铃","Weight"},{"俯卧撑","Pushups"},{"仰卧起坐","Situps"},{"倒立","Handstands"}}
            local title = ""
            for _,n in ipairs(names) do if n[2]==info.name then title=n[1] break end end
            A:Toggle({ Title = "自动"..title, Default = false, Callback = function(state)
                getgenv()[info.var] = state
                spawn(function()
                    while getgenv()[info.var] do
                        pcall(function()
                            local char = game.Players.LocalPlayer.Character; if not char then wait(2) else
                                for _,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                                    if v:IsA("Tool") and v.Name==info.name then
                                        v.Parent = char; game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep"); wait(0.03)
                                        v.Parent = game.Players.LocalPlayer.Backpack; wait(0.2)
                                    end
                                end
                            end
                        end); wait()
                    end
                end)
            end })
        end
    end

    -- ==================== 打石头 (B) ====================
    local rocks = {"Tiny Rock", "Inferno Rock", "Punching Rock", "Rock Of Legends", "Muscle King Mountain", "Ancient Jungle Rock"}
    local rockSection1 = B:Section({ Title = "石头对照表", Opened = true })
    B:Paragraph({ Title = "因为列表汉化有问题", Desc = "Tiny Rock = 10耐力\nInferno Rock = 100耐力\nPunching Rock = 5000耐力\nRock Of Legends = 150000耐力\nMuscle King Mountain = 400000耐力\nAncient Jungle Rock = 750000耐力\nMuscle King Mountain = 100万耐力\nAncient Jungle Rock = 500万耐力\nAncient Jungle Rock = 1000万耐力", ThumbnailSize = 200 })

    local rockSection2 = B:Section({ Title = "远程打石头v1", Opened = true })
    B:Dropdown({ Title = "选择石头", Values = rocks, Value = "空", Callback = function(v) Interstellar.Rocks = v end })
    B:Toggle({ Title = "自动打石头", Description = "把石头传送过来打", Default = false, Callback = function(state)
        getgenv().rockV1 = state
        spawn(function()
            local oldCFrame = nil
            while getgenv().rockV1 do wait()
                pcall(function()
                    local char = game.Players.LocalPlayer.Character; if not char then continue end
                    local rock = workspace.machinesFolder[Interstellar.Rocks].Rock
                    if not oldCFrame then oldCFrame = rock.CFrame end
                    char.Humanoid:EquipTool(char:FindFirstChild("Punch") or game.Players.LocalPlayer.Backpack:FindFirstChild("Punch"))
                    if char:FindFirstChild("Punch") then char.Punch:Activate() end
                    rock.CFrame = char.HumanoidRootPart.CFrame * CFrame.new(0,0,-3); rock.CanCollide = false; rock.Transparency = 1
                    rock.rockGui.rockName.Visible = false; rock.rockGui.statLabel.Visible = false
                end)
            end
            if oldCFrame then pcall(function()
                local rock = workspace.machinesFolder[Interstellar.Rocks].Rock
                rock.CFrame = oldCFrame; rock.CanCollide = true; rock.Transparency = 0
                rock.rockGui.rockName.Visible = true; rock.rockGui.statLabel.Visible = true
            end) end
        end)
    end })

    local rockSection3 = B:Section({ Title = "远程打石头v2", Opened = true })
    B:Dropdown({ Title = "选择石头", Values = rocks, Value = "空", Callback = function(v) Interstellar.Rock = v end })
    B:Toggle({ Title = "自动打石头", Description = "远程隔空", Default = false, Callback = function(state)
        getgenv().rockV2 = state
        spawn(function()
            while getgenv().rockV2 do wait()
                pcall(function()
                    local char = game.Players.LocalPlayer.Character; if not char then continue end
                    char.Humanoid:EquipTool(char:FindFirstChild("Punch") or game.Players.LocalPlayer.Backpack:FindFirstChild("Punch"))
                    if char:FindFirstChild("Punch") then char.Punch:Activate() end
                    firetouchinterest(workspace.machinesFolder[Interstellar.Rock].Rock, char.LeftHand, 0)
                    firetouchinterest(workspace.machinesFolder[Interstellar.Rock].Rock, char.LeftHand, 1)
                end)
            end
        end)
    end })

    local rockCoords = {
        [0]       = CFrame.new(7.60643005, 4.02632904, 2104.54004, -0.23040159, -8.53662385e-08, -0.973095655, -4.68743764e-08, 1, -7.66279342e-08, 0.973095655, 2.79580536e-08, -0.23040159),
        [10]      = CFrame.new(-157.680908, 3.72453046, 434.871185, 0.923298299, -1.81774684e-09, -0.384083599, 3.45247031e-09, 1, 3.56670582e-09, 0.384083599, -4.61917082e-09, 0.923298299),
        [100]     = CFrame.new(162.233673, 3.66615629, -164.686783, -0.921312928, -1.80826774e-07, -0.38882193, -9.13036544e-08, 1, -2.48719346e-07, 0.38882193, -1.93647494e-07, -0.921312928),
        [5000]    = CFrame.new(329.831482, 3.66450214, -618.48407, -0.806075394, -8.67358096e-08, 0.591812849, -1.05715522e-07, 1, 2.57029176e-09, -0.591812849, -6.04919563e-08, -0.806075394),
        [150000]  = CFrame.new(-2566.78076, 3.97019577, -277.503235, -0.923934579, -4.11600105e-08, -0.382550538, -3.38838042e-08, 1, -2.57576183e-08, 0.382550538, -1.08360858e-08, -0.923934579),
        [400000]  = CFrame.new(2155.61743, 3.79830337, 1227.06482, -0.551303148, -9.16796949e-09, -0.834304988, -5.61318245e-08, 1, 2.61027839e-08, 0.834304988, 6.12216127e-08, -0.551303148),
        [750000]  = CFrame.new(-7285.6499, 3.66624784, -1228.27417, 0.857643783, -1.58175091e-08, -0.514244199, -1.22581563e-08, 1, -5.12025977e-08, 0.514244199, 5.02172774e-08, 0.857643783),
        [1000000] = CFrame.new(4160.87109, 987.829102, -4136.64502, -0.893115997, 1.25481356e-05, 0.44982639, 5.02490684e-06, 1, -1.79187136e-05, -0.44982639, -1.37431543e-05, -0.893115997),
        [5000000] = CFrame.new(-8957.54395, 5.53625107, -6126.90186, -0.803919137, 6.6065212e-08, 0.594738603, -8.93136143e-09, 1, -1.23155459e-07, -0.594738603, -1.04318865e-07, -0.803919137),
        [10000000]= CFrame.new(-7552.9, 3.4, 2847.7, -0.803919137, 6.6065212e-08, 0.594738603, -8.93136143e-09, 1, -1.23155459e-07, -0.594738603, -1.04318865e-07, -0.803919137)
    }
    for val,cf in pairs(rockCoords) do
        B:Toggle({ Title = "石头"..val, Default = false, Callback = function(state)
            getgenv()["RK"..val] = state
            while getgenv()["RK"..val] do wait()
                pcall(function()
                    local char = game.Players.LocalPlayer.Character; if not char then continue end
                    char.HumanoidRootPart.CFrame = cf
                    char.Humanoid:EquipTool(char:FindFirstChild("Punch") or game.Players.LocalPlayer.Backpack:FindFirstChild("Punch"))
                    if char:FindFirstChild("Punch") then char.Punch:Activate() end
                end)
            end
        end })
    end

    -- ==================== 刷业报 (C) ====================
    local AutoStates = _G.WindUI_AutoStates
    local cSection1 = C:Section({ Title = "自动刷业报", Opened = true })
    C:Toggle({ Title = "自动刷业报v1", Default = AutoStates.AutoKillReport, Callback = function(state)
        AutoStates.AutoKillReport = state
        if state then
            task.spawn(function()
                while AutoStates.AutoKillReport do
                    pcall(function()
                        local char = game.Players.LocalPlayer.Character; if not char or not char:FindFirstChild("Humanoid") or char.Humanoid.Health <= 0 then wait() continue end
                        local punch = char:FindFirstChild("Punch") or game.Players.LocalPlayer.Backpack:FindFirstChild("Punch")
                        if punch then punch.Parent = char; punch:Activate() end
                        local targets = {}
                        for _,pl in ipairs(game.Players:GetPlayers()) do
                            if pl ~= game.Players.LocalPlayer and pl.Character and pl.Character:FindFirstChild("HumanoidRootPart") then
                                table.insert(targets, pl.Character.HumanoidRootPart)
                            end
                        end
                        if #targets > 0 then
                            local t = targets[math.random(#targets)]
                            char.HumanoidRootPart.CFrame = t.CFrame * CFrame.new(0,0,2)
                        end
                    end)
                    wait()
                end
            end)
        end
    end })

    C:Toggle({ Title = "自动刷业报v2", Default = AutoStates.AutoKillReport2, Callback = function(state)
        AutoStates.AutoKillReport2 = state
        if state then
            local safePos = CFrame.new(-8751.0,120.4,-5863.1,0.59992,-2.24e-09,0.80006,4.46e-09,1,-5.44e-10,-0.80006,3.90e-09,0.59992)
            task.spawn(function()
                while AutoStates.AutoKillReport2 do
                    pcall(function()
                        local char = game.Players.LocalPlayer.Character; if not char then wait() continue end
                        char.HumanoidRootPart.CFrame = safePos
                        local punch = char:FindFirstChild("Punch") or game.Players.LocalPlayer.Backpack:FindFirstChild("Punch")
                        if punch then punch.Parent = char; punch:Activate() end
                        local targets = {}
                        for _,pl in ipairs(game.Players:GetPlayers()) do
                            if pl ~= game.Players.LocalPlayer and pl.Character and pl.Character:FindFirstChild("HumanoidRootPart") then
                                table.insert(targets, pl.Character.HumanoidRootPart)
                            end
                        end
                        if #targets > 0 then
                            local t = targets[math.random(#targets)]
                            char.HumanoidRootPart.CFrame = t.CFrame * CFrame.new(0,0,2)
                        end
                    end)
                    wait()
                end
            end)
        end
    end })

    C:Toggle({ Title = "自动刷业报v3", Default = false, Callback = function(state)
        getgenv().AutoKarmaV3 = state
        if state then
            local platform = Instance.new('Part', workspace); platform.Size = Vector3.new(50,30,50); platform.Position = Vector3.new(0,3000000,0); platform.Anchored = true
            game.Players.LocalPlayer.CharacterAdded:Connect(function(c) if getgenv().AutoKarmaV3 then c:WaitForChild("HumanoidRootPart").CFrame = platform.CFrame + Vector3.new(0,25,0) end end)
            task.spawn(function()
                while getgenv().AutoKarmaV3 do
                    pcall(function()
                        local char = game.Players.LocalPlayer.Character; if not char then wait() continue end
                        char.HumanoidRootPart.CFrame = platform.CFrame + Vector3.new(0,25,0)
                        local punch = char:FindFirstChild("Punch") or game.Players.LocalPlayer.Backpack:FindFirstChild("Punch")
                        if punch then punch.Parent = char; punch:Activate() end
                        for _,pl in ipairs(game.Players:GetPlayers()) do
                            if pl ~= game.Players.LocalPlayer and pl.Character and pl.Character:FindFirstChild("HumanoidRootPart") then
                                pl.Character.HumanoidRootPart.CFrame = char.HumanoidRootPart.CFrame * CFrame.new(0,0,-2)
                            end
                        end
                    end)
                    wait()
                end
                if platform then platform:Destroy() end
            end)
        end
    end })

    C:Toggle({ Title = "自动刷业报v4", Default = AutoStates.AutoKillReport3, Callback = function(state)
        AutoStates.AutoKillReport3 = state
        if state then
            task.spawn(function()
                while AutoStates.AutoKillReport3 do
                    for _,target in ipairs(game.Players:GetPlayers()) do
                        if target ~= game.Players.LocalPlayer and target.Character and target.Character:FindFirstChild("Head") then
                            pcall(function()
                                local char = game.Players.LocalPlayer.Character; if not char then return end
                                char.Humanoid:EquipTool(char:FindFirstChild("Punch") or game.Players.LocalPlayer.Backpack:FindFirstChild("Punch"))
                                if char:FindFirstChild("Punch") then char.Punch:Activate() end
                                local head = target.Character.Head
                                local hand = char:FindFirstChild("LeftHand")
                                if hand then firetouchinterest(head, hand, 0); wait(0.01); firetouchinterest(head, hand, 1) end
                            end)
                        end
                    end
                    wait(0.1)
                end
            end)
        end
    end })

    local cSection2 = C:Section({ Title = "自定义", Opened = true })
    local Plr = game.Players
    local LP = Plr.LocalPlayer
    local PlayerList = {}
    local function refreshPlayerList()
        PlayerList = {}
        for _,pl in ipairs(Plr:GetPlayers()) do if pl ~= LP then table.insert(PlayerList, pl.Name) end end
    end
    refreshPlayerList()
    Plr.PlayerAdded:Connect(function(pl) if pl ~= LP then table.insert(PlayerList, pl.Name) end end)
    Plr.PlayerRemoving:Connect(function(pl) local idx = table.find(PlayerList, pl.Name); if idx then table.remove(PlayerList, idx) end end)

    local killDropdown = C:Dropdown({ Title = "要远程的玩家", Values = PlayerList, Value = {}, Multi = true, AllowNone = true, Callback = function(v) Interstellar.killplayers = v or {} end })
    C:Toggle({ Title = "选中名单远程击杀(不选列表默认全部)", Default = false, Callback = function(state)
        AutoStates.AutoKill = state
        if state then
            task.spawn(function()
                while AutoStates.AutoKill do
                    local targets = #Interstellar.killplayers > 0 and Interstellar.killplayers or PlayerList
                    for _,name in ipairs(targets) do
                        local pl = Plr:FindFirstChild(name)
                        if pl and pl.Character and pl.Character:FindFirstChild("Head") then
                            pcall(function()
                                local char = LP.Character; if not char then return end
                                char.Humanoid:EquipTool(char:FindFirstChild("Punch") or LP.Backpack:FindFirstChild("Punch"))
                                if char:FindFirstChild("Punch") then char.Punch:Activate() end
                                local head = pl.Character.Head
                                local hand = char:FindFirstChild("LeftHand")
                                if hand then firetouchinterest(head, hand, 0); wait(0.01); firetouchinterest(head, hand, 1) end
                            end)
                        end
                    end
                    wait(0.1)
                end
            end)
        end
    end })

    C:Button({ Title = "查看选定远程名单", Callback = function()
        local list = #Interstellar.killplayers > 0 and Interstellar.killplayers or PlayerList
        WindUI:Notify({ Title = "远程目标 ("..#list..")", Content = table.concat(list, ", "), Duration = 5 })
    end })
    C:Button({ Title = "刷新玩家列表", Callback = function() refreshPlayerList(); killDropdown:Refresh(PlayerList) end })

    -- ==================== 其他器材 (D) ====================
    local function equipAndFire()
        local char = game.Players.LocalPlayer.Character
        if not char or not char:FindFirstChild("HumanoidRootPart") then return end
        local tool = char:FindFirstChildOfClass("Tool") or game.Players.LocalPlayer.Backpack:FindFirstChildOfClass("Tool")
        if tool then char.Humanoid:EquipTool(tool) end
    end

    local dSection1 = D:Section({ Title = "跑步机", Opened = true })
    local treadmillCF = {
        ["沙滩跑步机10"] = CFrame.new(238.671112, 5.40315914, 387.713165, -0.0160072874, -2.90710176e-08, -0.99987185, -3.3434191e-09, 1, -2.90212157e-08, 0.99987185, 2.87843993e-09, -0.0160072874),
        ["冰霜健身房跑步机2000"] = CFrame.new(-3005.37866, 14.3221855, -464.697876, -0.015773816, -1.38508964e-08, 0.999875605, -5.13225586e-08, 1, 1.30429667e-08, -0.999875605, -5.11104332e-08, -0.015773816),
        ["神话健身房跑步机2000"] = CFrame.new(2571.23706, 15.6896839, 898.650391, 0.999968231, 2.23868635e-09, -0.00797206629, -1.73198844e-09, 1, 6.35660768e-08, 0.00797206629, -6.3550246e-08, 0.999968231),
        ["永恒健身房跑步机3500"] = CFrame.new(-7077.79102, 29.6702118, -1457.59961, -0.0322036594, -3.31122768e-10, 0.99948132, -6.44344267e-09, 1, 1.23684493e-10, -0.99948132, -6.43611742e-09, -0.0322036594),
        ["传奇健身房跑步机3000"] = CFrame.new(4370.82812, 999.358704, -3621.42773, -0.960604727, -8.41949266e-09, -0.27791819, -6.12478646e-09, 1, -9.12496567e-09, 0.27791819, -7.06329528e-09, -0.960604727),
        ["丛林健身房跑步机20000"] = CFrame.new(-8138.67919921875, 28.270538330078125, 2833.511474609375, -0.960604727, -8.41949266e-09, -0.27791819, -6.12478646e-09, 1, -9.12496567e-09, 0.27791819, -7.06329528e-09, -0.960604727)
    }
    for name,cf in pairs(treadmillCF) do
        D:Toggle({ Title = name, Default = false, Callback = function(state)
            getgenv()[name] = state
            while getgenv()[name] do wait()
                local char = game.Players.LocalPlayer.Character; if not char then continue end
                char.HumanoidRootPart.CFrame = cf
                local hum = char:FindFirstChild("Humanoid"); if hum then hum.WalkSpeed = 10 end
                game:GetService("RunService"):BindToRenderStep("treadmill", Enum.RenderPriority.Character.Value+1, function()
                    if char and char:FindFirstChild("Humanoid") then char.Humanoid:Move(Vector3.new(10000,0,-1), true) end
                end)
            end
            game:GetService("RunService"):UnbindFromRenderStep("treadmill")
        end })
    end

    local dSection2 = D:Section({ Title = "深蹲器材", Opened = true })
    local squatCF = {
        ["沙滩深蹲架"] = {cf=CFrame.new(232.627625,3.67689133,96.3039856,-0.963445187,-7.78685845e-08,-0.267905563,-7.92865222e-08,1,-5.52570167e-09,0.267905563,1.5917589e-08,-0.963445187), minStr=1000},
        ["霜冻健身房深蹲架"] = {cf=CFrame.new(-2629.13818,3.36860609,-609.827454,-0.995664716,-2.67296816e-08,-0.0930150598,-1.90042453e-08,1,-8.39415222e-08,0.0930150598,-8.18099295e-08,-0.995664716), minStr=4000},
        ["传奇健身房深蹲架"] = {cf=CFrame.new(4443.04443,987.521484,-4061.12988,0.83309716,3.33018835e-09,0.553126693,-2.87759438e-09,1,-1.68654424e-09,-0.553126693,-1.86619012e-10,0.83309716), minStr=0},
        ["肌肉之王健身房深蹲架"] = {cf=CFrame.new(-8757.37012,13.2186356,-6051.24365,-0.902269304,1.63610299e-08,-0.431172907,1.71076486e-08,1,2.14606288e-09,0.431172907,-5.44002754e-09,-0.902269304), minStr=0},
        ["丛林健身房深蹲架"] = {cf=CFrame.new(-8383.45,3.43+80,2854.54,-0.902269304,1.63610299e-08,-0.431172907,1.71076486e-08,1,2.14606288e-09,0.431172907,-5.44002754e-09,-0.902269304), minStr=0}
    }
    for name,dat in pairs(squatCF) do
        D:Toggle({ Title = name, Default = false, Callback = function(state)
            getgenv()[name] = state
            if state then
                task.spawn(function()
                    while getgenv()[name] do
                        pcall(function()
                            local lp = game.Players.LocalPlayer
                            if (dat.minStr == 0 or lp.leaderstats.Strength.Value >= dat.minStr) then
                                if lp.machineInUse.Value == nil then
                                    lp.Character.HumanoidRootPart.CFrame = dat.cf
                                    wait(0.0001)
                                    local vim = game:GetService("VirtualInputManager"); vim:SendKeyEvent(true,"E",false,game); wait(0.0001); vim:SendKeyEvent(false,"E",false,game)
                                else
                                    game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep", workspace.machinesFolder["Squat Rack"].interactSeat)
                                end
                            end
                        end)
                        wait()
                    end
                end)
            end
        end })
    end

    local dSection3 = D:Section({ Title = "引体向上器材", Opened = true })
    local pullupCF = {
        ["沙滩引体向上"] = CFrame.new(-185.157745,5.81071186,104.747154,0.227061391,-8.2363325e-09,0.97388047,5.58502826e-08,1,-4.56432803e-09,-0.97388047,5.54278827e-08,0.227061391),
        ["神话健身房引体向上"] = CFrame.new(2315.82104,5.81071281,847.153076,0.993555248,6.99809632e-08,0.113349125,-7.05298859e-08,1,8.32554692e-10,-0.113349125,-8.82168916e-09,0.993555248),
    }
    for name,cf in pairs(pullupCF) do
        D:Toggle({ Title = name, Default = false, Callback = function(state)
            getgenv()[name] = state
            if state then
                task.spawn(function()
                    while getgenv()[name] do
                        pcall(function()
                            local lp = game.Players.LocalPlayer
                            if lp.machineInUse.Value == nil then
                                lp.Character.HumanoidRootPart.CFrame = cf
                                wait(0.0001)
                                local vim = game:GetService("VirtualInputManager"); vim:SendKeyEvent(true,"E",false,game); wait(0.0001); vim:SendKeyEvent(false,"E",false,game)
                            else
                                game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep", workspace.machinesFolder["Legends Pullup"].interactSeat)
                            end
                        end)
                        wait()
                    end
                end)
            end
        end })
    end

    local dSection4 = D:Section({ Title = "丢石头", Opened = true })
    local throwCF = {
        ["沙滩投掷石"] = CFrame.new(-91.6730804,3.67689133,-292.42868,-0.221022144,-2.21041621e-08,-0.975268781,1.21414407e-08,1,-2.54162646e-08,0.975268781,-1.7458726e-08,-0.221022144),
        ["神话健身房投掷石"] = CFrame.new(2486.01733,3.67689276,1237.89331,0.883595645,-2.06135038e-08,-0.468250751,-3.3286871e-09,1,-5.03036404e-08,0.468250751,4.60067362e-08,0.883595645),
        ["传奇健身房投掷石"] = CFrame.new(4189.96143,987.829773,-3903.0166,0.422592968,0,0.906319559,0,1,0,-0.906319559,0,0.422592968),
        ["肌肉之王投掷石"] = CFrame.new(-8935.4384765625,13.855730056762695,-5693.66748046875),
        ["丛林健身房投掷石"] = CFrame.new(-8620.99,89.81,2673.54,-0.902269304,1.63610299e-08,-0.431172907,1.71076486e-08,1,2.14606288e-09,0.431172907,-5.44002754e-09,-0.902269304)
    }
    for name,cf in pairs(throwCF) do
        D:Toggle({ Title = name, Default = false, Callback = function(state)
            getgenv()[name] = state
            if state then
                task.spawn(function()
                    while getgenv()[name] do
                        pcall(function()
                            local lp = game.Players.LocalPlayer
                            if lp.machineInUse.Value == nil then
                                lp.Character.HumanoidRootPart.CFrame = cf
                                wait(0.0001)
                                local vim = game:GetService("VirtualInputManager"); vim:SendKeyEvent(true,"E",false,game); wait(0.0001); vim:SendKeyEvent(false,"E",false,game)
                            else
                                game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep", workspace.machinesFolder.Throw.interactSeat or workspace.machinesFolder.Deadlift.interactSeat)
                            end
                        end)
                        wait()
                    end
                end)
            end
        end })
    end

    -- ==================== 重生 (E) ====================
    E:Section({ Title = "自动重生", Opened = true })
    E:Toggle({ Title = "自动重生", Default = false, Callback = function(state)
        getgenv().AutoRebirth = state
        if state then task.spawn(function() while getgenv().AutoRebirth do pcall(function() game:GetService("ReplicatedStorage").rEvents.rebirthRemote:InvokeServer("rebirthRequest") end) wait() end end) end
    end })

    local eCustom = E:Section({ Title = "自定义", Opened = true })
    E:Input({ Title = "自定义重生次数", Desc = "只能输入大于现在的重生次数", Callback = function(v) Interstellar.birth = tonumber(v) or 0 end })
    E:Toggle({ Title = "重生到指定的重生次数", Default = false, Callback = function(state)
        Interstellar.autobirth = state
        if state then
            task.spawn(function()
                local plr = game.Players.LocalPlayer
                while Interstellar.autobirth and plr.leaderstats.Rebirths.Value < Interstellar.birth do
                    pcall(function() game:GetService("ReplicatedStorage").rEvents.rebirthRemote:InvokeServer("rebirthRequest") end)
                    wait()
                end
                Interstellar.autobirth = false
                WindUI:Notify({ Title = "重生", Content = "已自动重生到目标次数", Duration = 3 })
            end)
        end
    end })
    E:Divider()
    E:Paragraph({ Title = "适合直接打石头卡宠的重生次数", Desc = "重生:80\n重生:280\n重生:580\n...", ThumbnailSize = 190 })

    -- ==================== 修改 (F) ====================
    local fSection = F:Section({ Title = "美化数据", Opened = true })
    for _,stat in ipairs({"Strength","Durability","Agility","Rebirths","Gems","evilKarma","goodKarma","Kills"}) do
        local desc = {Strength="力量",Durability="耐力",Agility="敏捷",Rebirths="重生",Gems="宝石",evilKarma="邪恶业报",goodKarma="好人业报",Kills="总业报"}
        F:Input({ Title = desc[stat], Desc = "输入"..desc[stat].."数值", Callback = function(v)
            if tonumber(v) then game.Players.LocalPlayer.leaderstats[stat].Value = tonumber(v) end
        end })
    end

    -- ==================== 传送 (G) ====================
    local gSection = G:Section({ Title = "传送区", Opened = true })
    local function teleport(cf) game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = cf end
    G:Button({ Title = "安全点", Callback = function() teleport(CFrame.new(-51.67,32.22,1290.41,0.99455,1.24e-08,-0.10422,-7.59e-09,1,4.62e-08,0.10422,-4.52e-08,0.99455)) end })
    G:Toggle({ Title = "安全点循环", Default = false, Callback = function(state)
        getgenv().SafeSpot1 = state
        while getgenv().SafeSpot1 do wait() pcall(function() teleport(CFrame.new(-51.67,32.22,1290.41,0.99455,1.24e-08,-0.10422,-7.59e-09,1,4.62e-08,0.10422,-4.52e-08,0.99455)) end) end
    end })
    G:Toggle({ Title = "安全点循环2", Default = false, Callback = function(state)
        getgenv().SafeSpot2 = state
        while getgenv().SafeSpot2 do wait() pcall(function() teleport(CFrame.new(0,100050,133.15)) end) end
    end })
    local teleports = {
        ["雕像头顶"] = CFrame.new(1.19,85.09,244.49,0.59992,-2.24e-09,0.80006,4.46e-09,1,-5.44e-10,-0.80006,3.90e-09,0.59992),
        ["肌肉王雕像头顶"] = CFrame.new(-8751.0,120.4,-5863.1,0.59992,-2.24e-09,0.80006,4.46e-09,1,-5.44e-10,-0.80006,3.90e-09,0.59992),
        ["出生点"] = CFrame.new(7,3,108),
        ["新手岛"] = CFrame.new(-37.61,4.16,1877.14),
        ["传说健身房"] = CFrame.new(4603.28,988.18,-3897.87),
        ["永恒健身房"] = CFrame.new(-6758.96,4.01,-1284.92),
        ["神话健身房"] = CFrame.new(2250.78,4.01,1073.23),
        ["冰霜健身房"] = CFrame.new(-2623.02,4.01,-409.07),
        ["肌肉之王健身房"] = CFrame.new(-8625.93,13.86,-5730.47),
        ["丛林健身房"] = CFrame.new(-8685.62,3.43,2392.33)
    }
    for name,cf in pairs(teleports) do G:Button({ Title = name, Callback = function() teleport(cf) end }) end

    -- ==================== 收集 (H) ====================
    local hSection = H:Section({ Title = "功能", Opened = true })
    H:Button({ Title = "使用一次奶昔", Callback = function()
        for _,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do if v:IsA("Tool") and (v.Name:find("Shake") or v.Name:find("奶昔")) then game.Players.LocalPlayer.Character.Humanoid:EquipTool(v); v:Activate(); break end end
    end })
    H:Toggle({ Title = "自动使用奶昔", Default = false, Callback = function(state)
        getgenv().AutoShake = state
        while getgenv().AutoShake do wait()
            for _,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do if v:IsA("Tool") and (v.Name:find("Shake") or v.Name:find("奶昔")) then game.Players.LocalPlayer.Character.Humanoid:EquipTool(v); v:Activate(); break end end
        end
    end })
    H:Button({ Title = "使用一次能量棒", Callback = function()
        for _,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do if v:IsA("Tool") and (v.Name:find("Protein Bar") or v.Name:find("能量棒")) then game.Players.LocalPlayer.Character.Humanoid:EquipTool(v); v:Activate(); break end end
    end })
    H:Toggle({ Title = "自动使用能量棒", Default = false, Callback = function(state)
        getgenv().AutoREB = state
        while getgenv().AutoREB do wait()
            for _,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do if v:IsA("Tool") and (v.Name:find("Protein Bar") or v.Name:find("能量棒")) then game.Players.LocalPlayer.Character.Humanoid:EquipTool(v); v:Activate(); break end end
        end
    end })
    H:Divider()
    H:Button({ Title = "收集宝石", Callback = function()
        for _,v in pairs(game.ReplicatedStorage.chestRewards:GetDescendants()) do if v.Name ~= "Light Karma Chest" and v.Name ~= "Evil Karma Chest" then wait(2) game.ReplicatedStorage.rEvents.checkChestRemote:InvokeServer(v.Name) end end
    end })

    -- ==================== 宠物蛋 (I) ====================
    local iSection1 = I:Section({ Title = "购买", Opened = true })
    I:Paragraph({ Title = "关于直接购买宠物", Desc = "你得保证你有充足的宝石\n因为购买一个宠物就值0.4亿左右\n否则购买失败", ThumbnailSize = 200 })
    local petBuyMap = {["肌肉王光环"]="Muscle King", ["暗星"]="Darkstar Hunter", ["霓虹卫报"]="Neon Guardian", ["赛博对决龙"]="Cybernetic Showdown Dragon"}
    local buyPetName = nil
    I:Dropdown({ Title = "选择购买的宠物", Values = {"肌肉王光环","暗星","霓虹卫报","赛博对决龙"}, Value = "空", Callback = function(v) buyPetName = petBuyMap[v] end })
    I:Button({ Title = "购买选中宠物一次", Callback = function() if buyPetName then game.ReplicatedStorage.cPetShopRemote:InvokeServer(game.ReplicatedStorage.cPetShopFolder[buyPetName]) end end })
    I:Toggle({ Title = "自动购买选中宠物", Default = false, Callback = function(state)
        getgenv().autoBuyPet = state
        if state and buyPetName then task.spawn(function() while getgenv().autoBuyPet do pcall(function() game.ReplicatedStorage.cPetShopRemote:InvokeServer(game.ReplicatedStorage.cPetShopFolder[buyPetName]) end) wait(0.5) end end) end
    end })

    local iSection2 = I:Section({ Title = "进化", Opened = true })
    local evolvePets = {["赛博对决龙"]="Cybernetic Showdown Dragon", ["暗星"]="Darkstar Hunter", ["肌肉王光环"]="Muscle King", ["霓虹卫报"]="Neon Guardian"}
    for name,id in pairs(evolvePets) do
        I:Toggle({ Title = "自动进化"..name, Default = false, Callback = function(state)
            getgenv()["Evolve"..id] = state
            if state then task.spawn(function() while getgenv()["Evolve"..id] do pcall(function() game.ReplicatedStorage.rEvents.petEvolveEvent:FireServer("evolvePet", id) end) wait() end end) end
        end })
    end

    local iSection3 = I:Section({ Title = "宠物蛋", Opened = true })
    I:Paragraph({ Title = "因为列表汉化有问题", Desc = "Blue Crystal = 蓝色宠物蛋\nGreen Crystal = 绿色宠物蛋\nFrost Crystal = 冰霜宠物蛋\nMythical Crystal = 神话宠物蛋\nInferno Crystal = 地狱宠物蛋\nLegends Crystal = 传奇宠物蛋\nGalaxy Oracle Crystal = 肌肉王宠物蛋\nJungle Crystal = 丛林宠物蛋", ThumbnailSize = 200 })
    local crystalNames = {"Blue Crystal","Green Crystal","Frost Crystal","Mythical Crystal","Inferno Crystal","Legends Crystal","Muscle Elite Crystal","Galaxy Oracle Crystal","Jungle Crystal"}
    local crystalChosen = nil
    I:Dropdown({ Title = "选择宠物蛋", Values = crystalNames, Value = "空", Callback = function(v) crystalChosen = v end })
    I:Button({ Title = "购买宠物蛋", Callback = function() if crystalChosen then game.ReplicatedStorage.rEvents.openCrystalRemote:InvokeServer("openCrystal", crystalChosen) end end })
    I:Toggle({ Title = "自动购买选中宠物蛋", Default = false, Callback = function(state)
        getgenv().AutoOpenCrystal = state
        if state then task.spawn(function() while getgenv().AutoOpenCrystal do pcall(function() game.ReplicatedStorage.rEvents.openCrystalRemote:InvokeServer("openCrystal", crystalChosen) end) wait() end end) end
    end })

    -- ==================== 画质+通用 (J) ====================
    local jSection = J:Section({ Title = "常用功能", Opened = true })
    J:Toggle({ Title = "去雾", Default = false, Callback = function(s) if s then game.Lighting.FogStart=3276634343; game.Lighting.FogEnd=3276734343 else game.Lighting.FogStart=0 end end })
    J:Divider()
    J:Slider({ Title = "视野", Step = 1, Value = {Min=10,Max=180,Default=workspace.CurrentCamera.FieldOfView}, Callback = function(fov) workspace.CurrentCamera.FieldOfView = fov end })
    J:Divider()
    J:Toggle({ Title = "穿墙", Default = false, Callback = function(s)
        getgenv().noclip = s
        if s then
            getgenv().noclipConn = game:GetService("RunService").Stepped:Connect(function()
                for _,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do if v:IsA("BasePart") then v.CanCollide = false end end
            end)
        else
            if getgenv().noclipConn then getgenv().noclipConn:Disconnect() end
            for _,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do if v:IsA("BasePart") then v.CanCollide = true end end
        end
    end })
    J:Divider()
    J:Slider({ Title = "飞行倍率", Step = 0.1, Value = {Min=1,Max=20,Default=5}, Callback = function(v) getgenv().flyMultiplier = v end })
    J:Toggle({ Title = "飞行开关", Default = false, Callback = function(state)
        getgenv().fly = state
        if state then
            local control = require(game.Players.LocalPlayer.PlayerScripts:WaitForChild("PlayerModule"):WaitForChild("ControlModule"))
            local char = game.Players.LocalPlayer.Character
            if char and char:FindFirstChild("HumanoidRootPart") then
                local hrp = char.HumanoidRootPart
                local bv = Instance.new("BodyVelocity"); bv.Name = "VelocityHandler"; bv.Parent = hrp; bv.MaxForce = Vector3.new(9e9,9e9,9e9)
                local bg = Instance.new("BodyGyro"); bg.Name = "GyroHandler"; bg.Parent = hrp; bg.MaxTorque = Vector3.new(9e9,9e9,9e9); bg.P = 1000; bg.D = 50
                getgenv().flyLoop = game:GetService("RunService").RenderStepped:Connect(function()
                    local c = game.Players.LocalPlayer.Character; if not c or not c:FindFirstChild("HumanoidRootPart") then return end
                    local hr = c.HumanoidRootPart
                    hr.GyroHandler.CFrame = workspace.CurrentCamera.CFrame
                    local dir = control:GetMoveVector()
                    local speed = 150 * (getgenv().flyMultiplier or 5)
                    hr.VelocityHandler.Velocity = Vector3.new()
                    if dir.X~=0 then hr.VelocityHandler.Velocity += workspace.CurrentCamera.CFrame.RightVector * (dir.X*speed) end
                    if dir.Z~=0 then hr.VelocityHandler.Velocity -= workspace.CurrentCamera.CFrame.LookVector * (dir.Z*speed) end
                    if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.Space) then hr.VelocityHandler.Velocity += Vector3.new(0,speed/2,0) end
                    if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftShift) then hr.VelocityHandler.Velocity -= Vector3.new(0,speed/2,0) end
                    c.Humanoid.PlatformStand = true
                end)
            end
        else
            if getgenv().flyLoop then getgenv().flyLoop:Disconnect() end
            local c = game.Players.LocalPlayer.Character; if c then c.Humanoid.PlatformStand = false; for _,v in pairs(c.HumanoidRootPart:GetChildren()) do if v.Name=="VelocityHandler" or v.Name=="GyroHandler" then v:Destroy() end end end
        end
    end })

    -- ==================== 关于包类和训练 (K) ====================
    K:Button({ Title = "解锁全部通行证", Callback = function() pcall(function() for _,v in ipairs(game.ReplicatedStorage.gamepassIds:GetChildren()) do v.Parent = game.Players.LocalPlayer.ownedGamepasses end end) end })
    K:Divider()
    K:Button({ Title = "执行zxt脚本（第一个刷重生）", Callback = function() loadstring(game:HttpGet("https://raw.github.com/114514541883484/X/main/hanhua1.lua"))() end })
    K:Button({ Title = "执行ato脚本（第二个刷重生要群组）", Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/Anscripterato/QQ2134702438/refs/heads/main/byato/AnScript/atoscript"))() end })

    WindUI:Notify({ Title = "妥协", Content = "反挂机已自动开启", Duration = 3 })
    WindUI:Notify({ Title = "妥协", Content = "力量传奇", Duration = 3 })
    print("Anti Afk On")
    local vu = game:GetService("VirtualUser")
    game.Players.LocalPlayer.Idled:Connect(function() vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame); wait(1); vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame) end)
end