local M, S, V = unpack(select(2, ...))
-----------------------------------------------------------------------
-- Configuration for EUI
-----------------------------------------------------------------------

-- shows and hides the movers for each element.
function V.toggleMovers()
	for module,v in pairs(M) do
		for k,v in pairs(M[module].elements) do
			v:ToggleMovers()
			--[[
			if v.mover:IsVisible() then
				v.mover:Hide()
			else
				v.mover:Show()
			end
			]]
		end
	end
end

-- the config slash cmd
SLASH_EUI1 = '/eui'
function SlashCmdList.EUI(msg, editbox)
	V.toggleMovers()
end