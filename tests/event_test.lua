local E, S, M = unpack(select(2, ...))

-- Setup some events, and an increment variable.
local i = 0
local function allow_twice()
  E.Test:assert(i < 2)
  i = i + 1
end

local inc1 = E.Event:Add("PLAYER_LOGIN", allow_twice)
local inc2 = E.Event:Add("PLAYER_ENTERING_WORLD", allow_twice)
local dec1 = E.Event:Add("PLAYER_ENTERING_WORLD", allow_twice)
E.Test:Assert(E.Event.eventhandler:IsEventRegistered("PLAYER_LOGIN"))
E.Test:Assert(E.Event.eventhandler:IsEventRegistered("PLAYER_ENTERING_WORLD"))

E.Event:Remove(dec1)
E.Test:Assert(E.Event.eventhandler:IsEventRegistered("PLAYER_LOGIN"))
E.Test:Assert(E.Event.eventhandler:IsEventRegistered("PLAYER_ENTERING_WORLD"))

E.Event:Remove(inc2)
E.Test:Assert(E.Event.eventhandler:IsEventRegistered("PLAYER_LOGIN"))
E.Test:Deny(E.Event.eventhandler:IsEventRegistered("PLAYER_ENTERING_WORLD"))

E.Event:Remove(inc1)
E.Test:Deny(E.Event.eventhandler:IsEventRegistered("PLAYER_LOGIN"))
E.Test:Deny(E.Event.eventhandler:IsEventRegistered("PLAYER_ENTERING_WORLD"))

-- TODO: How to test that `allow_twice` was called?

E.Test:Report()
