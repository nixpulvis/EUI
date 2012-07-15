local M, S, V = unpack(select(2, ...))
-----------------------------------------------------------------------
-- EUI Slash Command Core
-----------------------------------------------------------------------
--[[ manages creating and use of slash commands, also describes methods
		 for grouping and displaying options to users ]]

-- table for storing all commands
V.Command = { }
function V.Command.Create( name, func, description )
	local self = V.tcopy(V.Command)
	self.name  = name
	self.help  = { 
		['main'] = description 
	}
	self.switches = {
		['-h'] = function()
			self.switch = nil
			self:Print(self.help['main'], 'USAGE')
			for k,v in pairs(self.help) do
				if k ~= 'main' then
					self.switch = k
					self:Print(v, '   ')
				end
			end
		end
	}

	_G["SLASH_"..strupper(self.name).."1"] = '/'..self.name
	SlashCmdList[strupper(self.name)] = function( msg, editbox )
		if strlen(msg) > 0 then
			local args = { strsplit(' ', msg) }
			local delimiter = strsub(args[1], 0, 1)

			if delimiter == '-' then
				
				if self.switches[args[1]] then
					local switch_args = V.tcopy(args)
					tremove(switch_args, 1)
					self.switch = args[1] -- set the switch we're on
					self.switches[args[1]](self, switch_args)
				else
					self.switches['-h']()
				end

			else
				self.switch = nil -- not a switch
				func(self, args)
			end

		else

			self.switch = nil -- not a switch
			func(self, nil)

		end
	end

	return self
end

-- make a switch
function V.Command:Switch( switch, func, description )
	self.switches[switch] = func
	self.help[switch] = description
end

-- helper functions for Command
function V.Command:Print( msg, prefix )
	if not prefix then prefix = '' end
	if self.switch then
		V.PrintCustom(prefix..' /'..self.name..' '..self.switch, msg)
	else
		V.PrintCustom(prefix..' /'..self.name, msg)
	end
end