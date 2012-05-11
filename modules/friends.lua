local M, S, V = unpack(select(2, ...))

local friendsList = V:NewModule("friendsList")

function friendsList:load()
	local friendsList = V:CreateElement("EUIFriendsList", friendsList, UIParent)
	
	friendsList:SetFrameStrata("BACKGROUND")
	friendsList:SetFrameLevel(0)
	friendsList:SetPoint("Center", UIParent, "Center", 0, 0)
	
	numFriends = GetNumFriends()
	BnetFriends = BNGetNumFriends()
	
	friendsList.friend = {}
	--maxLength = 100
	colMult = 175
	rowMult = 16
	col, row = 0 , 0
	
	--regular non-Bnet friends
	for i=1, numFriends do
		friendsList.friend[i] = friendsList:CreateEUIString(V.media.fonts.main, 12)
		friendsList.friend[i]:SetText(GetFriendInfo(i))
		friendsList.friend[i]:SetPoint("TOPLEFT", friendsList, "TOPLEFT", 4 + col*colMult, 14 - (row+1)*rowMult)
		row = row+1
	--	if  strlen(friendsList.friend[i]:GetText()) > maxLength then
	--		maxLength = strlen(friendsList.friend[i]:GetText())
	--	end
		if row >= 15 and (i < numFriends or BnetFriends > 0)	then
			col = col+1
			row = 0
		end
	end

	--adds Bnet friends
	for i=1, BnetFriends do
		friendsList.friend[numFriends+i] = friendsList:CreateEUIString(V.media.fonts.main, 12)
		friendsList.friend[numFriends+i]:SetText(select(2, BNGetFriendInfo(i)).." "..select(3, BNGetFriendInfo(i)))
		friendsList.friend[numFriends+i]:SetPoint("TOPLEFT", friendsList, "TOPLEFT", 4 + col*colMult, 14 - rowMult*(row + 1))
		row = row+1
	--	if  strlen(friendsList.friend[numFriends+i]:GetText()) > maxLength then
	--		maxLength = strlen(friendsList.friend[numFriends+i]:GetText())
	--	end
		if row >= 15 and i < BnetFriends	then
			col = col+1
			row = 0
		end
	end
	
	--if there are at least 15 friends, sizes Height to fit 15, else sizes to fit number of friends
	if col > 0 then
		row = 15
	end
	friendsList:SetWidth((col+1)*colMult)
	friendsList:SetHeight(row * rowMult)
end