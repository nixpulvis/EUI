local E, S, V = unpack(select(2, ...))
-----------------------------------------------------------------------
-- EUI Utility Functions
-----------------------------------------------------------------------
local eventhandler, events = CreateFrame("Frame"), { }



function V:Test()
	print("test")
end

-- Keep V.mylevel updated
function events:PLAYER_LEVEL_UP()
	V.mylevel = UnitLevel("player")
end
-- Keep V.incombat updated
function events:PLAYER_REGEN_DISABLED()
	V.incombat = true
end
function events:PLAYER_REGEN_ENABLED()
	V.incombat = false
end








for k,v in pairs(events) do
	eventhandler:RegisterEvent(k)
end
eventhandler:SetScript("OnEvent", function(self, event, ...)
	events[event](self, ...)
end)