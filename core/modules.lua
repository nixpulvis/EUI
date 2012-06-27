local M, S, V = unpack(select(2, ...))
-----------------------------------------------------------------------
-- EUI Modules
-----------------------------------------------------------------------
--[[ modules within the MEF system. A module contains a complete part of the UI.
	 These are almost like addons in thier own right. They have thier own
	 namespace (they can still access all of EUI however). They contain elements,
	 functions, and more. Modules are loaded on "ADDON_LOADED"

	 When a module is made it needs to have a load function. This is what every module
	 attempts to call when the addon is loaded. All the element creating should be
	 done within this function.

	 Also a module can have a install function, this will be called once when a player 
	 is detected that has not installed EUI before. This is useful for setting elements
	 defaults, but then letting the user change things later. ]]

--[[
V:NewModule
	param  : name	this is the name of the module (chat for example)
	return : table	this is the table that contains all data for this module (including frames, functions, etc.)
]]
function V:NewModule( name )
	M[name] = { 
		-- every module is going to have elements right?
		elements = { }
	}
	local function onAddonLoaded(self, addon)
		if addon == "EUI" then
			if not S.saved.noload then S.saved.noload = { } end
			if not tContains(S.saved.noload, name) then
				M[name]:Load()
				M[name].loaded = true
			end
		end
	end
	V.AddEventListener(onAddonLoaded, "ADDON_LOADED")
	return M[name]
end