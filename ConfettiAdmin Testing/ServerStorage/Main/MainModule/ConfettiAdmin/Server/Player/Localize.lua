-- @ScriptType: ModuleScript
local Module = {}

function Module:Initilize(shared, Player)
	local Clone = shared.SharedAssets:WaitForChild("🎊")
	
	shared.Players[Player].Gui = Clone
	
	Clone.Parent = Player:FindFirstChildOfClass("PlayerGui") or Player:WaitForChild("PlayerGui", 1)
end

return Module
