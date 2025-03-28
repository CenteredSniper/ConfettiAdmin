-- @ScriptType: ModuleScript
return {
	ExampleCommand1 = {
		Alias = {"examplecommand1", "examplealias1", "examplealias2"}; -- Command name and alias'
		Args = {"arg1", "arg2", "etc"}; -- Arguments, like :example hi bye hello, arg1 would be hi, etc.
		Description = "Example command"; -- Description displayed for said command, not important if hidden.

		AdminLevel = 100; -- Admin level required for command to be seen or used.

		Filter = true; -- Filters the args' strings before the function runs
		Hidden = true; -- Hides the command from console and cmdlists.

		Fun = false, -- Toggles if the command is a fun command.
		CrossServer = false, -- Toggles if the command requires MessageService

		Function = function(plr, args, Data)
			print("This is 'arg1':", tostring(args[1]))
			print("This is 'arg2':", tostring(args[2]))
			print("This is 'etc'(arg 3):", tostring(args[3]))
		end

			--[[ 
				Data variable holds the following:
					- Data.Settings
						You can either access the settings directly from this script, or use this.
					- Data.Datastore
						- Datastore.Admins
							Ex. [Key] = Rank
						- Datastore.Bans
							Ex. {Key,Key,etc.}
						- Datastore.Logs 
							Ex. {Key,UnixTime,Command}
					- Data.Ranks
						Stores the servers rank dictionary
							Ex. [Key] = Rank
					- Data.Banned
						Stores the server banned table
							Ex. {Key,Key,etc.}
							
					Key can either be 
						type number = UserID
						type string = GroupID or Username
			]]
	};
}