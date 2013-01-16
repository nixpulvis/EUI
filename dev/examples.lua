local M, S, V, F = unpack(select(2, ...))
do return end -- comment this to enable the examples.
-----------------------------------------------------------------------
-- EUI Examples <:O:>
-----------------------------------------------------------------------
--[[ My baby takes the morning train
     He works from nine 'til five and then
     He takes another home again
     To find me waiting for him ]]

-- EventMachine
local wooo = F.EventMachine:add("CURSOR_UPDATE", function(self)
  print("wooo")
end)
local boom = F.EventMachine:add("CURSOR_UPDATE", function(self)
  print("boom")
end)
F.EventMachine:remove("CURSOR_UPDATE", wooo) -- remove the wooo printing

local zing = F.EventMachine:add("PLAYER_XP_UPDATE", function(self, player)
  print(player.."received XP!")
end)

-- super simple spell alert
F.EventMachine:add("COMBAT_LOG_EVENT_UNFILTERED", function(self, ...)
  local spell = select(13, ...)
  print(spell)
end)