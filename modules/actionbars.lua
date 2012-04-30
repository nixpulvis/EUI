local E, S, V = unpack(select(2, ...))
-----------------------------------------------------------------------
-- EUI Actionbars
-----------------------------------------------------------------------
local actionbars = V:NewModule("actionbars")

function actionbars:load()
	local test = V:CreateElement("EUIActionBarTest", actionbars, UIParent)
	test:SetPoint("CENTER")
	test:SetSize(200, 300)
	
	MainMenuBar:Hide()
end