local M, S, V, F = unpack(select(2, ...))
-----------------------------------------------------------------------
-- EUI Development Tools
-----------------------------------------------------------------------
--[[ These are some tools and functions to assist in development of
     EUI, they will be included with the release, but are designed
     to use as little resources as possible when not in use. ]]

-- /rl <3
SLASH_RELOAD1 = '/rl'
function SlashCmdList.RELOAD( msg, editbox )
  ReloadUI()
end

-- Reset saved vars
SLASH_RESET1 = '/resetvars'
function SlashCmdList.RESET( msg, editbox )
  EUIData = {}
  EUIPerCharacterData = {}
  ReloadUI()
end