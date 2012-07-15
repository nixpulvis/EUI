local M, S, V = unpack(select(2, ...))
-----------------------------------------------------------------------
-- EUI Slash Command Core
-----------------------------------------------------------------------
--[[ manages creating and use of slash commands, also describes methods
		 for grouping and displaying options to users ]]

-- table for storing all commands
V.commands = { }

function V.NewCommand( name, func )
	V.commands[name] = { }
	local self = V.commands[name]

	_G["SLASH_"..strupper(name).."1"] = '/'..name
	SlashCmdList[strupper(name)] = function( msg, editbox )
		
		-- parse args
		local args
		if strlen(msg) > 0 then
			args = V.split(msg, ' ')
		end

		func(self, args)
	end

	-- helper functions for commands
	function self.Print( msg )
		V.PrintCustom('/'..name, msg)
	end

	return V.commands[name]
end