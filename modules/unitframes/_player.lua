local M, S, V = unpack(select(2, ...))
local oUF = select(2, ...).oUF
-----------------------------------------------------------------------
-- EUI Unitframe [Player Layout]
-----------------------------------------------------------------------
--[[ to be used for both the player and the target. ]]

local s = S.unitframes

function V.Load_unitframes_player( module )
	oUF:RegisterStyle('EUI_Player', function( self, unit )
		
		local background = V.CreateElement(module, nil, self)
		background:SetAllPoints()

		-- :: Health :: --------------------------
		------------------------------------------
		local health = CreateFrame('StatusBar', nil, self)
		health:SetIn(background)
		health:SetStatusBarTexture(V.media.tex.norm)
		
		-- health color
		if s.health.color == 'class' then
			health.colorClass = true
		elseif s.health.color == 'gradient' then
			health.colorSmooth = true
		else
			health:SetStatusBarColor(V.HexToColor(s.health.color))
		end

		-- oUF health settings
		health.Smooth = true
		health.frequentUpdates = true

		health.bg = health:CreateTexture('nil', 'BORDER')
		health.bg:SetAllPoints()
		health.bg:SetTexture(1,1,1)
		health.bg.multiplier = .2
		

		self.Health = health
		self.Health.bg = health.bg

	end)
end