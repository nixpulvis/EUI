local M, S, V = unpack(select(2, ...))
local oUF = select(2, ...).oUF
-----------------------------------------------------------------------
-- EUI Unitframes
-----------------------------------------------------------------------
--[[ unitframes for EUI, these are simplistic and provide only the
		 basic functionality. ]]

local unitframes = V:NewModule("unitframes")

function unitframes:Load()
	-- load layouts
	V.Load_unitframes_player(unitframes)

	-- spawn player and target
	oUF:SetActiveStyle("EUI_Player")
	local player = oUF:Spawn('player', "EUIPlayer")
	player:SetSize(150, 36)
	player:SetPoint("CENTER", -300, 0)
	local target = oUF:Spawn('target', "EUITarget")
	target:SetSize(150, 36)
	target:SetPoint("CENTER", 300, 0)

end