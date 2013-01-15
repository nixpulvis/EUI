local M, S, V, F = unpack(select(2, ...))
-----------------------------------------------------------------------
-- EUI Developer Testing File <:O:>
-----------------------------------------------------------------------
--[[ Where everybody knows your name, and they're always glad you came.
     You wanna be where you can see, our troubles are all the same
     You wanna be where everybody knows Your name. ]]

-- Make this file easy to toggle on and off
if not V.TEST then return end

-- Event Testing
local wooo = F.EventMachine:add("COMBAT_LOG_EVENT", function(self)
  print("wooo")
end)
local boom = F.EventMachine:add("COMBAT_LOG_EVENT", function(self)
  print("boom")
end)
F.EventMachine:remove("COMBAT_LOG_EVENT", wooo)

local ding = F.EventMachine:add("PLAYER_XP_UPDATE", function(self, player)
  print("ding")
end)
local zing = F.EventMachine:add("PLAYER_XP_UPDATE", function(self, player)
  print(player)
end)
F.EventMachine:remove("PLAYER_XP_UPDATE", ding)
F.EventMachine:remove("PLAYER_XP_UPDATE", zing)

-- print tests
if F.EventMachine.eventhandler:IsEventRegistered("COMBAT_LOG_EVENT") then
  print("pass")
end
if not F.EventMachine.eventhandler:IsEventRegistered("PLAYER_XP_UPDATE") then
  print("pass")
end