-- @ScriptType: ModuleScript
local Module = {}

function Module:Initilize(shared)
	return {
		ServerExecute = {
			Alias = {"s", "ss", "serverscript", "sscript", "script", "makescript"},
			Args = {"code"},
			Description = "Executes the given Lua code on the server",

			AdminLevel = 600,

			Filter = false,
			Hidden = false,

			Fun = false,
			CrossServer = false,
			CodeExecution = true,

			Function = function(plr, args)
				if args and args[1] and tostring(args[1]) then
					if not shared.Settings.CodeExecution then return false,"Code Execution not allowed." end

					local CodeFunction,Error = loadstring(tostring(args[1]))

					if CodeFunction then
						CodeFunction()
					end

					return CodeFunction,Error
				else
					return false,"Arg not valid"
				end
			end
		},
		
		VoidScripts = {
			Alias = {"voidsb", "voids", "voidscript", "voidscriptbuilder"},
			Args = {"Player"},
			Description = "Executes the given Lua code on the server",

			AdminLevel = 600,

			Filter = false,
			Hidden = false,

			Fun = true,
			CrossServer = false,
			CodeExecution = true,

			Function = function(plr, args)
				if not shared.Settings.CodeExecution then return false,"Code Execution not allowed." end
				
				shared.Remotes.Gui:Fire(true, plr, "VoidSB")
			end
		},
		
		R6 = {
			Alias = {},
			Args = {"Player"},
			Description = "Sets player to R6",

			AdminLevel = 300,

			Filter = false,
			Hidden = false,

			Fun = false,
			CrossServer = false,
			CodeExecution = false,

			Function = function(plr, args)
				local Player = args[1] and shared:PlayerShortName(args[1]) or plr
				
				if Player then
					local Character = Player.Character
					
					local R6Rig = shared
				end
			end
		},
	}
end

return Module
