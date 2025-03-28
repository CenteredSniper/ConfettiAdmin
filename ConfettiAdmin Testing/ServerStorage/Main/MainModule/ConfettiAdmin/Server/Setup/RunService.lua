-- @ScriptType: ModuleScript
local Module = {}

function Module:Initilize(shared)
	local RunService = shared:GetService("RunService")
	
	local LemonSignal = shared.LemonSignal
	
	shared.RenderStepped = LemonSignal.wrap(RunService.PreAnimation)
	shared.PreRender = LemonSignal.wrap(RunService.PreAnimation)

	shared.PreAnimation = LemonSignal.wrap(RunService.PreAnimation)

	shared.PreSimulation = LemonSignal.wrap(RunService.PreSimulation)
	shared.Stepped = LemonSignal.wrap(RunService.PreSimulation)

	shared.PostSimulation = LemonSignal.wrap(RunService.PostSimulation)
	shared.Heartbeat = LemonSignal.wrap(RunService.PostSimulation)
	
	shared.MachineInfo = {
		IsClient = RunService:IsClient(),
		IsServer = RunService:IsServer(),
		IsRunMode = RunService:IsRunMode(),
		IsStudio = RunService:IsStudio(),
	}
end

return Module
