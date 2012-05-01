local M, S, V = unpack(select(2, ...))
-----------------------------------------------------------------------
-- These are tools used for development.
-----------------------------------------------------------------------

-- Best slash cmd ever!
SLASH_RELOAD1 = '/rl'
function SlashCmdList.RELOAD(msg, editbox)
	ReloadUI()
end


-- Script Box
local script_box = V:CreatePanel("EUIScriptBox", UIParent)
script_box:SetSize(300, 300)
script_box:SetPoint("CENTER")
script_box:Hide()

--script_box.title = V:CreateFontString("LUA Scriptbox")
--script_box.title:SetPoint("TOPLEFT", script_box, "TOPLEFT", 2, -2)

script_box.run = V:CreateButton("EUIScriptBox_RunButton", script_box)
script_box.run:SetPoint("BOTTOMRIGHT", script_box, "BOTTOMRIGHT", -2, 2)
script_box.run:SetSize(35, 20)

script_box.close = V:CreateButton("EUIScriptBox_RunButton", script_box)
script_box.close:SetPoint("RIGHT", script_box.run, "LEFT", -2, 0)
script_box.close:SetSize(35, 20)

script_box.editbox = CreateFrame("EditBox", "EUIScriptBox_EditBox", script_box)
script_box.editbox:StyleFrame()
script_box.editbox:SetPoint("TOPLEFT", script_box, "TOPLEFT", 2, -4)
script_box.editbox:SetPoint("BOTTOMRIGHT", script_box, "BOTTOMRIGHT", -2, 22)
script_box.editbox:SetFontObject(ChatFontNormal)
script_box.editbox:SetMultiLine(true)

script_box.run:SetScript("OnClick", function(self)
	RunScript(script_box.editbox:GetText())
end)

script_box.close:SetScript("OnClick", function(self)
	script_box:Hide()
end)

-- open the script box
SLASH_SCRIPTBOX1 = '/sb'
function SlashCmdList.SCRIPTBOX(msg, editbox)
	script_box:Show()
end

-- install a module
SLASH_INSTALL1 = '/install'
function SlashCmdList.INSTALL(msg, editbox)
	M[msg].install()
end

-- reset saved vars
SLASH_RESET1 = '/reset'
function SlashCmdList.RESET(msg, editbox)
	V.resetSavedVars()
	ReloadUI()
end