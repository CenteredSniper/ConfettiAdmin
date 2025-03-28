-- @ScriptType: ModuleScript
local Module = {}

local function CheckPrefix(String, Prefix)
	return string.sub(String, 1, #Prefix) == Prefix
end

function Module:Initilize(shared, Player)
	shared.LemonSignal.wrap(Player.Chatted):Connect(function(Message)
		if not Message or #Message < 0 then
			return
		end
		
		for _, Split in string.split(Message, shared.Settings.BatchKey) do
			Split = string.sub(Split, 1, 1) == " " and string.sub(Split, 2) or Split			
			
			if CheckPrefix(Split, shared.Settings.Prefix) or shared.Settings.EnableDualPrefix and CheckPrefix(Split, shared.Settings.DualPrefix) then
				Split = string.sub(Split, 2)
				
				local Parameters = string.split(Split, " ")
				local Command = shared.CommandAlias[Parameters[1]]; table.remove(Parameters, 1)
				
				if Command then
					shared:Print("Found Command: " .. Command)
					
					local Command = shared.Commands[Command]
					
					if Command.Fun and not shared.Settings.FunCommands 
						or Command.CrossServer and not shared.Settings.CrossServerCommands 
						or Command.CodeExecution and not shared.Settings.CodeExecution then
						return
					end
					
					if 900 > Command.AdminLevel then -- replace 900 later
						Command.Function(Player, Parameters, shared)
					end
				end
			end
		end
	end)
end

return Module
