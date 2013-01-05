local M, S, V, F = unpack(select(2, ...))
-----------------------------------------------------------------------
-- EUI Event Handler
-----------------------------------------------------------------------
--[[ this is designed to make updating information possible without the
   need to make a frame just for event handling. ]]

F.Event = { }

-- the single frame in charge of handling EUI's events
local eventhandler, events = CreateFrame("Frame"), V.events

-- binds the functions in V.events to the event-handler.
local function update_event_registration()
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
function F.Event.add(event, func)
  if events[event] == nil then
    events[event] = { }
  end
  tinsert(events[event], func)
  update_event_registration()
end

-- remove the given function from the given event
function F.Event.remove(event, func)
  for i,v in ipairs(events[event]) do
    if v == func then tremove(events[event], i) end
  end
  update_event_registration()
end

-- call every function of an event it occurs
eventhandler:SetScript("OnEvent", function(self, event, ...)
  for i,v in ipairs(events[event]) do
    v(self, ...)
  end
end)