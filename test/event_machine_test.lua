local M, S, V, F = unpack(select(2, ...))
if not V.TEST then return end
-----------------------------------------------------------------------
-- EventMachine Test File <:O:>
-----------------------------------------------------------------------
--[[ Where everybody knows your name, and they're always glad you came.
     You wanna be where you can see, our troubles are all the same
     You wanna be where everybody knows Your name. ]]

-- Event Testing
local wooo = F.EventMachine:add("CURSOR_UPDATE", function(self)
  print("wooo")
end)
local boom = F.EventMachine:add("CURSOR_UPDATE", function(self)
  print("boom")
end)
F.EventMachine:remove("CURSOR_UPDATE", wooo)

local ding = F.EventMachine:add("PLAYER_XP_UPDATE", function(self, player)
  print("ding")
end)
local zing = F.EventMachine:add("PLAYER_XP_UPDATE", function(self, player)
  print(player)
end)
F.EventMachine:remove("PLAYER_XP_UPDATE", ding)
F.EventMachine:remove("PLAYER_XP_UPDATE", zing)

-- print tests
F.Test:assert(F.EventMachine.eventhandler:IsEventRegistered("CURSOR_UPDATE"))
F.Test:deny(F.EventMachine.eventhandler:IsEventRegistered("PLAYER_XP_UPDATE"))
F.Test:report()

-- clean up
F.EventMachine:remove("CURSOR_UPDATE", boom)