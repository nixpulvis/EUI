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

		if shown and _G["EUIChatFrame"..id] then
			_G["EUIChatFrame"..id]:Show()
		end
	end)
	hooksecurefunc("FCF_DockFrame", function(chatframe, index, selected)
		local id = chatframe:GetID()
		if id == 1 or not _G["EUIChatFrame"..id] then return end
		_G["EUIChatFrame"..id]:Hide()
	end)
	hooksecurefunc("FCF_Close", function(chatframe, index, selected)
		local id = chatframe:GetID()

		if _G["EUIChatFrame"..id] then
			_G["EUIChatFrame"..id]:Hide()
		end
	end)

	-- Style default windows (1 - 10)
	for i = 1, NUM_CHAT_WINDOWS do
		local blizzcf = _G["ChatFrame"..i]
		local editbox = _G["ChatFrame"..i.."EditBox"]
		local tab = _G["ChatFrame"..i.."Tab"]
	
		-- give every chatframe a background. just hide it until needed.
		local background = V:CreateElement("EUIChatFrame"..i, chat, UIParent)
		background:SetFrameStrata("BACKGROUND")
		background:SetFrameLevel(0)
		background:SetPoint("TOPLEFT", blizzcf, "TOPLEFT", -4, 28)
		background:SetPoint("BOTTOMRIGHT", blizzcf, "BOTTOMRIGHT", 2, -6)
		if  i ~= 1 then background:Hide() end
	
		-- remove blizzard style
		blizzcf:StripTextures()
		editbox:StripTextures()
	
		-- skin editbox
		editbox:StyleFrame(.9)
		editbox:ClearAllPoints()
		editbox:SetPoint("BOTTOMLEFT", background, "BOTTOMLEFT")
		editbox:SetPoint("BOTTOMRIGHT", background, "BOTTOMRIGHT")
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
		-- make that line under each tab
		tab.bottomline = V:CreateFrame(nil, tab)
		tab.bottomline:SetPoint("LEFT", tab, "BOTTOMLEFT")
		tab.bottomline:SetPoint("RIGHT", tab, "BOTTOMRIGHT")
		tab.bottomline:SetHeight(1)		
	end
	
	-- Style new windows (Whisper/RealID/Convo)
	hooksecurefunc("FCF_OpenTemporaryWindow", function()
		local blizzcf = FCF_GetCurrentChatFrame()
		local name = blizzcf:GetName()
		local editbox = _G[name.."EditBox"]
		local tab = _G[name.."Tab"]
	
		-- give every chatframe a background. just hide it until needed.
		local background = V:CreateElement("EUI".. name, chat, UIParent)
		background:SetFrameStrata("BACKGROUND")
		background:SetFrameLevel(0)
		background:SetPoint("TOPLEFT", blizzcf, "TOPLEFT", -4, 28)
		background:SetPoint("BOTTOMRIGHT", blizzcf, "BOTTOMRIGHT", 2, -6)
		background:Hide()
		
		-- remove blizzard style
		blizzcf:StripTextures()
		editbox:StripTextures()
	
		-- skin editbox
		editbox:StyleFrame(.9)
		editbox:ClearAllPoints()
		editbox:SetPoint("BOTTOMLEFT", background, "BOTTOMLEFT")
		editbox:SetPoint("BOTTOMRIGHT", background, "BOTTOMRIGHT")
		editbox:SetHeight(24)
		
		-- everytime the editbox would normally lower alpha, hide it
		editbox:Hide()
		editbox:HookScript("OnEditFocusLost", function(self) self:Hide() end)
	
		-- hide the chat arrow buttons.
		_G[name.."ButtonFrame"]:Hide()
		_G[name.."ButtonFrame"]:SetScript("OnShow", function(self)
			self:Hide()
		end)
		
		-- tabs
		tab:StripTextures()
		-- make that line under each tab
		tab.bottomline = V:CreateFrame(nil, tab)
		tab.bottomline:SetPoint("LEFT", tab, "BOTTOMLEFT")
		tab.bottomline:SetPoint("RIGHT", tab, "BOTTOMRIGHT")
		tab.bottomline:SetHeight(1)	
	end)
	
	ChatFrameMenuButton:Kill()
	FriendsMicroButton:Hide()
	
	-- don't show the editbox unless we click enter
	hooksecurefunc("ChatEdit_SetLastActiveWindow", function(editbox)
		editbox:SetAlpha(0)
	end)
	
	
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