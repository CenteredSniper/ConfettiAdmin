-- @ScriptType: ModuleScript
return {
	AutoUpdates = false, -- Sets auto-updates, will make it load slower, will require if no local copy
	CheckAssetVersions = true, -- Checks to see if local copy is up to date; might be slower.

	DataStorage = false, -- Toggles Datastorage, meaning things like admins will save to the game
	RankRequiredToSaveAdmins = 600, -- Anyone given admin ingame by someone of this rank or higher will be saved to the datastore.
	LoadDatastoreAdmins = true, -- Admins stored in datastorage will load
	DataStorageName = "Party!", -- Main Datastorage, change to reset data
	DataStorageKey = "Confetti_CHANGETHIS", -- Datastore key, changing resets data, only change it if you feel someone might manipulate your data with viruses/backdoors.

	ToolStorage = game:GetService("ServerStorage"), -- Tools command gets from this folder
	RecusiveTools = false, -- Gets descendants instead of children.

	--[[
		Examples of how to do users
		ID's = Numbers & Strings (ex. 2345566934 or "2345566934")
		Usernames = Strings (ex. "TimedMarch")
		GroupID:RankNumber = Strings (ex. "9987197:100")
		Gamepass
		
		Notes:	display names will not work
				for strings, use Quotation Marks ("") to wrap around
				To seperate users, use a Comma (,) - "TimedMarch","MarchTimed","5459106364",etc.
	]]

	Ranks = {
		["Whitelisted"] = { -- Simply for those who will bypass whitelist, but you don't want perms for.
			Level = 2,
			Users = {
				--// Add users here
			}
		},

		["VIP"] = {
			Level = 10,
			Users = {
				--// Add users here
			};
		};

		["Mods"] = {
			Level = 100,
			Users = {
				--// Add users here
			};
		};

		["Admins"] = {
			Level = 300,
			Users = {
				--// Add users here
			};
		};

		["Manager"] = {
			Level = 600,
			Users = {
				--// Add users here
			};
		};

		["Creators"] = {
			Level = 900,
			Users = {
				--// Add users here
			};
		};
	},

	CustomPermissions = {

		--[[
			This allows you to set custom permission levels for certain commands
			Don't add anything unless you know what you're doing
			Examples:
			CommandName:RankName - "ff:Manager"
			CommandName:RankLevel - "kill:100"
		]]
	},

	Banned = {}, -- Set players who will be banned from the game, this cannot be changed with datastorage
	-- Valid: number (ID), string (ID,Username,!GroupID) Ex: 2345566934, "2345566934", "TimedMarch", "!9987197" 

	CommandsToRun = { -- These commands ignore permission levels for players, so be careful with what you give them.
		OnStartUp = {
			-- Example: ":backup"
		},

		OnJoin = { -- Special Args: !username!, !displayname!, !playerid!
			-- Example: ":m New Player! %playername%"
		},

		OnSpawn = { -- Special Args: !username!, !displayname!, !playerid!
			-- Example: ":ff"
		}
	},

	WhitelistEnabled = false, -- Only whitelisted (those with permission level above 1) can join.

	ChatCommands = true,
	Prefix = ":", -- The character used prior to commands, like the : in :kill
	EnableDualPrefix = true, -- Enables a secondary prefix to be used
	DualPrefix = "-", -- Secondary prefix that can be used.
	BatchKey = "|", -- Splits commands, like :ff all | :explode all

	Console = true, -- Toggles the command console
	ConsoleAdminOnly = false, -- Console will only be allowed for people with permission level above 1
	ConsoleKeyCode = "Quote", -- Key to open console

	FunCommands = true, -- Enables commands considered to be fun.
	CrossServerCommands = true, -- Enables commands that work on multiple servers to be enabled.
	CreatorPowers = true, -- Gives the creator of ConfettiAdmin level 900 permission, allowing me to debug on your game.
	CodeExecution = true, -- Allows for commands that execute code to be enabled.

	BanMessage = "🎊 - Banned",
	LockMessage = "🎊 - Not Whitelisted",
	SystemTitle = "🎊 - System Message",

	MaxLogs = 5000, -- Max entries before the logs overfill and start removing. (Please keep this low if you are keeping datastorage on)
	SaveCommandLogs = true, -- Saves command logs to datastorage, also loads them when game starts up.
	Notification = true, -- Gives notifications for actions like recieving admin
	SongHint = true, -- Gives a hint notification when music is played or changed.
	AutoBackup = false, -- Automatically creates a backup of the map when the game starts.
	KeepInJail = false, -- Keeps players in jail even after they rejoin
	RemoveJailsOnLeave = true, -- Removes the jails created by admins after said admin leaves.

	Commands = require(script:WaitForChild("CustomCommands"))
}
