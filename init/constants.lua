local M, S, V = unpack(select(2, ...))
-----------------------------------------------------------------------
-- EUI Constants
-----------------------------------------------------------------------
--[[ holds info that EUI might need in any function or module ]]

V.myname = UnitName("player")
V.myclass = UnitClass("player")
V.myrace = UnitRace("player")
V.myfaction = UnitFactionGroup("player")
V.mylevel = UnitLevel("player")
V.myrealm = GetRealmName()
V.incombat = UnitAffectingCombat("player")

-- EUI version number
V.versionnumber = tonumber(GetAddOnMetadata("EUI", "Version"))

-- frame types that EUI's API are applied to
V.frame_types = {
  "Frame",
  "Button",
    "CheckButton",
  "Cooldown",
  "ColorSelect",
  "EditBox",
  "GameTooltip",
  "MessageFrame",
  "Minimap",
  "Model",
    "PlayerModel",
      "DressUpModel",
      "TabardModel",
  "ScrollFrame",
  "ScrollingMessageFrame",
  "SimpleHTML",
  "Slider",
  "StatusBar",
}

-- eui style constants
V.euicolor = 'FF8C00'
V.iconcrop = { .07, .93, .07, .93 }