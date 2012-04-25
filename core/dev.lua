local addon, ns = ...
local EUI = ns.EUI
-----------------------------------------------------------------------
-- These are tools used for development.
-----------------------------------------------------------------------

-- Best slash cmd ever!
SLASH_RELOAD1 = '/rl'
function SlashCmdList.RELOAD(msg, editbox)
	ReloadUI()
end