-- @ScriptType: ModuleScript
local Module = {}

local Localize = require(script:WaitForChild("Localize"))
local Chatted = require(script:WaitForChild("Chatted"))

function Module:Initilize(shared)
	local Players = shared:GetService("Players")
	shared.Players = {}
	
	local function InitilizePlayer(Player)
		shared.Players[Player] = {}
		
		Localize:Initilize(shared, Player)
		Chatted:Initilize(shared, Player)
		
		
		task.wait(2)
		shared.Remotes.Expose:Fire(true, Player, {Camera = true})
	end
	
	shared.LemonSignal.wrap(Players.PlayerAdded):Connect(InitilizePlayer)
	
	for _, Player in Players:GetPlayers() do
		task.defer(InitilizePlayer, Player)
	end
	
	--shared.Remotes.Expose:Connect(function(...)
		--shared:Warn(...)
	--end)
	
	
end

return Module
