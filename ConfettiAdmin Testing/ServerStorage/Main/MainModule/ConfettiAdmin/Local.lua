-- @ScriptType: ModuleScript
local Setup = require(script:WaitForChild("Setup"))
local GUI = require(script:WaitForChild("GUI"))

return function(shared)
	Setup:Initilize(shared)
	GUI:Initilize(shared)
end