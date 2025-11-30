local rs = game:GetService('ReplicatedStorage')
if rs:FindFirstChild('GameRemotes') then
	local HttpService = game:GetService("HttpService")
	Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/VeztWare/KavoUi/main/KavoUi.lua"))()
	local Window = Library.CreateLib("Dupe gui", "Midnight")
	local Tab = Window:NewTab("Main")
	local Tab2 = Window:NewTab("Xray/ESP")
	local Section = Tab:NewSection("Dupe")
	local Section4 = Tab2:NewSection("Main")
	local blocks = workspace.Blocks
	local CoalESP = false
	local SteelESP = false
	local GoldESP = false
	local DiamondESP = false
	local RubyESP = false
	local SapphireESP = false
	local SproutedWheatESP = false
	local gr = rs.GameRemotes
	local si = gr.SortItem
	gr.Demo:Destroy()
	Section:NewButton("Instant chest dupe", "It may seem that the chest is empty, but you need to close it and open it again", function()
		for i=36,62 do
			spawn(function()
				si:InvokeServer(i)
			end)
		end
	end)

		local partName2Color = {
		CoalOre = "Really black",
		SteelOre = "Medium stone grey",
		GoldOre = "Gold",
		DiamondOre = "Cyan",
		RubyOre = "Really red",
		SapphireOre = "Really blue",
		Wheat5 = "Wheat"
	}

	local function createESP(adornee, color)
		local a = Instance.new("BoxHandleAdornment")
		a.Parent = adornee
		a.Adornee = adornee
		a.AlwaysOnTop = true
		a.ZIndex = 0
		a.Size = adornee.Size
		a.Transparency = 0.5
		a.Color = BrickColor.new(color)
	end

	local function init(name, state)
		if state then
			local color = partName2Color[name]
			if color == nil then
				color = 'Institutional white'
			end
			for _,v in pairs(blocks:GetDescendants()) do
				if v.Name == name then
					createESP(v, color)
				end
			end
		else
			for _,v in pairs(blocks:GetDescendants()) do
				if v:IsA('BoxHandleAdornment') and v.Parent.Name == name then
					v:Destroy()
				end
			end
		end
	end

	blocks.DescendantAdded:Connect(function(v)
		if v.Name == 'CoalOre' and CoalESP then
			createESP(v, "Really black")
		elseif v.Name == 'SteelOre' and SteelESP then
			createESP(v, "Medium stone grey")
		elseif v.Name == 'GoldOre' and GoldESP then
			createESP(v, "Gold")
		elseif v.Name == 'DiamondOre' and DiamondESP then
			createESP(v, "Cyan")
		elseif v.Name == 'RubyOre' and RubyESP then
			createESP(v, "Really red")
		elseif v.Name == 'SapphireOre' and SapphireESP then
			createESP(v, "Really blue")
		elseif v.Name == 'Wheat5' and SproutedWheatESP then
			createESP(v, "Wheat")
		elseif v.Name == CustomName and CustomESP then
			createESP(v, "Institutional white")
		end
	end)

	Section4:NewToggle("ESP Coal ore", "Locates it", function(state)
		CoalESP = state
		wait()
		init('CoalOre', state)
	end)
	Section4:NewToggle("ESP Steel ore", "Locates it", function(state)
		SteelESP = state
		wait()
		init('SteelOre', state)
	end)
	Section4:NewToggle("ESP Gold ore", "Locates it", function(state)
		GoldESP = state
		wait()
		init('GoldOre', state)
	end)
	Section4:NewToggle("ESP Diamond ore", "Locates it", function(state)
		DiamondESP = state
		wait()
		init('DiamondOre', state)
	end)
	Section4:NewToggle("ESP Ruby ore", "Locates it", function(state)
		RubyESP = state
		wait()
		init('RubyOre', state)
	end)
	Section4:NewToggle("ESP Sapphire ore", "Locates it", function(state)
		SapphireESP = state
		wait()
		init('SapphireOre', state)
	end)
	Section4:NewToggle("ESP Sprouted wheat", "Locates it", function(state)
		SproutedWheatESP = state
		wait()
		init('Wheat5', state)
	end)
end
