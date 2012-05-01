local M, S, V = unpack(select(2, ...))
-----------------------------------------------------------------------
-- Configuration for EUI
-----------------------------------------------------------------------

-- the config slash cmd
SLASH_EUI1 = '/eui'
function SlashCmdList.EUI(msg, editbox)
	V.toggleMovers()
end