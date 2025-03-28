-- @ScriptType: ModuleScript
local Module = {}

function Module:Initilize(shared, Name, Data)
	local UiElements = shared:GetAsset("UiElements", 1/3)
	
	if UiElements then
		local Clone = UiElements:WaitForChild(Name, 1/3)
		local UiModule = script:WaitForChild(Name,5)
		
		if Clone and UiModule then
			Clone = Clone:Clone()
			
			Clone.Parent = shared.Gui
			require(UiModule):Initilize(shared, Clone, Data)
		end
	end
end

return Module
