local E, S, M = unpack(select(2, ...))
do return end -- comment this to enable the examples.
-----------------------------------------------------------------------
-- EUI Examples
-----------------------------------------------------------------------

-- EventMachine
local wooo = E.EventMachine:Add("CURSOR_UPDATE", function(self)
  print("wooo")
end)
local boom = E.EventMachine:Add("CURSOR_UPDATE", function(self)
  print("boom")
end)
E.EventMachine:Remove("CURSOR_UPDATE", wooo) -- remove the wooo printing

local zing = E.EventMachine:Add("PLAYER_XP_UPDATE", function(self, player)
  print(player.."received XP!")
end)

-- super simple spell alert
E.EventMachine:Add("COMBAT_LOG_EVENT_UNFILTERED", function(self, ...)
  local spell = select(13, ...)
  print(spell)
end)