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
		tab.bottomline = V:CreateFrame(nil, tab)
		tab.bottomline:SetPoint("LEFT", tab, "BOTTOMLEFT")
		tab.bottomline:SetPoint("RIGHT", tab, "BOTTOMRIGHT")
		tab.bottomline:SetHeight(1)		
		
	end
	ChatFrameMenuButton:Kill()
	FriendsMicroButton:Hide()
	
	-----------------------------------------------------------------
	-- FRIENDS AND GUILD
	-----------------------------------------------------------------
	
	--Guild
	local guild_panel = V:CreateFrame("EUIChatGuildFrame", chatframe)
	guild_panel:SetPoint("BOTTOMLEFT", chatframe, "TOPLEFT", 0, 3)
	guild_panel:SetPoint("BOTTOMRIGHT", chatframe, "TOP", -2, 3)
	guild_panel:SetHeight(20)
	
	guild_panel.text = guild_panel:CreateEUIString(V.media.fonts.main, 12)
	guild_panel.text:SetPoint("CENTER")
	guild_panel.text:SetText("Guild")

	guild_panel:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(guild_panel, "ANCHOR_TOP")
		GameTooltip:ClearLines()
		
		-- Guild info
		local guildName, guildRankName, guildRankIndex = GetGuildInfo("player")
		GameTooltip:AddDoubleLine(guildName)
		
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
	guild_panel:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)
	guild_panel:SetScript("OnMouseUp", function(self)
		ToggleGuildFrame()
	end)
	
	-- Friends
	local friends_panel = V:CreateFrame("EUIChatGuildFrame", chatframe)
	friends_panel:SetPoint("BOTTOMRIGHT", chatframe, "TOPRIGHT", 0, 3)
	friends_panel:SetPoint("BOTTOMLEFT", chatframe, "TOP", 2, 3)
	friends_panel:SetHeight(20)
	
	friends_panel.text = friends_panel:CreateEUIString(V.media.fonts.main, 12)
	friends_panel.text:SetPoint("CENTER")
	friends_panel.text:SetText("Friends")

	friends_panel:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(friends_panel, "ANCHOR_TOP")
		GameTooltip:ClearLines()
		
		-- Header
		GameTooltip:AddLine("Friends:")
		
		for i = 1, GetNumFriends() do
			local name, level, class, area, connected, status, note = GetFriendInfo(i)
			local classc, levelc = RAID_CLASS_COLORS[class], GetQuestDifficultyColor(level)
			
			if online then
				GameTooltip:AddDoubleLine(name, level, classc.r, classc.g, classc.b, levelc.r, levelc.g, levelc.b)
			end
		end
		
		for i = 1, BNGetNumFriends() do
			local presenceID, givenName, surname, toonName, toonID, client, online,
			 lastOnline, isAFK, isDND, broadcastText, noteText, isFriend, broadcastTime  = BNGetFriendInfo(i)
			local classc = RAID_CLASS_COLORS[class]
			
			if online then
				GameTooltip:AddDoubleLine(givenName.." "..surname, toonName, .3, .35, .9, 1, 1, 1)
			end
		end
				
		GameTooltip:Show()
	end)
	friends_panel:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)
	friends_panel:SetScript("OnMouseUp", function(self)
		ToggleFriendsFrame()
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