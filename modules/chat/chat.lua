local M, S, V = unpack(select(2, ...))
-----------------------------------------------------------------------
-- EUI Chat (needs install)
-----------------------------------------------------------------------
local chat = V:NewModule("chat")

function chat:load()		
	-- show and hide backgrounds
	hooksecurefunc("FCF_UnDockFrame", function(chatframe)
		local id = chatframe:GetID()
		local shown = select(7, FCF_GetChatWindowInfo(chatframe:GetID()))

		if shown then
			_G["EUIChatFrame"..id]:Show()
		end
	end)
	hooksecurefunc("FCF_DockFrame", function(chatframe, index, selected)
		local id = chatframe:GetID()
		if id == 1 then return end
		_G["EUIChatFrame"..id]:Hide()
	end)
	hooksecurefunc("FCF_Close", function(chatframe, index, selected)
		local id = chatframe:GetID()
		_G["EUIChatFrame"..id]:Hide()
	end)

	--skinning
	for i = 1, NUM_CHAT_WINDOWS do
		local blizzcf = _G["ChatFrame"..i]
		local editbox = _G["ChatFrame"..i.."EditBox"]
		local tab = _G["ChatFrame"..i.."Tab"]
	
		-- give every chatframe a background. just hide it until needed.
		local background = V:CreateElement("EUIChatFrame"..i, chat, UIParent)
		background:SetFrameStrata("BACKGROUND")
		background:SetFrameLevel(0)
		background:SetPoint("TOPLEFT", blizzcf, "TOPLEFT", -4, 24)
		background:SetPoint("BOTTOMRIGHT", blizzcf, "BOTTOMRIGHT", 2, -6)
		if  i ~= 1 then background:Hide() end
	
		-- remove blizzard style
		blizzcf:StripTextures()
		editbox:StripTextures()
	
		-- skin editbox
		editbox:StyleFrame()
		editbox:ClearAllPoints()
		editbox:SetPoint("BOTTOMLEFT", EUIChatFrame1, "BOTTOMLEFT")
		editbox:SetPoint("BOTTOMRIGHT", EUIChatFrame1, "BOTTOMRIGHT")
		editbox:SetHeight(24)
		
		-- everytime the editbox would normally lower alpha, hide it
		editbox:Hide()
		editbox:HookScript("OnEditFocusLost", function(self) self:Hide() end)
	
		-- hide the chat arrow buttons.
		_G["ChatFrame"..i.."ButtonFrame"]:Hide()
		_G["ChatFrame"..i.."ButtonFrame"]:SetScript("OnShow", function(self)
			self:Hide()
		end)
		
		-- tabs
		tab:StripTextures()
		tab.bottomline = V:CreateFrame(nil, tab)
		tab.bottomline:SetPoint("LEFT", tab, "BOTTOMLEFT")
		tab.bottomline:SetPoint("RIGHT", tab, "BOTTOMRIGHT")
		tab.bottomline:SetHeight(1)			
	end
	ChatFrameMenuButton:Kill()
	FriendsMicroButton:Hide()
	
	--add Friends and Guild pane
	V.CreateFriendsPanel()
	V.CreateGuildPanel()
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