local E, S, V = unpack(select(2, ...))
-----------------------------------------------------------------------
-- EUI Chat
-----------------------------------------------------------------------

local chat = E:CreatePanel("EUIChatFrame", UIParent)
chat:SetFrameStrata("BACKGROUND")
chat:SetFrameLevel(0)
chat:SetAllPointsOffset(4, ChatFrame1)

--Skinning
for i = 1, NUM_CHAT_WINDOWS do
	local chat_frame = _G["ChatFrame"..i]
	local editbox = _G["ChatFrame"..i.."EditBox"]
	
	chat_frame:StripTextures()
	editbox:StripTextures()
	
	_G["ChatFrame"..i.."ButtonFrame"]:Hide()
end
ChatFrameMenuButton:Kill()
FriendsMicroButton:Hide()

local function setDefaultPosDim()	
	-- default position
	ChatFrame1:ClearAllPoints()
	ChatFrame1:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 10, 10)
	
	-- default chat size
	ChatFrame1:SetSize(300, 200)
	
	FCF_SavePositionAndDimensions(ChatFrame1)
end

function E:Chat_Install()
	setDefaultPosDim()
end

local test_install = E:CreateButton("TestInstall", UIParent)
test_install:SetPoint("CENTER")
test_install:SetScript("OnMouseDown", function() E:Chat_Install() end)