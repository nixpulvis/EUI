local M, S, V = unpack(select(2, ...))

V.myname = UnitName("player")
V.myclass = UnitClass("player")
V.myrace = UnitRace("player")
V.myfaction = UnitFactionGroup("player")
V.mylevel = UnitLevel("player")
V.myrealm = GetRealmName()
V.incombat = UnitAffectingCombat("player")

V.versionnumber = tonumber(GetAddOnMetadata("EUI", "Version"))

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