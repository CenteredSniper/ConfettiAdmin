-- @ScriptType: ModuleScript
local Module = {}

local UserInputService = game:GetService("UserInputService")

function Module:Initilize(shared)
	local LemonSignal = shared.LemonSignal
	
	local Exposed = {}
	local ExposeRemote = shared.Remotes.Expose
	
	do -- UserInputService
		local KeyEvent = LemonSignal.new()
		local MouseEvent = LemonSignal.new()
		
		local LastMousePosition = Vector2.new()
		local MouseInputs = {
			[Enum.UserInputType.MouseButton1] = "LeftClick",
			[Enum.UserInputType.MouseButton2] = "RightClick",
			[Enum.UserInputType.MouseButton3] = "MiddleClick",
		}

		LemonSignal.wrap(UserInputService.InputBegan):Connect(function(Input, GameProcessed)
			if GameProcessed then
				return
			end

			if MouseInputs[Input.UserInputType] then
				MouseEvent:Fire(MouseInputs[Input.UserInputType], true)
			elseif Input.UserInputType == Enum.UserInputType.Keyboard then
				KeyEvent:Fire(Input.KeyCode.Name, true)
			end
		end)

		LemonSignal.wrap(UserInputService.InputEnded):Connect(function(Input, GameProcessed)
			if GameProcessed then
				return
			end

			if MouseInputs[Input.UserInputType] then
				MouseEvent:Fire(MouseInputs[Input.UserInputType], false)
			elseif Input.UserInputType == Enum.UserInputType.Keyboard then
				KeyEvent:Fire(Input.KeyCode.Name, false)
			end
		end)

		LemonSignal.wrap(UserInputService.InputChanged):Connect(function(Input, GameProcessed)
			if GameProcessed then
				return
			end

			if Input.UserInputType == Enum.UserInputType.MouseMovement then
				MouseEvent:Fire("Delta", Input.Delta)
				
				shared.MousePosition = UserInputService:GetMouseLocation()
				if LastMousePosition ~= shared.MousePosition then
					LastMousePosition = shared.MousePosition
					MouseEvent:Fire("Movement", shared.MousePosition)
				end
			end
		end)

		function shared:IsClicking(Type)
			return UserInputService:IsMouseButtonPressed(
				Type == "Right" and Enum.UserInputType.MouseButton2
					or Type == "Middle" and Enum.UserInputType.MouseButton3
					or Enum.UserInputType.MouseButton1 -- defaults to m1
			)
		end

		shared.KeyEvent = KeyEvent
		shared.MouseEvent = MouseEvent
		shared.MousePosition = UserInputService:GetMouseLocation()
	end
	
	do -- Camera
		local CameraEvent = LemonSignal.new()
		local Camera = workspace.CurrentCamera
		local LastPosition = Camera.CFrame
		
		shared.RenderStepped:Connect(function()
			if not Camera.CFrame:FuzzyEq(LastPosition, 0.001) then
				CameraEvent:Fire(Camera.CFrame)
				LastPosition = Camera.CFrame
			end
		end)
		
		shared.CameraEvent = CameraEvent
	end
	
	do -- Expose
		shared.KeyEvent:Connect(function(Key, Down)
			if Exposed[Key] then
				ExposeRemote:Fire(false, "Key", Key, Down)
			end
		end)

		shared.MouseEvent:Connect(function(Type, Down)
			if Exposed[Type] then
				ExposeRemote:Fire(false, "Mouse", Type, Down)
			end
		end)

		shared.CameraEvent:Connect(function(Pos)
			if Exposed["Camera"] then
				ExposeRemote:Fire(false, "Camera", Pos)
			end
		end)

		shared.Remotes.Expose:Connect(function(Array)
			for Type, Toggle in Array do
				Exposed[Type] = Toggle
			end
		end)
	end
end

return Module
