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

-- size : Table -> Number
-- Returns the size of this table, ignoring occurrences of V.noop.
local function size(t)
  local n = 0
  for i,v in ipairs(t) do
    if v ~= V.noop then n = n + 1 end
  end
  return n
end

-- F.EventMachine:add : String, Function -> Number
-- Returns the index of this function on a per event basis.
-- adds the given function to the given event. see :remove,
-- for information on removing functions from events.
function F.EventMachine:add(event, func)
  if self.events[event] == nil then
    self.events[event] = {}
  end
  -- Add the function to the first noop space in the table or at the end.
  local index
  for i,v in ipairs(self.events[event]) do
    if v == V.noop then
      index = i
      break
    end
  end
  if not index then
    index = #self.events[event]+1
  end
  self.events[event][index] = func
  -- Register the event.
  self.eventhandler:RegisterEvent(event)
  return index
end

-- F.EventMachine:remove : String, Number -> Boolean
-- Returns true if the given event had a function at the
-- given index, and it was removed from the event machine.
-- The index is the number returned from :add.
function F.EventMachine:remove(event, index)
  if self.events[event][index] then self.events[event][index] = V.noop end
  -- if the event doesn't have any functions unregister it.
  if size(self.events[event]) == 0 then self.eventhandler:UnregisterEvent(event)
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

F.EventMachine:start() -- and just like that the beast is alive