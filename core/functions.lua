local M, S, V = unpack(select(2, ...))
-----------------------------------------------------------------------
-- EUI Functions
-----------------------------------------------------------------------
--[[ these are EUI's utilities, they provide somewhat abstracted
	 functionality. All functions here are stored in V ]]

-- table copying, many uses for this
function V.tcopy( t )
  local copy = { }
  for k,v in pairs(t) do
    copy[k] = v
  end
  return copy
end

-- rounding numbers
function V.round( num, decimals )
  local mult = 10^(decimals or 0)
  return math.floor(num * mult + 0.5) / mult
end

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

-- a timer, with callbacks
V.Timer = {
	precision     = 2,		-- number of decimals
 	post_update   = nil,	-- function after each update
 	post_complete = nil,	-- function at end
 	time_initial  = nil,	-- initial time on timer
 	time_left     = nil,	-- current time left
}
function V.Timer.Create( precision )
	local self     = V.tcopy(V.Timer)
	self.precision = precision

	-- the update frame
	self.engine = CreateFrame('Frame')

	return self
end
function V.Timer:Remove()
	self.engine:Kill()
	self = nil
end
function V.Timer:Start( time_left, post_update, post_complete )
		self.time_initial  = time_left
		self.time_left     = time_left
		self.post_update   = post_update
		self.post_complete = post_complete

		self.engine:SetScript('OnUpdate', function(engine, elapsed)
		if self.time_left <= elapsed then
			if post_update then self.post_update(0) end
			if post_complete then self.post_complete() end
			self.engine:SetScript('OnUpdate', nil)
		else
			if self.post_update then self.post_update(V.round(self.time_left, self.precision)) end
		end
		self.time_left = self.time_left - elapsed
	end)
end
function V.Timer:Reset()
	self.time_left = self.time_initial
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
	V.incombat = UnitAffectingCombat("player")
end
V.AddEventListener(updateCombatStatus, "PLAYER_REGEN_ENABLED")
V.AddEventListener(updateCombatStatus, "PLAYER_REGEN_DISABLED")