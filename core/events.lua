local M, S, V = unpack(select(2, ...))
-----------------------------------------------------------------------
-- EUI Event Handler
-----------------------------------------------------------------------
--[[ this is designed to make updating information possible without the 
	 need to make a frame just for event handling. ]]

-- the single frame in charge of handling EUI's events
local eventhandler, events = CreateFrame("Frame"), V.events

-- binds the functions in V.events to the event-handler.
local function updateEventRegistration()
	for k,v in pairs(events) do
		if not eventhandler:IsEventRegistered(k) then
			eventhandler:RegisterEvent(k)
			break
		end
		if #v == 0 then
			eventhandler:UnregisterEvent(k)
			events[k] = nil
			break
		end		
	end
end

-- adds the given function to the given event
function V.addEventListener(func, event)
	if V.events[event] == nil then
		V.events[event] = { }
	end
	tinsert(events[event], func)
	updateEventRegistration()
end

-- remove the given function from the given event
function V.removeEventListener(func, event)
	for i,v in ipairs(events[event]) do
		if v == func then tremove(events[event], i) end
	end
	updateEventRegistration()
end

eventhandler:SetScript("OnEvent", function(self, event, ...)
	for i,v in ipairs(events[event]) do
		v(self, ...)
	end
end)