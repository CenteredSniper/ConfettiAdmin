-- @ScriptType: ModuleScript
--!strict
local RunService = game:GetService("RunService")
local Type = require(script.Parent.Type)

local Parent = game:GetService("ProximityPromptService")

if RunService:IsServer() then
	if not Parent:FindFirstChild("Reliable") then
		Instance.new("RemoteEvent", Parent).Name = "Reliable"
	end
	if not Parent:FindFirstChild("Unreliable") then
		Instance.new("UnreliableRemoteEvent", Parent).Name = "Unreliable"
	end
	if not Parent:FindFirstChild("Request") then
		Instance.new("RemoteEvent", Parent).Name = "Request"
	end
elseif not Parent:FindFirstChild("Reliable") or not Parent:FindFirstChild("Unreliable") or not Parent:FindFirstChild("Request") then
	repeat task.wait() until Parent:FindFirstChild("Reliable") and Parent:FindFirstChild("Unreliable") and Parent:FindFirstChild("Request")
end

return {
	Reliable = Parent.Reliable,
	Unreliable = Parent.Unreliable,
	Request = Parent.Request
} :: Type.Event