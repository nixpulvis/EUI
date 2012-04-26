local M, S, V = unpack(select(2, ...))
-----------------------------------------------------------------------
-- EUI Chat
-----------------------------------------------------------------------
EUI:LoadModule("Chat", true)

local function EUI_Chat()
	local chat = EUI:CreatePanel("EUIChatFrame", UIParent)
	chat:SetFrameStrata("BACKGROUND")
	chat:SetFrameLevel(0)
	chat:SetAllPointsOffset(4, ChatFrame1)

	--Skinning
	for i = 1, NUM_CHAT_WINDOWS do
		local chat_frame = _G["ChatFrame"..i]
		local editbox = _G["ChatFrame"..i.."EditBox"]
	
		-- Remove Blizz Style
		chat_frame:StripTextures()
		editbox:StripTextures()
	
		-- Skin Editbox
		editbox:StyleFrame()
		editbox:ClearAllPoints()
		editbox:SetPoint("BOTTOMLEFT", chat, "BOTTOMLEFT")
		editbox:SetPoint("BOTTOMRIGHT", chat, "BOTTOMRIGHT")
		editbox:SetHeight(24)
	
		-- Hide the chat arrow buttons.
		_G["ChatFrame"..i.."ButtonFrame"]:Hide()
	end
	ChatFrameMenuButton:Kill()
	FriendsMicroButton:Hide()

	-- Setting the Default Position and Size
	local function setDefault()	
		-- default position
		ChatFrame1:ClearAllPoints()
		ChatFrame1:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 10, 10)
	
		-- default chat size
		ChatFrame1:SetSize(300, 200)
	
		FCF_SavePositionAndDimensions(ChatFrame1)
	end

	-- Code to be called on install
	local function install()
		setDefault()
	end
	M["Chat"].install = install
end