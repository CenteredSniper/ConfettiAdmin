-- @ScriptType: ModuleScript
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
local HttpService = shared:GetService("HttpService")

if HiddenService:FindFirstChild("Confetti") then
	warn("🎊 - Confetti already executed?")
	return
end

local Local, Server, SharedAssets = script:WaitForChild("Local"), script:WaitForChild("Server"), script:WaitForChild("Shared")

function shared:Round(Number, Places)
	Places = tonumber(Places) or 0
	
	return math.round(Number * (10^Places)) / (10^Places)
end

return function(SentSettings)
	shared.Settings = SentSettings or require(SharedAssets:WaitForChild("DefaultSettings"))
	shared.SharedAssets = SharedAssets
	
	local Confetti = Instance.new("ForceField"); do
		Confetti.Name = "Confetti"
		Confetti.Visible = false

		Confetti.Parent = HiddenService
	end
	
	SharedAssets.Parent = Confetti
	Local.Parent = Confetti
	
	script.Parent = game.Parent
	require(Server)(shared)
	
	if SentSettings.StartTime then
		shared:Print(`Server Start Time: {shared:Round(os.clock()-SentSettings.StartTime, 3) * 1000}ms`)
	else
		shared:Warn(`Settings not found, defaulting settings.`)
	end
end