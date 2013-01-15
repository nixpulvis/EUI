local M, S, V, F = unpack(select(2, ...))
-----------------------------------------------------------------------
-- EUI EventMachine
-----------------------------------------------------------------------
--[[ this is designed to make updating information possible without the
   need to make a frame just for event handling.

   Example Usage:
     F.EventMachine:add("PLAYER_LEVEL_UP", function()
       print("You leveled up")
     end)

     As you can see this is useful for doing things on events
     that are not associated with a perticular frame. ]]

F.EventMachine = {
  ['events']       = {},
  ['eventhandler'] = CreateFrame("Frame"),
}

-- F.EventMachine:add : String, Function -> Number
-- Returns the index of this function on a per event basis.
-- adds the given function to the given event. see :remove,
-- for information on removing functions from events.
function F.EventMachine:add(event, func)
  if self.events[event] == nil then
    self.events[event] = {}
  end
  tinsert(self.events[event], func)
  self.eventhandler:RegisterEvent(event)
end

-- F.EventMachine:remove : String, Number -> Boolean
-- Returns true if the given event had a function at the
-- given index, and it was removed from the event machine.
-- The index is the number returned from :add.
function F.EventMachine:remove(event, index)
  --for i,v in ipairs(self.events[event]) do
  --  if v == func then tremove(self.events[event], i) end
  --end
  if self.events[index] then self.events[index] = nil end
  -- if the event doesn't have any functions unregister it.
  if #self.events[event] == 0 then self.eventhandler:UnregisterEvent(event)
  end
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