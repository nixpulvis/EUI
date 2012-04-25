local E, S = unpack(select(2, ...))
-----------------------------------------------------------------------
-- EUI Chat
-----------------------------------------------------------------------

local chat = E:CreatePanel("EUIChatFrame", ChatFrame1)
chat:SetFrameLevel(0)
chat:SetAllPointsOffset(4)


local f = CreateFrame("Frame")
f:RegisterEvent("UPDATE_CHAT_WINDOWS")
f:RegisterEvent("UPDATE_FLOATING_CHAT_WINDOWS")

f:SetScript("OnEvent", function()
	
	ChatFrame1:StripTextures()
	SetChatWindowSavedDimensions(1, 1000, 175);

	ChatFrame1EditBox:StripTextures()
	
end)