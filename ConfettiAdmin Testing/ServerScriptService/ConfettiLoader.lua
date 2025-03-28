-- @ScriptType: Script
--[[
	｢ Confetti Admin ｣
	
	｢ Developed By ｣
	-	TimedMarch (Main Scripter)
	-	EternityDev (Warp)
]]

-- // Variables \\ --

local StartTime = os.clock()

-- [ Services ] --

local MarketplaceService = game:GetService("MarketplaceService")

-- [ Variables ] --

local Settings = script:WaitForChild("Settings",1/3)

local Module

local AssetVersionId = 16113211334
local ConfettiRequireId = 16112887356

-- // Functions \\ --

local function FindValidResults()
	local Results = {}

	for _,Confetti in pairs(game:GetDescendants()) do
		if Confetti.Name == "ConfettiAdmin" and Confetti:WaitForChild("Version", 1/3) and Confetti:FindFirstChild("DefaultSettings",true) then
			table.insert(Results,Confetti)
		end
	end
	
	return Results
end

local function FindLocalConfetti()
	local Highest = 0
	local FoundModule
	
	for _,Confetti in pairs(FindValidResults()) do
		local Version = Confetti:WaitForChild("Version", 1/3)
		if Version.Value > Highest then
			FoundModule = Confetti
			Highest = Version
		end
	end
	
	return FoundModule
end

local function GetVersion()
	local Success,ProductInfo = pcall(MarketplaceService.GetProductInfo, MarketplaceService, AssetVersionId)

	return Success and tonumber(ProductInfo.Description) or 0 -- return 0 if description isnt a number, or productinfo errors
end

-- // Events \\ --

-- // Runtime \\ --

if Settings then
	Settings = require(Settings)
	Settings.StartTime = StartTime
	
	Module = FindLocalConfetti()
	
	if Settings.AutoUpdates then
		if Settings.CheckAssetVersions and Module then
			local Latest = GetVersion()
			local LocalVersion = Module:WaitForChild("Version", 1/3)
			
			if LocalVersion and Latest > LocalVersion.Value then -- check if outdated
				Module = ConfettiRequireId
			end
		else
			Module = ConfettiRequireId
		end
	end
	
	if not Module then
		Module = ConfettiRequireId
	end
else -- no risks
	Module = ConfettiRequireId
end

require(Module)(Settings)