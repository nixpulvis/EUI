print("it Loaded nigger")
print(addon)
local M, S, V = unpack(select(2, ...))

local friendsList = V:NewModule("friendsList")

function friendsList:load()
	local friendsList = V:CreateElement("EUIFriendsList", friendsList, UIParent)
	
	friendsList:SetFrameStrata("BACKGROUND")
	friendsList:SetFrameLevel(0)
	friendsList:SetPoint("Center", UIParent, "Center", 0, 0)
	
	numFriends = GetNumFriends()
	
	friendsList:setWidth(100)
	friendsList:setHeight(numFriends*20)
	
	local friendsList.friend
	for i=1, numFriends do
		friendsList.friend[i] = V.SetFontString(friendsList, V.media.font.main, 12)
		friendsList.friend[i]:SetText(GetFriendInfo(i))
		freindsList.friend[i]:SetPoint("TOPLEFT", friendsList, "TOPLEFT", 4, -i*20)
	end
	
end