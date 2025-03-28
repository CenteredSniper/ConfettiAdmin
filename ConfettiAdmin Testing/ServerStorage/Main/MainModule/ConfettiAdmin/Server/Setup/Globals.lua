-- @ScriptType: ModuleScript
local Module = {}

local function IsEmptyName(Name)
	return tostring(Name) == "" or tostring(Name) == " "
end

local function ShortName(Name1, Name2)
	Name1 = tostring(Name1)
	Name2 = tostring(Name2)
	
	return Name1 and not IsEmptyName(Name1) and Name2 and not IsEmptyName(Name2) and
		string.sub(
			string.lower(Name1),
			1,
			#tostring(Name2)
		) == string.lower(Name1)
end

function Module:Initilize(shared)
	local CachedAssets = {}
	local Players = shared:GetService("Players")
	
	function shared:GetAsset(Name)
		if not CachedAssets[Name] then
			CachedAssets[Name] = shared.SharedAssets:WaitForChild(Name, 3)
		end

		return CachedAssets[Name]
	end
	
	function shared:PlayerShortName(Name)
		local List = {}
		
		for _, Player in Players:GetPlayers() do
			if ShortName(Player.Name, Name) or ShortName(Player.DisplayName, Name) then
				table.insert(List, Player)
			end
		end
		
		return List
	end
	
	function shared:Print(...)
		print("🎊 -", ...)
	end

	function shared:Warn(...)
		warn("🎊 -", ...)
	end
	
	shared.loadstring = require(shared:GetAsset("Loadstring"))
end

return Module
