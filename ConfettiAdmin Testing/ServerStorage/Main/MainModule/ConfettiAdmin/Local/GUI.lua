-- @ScriptType: ModuleScript
local Module = {}

local NewUI = require(script:WaitForChild("NewUI"))

function Module:Initilize(shared)
	
	shared.Remotes.Gui:Connect(function(...) -- for new ui elemetns
		NewUI:Initilize(shared, ...)
	end)
end

return Module
