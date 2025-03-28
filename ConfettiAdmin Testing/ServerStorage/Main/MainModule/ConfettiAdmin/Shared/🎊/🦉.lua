-- @ScriptType: LocalScript
local Start = os.clock()
local shared = {}

shared.Services = {}

function shared:GetService(Name)
	local Service = shared.Services[Name]

	if not shared.Services[Name] then
		Service = game:GetService(Name)

		if Service then
			shared.Services[Name] = Service
		end
	end

	return Service
end

local HiddenService = shared:GetService("ProximityPromptService")
local Confetti = HiddenService:WaitForChild("Confetti", 60)

if Confetti and Confetti:WaitForChild("Local", 5) and Confetti:WaitForChild("Shared", 5) then
	shared.SharedAssets = Confetti.Shared
	shared.Gui = script.Parent
	
	Confetti.Parent = game.Parent
	require(Confetti.Local)(shared)
	
	shared:Print(`Client Start Time: {shared:Round(os.clock()-Start, 3) * 1000}ms`)
else
	print("Failed to load Confetti?")
end