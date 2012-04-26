local M, S, V = unpack(select(2, ...))
-----------------------------------------------------------------------
-- These are tools used for development.
-----------------------------------------------------------------------

-- Best slash cmd ever!
SLASH_RELOAD1 = '/rl'
function SlashCmdList.RELOAD(msg, editbox)
	ReloadUI()
end