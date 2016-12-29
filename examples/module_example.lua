local E, S, M = unpack(select(2, ...))

-- Module Example
-----------------
local M.mod = E.Module:Create()
local frame = CreateFrame("Frame", UIParent)
M.mod:AddElement(frame)
M.mod:OnLoad(function()
  print("mod loaded")
end)
M.mod:OnUnload(function()
  print("mod unloaded")
end)
