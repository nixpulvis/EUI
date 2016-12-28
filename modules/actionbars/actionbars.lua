local M, S, V = unpack(select(2, ...))
-----------------------------------------------------------------------
-- EUI Actionbars
-----------------------------------------------------------------------
--[[ setup for EUIs actionbars ]]

local actionbars = V:NewModule("actionbars")

function actionbars:Load()
  -- hiding
  V.Load_actionbars_hide(unitframes)

end