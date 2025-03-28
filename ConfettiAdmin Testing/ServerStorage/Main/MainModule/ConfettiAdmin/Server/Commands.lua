-- @ScriptType: ModuleScript
local Module = {}

function Module:Initilize(shared)
	local Index = require(script:WaitForChild("Index")):Initilize(shared)
	
	shared.CommandAlias = {}
	shared.Commands = {}
	
	for CommandName, Data in Index do
		for _, Alias in Data.Alias do
			shared.CommandAlias[string.lower(Alias)] = CommandName
		end
		
		shared.CommandAlias[string.lower(CommandName)] = CommandName
		shared.Commands[CommandName] = Data
	end
	
	for CommandName, Data in shared.Settings.Commands do
		for _, Alias in Data.Alias do
			shared.CommandAlias[string.lower(Alias)] = CommandName
		end
		
		shared.CommandAlias[string.lower(CommandName)] = CommandName
		shared.Commands[CommandName] = Data
	end
end

return Module
