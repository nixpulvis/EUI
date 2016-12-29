local E, S, M = unpack(select(2, ...))
-----------------------------------------------------------------------
-- EUI Settings
-----------------------------------------------------------------------
--[[ default settings for EUI. designed to be approachable to users,
   these values are only defaults. many of them will be overridden by
   savedvar settings. ]]

S.general = {
  ['background_color'] = { .075, .075, .075, .8 },
  ['border_color']     = { 0, 0, 0 },
}

S.auras = {
  ['size'] = 35,
}

S.minimap = {
  ['size'] = 150,
}
