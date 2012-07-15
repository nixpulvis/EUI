local M, S, V = unpack(select(2, ...))
-----------------------------------------------------------------------
-- EUI /test
-----------------------------------------------------------------------
--[[ functionality for installing modules ]]

local cmd = V.NewCommand('test', function(self, args)
	if args then
		for i,v in ipairs(args) do
			self.Print(v)
		end
	else
		self.Print('No Args')
	end
end)
