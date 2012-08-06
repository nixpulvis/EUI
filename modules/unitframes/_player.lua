local M, S, V = unpack(select(2, ...))
local oUF = select(2, ...).oUF
-----------------------------------------------------------------------
-- EUI Unitframe [Player Layout]
-----------------------------------------------------------------------
--[[ to be used for both the player and the target. ]]

local s = S.unitframes

function V.Load_unitframes_player( module )
	oUF:RegisterStyle('EUI_Player', function( self, unit )
		
		-- :: Background :: ----------------------
		------------------------------------------
		local background = V.CreateElement(module, nil, self)
		background:SetAllPoints()

		-- divider
		background.div = V.CreateFrame(nil, background)

		-- :: Power :: ---------------------------
		------------------------------------------
		local power = CreateFrame('StatusBar', nil, self)
		power:SetPoint('BOTTOMRIGHT', -1, 1)
		power:SetPoint('BOTTOMLEFT', 1, 1)
		power:SetHeight(16)
		power:SetStatusBarTexture(V.media.tex.norm)

		-- set divider position
		background.div:SetPoint('LEFT', power, 'TOPLEFT')
		background.div:SetPoint('RIGHT', power, 'TOPRIGHT')
		background.div:SetHeight(1)

		power.bg = power:CreateTexture('nil', 'BORDER')
		power.bg:SetAllPoints()
		power.bg:SetTexture(1,1,1)
		power.bg.multiplier = .2

		-- oUF power settings
		power.smooth = true
		power.frequentUpdates = true
		power.colorPower = true
		power.colorClass = true

		self.Power = power
		self.Power.bg = power.bg

		-- :: Health :: --------------------------
		------------------------------------------
		local health = CreateFrame('StatusBar', nil, self)
		health:SetPoint('TOPLEFT', 1, -1)
		health:SetPoint('BOTTOMRIGHT', -1, power:GetHeight()+1)
		health:SetStatusBarTexture(V.media.tex.norm)
		
		-- health color
		if s.health.color == 'class' then
			health.colorDisconnected = true
			health.colorTapping      = true	
			health.colorClass        = true
			health.colorReaction     = true	
		elseif s.health.color == 'gradient' then
			health.colorSmooth = true
		else
			health:SetStatusBarColor(V.HexToColor(s.health.color))
		end

		local prediction = CreateFrame('StatusBar', nil, health)
		prediction:SetPoint('TOPLEFT', health:GetStatusBarTexture(), 'TOPRIGHT', 0, 0)
		prediction:SetPoint('BOTTOMLEFT', health:GetStatusBarTexture(), 'BOTTOMRIGHT', 0, 0)
		prediction:SetWidth(250)
		prediction:SetStatusBarTexture(V.media.tex.norm)
		prediction:SetStatusBarColor(0, 1, 0.5, 0.25)
		prediction:SetMinMaxValues(0,1)

		self.HealPrediction = {
			myBar = prediction,
			maxOverflow = 1,
		}

		-- oUF health settings
		health.smooth = true
		health.frequentUpdates = true

		health.bg = health:CreateTexture('nil', 'BORDER')
		health.bg:SetAllPoints()
		health.bg:SetTexture(1,1,1)
		health.bg.multiplier = .2
		

		self.Health = health
		self.Health.bg = health.bg
	end)
end