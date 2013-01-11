local M, S, V, F = unpack(select(2, ...))
-----------------------------------------------------------------------
-- EUI EventMachine
-----------------------------------------------------------------------
--[[ this is designed to make updating information possible without the
   need to make a frame just for event handling. ]]

F.EventMachine = {
  ['events']       = {},
  ['eventhandler'] = CreateFrame("Frame"),
}

-- adds the given function to the given event
function F.EventMachine:add(event, func)
  if self.events[event] == nil then
    self.events[event] = { }
  end
  tinsert(self.events[event], func)
  self.eventhandler:RegisterEvent(event)
end

-- remove the given function from the given event
function F.EventMachine:remove(event, func)
  for i,v in ipairs(self.events[event]) do
    if v == func then tremove(self.events[event], i) end
  end
  if #self.events[event] == 0 then self.eventhandler:UnregisterEvent(event) end
end

-- start up the event machine, by binding it's OnEvent script
function F.EventMachine:start()
  -- call every function of an event when the event occurs
  self.eventhandler:SetScript("OnEvent", function(handler, event, ...)
    for i,v in ipairs(self.events[event]) do
      v(handler, ...)
    end
  end)
end

-- stop the event machine by setting the OnEvent script to nil
function F.EventMachine:stop()
  self.eventhandler:SetScript("OnEvent", nil)
end