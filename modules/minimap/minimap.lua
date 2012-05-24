local M, S, V = unpack(select(2, ...))
-----------------------------------------------------------------------
-- EUI Minimap
-----------------------------------------------------------------------
local minimap = V:NewModule("minimap")

function minimap:load()
	local EUIMinimap = V.CreateElement(minimap, "EUIMinimap", UIParent)
	EUIMinimap:SetPoint("TOPRIGHT", UIParent, "TOPRIGHT", -20, -20)
	EUIMinimap:SetSize(150,150)
	EUIMinimap:SetFrameStrata("LOW")
	
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

	--set the mail icon
	MiniMapMailIcon:SetTexture(V.media.icons.mail)
		
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
	
	--removes blizzard time clock
	local function RemoveBlizTime(self, name)
		if name == "Blizzard_TimeManager" then
			TimeManagerClockButton:Hide()
			TimeManagerClockButton:SetScript("OnShow", function(self)
				TimeManagerClockButton:Hide()
			end)
		end
	end
	V.addEventListener(RemoveBlizTime, "ADDON_LOADED")
	
	--create a frame for time and put time in it (simply puts in realm time...no local time support yet)
	local clockframe = V.CreateFrame("EUIClockframe", EUIMinimap, 45, 17)
	clockframe:SetPoint("TOP", EUIMinimap, "TOP", 0, -4)
	clockframe:SetFrameStrata("MEDIUM")	

	clockframe.text = clockframe:CreateString("", V.media.fonts.main, 12)
	local displayFormat = string.join("", "%02d", ":%02d")
	clockframe.text:SetPoint("CENTER")
	
	--formats time hour and minute strings to be in 12 or 24 hour format and if its in local time or server time
	local function CalculateTimeValues()
		local hour, minute
		mil_time = GetCVarBool("timeMgrUseMilitaryTime")
		local_time = GetCVarBool("timeMgrUseLocalTime")
		
		if local_time then
			minute = tonumber(date("%M"))
			
			if mil_time then
				hour = tonumber(date("%H"))
				return hour, minute
			else
				hour = tonumber(date("%I"))
				return hour, minute
			end
		else
			hour, minute = GetGameTime()
			if mil_time then
				return hour, minute
			else
				if hour>=12 then
					if hour>12 then hour = hour - 12 end
				else
					if hour == 0 then hour = 12 end
				end
				return hour, minute
			end
		end
	end
	
	--update the time
	local t = 1
	clockframe:SetScript("OnUpdate", function(self, elapsed)
		t = t - elapsed
		
		if t > 0 then return end
		
		local hour, minute = CalculateTimeValues()
		
		--if time is the same, end to save cpu cycles
		if (hour == curHour and minute == curMinute) then
			t = 2
			return
		end
		
		curHour = hour
		curMinute = minute
		
		if t <= 0 then
			local hour, minute = CalculateTimeValues()
			clockframe.text:SetFormattedText(displayFormat, hour, minute)
		end
	end)
	
	--making zone text frame
	local zoneframe = V.CreateFrame("EUIZoneframe", EUIMinimap, 150, 20)
	zoneframe:SetAlpha(0)
	zoneframe:SetPoint("BOTTOM", EUIMinimap, "BOTTOM", 0, 0)
	zoneframe:SetFrameStrata("MEDIUM")
		--making a string to be put into th zone text frame
	local zoneframe_text = zoneframe:CreateFontString("TukuiMinimapZoneText","Overlay")
	zoneframe_text:SetFont(V.media.fonts.main, 12)
	zoneframe_text:SetHeight(12)
	zoneframe_text:SetWidth(zoneframe:GetWidth()-6)
	zoneframe_text:SetPoint("CENTER", zoneframe, "CENTER")
	
	--this sets the text to the zone and colorizes it 
	local function zone_Update()
		local pvp = GetZonePVPInfo()
		zoneframe_text:SetText(GetMinimapZoneText())
		if pvp == "friendly" then
			zoneframe_text:SetTextColor(0.1, 1.0, 0.1)
		elseif pvp == "sanctuary" then
			zoneframe_text:SetTextColor(0.41, 0.8, 0.94)
		elseif pvp == "arena" or pvp == "hostile" then
			zoneframe_text:SetTextColor(1.0, 0.1, 0.1)
		elseif pvp == "contested" then
			zoneframe_text:SetTextColor(1.0, 0.7, 0.0)
		else
			zoneframe_text:SetTextColor(1.0, 1.0, 1.0)
		end
	end
	
	zoneframe:RegisterEvent("PLAYER_ENTERING_WORLD")
	zoneframe:RegisterEvent("ZONE_CHANGED_NEW_AREA")
	zoneframe:RegisterEvent("ZONE_CHANGED")
	zoneframe:RegisterEvent("ZONE_CHANGED_INDOORS")
	zoneframe:RegisterEvent("ADDON_LOADED")
	zoneframe:SetScript("OnEvent", zone_Update)
	
	--event handling to hide zone unless mouse is in minimap
	Minimap:SetScript("OnEnter",function()
		zoneframe:SetAlpha(1)
	end)
	
	Minimap:SetScript("OnLeave",function()
		zoneframe:SetAlpha(0)
	end)

	--clicking the time (LEFTCLICK = stopwatch, RIGHTCLICK = alarm/time manager,
	clockframe:SetScript("OnMouseUp", function(self, button)
		--menu for the dropdown
		local menu = {
			{ text = "Time Menu", isTitle = true, isNotRadio = true, notCheckable = true},
			{ text = "Clock Settings", isNotRadio = true, notCheckable = true,
				func = function() 
					if TimeManagerFrame:IsShown() then
						TimeManagerFrame:Hide()
					else
						TimeManagerFrame:SetPoint("TOPRIGHT", EUIMinimap, "BOTTOMRIGHT", 55, -5)
						TimeManagerFrame:Show()
					end
				end },
			{ text = "Calendar", isNotRadio = true, notCheckable = true,
				func = function()
					GameTimeFrame:Click()
				end },
			{ text = "Stopwatch", isNotRadio = true, notCheckable = true,
				func = function()
					if StopwatchFrame:IsShown() then
						StopwatchFrame:Hide()
					else
						StopwatchFrame:SetPoint("TOPRIGHT", EUIMinimap, "BOTTOMRIGHT", 0, -5)
						StopwatchFrame:Show()
					end
				end
			}
		}
		
		--creating frame and dropdown
		local timemenuframe = CreateFrame("Frame", "TimeMenuFrame", UIParent, "UIDropDownMenuTemplate")
		UIDropDownMenu_SetAnchor(timemenuframe, 0, -5, "TOP", EUIClockframe, "BOTTOM")
		EasyMenu(menu, timemenuframe, EUIClockframe, -20 , 0, "MENU", 2)
	end)
	
	
	--right clicking minimap brings up tracking menu
	Minimap:SetScript("OnMouseUp", function(self, button)
		if button == "RightButton" then	
			UIDropDownMenu_SetAnchor(MiniMapTrackingDropDown, -5, 0, "TOPRIGHT", EUIMinimap, "TOPLEFT")
			ToggleDropDownMenu(1, nil, MiniMapTrackingDropDown)
		else
			Minimap_OnClick(self)
		end
	end)
	
	--scrolling to zoom
	Minimap:EnableMouseWheel(true)
	Minimap:SetScript("OnMouseWheel", function(self, direction)
		if direction > 0 then
			_G.MinimapZoomIn:Click()
		elseif direction < 0 then
			_G.MinimapZoomOut:Click()
		end
	end)	
end