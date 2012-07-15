local M, S, V = unpack(select(2, ...))
-----------------------------------------------------------------------
-- EUI Unitframes
-----------------------------------------------------------------------
--[[ unitframes for EUI, these are simplistic and provide only the
		 basic functionality. ]]

local unitframes = V:NewModule("unitframes")

function unitframes:Load()
	V.Print('This works!')
end