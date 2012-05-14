local M, S, V = unpack(select(2, ...))
-----------------------------------------------------------------------
-- EUI Chat (needs install)
-----------------------------------------------------------------------
function V.CreateFriendsPanel()
	local friends_panel = V:CreateFrame("EUIChatGuildFrame", EUIChatFrame1)
	friends_panel:SetPoint("BOTTOMRIGHT", EUIChatFrame1, "TOPRIGHT", 0, 3)
	friends_panel:SetPoint("BOTTOMLEFT", EUIChatFrame1, "TOP", 2, 3)
	friends_panel:SetHeight(20)

	friends_panel.text = friends_panel:CreateString("Friends", V.media.fonts.main, 12)
	friends_panel.text:SetPoint("CENTER")

	friends_panel:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(friends_panel, "ANCHOR_TOP")
		GameTooltip:ClearLines()
	
		-- header
		GameTooltip:AddLine("Friends")
		
		-- world of warcraft friends
		local num_friends, num_online_friends = GetNumFriends()
		if num_online_friends > 0 then GameTooltip:AddLine(" ") GameTooltip:AddLine("Ingame Friends:") end
		for i = 1, num_friends do
			local name, level, class, area, online, status, note = GetFriendInfo(i)
			local classc, levelc = RAID_CLASS_COLORS[string.upper(class)], GetQuestDifficultyColor(level)
		
			if online then
				GameTooltip:AddDoubleLine(name, level, classc.r, classc.g, classc.b, levelc.r, levelc.g, levelc.b)
			end
		end
	
		-- BN Friends
		local numBNFriends, numBNOnlineFriends = BNGetNumFriends()
		if numBNOnlineFriends > 0 then GameTooltip:AddLine(" ") GameTooltip:AddLine("BN Friends:") end
		for i = 1, numBNFriends do
			local presenceID, givenName, surname, toonName, toonID, client, online,
			 lastOnline, isAFK, isDND, broadcastText, noteText, isFriend, broadcastTime  = BNGetFriendInfo(i)
		
			if online then
				GameTooltip:AddDoubleLine(givenName.." "..surname, "Playing "..client, 1,1,1,1,1,1)
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