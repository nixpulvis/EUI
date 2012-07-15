local M, S, V = unpack(select(2, ...))
-----------------------------------------------------------------------
-- EUI /module
-----------------------------------------------------------------------
--[[ for enabling and disabling modules ]]

local cmd = V.Command.Create('module', function(self, args)
	
	self.switches['-h']()

end, "Set EUI modules to be loaded or not.")

cmd:Switch('-load', function(self, args)

	if args and args[1] then
		if args[1] == 'all' then -- load all
			S.saved.noload = { }
			ReloadUI()
		else
			if M[args[1]] then -- if module exists
				for i,v in ipairs(S.saved.noload) do
					if v == args[1] then
						tremove(S.saved.noload, i)
					end
				end
				ReloadUI()
			else
				self:Print('no module '..args[1]..' in EUI')
			end
		end
	else
		self.switches['-h']()
	end

end, 'load [MODULE]')

cmd:Switch('-noload', function(self, args)

	if args and args[1] then
		if args[1] == 'all' then -- noload all
			for k,v in pairs(M) do
				tinsert(S.saved.noload, k)
			end
			ReloadUI()
		else
			if M[args[1]] then -- if module exists
				tinsert(S.saved.noload, args[1])
				ReloadUI()
			else
				self:Print('no module '..args[1]..' in EUI')
			end
		end
	else
		self.switches['-h']()
	end

end, "don't load [MODULE]")