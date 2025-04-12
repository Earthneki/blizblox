if game.PlaceId == 71017572336194 then
	local DiscordLib = loadstring(game:HttpGet "https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/discord")()

	local win = DiscordLib:Window("Earthneki Hub [v.0.1]")

	local serv = win:Server("BizBlox[Main]", "")

	local a = serv:Channel("Auto Fram")

	local tool = {}
	local player = {}

	_G.Invinsible = false

	game.Players.LocalPlayer.Character.Humanoid:UnequipTools()

	for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
		table.insert(tool, v.Name)
	end

	for _, v in pairs(game.Players:GetChildren()) do
		if v.Name ~= game.Players.LocalPlayer.Name then
			table.insert(player, v.Name)
		end
	end

	function Gallery(a)
		_G.Monster_Select = nil
		_G.Quest_Select = nil

		_G.Monster_Select = a
		_G.Quest_Select = a
	end

	function Check_Levels()
		local Levels = game:GetService("Players").LocalPlayer.Level.Value
		if Levels == 1 or Levels <= 14 then
			_G.Monster = "Thug [Level 5]"
		elseif Levels == 15 or Levels <= 19 then
			_G.Monster = "HumonUser [Level 15]"
		elseif Levels == 20 or Levels <= 29 then
			_G.Monster = "Gryphon [Level 30]"
		elseif Levels == 30 or Levels <= 39 then
			_G.Monster = "Vampire [Level 40]"
		elseif Levels == 40 or Levels <= 54 then
			_G.Monster = "Snow Thug [Level 50]"
		elseif Levels == 55 or Levels <= 69 then
			_G.Monster = "Snowman [Level 65]"
		elseif Levels == 70 or Levels <= 169 then
			_G.Monster = "Wammu"
		elseif Levels == 170 or Levels <= 249 then
			_G.Monster = "Dio Royal Guard [Level  180]"
		elseif Levels == 250 or Levels <= 274 then
			_G.Monster = "School Bully [Level 270]"
		elseif Levels == 275 or Levels <= 299 then
			_G.Monster = "City Criminal [Level 280]"
		elseif Levels == 300 or Levels <= 1000 then
			_G.Monster = "Criminal Master [Level 300]"
		end
	end

	local x, y, z, ox, oy, oz = 0, 6, 0, 300, 0, 0

	local method_drop =
		a:Dropdown(
			"Method",
			{"Above [Recommend]", "Behide", "Under"},
			function(bool)
				_G.Method = bool
				method_select = bool
			end
		)

	a:Button(
		"Method Select",
		function()
			DiscordLib:Notification("Notification", "Selected "..method_select, "Continue")
			if _G.Method == "Above [Recommend]" then
				x = 0; y = 7; z = 0; ox = 300; oy = 0; oz = 0
			elseif _G.Method == "Behide" then
				x = 0; y = 0; z = 6; ox = 0; oy = 0; oz = 0
			elseif _G.Method == "Under" then
				x = 0; y = -6; z = 0; ox = 900; oy = 0; oz = 0
			end
		end
	)

	local tool_drop =
		a:Dropdown(
			"Tool",
			tool,
			function(bool)
				tool_select = bool
			end
		)

	a:Button(
		"Refesh",
		function()
			game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
			tool_drop:Clear()
			for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
				tool_drop:Add(v.Name)
			end
		end
	)

	a:Button(
		"Tool Select",
		function()
			DiscordLib:Notification("Notification", "Selected "..tool_select, "Continue")
			_G.Tool = tool_select
		end
	)

	a:Seperator()

	local af_drop =
		a:Dropdown(
			"Auto Fram",
			{"Thug [Level 5]", "HumonUser [Level 15]", "Gryphon [Level 30]", "Vampire [Level 40]", "Snow Thug [Level 50]", "Snowman [Level 65]", "Wammu", "Desert Bandit [Level 95]", "Desert Monster [Level 120]", "Dio Guard [Level 165]", "Dio Royal Guard [Level  180]", "School Bully  [Level 270]", "City Criminal  [Level 280]", "Criminal Master [Level 300]"},
			function(bool)
				af_select = bool
			end
		)

	a:Button(
		"Auto Fram Select",
		function()
			DiscordLib:Notification("Notification", "Selected "..af_select, "Continue")
			_G.Auto_Fram_Select = af_select
		end
	)

	a:Toggle(
		"Auto Farm",
		false,
		function(bool)
			if bool == true then
				_G.Auto_Fram_Select_Begin = true
				game:GetService("RunService").RenderStepped:Connect(function()
					if _G.Auto_Fram_Select_Begin == true then
						pcall(function()
							if game.Players.LocalPlayer.Quest:FindFirstChild("Target") ~= nil then
								for _, v in pairs(game.Workspace.Enemies:GetChildren()) do
									if v ~= nil then
										if v.Name == _G.Auto_Fram_Select then
											if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Tool) then
												game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack[_G.Tool])
											else
												game:GetService("VirtualUser"):CaptureController()
												game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
											end

											repeat task.wait()
												if not (v.Humanoid.Health == 0 or v.Humanoid.Health <= 0) and v.Name == _G.Auto_Fram_Select  then
													game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(x, y, z) * CFrame.fromOrientation(ox, oy, oz)
													setfflag("HumanoidParallelRemoveNoPhysics", "False")
													setfflag("HumanoidParallelRemoveNoPhysicsNoSimulate2", "False")
													game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
												end
											until v.Humanoid.Health == 0 or v.Humanoid.Health <= 0 or _G.Auto_Fram_Select_Begin == false or game.Players.LocalPlayer.Quest:FindFirstChild("Target") == nil or game.Players.LocalPlayer.Quest:FindFirstChild("Target").Value ~= _G.Auto_Fram_Select or game.Players.LocalPlayer.Character.Humanoid.Health == 0
										elseif v.Name ~= _G.Auto_Fram_Select and v.Name == tostring(game.Players.LocalPlayer.Quest.Target.Value) then
											if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Tool) then
												game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack[_G.Tool])
											else
												game:GetService("VirtualUser"):CaptureController()
												game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
											end

											repeat task.wait()
												if not (v.Humanoid.Health == 0 or v.Humanoid.Health <= 0) then
													game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(x, y, z) * CFrame.fromOrientation(ox, oy, oz)
													setfflag("HumanoidParallelRemoveNoPhysics", "False")
													setfflag("HumanoidParallelRemoveNoPhysicsNoSimulate2", "False")
													game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
												end
											until v.Humanoid.Health == 0 or v.Humanoid.Health <= 0 or _G.Auto_Fram_Select_Begin == false or game.Players.LocalPlayer.Quest:FindFirstChild("Target") == nil or game.Players.LocalPlayer.Quest:FindFirstChild("Target").Value ~= _G.Auto_Fram_Select or game.Players.LocalPlayer.Character.Humanoid.Health == 0

											--game:GetService("ReplicatedStorage"):FindFirstChild("Remote"):FindFirstChild("GameEvent"):FireServer("QuestCancel")
										end
									elseif game.Workspace.Enemies:FindFirstChild(_G.Auto_Fram_Select) == nil then
										game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace["HitboxClick"][_G.Auto_Fram_Select].CFrame
										setfflag("HumanoidParallelRemoveNoPhysics", "False")
										setfflag("HumanoidParallelRemoveNoPhysicsNoSimulate2", "False")
										game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
									end
								end
							elseif game.Players.LocalPlayer.Quest:FindFirstChild("Target") == nil then
								local args = {
									[1] = "Quest",
									[2] = _G.Auto_Fram_Select
								}

								game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("GameEvent"):FireServer(unpack(args))
								
								game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace["HitboxClick"][_G.Auto_Fram_Select].CFrame
								setfflag("HumanoidParallelRemoveNoPhysics", "False")
								setfflag("HumanoidParallelRemoveNoPhysicsNoSimulate2", "False")
								game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
							end
						end)
					end
				end)
			else
				_G.Auto_Fram_Select_Begin = false
			end
		end
	)

	a:Seperator()


	a:Toggle(
		"Auto Fram Lvl",
		false,
		function(bool)
			if bool == true then
				_G.Auto_Fram_Level = true
				game:GetService("RunService").RenderStepped:Connect(function()
					if _G.Auto_Fram_Level == true then
						pcall(function()
							Check_Levels()
							if game.Players.LocalPlayer.Quest:FindFirstChild("Target") ~= nil then
								for _, v in pairs(game.Workspace.Enemies:GetChildren()) do
									if v ~= nil then
										if v.Name == _G.Monster then
											if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Tool) then
												game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack[_G.Tool])
											else
												game:GetService("VirtualUser"):CaptureController()
												game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
											end

											repeat task.wait()
												if not (v.Humanoid.Health == 0 or v.Humanoid.Health <= 0) and v.Name == _G.Monster  then
													game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(x, y, z) * CFrame.fromOrientation(ox, oy, oz)
													setfflag("HumanoidParallelRemoveNoPhysics", "False")
													setfflag("HumanoidParallelRemoveNoPhysicsNoSimulate2", "False")
													game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
												end
											until v.Humanoid.Health == 0 or v.Humanoid.Health <= 0 or _G.Auto_Fram_Level == false or game.Players.LocalPlayer.Quest:FindFirstChild("Target") == nil or game.Players.LocalPlayer.Quest:FindFirstChild("Target").Value ~= _G.Monster or game.Players.LocalPlayer.Character.Humanoid.Health == 0
										elseif v.Name ~= _G.Monster and v.Name == tostring(game.Players.LocalPlayer.Quest.Target.Value) then
											if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Tool) then
												game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack[_G.Tool])
											else
												game:GetService("VirtualUser"):CaptureController()
												game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
											end

											repeat task.wait()
												if not (v.Humanoid.Health == 0 or v.Humanoid.Health <= 0) then
													game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(x, y, z) * CFrame.fromOrientation(ox, oy, oz)
													setfflag("HumanoidParallelRemoveNoPhysics", "False")
													setfflag("HumanoidParallelRemoveNoPhysicsNoSimulate2", "False")
													game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
												end
											until v.Humanoid.Health == 0 or v.Humanoid.Health <= 0 or _G.Auto_Fram_Level == false or game.Players.LocalPlayer.Quest:FindFirstChild("Target") == nil or game.Players.LocalPlayer.Quest:FindFirstChild("Target").Value ~= _G.Monster or game.Players.LocalPlayer.Character.Humanoid.Health == 0
										elseif v.Name == _G.Monster and (v.Humanoid.Health <= 0 or v.Humanoid.Health == 0) then
											game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace["HitboxClick"][_G.Monster].CFrame * CFrame.new(0, -20, 0)
											setfflag("HumanoidParallelRemoveNoPhysics", "False")
											setfflag("HumanoidParallelRemoveNoPhysicsNoSimulate2", "False")
											game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
										end
									elseif game.Workspace.Enemies:FindFirstChild(_G.Monster) == nil then
										game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace["HitboxClick"][_G.Monster].CFrame
										setfflag("HumanoidParallelRemoveNoPhysics", "False")
										setfflag("HumanoidParallelRemoveNoPhysicsNoSimulate2", "False")
										game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
									end
								end
							elseif game.Players.LocalPlayer.Quest:FindFirstChild("Target") == nil then
								local args = {
									[1] = "Quest",
									[2] = _G.Monster
								}

								game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("GameEvent"):FireServer(unpack(args))
								
								game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace["HitboxClick"][_G.Monster].CFrame
								setfflag("HumanoidParallelRemoveNoPhysics", "False")
								setfflag("HumanoidParallelRemoveNoPhysicsNoSimulate2", "False")
								game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
							end
						end)
					end
				end)
			else
				_G.Auto_Fram_Level = false
			end
		end
	)



	a:Toggle(
		"Instant Kill (Requested 30% Damage)",
		false,
		function(bool)
			if bool == true then
				_G.Instant_Kill = true
				while _G.Instant_Kill == true do task.wait()
					pcall(function()
						for _, v in pairs(game.Workspace.Enemies:GetChildren()) do
							if v.ClassName == "Model" and v:FindFirstChild("Humanoid") and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude <= 50 then
								if v:FindFirstChild(game.Players.LocalPlayer.Name) and tonumber(v[game.Players.LocalPlayer.Name].Value) >= tonumber(v.Humanoid.MaxHealth/3) then
									v.Humanoid.Health = 0
									game:GetService("Workspace").FallenPartsDestroyHeight = 0 / 0
									sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", 1000)
								end
							end
						end
					end)
				end
			else
				_G.Instant_Kill = false
			end
		end
	)
	
	a:Toggle(
		"Auto Bring [Next Update]",
		false,
		function(bool)
			--
		end
	)

	a:Toggle(
		"Kill Aura [In Dev]",
		false,
		function(bool)
			--
		end
	)

	local b = serv:Channel("Players")

	local player_drop =
		b:Dropdown(
			"Player",
			player,
			function(bool)
				player_select = bool
			end
		)


	b:Button(
		"Refesh",
		function()
			player_drop:Clear()
			for _, v in pairs(game.Players:GetChildren()) do
				if v.Name ~= game.Players.LocalPlayer.Name then
					player_drop:Add(v.Name)
				end
			end
		end
	)

	b:Button(
		"Player Select",
		function()
			DiscordLib:Notification("Notification", "Selected "..player_select, "Continue")
			_G.Player = player_select
		end
	)

	b:Button(
		"View",
		function()
			game.Workspace.Camera.CameraSubject = game.Players[_G.Player].Character.Humanoid
		end
	)

	b:Button(
		"Unview",
		function()
			game.Workspace.Camera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
		end
	)

	b:Button(
		"Teleport",
		function()
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[_G.Player].Character.HumanoidRootPart.CFrame
		end
	)


	local c = serv:Channel("Teleport")

	c:Button("Teleport to Spawn", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(160.398087, 23.4252701, 7.68664122, 0.999733746, -1.04061177e-08, -0.0230752323, 1.07108074e-08, 1, 1.30805908e-08, 0.0230752323, -1.33242626e-08, 0.999733746)
	end)

	c:Button("Teleport to Jungle", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(131.005127, 2.99999905, -386.843781, 0.994919598, -7.25665146e-08, -0.100672781, 6.93652282e-08, 1, -3.52994007e-08, 0.100672781, 2.81368759e-08, 0.994919598)
	end)

	c:Button("Teleport to Snow Island", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1540.02002, -38.0334091, -9.99454975, 0.206169397, 8.9643688e-09, 0.97851634, 3.85400323e-10, 1, -9.2423873e-09, -0.97851634, 2.28261787e-09, 0.206169397)
	end)


	c:Button("Teleport to Desert", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-743.806824, 32.856144, 84.9651566, 0.0693731532, 3.65711017e-08, 0.99759078, 3.47287568e-08, 1, -3.90744859e-08, -0.99759078, 3.73558073e-08, 0.0693731532)
	end)

	c:Button("Teleport to Dio Castle", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1690.32202, 22.6517315, 85.07798, 0.000313595403, 3.54637102e-08, 0.99999994, 1.16533885e-08, 1, -3.54673659e-08, -0.99999994, 1.16645102e-08, 0.000313595403)
	end)

	c:Button("Teleport to Morioh", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(248.702362, 3.41399956, 724.925415, -0.0282696951, -8.23029751e-08, -0.999600351, -6.0465986e-08, 1, -8.06258456e-08, 0.999600351, 5.81625486e-08, -0.0282696951)
	end)


	local d = serv:Channel("Misc")

	d:Button(
		"Infinite Stamina (Can't turn off)",
		function()
			game.Players.LocalPlayer.Stamina.Changed:Connect(function()
				game.Players.LocalPlayer.Stamina.Value = game.Players.LocalPlayer.StaminaMax.Value
			end)
		end
	)

	d:Button(
		"Invisible (Drop Body)",
		function()
			game.Players.LocalPlayer.Character.LowerTorso.Root:Destroy()
		end
	)

	d:Button(
		"Teleport to Arrow",
		function()
			for _, v in pairs(game.Workspace:GetChildren()) do
				if v.ClassName == "Tool" then
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Handle.CFrame
				end
			end
		end
	)


	if _G.Auto_Stats == true then
		local sp = serv:Channel("Auto Stats : On")

		sp:Button(
			"On",
			function()
				DiscordLib:Notification("Notification", "Started Auto Stats", "Continue")
			end
		)

		sp:Button(
			"Off",
			function()
				DiscordLib:Notification("Notification", "Stopped Auto Stats", "Continue")
			end
		)

		game.Players.LocalPlayer.Level.Changed:Connect(function()

		end)
	end
