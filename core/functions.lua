local M, S, V = unpack(select(2, ...))
-----------------------------------------------------------------------
-- EUI Utility Functions
-----------------------------------------------------------------------

-- converts hex colors to 0-1 colors for use in EUI.
function V.HexToColor(hex)
	local color = { }
	if strlen(hex) == 6 or strlength(hex) == 8 then
		for i = 1, 8, 2 do
			if strsub(hex, i, i+1) == "" then print(strsub(hex, i, i+1)) break end
			-- converting string to number 0-1
			tinsert(color, tonumber(strsub(hex, i, i+1), 16)/255)
		end
	else
		error(hex.." is not a valid hex color")
	end
	return unpack(color)
end

-----------------------------------------------------------------------
-- Event Functions
-----------------------------------------------------------------------

-- Keep V.mylevel updated
local function updateUnitLevel()
	V.mylevel = UnitLevel("player")
end
V.addEventListener(updateUnitLevel, "PLAYER_LEVEL_UP")

-- Keep V.incombat updated
local function updateCombatStatus()
	UnitAffectingCombat("player")
	print('hit')
end
V.addEventListener(updateCombatStatus, "PLAYER_REGEN_ENABLED")
V.addEventListener(updateCombatStatus, "PLAYER_REGEN_DISABLED")


V.removeEventListener(updateCombatStatus, "PLAYER_REGEN_ENABLED")
V.removeEventListener(updateCombatStatus, "PLAYER_REGEN_DISABLED")