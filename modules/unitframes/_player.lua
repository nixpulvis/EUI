local M, S, V = unpack(select(2, ...))
local oUF = select(2, ...).oUF
-----------------------------------------------------------------------
-- EUI Unitframe [Player Layout]
-----------------------------------------------------------------------
--[[ to be used for both the player and the target. ]]

function V.Load_unitframes_player( module )
	oUF:RegisterStyle('EUI_Player', function( self, unit )
		frame = V.CreateElement(module, nil, self)
		frame:SetAllPoints()
	end)
end