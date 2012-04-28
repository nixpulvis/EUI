local E, S, V = unpack(select(2, ...))
-----------------------------------------------------------------------
-- EUI Event Handler
-----------------------------------------------------------------------
local eventhandler, events = CreateFrame("Frame"), V.events

-- This binds the functions in V.events to the eventhandler.
for k,v in pairs(events) do
	eventhandler:RegisterEvent(k)
end

eventhandler:SetScript("OnEvent", function(self, event, ...)
	for i,v in ipairs(events[event]) do
		v(self, ...)
	end
end)