elseif game.PlaceId == 93140024895832 then
	local DiscordLib = loadstring(game:HttpGet "https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/discord")()

	local win = DiscordLib:Window("Earthneki Hub [v.0.1]")

	local serv = win:Server("BizBlox [Italy]", "")

	local a = serv:Channel("Auto Fram")

	local tool = {}
	local player = {}

	_G.Invinsible = false

	game.Players.LocalPlayer.Character.Humanoid:UnequipTools()

	for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
		table.insert(tool, v.Name)
	end

	for _, v in pairs(game.Players:GetChildren()) do
		if v.Name ~= game.Players.LocalPlayer.Name then
			table.insert(player, v.Name)
		end
	end

	function Gallery(a)
		_G.Monster_Select = nil
		_G.Quest_Select = nil

		_G.Monster_Select = a
		_G.Quest_Select = a
	end

	function Check_Levels()
		local Levels = game:GetService("Players").LocalPlayer.Level.Value
		if Levels == 420 or Levels <= 439 then
			_G.Monster = "Special Force [Level 425]"
		elseif Levels == 440 or Levels <= 459 then
			_G.Monster = "Gangster [Level 450]"
		elseif Levels == 460 or Levels <= 479 then
			_G.Monster = "Mafia [Level 475]"
		elseif Levels == 480 or Levels <= 1000 then
			_G.Monster = "Elite Mafia [Level 500]"
		end
	end

	local x, y, z, ox, oy, oz = 0, 6, 0, 300, 0, 0

	local method_drop =
		a:Dropdown(
			"Method",
			{"Above [Recommend]", "Behide", "Under"},
			function(bool)
				_G.Method = bool
				method_select = bool
			end
		)

	a:Button(
		"Method Select",
		function()
			DiscordLib:Notification("Notification", "Selected "..method_select, "Continue")
			if _G.Method == "Above [Recommend]" then
				x = 0; y = 7; z = 0; ox = 300; oy = 0; oz = 0
			elseif _G.Method == "Behide" then
				x = 0; y = 0; z = 6; ox = 0; oy = 0; oz = 0
			elseif _G.Method == "Under" then
				x = 0; y = -6; z = 0; ox = 900; oy = 0; oz = 0
			end
		end
	)

	local tool_drop =
		a:Dropdown(
			"Tool",
			tool,
			function(bool)
				tool_select = bool
			end
		)

	a:Button(
		"Refesh",
		function()
			game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
			tool_drop:Clear()
			for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
				tool_drop:Add(v.Name)
			end
		end
	)

	a:Button(
		"Tool Select",
		function()
			DiscordLib:Notification("Notification", "Selected "..tool_select, "Continue")
			_G.Tool = tool_select
		end
	)

	a:Seperator()

	local af_drop =
		a:Dropdown(
			"Auto Fram",
			{"Thug [Level 5]", "HumonUser [Level 15]", "Gryphon [Level 30]", "Vampire [Level 40]", "Snow Thug [Level 50]", "Snowman [Level 65]", "Wammu", "Desert Bandit [Level 95]", "Desert Monster [Level 120]", "Dio Guard [Level 165]", "Dio Royal Guard [Level  180]", "School Bully  [Level 270]", "City Criminal  [Level 280]", "Criminal Master [Level 300]"},
			function(bool)
				af_select = bool
			end
		)

	a:Button(
		"Auto Fram Select",
		function()
			DiscordLib:Notification("Notification", "Selected "..af_select, "Continue")
			_G.Auto_Fram_Select = af_select
		end
	)

	a:Toggle(
		"Auto Farm",
		false,
		function(bool)
			if bool == true then
				_G.Auto_Fram_Select_Begin = true
				game:GetService("RunService").RenderStepped:Connect(function()
					if _G.Auto_Fram_Select_Begin == true then
						pcall(function()
							if game.Players.LocalPlayer.Quest:FindFirstChild("Target") ~= nil then
								for _, v in pairs(game.Workspace.Enemies:GetChildren()) do
									if v ~= nil then
										if v.Name == _G.Auto_Fram_Select then
											if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Tool) then
												game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack[_G.Tool])
											else
												game:GetService("VirtualUser"):CaptureController()
												game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
											end

											repeat task.wait()
												if not (v.Humanoid.Health == 0 or v.Humanoid.Health <= 0) and v.Name == _G.Auto_Fram_Select  then
													game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(x, y, z) * CFrame.fromOrientation(ox, oy, oz)
													setfflag("HumanoidParallelRemoveNoPhysics", "False")
													setfflag("HumanoidParallelRemoveNoPhysicsNoSimulate2", "False")
													game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
												end
											until v.Humanoid.Health == 0 or v.Humanoid.Health <= 0 or _G.Auto_Fram_Select_Begin == false or game.Players.LocalPlayer.Quest:FindFirstChild("Target") == nil or game.Players.LocalPlayer.Quest:FindFirstChild("Target").Value ~= _G.Auto_Fram_Select or game.Players.LocalPlayer.Character.Humanoid.Health == 0
										elseif v.Name ~= _G.Auto_Fram_Select and v.Name == tostring(game.Players.LocalPlayer.Quest.Target.Value) then
											if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Tool) then
												game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack[_G.Tool])
											else
												game:GetService("VirtualUser"):CaptureController()
												game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
											end

											repeat task.wait()
												if not (v.Humanoid.Health == 0 or v.Humanoid.Health <= 0) then
													game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(x, y, z) * CFrame.fromOrientation(ox, oy, oz)
													setfflag("HumanoidParallelRemoveNoPhysics", "False")
													setfflag("HumanoidParallelRemoveNoPhysicsNoSimulate2", "False")
													game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
												end
											until v.Humanoid.Health == 0 or v.Humanoid.Health <= 0 or _G.Auto_Fram_Select_Begin == false or game.Players.LocalPlayer.Quest:FindFirstChild("Target") == nil or game.Players.LocalPlayer.Quest:FindFirstChild("Target").Value ~= _G.Auto_Fram_Select or game.Players.LocalPlayer.Character.Humanoid.Health == 0

											--game:GetService("ReplicatedStorage"):FindFirstChild("Remote"):FindFirstChild("GameEvent"):FireServer("QuestCancel")
										end
									elseif game.Workspace.Enemies:FindFirstChild(_G.Auto_Fram_Select) == nil then
										game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace["HitboxClick"][_G.Auto_Fram_Select].CFrame
										setfflag("HumanoidParallelRemoveNoPhysics", "False")
										setfflag("HumanoidParallelRemoveNoPhysicsNoSimulate2", "False")
										game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
									end
								end
							elseif game.Players.LocalPlayer.Quest:FindFirstChild("Target") == nil then
								local args = {
									[1] = "Quest",
									[2] = _G.Auto_Fram_Select
								}

								game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("GameEvent"):FireServer(unpack(args))
								
								game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace["HitboxClick"][_G.Auto_Fram_Select].CFrame
								setfflag("HumanoidParallelRemoveNoPhysics", "False")
								setfflag("HumanoidParallelRemoveNoPhysicsNoSimulate2", "False")
								game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
							end
						end)
					end
				end)
			else
				_G.Auto_Fram_Select_Begin = false
			end
		end
	)

	a:Seperator()


	a:Toggle(
		"Auto Fram Lvl",
		false,
		function(bool)
			if bool == true then
				_G.Auto_Fram_Level = true
				game:GetService("RunService").RenderStepped:Connect(function()
					if _G.Auto_Fram_Level == true then
						pcall(function()
							Check_Levels()
							if game.Players.LocalPlayer.Quest:FindFirstChild("Target") ~= nil then
								for _, v in pairs(game.Workspace.Enemies:GetChildren()) do
									if v ~= nil then
										if v.Name == _G.Monster then
											if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Tool) then
												game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack[_G.Tool])
											else
												game:GetService("VirtualUser"):CaptureController()
												game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
											end

											repeat task.wait()
												if not (v.Humanoid.Health == 0 or v.Humanoid.Health <= 0) and v.Name == _G.Monster  then
													game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(x, y, z) * CFrame.fromOrientation(ox, oy, oz)
													setfflag("HumanoidParallelRemoveNoPhysics", "False")
													setfflag("HumanoidParallelRemoveNoPhysicsNoSimulate2", "False")
													game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
												end
											until v.Humanoid.Health == 0 or v.Humanoid.Health <= 0 or _G.Auto_Fram_Level == false or game.Players.LocalPlayer.Quest:FindFirstChild("Target") == nil or game.Players.LocalPlayer.Quest:FindFirstChild("Target").Value ~= _G.Monster or game.Players.LocalPlayer.Character.Humanoid.Health == 0
										elseif v.Name ~= _G.Monster and v.Name == tostring(game.Players.LocalPlayer.Quest.Target.Value) then
											if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Tool) then
												game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack[_G.Tool])
											else
												game:GetService("VirtualUser"):CaptureController()
												game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
											end

											repeat task.wait()
												if not (v.Humanoid.Health == 0 or v.Humanoid.Health <= 0) then
													game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(x, y, z) * CFrame.fromOrientation(ox, oy, oz)
													setfflag("HumanoidParallelRemoveNoPhysics", "False")
													setfflag("HumanoidParallelRemoveNoPhysicsNoSimulate2", "False")
													game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
												end
											until v.Humanoid.Health == 0 or v.Humanoid.Health <= 0 or _G.Auto_Fram_Level == false or game.Players.LocalPlayer.Quest:FindFirstChild("Target") == nil or game.Players.LocalPlayer.Quest:FindFirstChild("Target").Value ~= _G.Monster or game.Players.LocalPlayer.Character.Humanoid.Health == 0
										elseif v.Name == _G.Monster and (v.Humanoid.Health <= 0 or v.Humanoid.Health == 0) then
											game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace["HitboxClick"][_G.Monster].CFrame * CFrame.new(0, -20, 0)
											setfflag("HumanoidParallelRemoveNoPhysics", "False")
											setfflag("HumanoidParallelRemoveNoPhysicsNoSimulate2", "False")
											game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
										end
									elseif game.Workspace.Enemies:FindFirstChild(_G.Monster) == nil then
										game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace["HitboxClick"][_G.Monster].CFrame
										setfflag("HumanoidParallelRemoveNoPhysics", "False")
										setfflag("HumanoidParallelRemoveNoPhysicsNoSimulate2", "False")
										game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
									end
								end
							elseif game.Players.LocalPlayer.Quest:FindFirstChild("Target") == nil then
								local args = {
									[1] = "Quest",
									[2] = _G.Monster
								}

								game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("GameEvent"):FireServer(unpack(args))
								
								game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace["HitboxClick"][_G.Monster].CFrame
								setfflag("HumanoidParallelRemoveNoPhysics", "False")
								setfflag("HumanoidParallelRemoveNoPhysicsNoSimulate2", "False")
								game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
							end
						end)
					end
				end)
			else
				_G.Auto_Fram_Level = false
			end
		end
	)



	a:Toggle(
		"Instant Kill (Requested 30% Damage)",
		false,
		function(bool)
			if bool == true then
				_G.Instant_Kill = true
				while _G.Instant_Kill == true do task.wait()
					pcall(function()
						for _, v in pairs(game.Workspace.Enemies:GetChildren()) do
							if v.ClassName == "Model" and v:FindFirstChild("Humanoid") and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude <= 50 then
								if v:FindFirstChild(game.Players.LocalPlayer.Name) and tonumber(v[game.Players.LocalPlayer.Name].Value) >= tonumber(v.Humanoid.MaxHealth/3) then
									v.Humanoid.Health = 0
									game:GetService("Workspace").FallenPartsDestroyHeight = 0 / 0
									sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", 1000)
								end
							end
						end
					end)
				end
			else
				_G.Instant_Kill = false
			end
		end
	)
	
	a:Toggle(
		"Auto Bring [Next Update]",
		false,
		function(bool)
			--
		end
	)

	a:Toggle(
		"Kill Aura [In Dev]",
		false,
		function(bool)
			--
		end
	)

	local b = serv:Channel("Players")

	local player_drop =
		b:Dropdown(
			"Player",
			player,
			function(bool)
				player_select = bool
			end
		)


	b:Button(
		"Refesh",
		function()
			player_drop:Clear()
			for _, v in pairs(game.Players:GetChildren()) do
				if v.Name ~= game.Players.LocalPlayer.Name then
					player_drop:Add(v.Name)
				end
			end
		end
	)

	b:Button(
		"Player Select",
		function()
			DiscordLib:Notification("Notification", "Selected "..player_select, "Continue")
			_G.Player = player_select
		end
	)

	b:Button(
		"View",
		function()
			game.Workspace.Camera.CameraSubject = game.Players[_G.Player].Character.Humanoid
		end
	)

	b:Button(
		"Unview",
		function()
			game.Workspace.Camera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
		end
	)

	b:Button(
		"Teleport",
		function()
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[_G.Player].Character.HumanoidRootPart.CFrame
		end
	)


	local c = serv:Channel("Teleport")

	c:Button("Teleport to Spawn", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(160.398087, 23.4252701, 7.68664122, 0.999733746, -1.04061177e-08, -0.0230752323, 1.07108074e-08, 1, 1.30805908e-08, 0.0230752323, -1.33242626e-08, 0.999733746)
	end)

	c:Button("Teleport to Jungle", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(131.005127, 2.99999905, -386.843781, 0.994919598, -7.25665146e-08, -0.100672781, 6.93652282e-08, 1, -3.52994007e-08, 0.100672781, 2.81368759e-08, 0.994919598)
	end)

	c:Button("Teleport to Snow Island", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1540.02002, -38.0334091, -9.99454975, 0.206169397, 8.9643688e-09, 0.97851634, 3.85400323e-10, 1, -9.2423873e-09, -0.97851634, 2.28261787e-09, 0.206169397)
	end)


	c:Button("Teleport to Desert", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-743.806824, 32.856144, 84.9651566, 0.0693731532, 3.65711017e-08, 0.99759078, 3.47287568e-08, 1, -3.90744859e-08, -0.99759078, 3.73558073e-08, 0.0693731532)
	end)

	c:Button("Teleport to Dio Castle", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1690.32202, 22.6517315, 85.07798, 0.000313595403, 3.54637102e-08, 0.99999994, 1.16533885e-08, 1, -3.54673659e-08, -0.99999994, 1.16645102e-08, 0.000313595403)
	end)

	c:Button("Teleport to Morioh", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(248.702362, 3.41399956, 724.925415, -0.0282696951, -8.23029751e-08, -0.999600351, -6.0465986e-08, 1, -8.06258456e-08, 0.999600351, 5.81625486e-08, -0.0282696951)
	end)


	local d = serv:Channel("Misc")

	d:Button(
		"Infinite Stamina (Can't turn off)",
		function()
			game.Players.LocalPlayer.Stamina.Changed:Connect(function()
				game.Players.LocalPlayer.Stamina.Value = game.Players.LocalPlayer.StaminaMax.Value
			end)
		end
	)

	d:Button(
		"Invisible (Drop Body)",
		function()
			game.Players.LocalPlayer.Character.LowerTorso.Root:Destroy()
		end
	)

	d:Button(
		"Teleport to Arrow",
		function()
			for _, v in pairs(game.Workspace:GetChildren()) do
				if v.ClassName == "Tool" then
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Handle.CFrame
				end
			end
		end
	)


	if _G.Auto_Stats == true then
		local sp = serv:Channel("Auto Stats : On")

		sp:Button(
			"On",
			function()
				DiscordLib:Notification("Notification", "Started Auto Stats", "Continue")
			end
		)

		sp:Button(
			"Off",
			function()
				DiscordLib:Notification("Notification", "Stopped Auto Stats", "Continue")
			end
		)

		game.Players.LocalPlayer.Level.Changed:Connect(function()

		end)
	end
