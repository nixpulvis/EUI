local M, S, V = unpack(select(2, ...))

--[[
This needs to be at the beginning of every module. It loads the module and sets up the table for the 
modules's data.
]]
function V:NewModule(name)
	M[name] = { 
		elements = { }
	}
	local function onAddonLoaded(self, addon)
		if addon == "EUI" then
			if not S.saved.noload then S.saved.noload = { } end
			if not tContains(S.saved.noload, name) then
				M[name]:load()
			end
		end
	end
	V.addToEvent(onAddonLoaded, "ADDON_LOADED")
	return M[name]
end