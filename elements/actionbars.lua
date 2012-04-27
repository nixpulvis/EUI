local E, S, V = unpack(select(2, ...))
-----------------------------------------------------------------------
-- EUI Actionbars
-----------------------------------------------------------------------
local actionbars = V:NewElement("actionbars")

function actionbars:load()
	MainMenuBar:Hide()
end