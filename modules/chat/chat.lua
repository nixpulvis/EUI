local M, S, V = unpack(select(2, ...))
-----------------------------------------------------------------------
-- EUI Chat (needs install)
-----------------------------------------------------------------------
local chat = V:NewModule("chat")

function chat:load()		
	
	-- skins the given chatframe
	local function SkinChatFrame(chatframe)
		local name = chatframe:GetName()
		local editbox = _G[name.."EditBox"]
		local tab = _G[name.."Tab"]
	
		-- give every chatframe a background. just hide it until needed.
		local background = V:CreateElement("EUI"..name, chat, UIParent)
		background:SetFrameStrata("BACKGROUND")
		background:SetFrameLevel(0)
		background:SetPoint("TOPLEFT", chatframe, "TOPLEFT", -4, 28)
		background:SetPoint("BOTTOMRIGHT", chatframe, "BOTTOMRIGHT", 2, -6)
		background:Hide()
		
		if name == "ChatFrame1" then
			background.div = V:CreateFrame(nil, background, 0, 1)
			background.div:SetPoint("LEFT", background, "TOPLEFT", 2, -20)
			background.div:SetPoint("RIGHT", background, "TOPRIGHT", -2, -20)
			
			background:SetPoint("TOPLEFT", chatframe, "TOPLEFT", -4, 48)
			background:Show()
		end
		
		-- remove blizzard style
		chatframe:StripTextures()
		editbox:StripTextures()
	
		-- skin editbox
		editbox:StyleFrame(.9)
		editbox:ClearAllPoints()
		editbox:SetPoint("BOTTOMLEFT", background, "BOTTOMLEFT")
		editbox:SetPoint("BOTTOMRIGHT", background, "BOTTOMRIGHT")
		editbox:SetHeight(24)
		
		-- update border color based on active chat
		hooksecurefunc("ChatEdit_UpdateHeader", function()
			local type = editbox:GetAttribute("chatType")
			if ( type == "CHANNEL" ) then
				local id = GetChannelName(editbox:GetAttribute("channelTarget"))
				if id == 0 then
					editbox:SetBackdropBorderColor(unpack(C.media.bordercolor))
				else
					editbox:SetBackdropBorderColor(ChatTypeInfo[type..id].r,ChatTypeInfo[type..id].g,ChatTypeInfo[type..id].b)
				end
			else
				editbox:SetBackdropBorderColor(ChatTypeInfo[type].r,ChatTypeInfo[type].g,ChatTypeInfo[type].b)
			end
		end)
		
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
	end
	
	-- skin the default 10 chat friends
	for i = 1, NUM_CHAT_WINDOWS do
		local chatframe = _G["ChatFrame"..i]
		SkinChatFrame(chatframe)
	end
	
	-- Style new windows (Whisper/RealID/Convo)
	hooksecurefunc("FCF_OpenTemporaryWindow", function()
		local chatframe = FCF_GetCurrentChatFrame()
		SkinChatFrame(chatframe)
	end)
	
	-- show background on UnDocking
	hooksecurefunc("FCF_UnDockFrame", function(chatframe)
		local id = chatframe:GetID()
		local shown = select(7, FCF_GetChatWindowInfo(chatframe:GetID()))

		if shown and _G["EUIChatFrame"..id] then
			_G["EUIChatFrame"..id]:Show()
			_G["ChatFrame"..id.."EditBox"]:ClearAllPoints()
			_G["ChatFrame"..id.."EditBox"]:SetPoint("BOTTOMLEFT", _G["EUIChatFrame"..id], "BOTTOMLEFT")
			_G["ChatFrame"..id.."EditBox"]:SetPoint("BOTTOMRIGHT", _G["EUIChatFrame"..id], "BOTTOMRIGHT")
		end
	end)
	
	-- hide background on Docking	
	hooksecurefunc("FCF_DockFrame", function(chatframe, index, selected)
		local id = chatframe:GetID()
		if id == 1 or not _G["EUIChatFrame"..id] then return end
		_G["EUIChatFrame"..id]:Hide()
		_G["ChatFrame"..id.."EditBox"]:SetAllPoints(ChatFrame1EditBox)
	end)
	
	-- hide background on closing
	hooksecurefunc("FCF_Close", function(chatframe, index, selected)
		local id = chatframe:GetID()

		if _G["EUIChatFrame"..id] then
			_G["EUIChatFrame"..id]:Hide()
		end
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