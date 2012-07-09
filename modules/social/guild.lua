local M, S, V = unpack(select(2, ...))
-----------------------------------------------------------------------
-- EUI Chat (needs install)
-----------------------------------------------------------------------
function V.CreateGuildPanel()
	local guild_panel = V.CreateFrame("EUIChatGuildFrame", EUIChatFrame1)
	guild_panel:SetPoint("BOTTOMLEFT", EUIChatFrame1, "TOPLEFT", 0, 3)
	guild_panel:SetPoint("BOTTOMRIGHT", EUIChatFrame1, "TOP", -2, 3)
	guild_panel:SetHeight(20)

	guild_panel.text = guild_panel:CreateString("Guild", V.media.fonts.main, 12)
	guild_panel.text:SetPoint("CENTER")

	guild_panel:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(guild_panel, "ANCHOR_TOP", 0, 5)
		GameTooltip:ClearLines()
		
		if not IsInGuild() then
			GameTooltip:AddLine("Not In Guild") 
		else
			-- Guild info
			local guildName, guildRankName, guildRankIndex = GetGuildInfo("player")
			local numTotalMembers, numOnlineMembers = GetNumGuildMembers();
			GameTooltip:AddDoubleLine(guildName.." ["..GetGuildLevel().."]", numOnlineMembers.."/"..numTotalMembers)
			GameTooltip:AddLine(" ")
		
			for i = 1, GetNumGuildMembers() do
				local name, rank, rankIndex, level, class, zone, note,
				officernote, online, status, classFileName,
				achievementPoints, achievementRank, isMobile = GetGuildRosterInfo(i)
				local classc, levelc = RAID_CLASS_COLORS[classFileName], GetQuestDifficultyColor(level)
			
				if online then
					GameTooltip:AddDoubleLine(name, string.format("|cFFFFFFFF%s|r", "["..rank.."] ")..level, classc.r, classc.g, classc.b, levelc.r, levelc.g, levelc.b)
				end
			end
		end
		
		GameTooltip:Show()
	end)
	guild_panel:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)
	guild_panel:SetScript("OnMouseUp", function(self)
		ToggleGuildFrame()
	end)
end