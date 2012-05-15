local M, S, V = unpack(select(2, ...))
-----------------------------------------------------------------------
-- Tooltip Skinning and Enhancement
-----------------------------------------------------------------------
print("tooltip: Loaded")

local tooltip = GameTooltip

local function SkinTooltip()
	tooltip:StripTextures()
	tooltip:StyleFrame()
end

hooksecurefunc("GameTooltip_OnLoad", SkinTooltip)
hooksecurefunc("GameTooltip_OnHide", SkinTooltip)