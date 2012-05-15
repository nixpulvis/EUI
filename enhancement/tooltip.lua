local M, S, V = unpack(select(2, ...))
-----------------------------------------------------------------------
-- Tooltip Skinning and Enhancement
-----------------------------------------------------------------------
local t = V:NewModule("tooltip")

function t:load()
	local tooltip = GameTooltip
	local anchor = V:CreateElement(t, "EUITooltipAnchor", UIParent)
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

	local function SkinTooltip()
		tooltip:StripTextures()
		tooltip:StyleFrame()
	end
	
	-- First things first, skin this shit.
	SkinTooltip()
	
	-- turns out blizz hates being skinned, TOO BAD.
	hooksecurefunc("GameTooltip_OnLoad", SkinTooltip)
	hooksecurefunc("GameTooltip_OnHide", SkinTooltip)
	
	hooksecurefunc("GameTooltip_SetDefaultAnchor", function(self, parent)
		PositionTooltip(self)
	end)
	
	local function Tooltip_OnUpdate(self, elapsed)
		PositionTooltip(self)
	end
	
	GameTooltip:HookScript("OnUpdate", Tooltip_OnUpdate)
end