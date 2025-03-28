-- @ScriptType: ModuleScript
local Module = {}

local Remotes = {
	"Command",
	"Loadstring",
	"Gui",
	"Expose",
}

local ScriptEvent = require(script:WaitForChild("ScriptEvent"))

function Module:Initilize(shared)
	local Warp = require(shared.SharedAssets:WaitForChild("Warp"))
	local LemonSignal = require(shared.SharedAssets:WaitForChild("LemonSignal"))
	
	shared.Warp = Warp
	shared.LemonSignal = LemonSignal
	shared.Remotes = {}

	for _, v in Remotes do
		shared.Remotes[v] = Warp.Server(v)
	end
	
	ScriptEvent:Initilize(shared)
end

return Module
