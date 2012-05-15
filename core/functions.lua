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

-- shows and hides the movers for each element.
function V.toggleMovers()
	for module,v in pairs(M) do
		for k,v in pairs(M[module].elements) do
			if v.mover:IsVisible() then
				v.mover:Hide()
			else
				v.mover:Show()
			end
		end
	end
end

-----------------------------------------------------------------------
-- Event Functions
-----------------------------------------------------------------------

-- adds the given function to the given event
function V.addToEvent(func, event)
	if V.events[event] == nil then
		V.events[event] = { }
	end
	tinsert(V.events[event], func)
end

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