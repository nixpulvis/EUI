local M, S, V = unpack(select(2, ...))
-----------------------------------------------------------------------
-- EUI Chat (needs install)
-----------------------------------------------------------------------
local chat = V:NewModule("chat")

function chat:load()	
	local chatframe = V:CreateElement("EUIChatFrame", chat, UIParent)
	chatframe:SetFrameStrata("BACKGROUND")
	chatframe:SetFrameLevel(0)
	chatframe:SetPoint("TOPLEFT", ChatFrame1, "TOPLEFT", -4, 24)
	chatframe:SetPoint("BOTTOMRIGHT", ChatFrame1, "BOTTOMRIGHT", 2, -6)
	
	--Skinning
	for i = 1, NUM_CHAT_WINDOWS do
		local blizzcf = _G["ChatFrame"..i]
		local editbox = _G["ChatFrame"..i.."EditBox"]
		local tab = _G["ChatFrame"..i.."Tab"]
	
		-- Remove Blizz Style
		blizzcf:StripTextures()
		editbox:StripTextures()
	
		-- Skin Editbox
		editbox:StyleFrame()
		editbox:ClearAllPoints()
		editbox:SetPoint("BOTTOMLEFT", chatframe, "BOTTOMLEFT")
		editbox:SetPoint("BOTTOMRIGHT", chatframe, "BOTTOMRIGHT")
		editbox:SetHeight(24)
		
		-- everytime the editbox would normally lower alpha, hide it
		editbox:Hide()
		editbox:HookScript("OnEditFocusLost", function(self) self:Hide() end)
	
		-- Hide the chat arrow buttons.
		_G["ChatFrame"..i.."ButtonFrame"]:Hide()
		
		
		-- TABS --
		tab:StripTextures()
		tab.bottomline = V:CreatePanel(nil, tab)
		tab.bottomline:SetPoint("LEFT", tab, "BOTTOMLEFT")
		tab.bottomline:SetPoint("RIGHT", tab, "BOTTOMRIGHT")
		tab.bottomline:SetHeight(1)		
		
	end
	ChatFrameMenuButton:Kill()
	FriendsMicroButton:Hide()
	
	-- Chat info
	local info_panel = V:CreatePanel("EUIChatInfoPanel", chatframe)
	info_panel:SetPoint("BOTTOMLEFT", chatframe, "TOPLEFT", 0, 3)
	info_panel:SetPoint("BOTTOMRIGHT", chatframe, "TOPRIGHT", 0, 3)
	info_panel:SetHeight(20)
	
	info_panel.text = V.SetFontString(info_panel, V.media.fonts.main, 12)
	info_panel.text:SetText("GUILD")
	info_panel.text:SetPoint("CENTER")

	info_panel:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(info_panel, "ANCHOR_TOP")
		GameTooltip:ClearLines()
		
		-- Guild info
		local guildName, guildRankName, guildRankIndex = GetGuildInfo("player")
		GameTooltip:AddDoubleLine(guildName..":", guildRankName)
		
		for i = 1, GetNumGuildMembers() do
			local name, rank, rankIndex, level, class, zone, note,
			officernote, online, status, classFileName,
			achievementPoints, achievementRank, isMobile = GetGuildRosterInfo(i)
			local classc, levelc = RAID_CLASS_COLORS[classFileName], GetQuestDifficultyColor(level)
			
			if online then
				GameTooltip:AddDoubleLine(name, string.format("|cFFFFFFFF%s|r", "["..rank.."] ")..level, classc.r, classc.g, classc.b, levelc.r, levelc.g, levelc.b)
			end
		end
				
		GameTooltip:Show()
	end)
	info_panel:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)
end

-- Code to be called on install
function chat:install()
	local frame = _G["ChatFrame".."1"]
	local id = frame:GetID()

	-- default position
	frame:ClearAllPoints()
	frame:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 10, 10)

	-- default chat size
	local width, height = 300, 200
	frame:SetSize(width, height)
	SetChatWindowSavedDimensions(id, width, height)
	FCF_SavePositionAndDimensions(frame)
end