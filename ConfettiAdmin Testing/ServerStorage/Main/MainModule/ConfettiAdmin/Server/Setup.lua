-- @ScriptType: ModuleScript
local Module = {}

local Globals = require(script:WaitForChild("Globals"))
local SignalEvents = require(script:WaitForChild("SignalEvents"))
local RunService = require(script:WaitForChild("RunService"))

function Module:Initilize(shared)
	Globals:Initilize(shared)
	SignalEvents:Initilize(shared)
	RunService:Initilize(shared)
end

return Module
