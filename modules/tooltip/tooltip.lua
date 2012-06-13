local M, S, V = unpack(select(2, ...))
-----------------------------------------------------------------------
-- Tooltip Skinning and Enhancement
-----------------------------------------------------------------------
local GameTooltip = _G["GameTooltip"]

-- These are the Tooltips in the game we want to skin.
local tooltips = {
	GameTooltip,
	ShoppingTooltip1,
	ShoppingTooltip2,
	ShoppingTooltip3,
	WorldMapTooltip,
	WorldMapCompareTooltip1,
	WorldMapCompareTooltip2,
	WorldMapCompareTooltip3,
	ItemRefTooltip,
	FriendsTooltip
}

local t = V:NewModule("tooltip")

function t:load()
	local tooltip = GameTooltip
	local anchor = V.CreateElement(t, "EUITooltipAnchor", UIParent)
	anchor:SetSize(150, 15)
	anchor:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -325, 150)
	anchor:Hide()

	local function PositionTooltip(tt)
		if tt:GetAnchorType() == "ANCHOR_NONE" and anchor then
			local point = anchor:GetPoint()
			if point == "TOPLEFT" then
				tt:ClearAllPoints()
				tt:SetPoint("TOPLEFT", anchor, "BOTTOMLEFT", 0, -5)			
			elseif point == "TOP" then
				tt:ClearAllPoints()
				tt:SetPoint("TOP", anchor, "BOTTOM", 0, -5)			
			elseif point == "TOPRIGHT" then
				tt:ClearAllPoints()
				tt:SetPoint("TOPRIGHT", anchor, "BOTTOMRIGHT", 0, -5)			
			elseif point == "BOTTOMLEFT" or point == "LEFT" then
				tt:ClearAllPoints()
				tt:SetPoint("BOTTOMLEFT", anchor, "TOPLEFT", 0, 5)		
			elseif point == "BOTTOMRIGHT" or point == "RIGHT" then
				tt:ClearAllPoints()
				tt:SetPoint("BOTTOMRIGHT", anchor, "TOPRIGHT", 0, 5)
			else
				tt:ClearAllPoints()
				tt:SetPoint("BOTTOM", anchor, "TOP", 0, 5)		
			end
		end
	end

	local function SkinTooltip(n)
		n:Skin()
	end

	-- Skin the tooltip every time the frame is shown, <3 Tukui
	local function tooltip_PLAYER_ENTERING_WORLD()
		for _,v in pairs(tooltips) do
			if v == ItemRefTooltip then
				v:HookScript("OnTooltipSetItem", SkinTooltip)
			end
			v:HookScript("OnShow", SkinTooltip)
		end
	end
	V.addEventListener(tooltip_PLAYER_ENTERING_WORLD, "PLAYER_ENTERING_WORLD")
	
	-- Position tooltip on update
	GameTooltip:HookScript("OnUpdate", function(self) PositionTooltip(self) end)

	-- Health bar skinning	
	local hp = GameTooltipStatusBar
	hp:Skin()
	hp:ClearAllPoints()
	hp:SetHeight(6)
	hp:SetPoint("BOTTOMLEFT", hp:GetParent(), "TOPLEFT", 0, 3)
	hp:SetPoint("BOTTOMRIGHT", hp:GetParent(), "TOPRIGHT", 0, 3)
	hp:SetStatusBarTexture(V.media.tex.norm)
end