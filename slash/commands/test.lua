local M, S, V = unpack(select(2, ...))
-----------------------------------------------------------------------
-- EUI /test
-----------------------------------------------------------------------
--[[ functionality for installing modules ]]

local cmd = V.NewCommand('test', function(self, args)
	self.Print('working')
end)
