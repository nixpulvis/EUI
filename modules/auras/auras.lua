local M, S, V = unpack(select(2, ...))
-----------------------------------------------------------------------
-- EUI Player Auras
-----------------------------------------------------------------------
--[[ default player auras for, displays all buffs and debuffs. ]]

local auras = V:NewModule('auras')

function auras:Load()

	-- disable blizz auras
	BuffFrame:Hide()

	-- aura container
	auras_frame = V.CreateElement(auras, 'EUI_Auras', UIParent)
	auras_frame:SetPoint('TOPLEFT', 5, -5)
	auras_frame:SetSize(600,250)
	auras_frame:SetAlpha(0)
	
	-- a table containing the names of all auras
	local buffs   = { }
	local debuffs = { }	

	-- settings
	local size = 35

	-- initialize buff buttons
	local buffs_frames = { }
	for i=1,10 do
		buffs_frames[i] = V.CreateButton(nil, UIParent, 'SecureActionButtonTemplate')
		buffs_frames[i]:SetSize(size, size)
		buffs_frames[i]:SetPoint("TOPLEFT", auras_frame, "TOPLEFT", (i-1)*(size+5), 0)
		buffs_frames[i].icon = buffs_frames[i]:CreateTexture("ARTWORK")

		-- click off action
		buffs_frames[i]:SetAttribute("type", "macro")
		buffs_frames[i]:SetAttribute("macrotext", "/cancelaura "..i)
	end
	-- initialize debuff buttons 
	local debuffs_frames = { }
	for i=1,10 do
		debuffs_frames[i] = V.CreateButton(nil, UIParent, 'SecureActionButtonTemplate')
		debuffs_frames[i]:SetSize(size, size)
		debuffs_frames[i]:SetPoint("TOPLEFT", auras_frame, "TOPLEFT", (i-1)*(size+5), -80)
		debuffs_frames[i].icon = debuffs_frames[i]:CreateTexture("ARTWORK")
	end

	local function update_aura( frame, index, filter )
		name,_,icon,count,d_type,duration,exp_time,caster,is_stealable,consolidate,spell_id 
		= UnitAura('player', index, filter)

		frame.icon:SetPoint("TOPLEFT", 1, -1)
  	frame.icon:SetPoint("BOTTOMRIGHT", -1, 1)
		frame.icon:SetTexture(icon)
		frame.icon:SetTexCoord(unpack(V.iconcrop))

		frame:SetAlpha(1)
	end

	local function refresh_auras()
		i = 1
		repeat
			local name = UnitAura('player', i, 'HELPFUL')
			buffs[i] = name
			i = i + 1
		until name == nil
		i = 1
		repeat
			local name = UnitAura('player', i, 'HARMFUL')
			debuffs[i] = name
			i = i + 1
		until name == nil
	end

	local function update_auras()
		refresh_auras()
		
		--clear
		for i,v in ipairs(buffs_frames) do
			v:SetAlpha(0)
		end
		for i,v in ipairs(debuffs_frames) do
			v:SetAlpha(0)
		end

		--create
		for i,v in ipairs(buffs) do
			update_aura(buffs_frames[i], i, 'HELPFUL')
		end
		for i,v in ipairs(debuffs) do
			update_aura(debuffs_frames[i], i, 'HARMFUL')
		end
	end
	V.AddEventListener(update_auras, 'UNIT_AURA')
	V.AddEventListener(update_auras, 'PLAYER_ENTERING_WORLD')
		


	-- create_aura('player', 1, 'HELPFUL')

end