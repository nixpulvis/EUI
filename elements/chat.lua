local E, S, V = unpack(select(2, ...))
-----------------------------------------------------------------------
-- EUI Chat (needs install)
-----------------------------------------------------------------------
local chat = V:NewElement("chat")

function chat:load()
	local chatframe = V:CreatePanel("EUIChatFrame", UIParent)
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
end

-- Code to be called on install
function chat:install()
	local handler = CreateFrame("Frame")
	handler:RegisterEvent("UPDATE_CHAT_WINDOWS")
	handler:SetScript("OnEvent", function(self, event, ...)
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
		
		-- Never call this again
		self:SetScript("OnEvent", nil)
	end)
end