elseif game.PlaceId == 80601505308253 then
	local DiscordLib = loadstring(game:HttpGet "https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/discord")()

	local win = DiscordLib:Window("Earthneki Hub [v.0.1]")

	local serv = win:Server("BizBlox [Prison] ", "")

	local a = serv:Channel("Auto Fram")

	local tool = {}
	local player = {}

	_G.Invinsible = false

	game.Players.LocalPlayer.Character.Humanoid:UnequipTools()

	for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
		table.insert(tool, v.Name)
	end

	for _, v in pairs(game.Players:GetChildren()) do
		if v.Name ~= game.Players.LocalPlayer.Name then
			table.insert(player, v.Name)
		end
	end

	function Gallery(a)
		_G.Monster_Select = nil
		_G.Quest_Select = nil

		_G.Monster_Select = a
		_G.Quest_Select = a
	end

	function Check_Levels()
		local Levels = game:GetService("Players").LocalPlayer.Level.Value
		if Levels == 600 or Levels <= 624 then
			_G.Monster = "Newbie Prisoner [Level 615]"
		elseif Levels == 625 or Levels <= 649 then
			_G.Monster = "Prisoner [Level 630]"
		elseif Levels == 650 or Levels <= 674 then
			_G.Monster = "Strong Prisoner [Level 660]"
		elseif Levels == 675 or Levels <= 1000 then
			_G.Monster = "Prisoner Guard [Level 685]"
		end
	end

	local x, y, z, ox, oy, oz = 0, 6, 0, 300, 0, 0

	local method_drop =
		a:Dropdown(
			"Method",
			{"Above [Recommend]", "Behide", "Under"},
			function(bool)
				_G.Method = bool
				method_select = bool
			end
		)

	a:Button(
		"Method Select",
		function()
			DiscordLib:Notification("Notification", "Selected "..method_select, "Continue")
			if _G.Method == "Above [Recommend]" then
				x = 0; y = 7; z = 0; ox = 300; oy = 0; oz = 0
			elseif _G.Method == "Behide" then
				x = 0; y = 0; z = 6; ox = 0; oy = 0; oz = 0
			elseif _G.Method == "Under" then
				x = 0; y = -6; z = 0; ox = 900; oy = 0; oz = 0
			end
		end
	)

	local tool_drop =
		a:Dropdown(
			"Tool",
			tool,
			function(bool)
				tool_select = bool
			end
		)

	a:Button(
		"Refesh",
		function()
			game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
			tool_drop:Clear()
			for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
				tool_drop:Add(v.Name)
			end
		end
	)

	a:Button(
		"Tool Select",
		function()
			DiscordLib:Notification("Notification", "Selected "..tool_select, "Continue")
			_G.Tool = tool_select
		end
	)

	a:Seperator()

	local af_drop =
		a:Dropdown(
			"Auto Fram",
			{"Thug [Level 5]", "HumonUser [Level 15]", "Gryphon [Level 30]", "Vampire [Level 40]", "Snow Thug [Level 50]", "Snowman [Level 65]", "Wammu", "Desert Bandit [Level 95]", "Desert Monster [Level 120]", "Dio Guard [Level 165]", "Dio Royal Guard [Level  180]", "School Bully  [Level 270]", "City Criminal  [Level 280]", "Criminal Master [Level 300]"},
			function(bool)
				af_select = bool
			end
		)

	a:Button(
		"Auto Fram Select",
		function()
			DiscordLib:Notification("Notification", "Selected "..af_select, "Continue")
			_G.Auto_Fram_Select = af_select
		end
	)

	a:Toggle(
		"Auto Farm",
		false,
		function(bool)
			if bool == true then
				_G.Auto_Fram_Select_Begin = true
				game:GetService("RunService").RenderStepped:Connect(function()
					if _G.Auto_Fram_Select_Begin == true then
						pcall(function()
							if game.Players.LocalPlayer.Quest:FindFirstChild("Target") ~= nil then
								for _, v in pairs(game.Workspace.Enemies:GetChildren()) do
									if v ~= nil then
										if v.Name == _G.Auto_Fram_Select then
											if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Tool) then
												game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack[_G.Tool])
											else
												game:GetService("VirtualUser"):CaptureController()
												game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
											end

											repeat task.wait()
												if not (v.Humanoid.Health == 0 or v.Humanoid.Health <= 0) and v.Name == _G.Auto_Fram_Select  then
													game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(x, y, z) * CFrame.fromOrientation(ox, oy, oz)
													setfflag("HumanoidParallelRemoveNoPhysics", "False")
													setfflag("HumanoidParallelRemoveNoPhysicsNoSimulate2", "False")
													game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
												end
											until v.Humanoid.Health == 0 or v.Humanoid.Health <= 0 or _G.Auto_Fram_Select_Begin == false or game.Players.LocalPlayer.Quest:FindFirstChild("Target") == nil or game.Players.LocalPlayer.Quest:FindFirstChild("Target").Value ~= _G.Auto_Fram_Select or game.Players.LocalPlayer.Character.Humanoid.Health == 0
										elseif v.Name ~= _G.Auto_Fram_Select and v.Name == tostring(game.Players.LocalPlayer.Quest.Target.Value) then
											if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Tool) then
												game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack[_G.Tool])
											else
												game:GetService("VirtualUser"):CaptureController()
												game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
											end

											repeat task.wait()
												if not (v.Humanoid.Health == 0 or v.Humanoid.Health <= 0) then
													game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(x, y, z) * CFrame.fromOrientation(ox, oy, oz)
													setfflag("HumanoidParallelRemoveNoPhysics", "False")
													setfflag("HumanoidParallelRemoveNoPhysicsNoSimulate2", "False")
													game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
												end
											until v.Humanoid.Health == 0 or v.Humanoid.Health <= 0 or _G.Auto_Fram_Select_Begin == false or game.Players.LocalPlayer.Quest:FindFirstChild("Target") == nil or game.Players.LocalPlayer.Quest:FindFirstChild("Target").Value ~= _G.Auto_Fram_Select or game.Players.LocalPlayer.Character.Humanoid.Health == 0

											--game:GetService("ReplicatedStorage"):FindFirstChild("Remote"):FindFirstChild("GameEvent"):FireServer("QuestCancel")
										end
									elseif game.Workspace.Enemies:FindFirstChild(_G.Auto_Fram_Select) == nil then
										game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace["HitboxClick"][_G.Auto_Fram_Select].CFrame
										setfflag("HumanoidParallelRemoveNoPhysics", "False")
										setfflag("HumanoidParallelRemoveNoPhysicsNoSimulate2", "False")
										game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
									end
								end
							elseif game.Players.LocalPlayer.Quest:FindFirstChild("Target") == nil then
								local args = {
									[1] = "Quest",
									[2] = _G.Auto_Fram_Select
								}

								game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("GameEvent"):FireServer(unpack(args))
								
								game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace["HitboxClick"][_G.Auto_Fram_Select].CFrame
								setfflag("HumanoidParallelRemoveNoPhysics", "False")
								setfflag("HumanoidParallelRemoveNoPhysicsNoSimulate2", "False")
								game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
							end
						end)
					end
				end)
			else
				_G.Auto_Fram_Select_Begin = false
			end
		end
	)

	a:Seperator()


	a:Toggle(
		"Auto Fram Lvl",
		false,
		function(bool)
			if bool == true then
				_G.Auto_Fram_Level = true
				game:GetService("RunService").RenderStepped:Connect(function()
					if _G.Auto_Fram_Level == true then
						pcall(function()
							Check_Levels()
							if game.Players.LocalPlayer.Quest:FindFirstChild("Target") ~= nil then
								for _, v in pairs(game.Workspace.Enemies:GetChildren()) do
									if v ~= nil then
										if v.Name == _G.Monster then
											if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Tool) then
												game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack[_G.Tool])
											else
												game:GetService("VirtualUser"):CaptureController()
												game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
											end

											repeat task.wait()
												if not (v.Humanoid.Health == 0 or v.Humanoid.Health <= 0) and v.Name == _G.Monster  then
													game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(x, y, z) * CFrame.fromOrientation(ox, oy, oz)
													setfflag("HumanoidParallelRemoveNoPhysics", "False")
													setfflag("HumanoidParallelRemoveNoPhysicsNoSimulate2", "False")
													game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
												end
											until v.Humanoid.Health == 0 or v.Humanoid.Health <= 0 or _G.Auto_Fram_Level == false or game.Players.LocalPlayer.Quest:FindFirstChild("Target") == nil or game.Players.LocalPlayer.Quest:FindFirstChild("Target").Value ~= _G.Monster or game.Players.LocalPlayer.Character.Humanoid.Health == 0
										elseif v.Name ~= _G.Monster and v.Name == tostring(game.Players.LocalPlayer.Quest.Target.Value) then
											if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Tool) then
												game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack[_G.Tool])
											else
												game:GetService("VirtualUser"):CaptureController()
												game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
											end

											repeat task.wait()
												if not (v.Humanoid.Health == 0 or v.Humanoid.Health <= 0) then
													game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(x, y, z) * CFrame.fromOrientation(ox, oy, oz)
													setfflag("HumanoidParallelRemoveNoPhysics", "False")
													setfflag("HumanoidParallelRemoveNoPhysicsNoSimulate2", "False")
													game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
												end
											until v.Humanoid.Health == 0 or v.Humanoid.Health <= 0 or _G.Auto_Fram_Level == false or game.Players.LocalPlayer.Quest:FindFirstChild("Target") == nil or game.Players.LocalPlayer.Quest:FindFirstChild("Target").Value ~= _G.Monster or game.Players.LocalPlayer.Character.Humanoid.Health == 0
										elseif v.Name == _G.Monster and (v.Humanoid.Health <= 0 or v.Humanoid.Health == 0) then
											game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace["HitboxClick"][_G.Monster].CFrame * CFrame.new(0, -20, 0)
											setfflag("HumanoidParallelRemoveNoPhysics", "False")
											setfflag("HumanoidParallelRemoveNoPhysicsNoSimulate2", "False")
											game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
										end
									elseif game.Workspace.Enemies:FindFirstChild(_G.Monster) == nil then
										game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace["HitboxClick"][_G.Monster].CFrame
										setfflag("HumanoidParallelRemoveNoPhysics", "False")
										setfflag("HumanoidParallelRemoveNoPhysicsNoSimulate2", "False")
										game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
									end
								end
							elseif game.Players.LocalPlayer.Quest:FindFirstChild("Target") == nil then
								local args = {
									[1] = "Quest",
									[2] = _G.Monster
								}

								game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("GameEvent"):FireServer(unpack(args))
								
								game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace["HitboxClick"][_G.Monster].CFrame
								setfflag("HumanoidParallelRemoveNoPhysics", "False")
								setfflag("HumanoidParallelRemoveNoPhysicsNoSimulate2", "False")
								game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
							end
						end)
					end
				end)
			else
				_G.Auto_Fram_Level = false
			end
		end
	)



	a:Toggle(
		"Instant Kill (Requested 30% Damage)",
		false,
		function(bool)
			if bool == true then
				_G.Instant_Kill = true
				while _G.Instant_Kill == true do task.wait()
					pcall(function()
						for _, v in pairs(game.Workspace.Enemies:GetChildren()) do
							if v.ClassName == "Model" and v:FindFirstChild("Humanoid") and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude <= 50 then
								if v:FindFirstChild(game.Players.LocalPlayer.Name) and tonumber(v[game.Players.LocalPlayer.Name].Value) >= tonumber(v.Humanoid.MaxHealth/3) then
									v.Humanoid.Health = 0
									game:GetService("Workspace").FallenPartsDestroyHeight = 0 / 0
									sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", 1000)
								end
							end
						end
					end)
				end
			else
				_G.Instant_Kill = false
			end
		end
	)
	
	a:Toggle(
		"Auto Bring [Next Update]",
		false,
		function(bool)
			--
		end
	)

	a:Toggle(
		"Kill Aura [In Dev]",
		false,
		function(bool)
			--
		end
	)

	local b = serv:Channel("Players")

	local player_drop =
		b:Dropdown(
			"Player",
			player,
			function(bool)
				player_select = bool
			end
		)


	b:Button(
		"Refesh",
		function()
			player_drop:Clear()
			for _, v in pairs(game.Players:GetChildren()) do
				if v.Name ~= game.Players.LocalPlayer.Name then
					player_drop:Add(v.Name)
				end
			end
		end
	)

	b:Button(
		"Player Select",
		function()
			DiscordLib:Notification("Notification", "Selected "..player_select, "Continue")
			_G.Player = player_select
		end
	)

	b:Button(
		"View",
		function()
			game.Workspace.Camera.CameraSubject = game.Players[_G.Player].Character.Humanoid
		end
	)

	b:Button(
		"Unview",
		function()
			game.Workspace.Camera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
		end
	)

	b:Button(
		"Teleport",
		function()
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[_G.Player].Character.HumanoidRootPart.CFrame
		end
	)


	local c = serv:Channel("Teleport")

	c:Button("Teleport to Spawn", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(160.398087, 23.4252701, 7.68664122, 0.999733746, -1.04061177e-08, -0.0230752323, 1.07108074e-08, 1, 1.30805908e-08, 0.0230752323, -1.33242626e-08, 0.999733746)
	end)

	c:Button("Teleport to Jungle", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(131.005127, 2.99999905, -386.843781, 0.994919598, -7.25665146e-08, -0.100672781, 6.93652282e-08, 1, -3.52994007e-08, 0.100672781, 2.81368759e-08, 0.994919598)
	end)

	c:Button("Teleport to Snow Island", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1540.02002, -38.0334091, -9.99454975, 0.206169397, 8.9643688e-09, 0.97851634, 3.85400323e-10, 1, -9.2423873e-09, -0.97851634, 2.28261787e-09, 0.206169397)
	end)


	c:Button("Teleport to Desert", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-743.806824, 32.856144, 84.9651566, 0.0693731532, 3.65711017e-08, 0.99759078, 3.47287568e-08, 1, -3.90744859e-08, -0.99759078, 3.73558073e-08, 0.0693731532)
	end)

	c:Button("Teleport to Dio Castle", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1690.32202, 22.6517315, 85.07798, 0.000313595403, 3.54637102e-08, 0.99999994, 1.16533885e-08, 1, -3.54673659e-08, -0.99999994, 1.16645102e-08, 0.000313595403)
	end)

	c:Button("Teleport to Morioh", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(248.702362, 3.41399956, 724.925415, -0.0282696951, -8.23029751e-08, -0.999600351, -6.0465986e-08, 1, -8.06258456e-08, 0.999600351, 5.81625486e-08, -0.0282696951)
	end)


	local d = serv:Channel("Misc")

	d:Button(
		"Infinite Stamina (Can't turn off)",
		function()
			game.Players.LocalPlayer.Stamina.Changed:Connect(function()
				game.Players.LocalPlayer.Stamina.Value = game.Players.LocalPlayer.StaminaMax.Value
			end)
		end
	)

	d:Button(
		"Invisible (Drop Body)",
		function()
			game.Players.LocalPlayer.Character.LowerTorso.Root:Destroy()
		end
	)

	d:Button(
		"Teleport to Arrow",
		function()
			for _, v in pairs(game.Workspace:GetChildren()) do
				if v.ClassName == "Tool" then
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Handle.CFrame
				end
			end
		end
	)


	if _G.Auto_Stats == true then
		local sp = serv:Channel("Auto Stats : On")

		sp:Button(
			"On",
			function()
				DiscordLib:Notification("Notification", "Started Auto Stats", "Continue")
			end
		)

		sp:Button(
			"Off",
			function()
				DiscordLib:Notification("Notification", "Stopped Auto Stats", "Continue")
			end
		)

		game.Players.LocalPlayer.Level.Changed:Connect(function()

		end)
	end
end
