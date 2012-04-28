local E, S, V = unpack(select(2, ...))
-----------------------------------------------------------------------
-- EUI Utility Functions
-----------------------------------------------------------------------

-- adds the given function to the given event
function V.addToEvent(func, event)
	if V.events[event] == nil then
		V.events[event] = { }
	end
	tinsert(V.events[event], func)
end

-----------------------------------------------------------------------
-- Event Functions
-----------------------------------------------------------------------

-- Keep V.mylevel updated
local function updateUnitLevel()
	V.mylevel = UnitLevel("player")
end
V.addToEvent(updateUnitLevel, "PLAYER_LEVEL_UP")

-- Keep V.incombat updated
local function updateCombatStatus()
	UnitAffectingCombat("player")
end
V.addToEvent(updateCombatStatus, "PLAYER_REGEN_ENABLED")
V.addToEvent(updateCombatStatus, "PLAYER_REGEN_DISABLED")