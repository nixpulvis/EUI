local E, S, M = unpack(select(2, ...))

E.Test:Create(function()
  local frame = E.Frame()
  E.Test:Assert(frame:GetParent() == UIParent)
end)

E.Test:Create(function()
  local button = E.Button()
  E.Test:Assert(button:GetParent() == UIParent)
end)
