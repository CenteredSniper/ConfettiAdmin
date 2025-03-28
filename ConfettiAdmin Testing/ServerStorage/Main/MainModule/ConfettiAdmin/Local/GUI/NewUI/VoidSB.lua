-- @ScriptType: ModuleScript
local Module = {}

function Module:Initilize(shared, Frame, Data)
	local Example = Frame:WaitForChild("Example")
	
	for _, Script in shared:GetAsset("VoidScripts"):GetChildren() do
		local Clone = Example:Clone()
		
		Clone.Activated:Connect(function()
			shared.Remotes.Loadstring:Fire(true, "Void", Clone.Name)
		end)
		
		Clone.Name = Script.Name
		Clone.Text = Script.Name
		Clone.Visible = true
		Clone.Parent = Frame
	end
end

return Module
