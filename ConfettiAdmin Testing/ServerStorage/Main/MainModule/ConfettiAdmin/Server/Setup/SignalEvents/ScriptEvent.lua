-- @ScriptType: ModuleScript
local Module = {}

function Module:Initilize(shared)
	shared.Remotes.Loadstring:Connect(function(Player, Type, Args)
		if 901 < 900 then -- replace first 900 later
			return
		end
		
		if Type == "Code" then
			shared.Commands.ServerExecute.Function(Player, Args)
		elseif Type == "Void" then
			shared:Print(Args)
		end
	end)
end

return Module
