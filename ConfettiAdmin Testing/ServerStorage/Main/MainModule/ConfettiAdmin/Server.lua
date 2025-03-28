-- @ScriptType: ModuleScript
local Setup = require(script:WaitForChild("Setup"))
local Commands = require(script:WaitForChild("Commands"))
local Player = require(script:WaitForChild("Player"))

return function(shared)
	Setup:Initilize(shared)
	Commands:Initilize(shared)
	Player:Initilize(shared)
end