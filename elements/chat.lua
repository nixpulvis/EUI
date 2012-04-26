local E, S, V = unpack(select(2, ...))
-----------------------------------------------------------------------
-- EUI Chat (needs install)
-----------------------------------------------------------------------
local chat = EUI:NewElement("chat")

function chat:load()
	local chatframe = EUI:CreatePanel("EUIChatFrame", UIParent)
	chatframe:SetFrameStrata("BACKGROUND")
	chatframe:SetFrameLevel(0)
	chatframe:SetAllPointsOffset(4, ChatFrame1)

	--Skinning
	for i = 1, NUM_CHAT_WINDOWS do
		local blizzcf = _G["ChatFrame"..i]
		local editbox = _G["ChatFrame"..i.."EditBox"]
	
		-- Remove Blizz Style
		blizzcf:StripTextures()
		editbox:StripTextures()
	
		-- Skin Editbox
		editbox:StyleFrame()
		editbox:ClearAllPoints()
		editbox:SetPoint("BOTTOMLEFT", chatframe, "BOTTOMLEFT")
		editbox:SetPoint("BOTTOMRIGHT", chatframe, "BOTTOMRIGHT")
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
	self.install = install
end