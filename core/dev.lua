local M, S, V = unpack(select(2, ...))
-----------------------------------------------------------------------
-- EUI Development Tools
-----------------------------------------------------------------------
--[[ these are some tools and functions to assist in development of
	 EUI, they will be included with the release, but are designed
	 to use as little resources as possible when not in use. ]]

-- :: /rl :: ----------------------------------------------------------
-----------------------------------------------------------------------
SLASH_RELOAD1 = '/rl'
function SlashCmdList.RELOAD(msg, editbox)
	ReloadUI()
end