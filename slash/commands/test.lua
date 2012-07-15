local M, S, V = unpack(select(2, ...))
-----------------------------------------------------------------------
-- EUI /test
-----------------------------------------------------------------------
--[[ functionality for installing modules ]]

local cmd = V.Command.Create('test', function(self, args)
	
	if args[1] then
		local first = args[1]
		self:Print('main function '..first)
	end

end, 'prints things.')

cmd:Switch('-d', function(self, args)

	if args[1] then
		local first = args[1]
		self:Print('-d function '..first)
	end

end, 'does something.')