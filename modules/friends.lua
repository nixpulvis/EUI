print("it Loaded nigger")
local M, S, V = unpack(select(2, ...))

local friendsList = V:NewModule("friendsList")

function friendsList:load()
	local friendsList = V:CreateElement("EUIFriendsList", friendsList, UIParent)
	
	friendsList:SetFrameStrata("BACKGROUND")
	friendsList:SetFrameLevel(0)
	friendsList:SetPoint("Center", UIParent, "Center", 0, 0)
	
	numFriends = GetNumFriends()
	
	friendsList:SetWidth(100)
	friendsList:SetHeight(numFriends*20)
	
	friendsList.friend = {}
	for i=1, numFriends do
		friendsList.friend[i] = V.SetFontString(friendsList, V.media.fonts.main, 12)
		friendsList.friend[i]:SetText(GetFriendInfo(i))
		friendsList.friend[i]:SetPoint("TOPLEFT", friendsList, "TOPLEFT", 4, -i*20+16)
	end
	
end