local M, S, V = unpack(select(2, ...))
-----------------------------------------------------------------------
-- EUI Utility Functions
-----------------------------------------------------------------------

-- Make a string on a frame
function V.SetFontString(parent, fontName, fontHeight, fontStyle)
	local fs = parent:CreateFontString(nil, "OVERLAY")
	fs:SetFont(fontName, fontHeight, fontStyle)
	fs:SetJustifyH("LEFT")
	fs:SetShadowColor(0, 0, 0)
	fs:SetShadowOffset(1.25, -1.25)
	return fs
end

-- adds the given function to the given event
function V.addToEvent(func, event)
	if V.events[event] == nil then
		V.events[event] = { }
	end
	tinsert(V.events[event], func)
end

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