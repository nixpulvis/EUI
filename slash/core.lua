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
	
	-- setup the proper function for blizz's sake
	_G['SLASH_'..name.to_c..'1'] = '/'..name
	function SlashCmdList[name]( msg, editbox )
		-- parse args
		args = msg.split(' ')

		func(self ,args)
	end

	-- helper functions for commands
	function self.Print( msg )
		V.PrintCustom('/'..name, msg)
	end

	return V.commands[name]
end