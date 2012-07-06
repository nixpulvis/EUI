local M, S, V = unpack(select(2, ...))
-----------------------------------------------------------------------
-- EUI Functions
-----------------------------------------------------------------------
--[[ these are EUI's utilities, they provide somewhat abstracted
	 functionality. All functions here are stored in V ]]

-- converts hex colors to 0-1 colors for use in EUI.
function V.HexToColor( hex )
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

-- converts the given color (0-1) to hex value.
function V.ColorToHex( color )
	local r,g,b = unpack(color)
	local function num_to_hex( num )
	    local hexstr = '0123456789ABCDEF'
	    local s = ''
	    while num > 0 do
	        local mod = math.fmod(num, 16)
	        s = string.sub(hexstr, mod+1, mod+1)..s
	        num = math.floor(num / 16)
	    end
	    if s == '' then s = '0' end
	    return s
	end
	return 'FF'..num_to_hex(r)..num_to_hex(g)..num_to_hex(b)
end

-- :: Event Dependent :: ----------------------------------------------
-----------------------------------------------------------------------

-- V.mylevel updated
local function updateUnitLevel()
	V.mylevel = UnitLevel("player")
end
V.AddEventListener(updateUnitLevel, "PLAYER_LEVEL_UP")

-- V.incombat updated
local function updateCombatStatus()
	UnitAffectingCombat("player")
end
V.AddEventListener(updateCombatStatus, "PLAYER_REGEN_ENABLED")
V.AddEventListener(updateCombatStatus, "PLAYER_REGEN_DISABLED")