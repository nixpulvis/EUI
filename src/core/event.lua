local E, S, M = unpack(select(2, ...))
-----------------------------------------------------------------------
-- EUI Event Machine
-----------------------------------------------------------------------
--[[ This is designed to make updating information possible without the
     need to make a frame just for event handling.

  Example Usage:
    E.Event:add("PLAYER_LEVEL_UP", function()
      print("You leveled up")
    end)

  As you can see this is useful for doing things on events that are not
  associated with a perticular frame. ]]

E.Event = {
  ['events']       = {},
  ['eventhandler'] = CreateFrame("Frame"),
}

-- nil_index : Table -> Number
-- Returns the index of the first nil slot in this table.
local function nil_index(t)
  local index
  for i,v in pairs(t) do
    if not v then
      index = i
      break
    end
  end

  if not index then
    index = #t + 1
  end

  return index
end

-- E.Event:Add : string, function -> [string, number]
-- Returns the index of this function on a per event basis.
-- Adds the given function to the given event. See :remove,
-- for information on removing functions from events.
function E.Event:Add(event, func)
  if self.events[event] == nil then
    self.events[event] = {}
  end
  -- Add the function to the first nil space in the table or at the end.
  local index = nil_index(self.events[event])
  self.events[event][index] = func
  -- Register the event.
  self.eventhandler:RegisterEvent(event)
  return event, index
end

-- E.Event:Remove : [string, number] -> boolean
-- Returns true if the given event had a function at the
-- given index, and it was removed from the event machine.
-- The index is the number returned from :add.
function E.Event:Remove(event, index)
  local before = #self.events[event]
  table.remove(self.events[event], index)
  local after = #self.events[event]

  -- if the event doesn't have any functions unregister it.
  if after == 0 then self.eventhandler:UnregisterEvent(event) end

  if before == after then
    return false
  else
    return true
  end
end

-- E.Event:Reset()
-- Removes all functions from the event machines table, and unregesters all
-- events on the event handler.
function E.Event:Reset()
  self.events = {} -- this is bad. we should dump the existing table.
  self.eventhandler:UnregisterAllEvents()
end

-- E.Event:Start()
-- Start up the event machine, by binding it's OnEvent script
function E.Event:start()
  -- call every function of an event when the event occurs
  self.eventhandler:SetScript("OnEvent", function(handler, event, ...)
    for _,func in pairs(self.events[event]) do
      if func then func(handler, ...) end
    end
  end)
end

-- E.Event:Stop()
-- Stop the event machine by setting the OnEvent script to nil.
function E.Event:stop()
  self.eventhandler:SetScript("OnEvent", nil)
end

E.Event:start() -- Just like that the beast is alive.
