print("at least it loaded")
local M, S, V = unpack(select(2, ...))

--_G["MinimapCluster"]:Hide()

local minimap = V:NewModule("minimap")
function minimap:load()
	local EUIMinimap = V:CreateElement("EUIMinimap", minimap, UIParent)
	EUIMinimap:SetPoint("TOPRIGHT", UIParent, "TOPRIGHT", -20, -20)
	EUIMinimap:SetSize(150,150)
	EUIMinimap:SetFrameStrata("LOW")
	--EUIMinimap:
	
	-- squarifies the map
	Minimap:SetMaskTexture(V.media.tex.blank)
	function GetMinimapShape() return "SQUARE" end
	
	--hides border
	MinimapBorder:Hide()
	MinimapBorderTop:Hide()
	
	--hides the zone text
	MinimapZoneTextButton:Hide()
	
	-- sets blizz.Minimap's parent to EUIMinimap and anchors it correctly
	Minimap:SetParent(EUIMinimap)
	Minimap:ClearAllPoints()
	Minimap:SetPoint("TOPLEFT", 2, -2)
	Minimap:SetPoint("BOTTOMRIGHT", -2, 2)
	Minimap:SetSize(150,150)
	
	--hides world map button
	MiniMapWorldMapButton:Hide()
	
	--gets rid of the "N" at the top of the map signifying North
	MinimapNorthTag:SetTexture(nil)
	
	--hide the zoom
	MinimapZoomIn:Hide()
	MinimapZoomOut:Hide()
	
	--hide voice chat just in case someone actually does enable it
	MiniMapVoiceChatFrame:Hide()
	
	--hide calendar
	GameTimeFrame:Hide()
	
	--moves mail to inside map frame on TOPRIGHT and removes border
	MiniMapMailFrame:ClearAllPoints()
	MiniMapMailFrame:SetPoint("TOPRIGHT", Minimap, 3, 3)
	MiniMapMailBorder:Hide()
		--need to make a mail icon with transparent background
		
	--put battleground icon in BOTTOMRIGHT corner
	MiniMapBattlefieldFrame:ClearAllPoints()
	MiniMapBattlefieldFrame:SetPoint("BOTTOMRIGHT", Minimap, 0, 0)
	MiniMapBattlefieldBorder:Hide()
	
	--puts dungeon difficulty in TOPLEFT corner
	MiniMapInstanceDifficulty:ClearAllPoints()
	MiniMapInstanceDifficulty:SetParent(Minimap)
	MiniMapInstanceDifficulty:SetPoint("TOPLEFT", Minimap, "TOPLEFT", 0, 0)
	GuildInstanceDifficulty:ClearAllPoints()
	GuildInstanceDifficulty:SetParent(Minimap)
	GuildInstanceDifficulty:SetPoint("TOPLEFT", Minimap, "TOPLEFT", 0, 0)
	
	--put LFG/LFR icon in BOTTOMLEFT corner
	MiniMapLFGFrame:ClearAllPoints()
	MiniMapLFGFrame:SetPoint("BOTTOMLEFT", Minimap, 0, 0)
	MiniMapLFGFrameBorder:Hide()
	
	--hide tracking
	MiniMapTracking:Hide()
	
	--create a frame for time and put time in it (simply puts in realm time...no local time support yet)
	local clockframe = V:CreateFrame("clockframe", EUIMinimap, 40, 15)
	clockframe:SetPoint("CENTER", EUIMinimap, "BOTTOM", 0, 0)
	clockframe:SetFrameStrata("MEDIUM")
	
	local hour, minute = GetGameTime()
	clockframe.text = clockframe:CreateEUIString(V.media.fonts.main, 12)
	clockframe.text:SetPoint("CENTER")
	clockframe.text:SetText(hour .. ":" .. minute)
	
	--removes blizzard time clock
	local f = CreateFrame("Frame", nil, UIParent)
	f:RegisterEvent("ADDON_LOADED")
	f:SetScript("OnEvent", function(self, event, name)
		if name == "Blizzard_TimeManager" then
			TimeManagerClockButton:Hide()
			TimeManagerClockButton:SetScript("OnShow", function(self)
				TimeManagerClockButton:Hide()
			end)
		end
	end)
	
	--making zone text frame
	local zoneframe = V:CreateFrame("zoneframe", EUIMinimap, 150, 20)
	zoneframe:SetAlpha(0)
	zoneframe:SetPoint("TOP", EUIMinimap, "TOP", 0, 0)
	zoneframe:SetFrameStrata("MEDIUM")
	zoneframe.text = zoneframe:CreateEUIString(V.media.fonts.main, 12)
	zoneframe.text:SetAlpha(0)
	zoneframe.text:SetPoint("CENTER")
	--this sets the text to the zone and colorizes it 
	local zone_Update = function()
		local pvp = GetZonePVPInfo()
		zoneframe.text:SetText(GetMinimapZoneText())
		if pvp == "friendly" then
			zoneframe.text:SetTextColor(0.1, 1.0, 0.1)
		elseif pvp == "sanctuary" then
			zoneframe.text:SetTextColor(0.41, 0.8, 0.94)
		elseif pvp == "arena" or pvp == "hostile" then
			zoneframe.text:SetTextColor(1.0, 0.1, 0.1)
		elseif pvp == "contested" then
			zoneframe.text:SetTextColor(1.0, 0.7, 0.0)
		else
			zoneframe.text:SetTextColor(1.0, 1.0, 1.0)
		end
	end
	zoneframe:RegisterEvent("PLAYER_ENTERING_WORLD")
	zoneframe:RegisterEvent("ZONE_CHANGED_NEW_AREA")
	zoneframe:RegisterEvent("ZONE_CHANGED")
	zoneframe:RegisterEvent("ZONE_CHANGED_INDOORS")
	zoneframe:SetScript("OnEvent",zone_Update)
	
	
	
	--event handling to hide zone unless mouse is in minimap
	Minimap:SetScript("OnEnter",function()
		zoneframe:SetAlpha(1)
		zoneframe.text:SetAlpha(1)
	end)
	
	Minimap:SetScript("OnLeave",function()
		zoneframe:SetAlpha(0)
		zoneframe.text:SetAlpha(0)
	end)

	
	--scrolling to zoom
	Minimap:EnableMouseWheel(true)
	Minimap:SetScript("OnMouseWheel", function(self, d)
	if d > 0 then
		_G.MinimapZoomIn:Click()
	elseif d < 0 then
		_G.MinimapZoomOut:Click()
	end
end)
	
end