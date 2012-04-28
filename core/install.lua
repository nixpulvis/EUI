local E, S, V = unpack(select(2, ...))
-----------------------------------------------------------------------
-- EUI Install
-----------------------------------------------------------------------

local function install()
	E.chat.install()
end

local function install_ADDON_LOADED(self, name)
	if name == "EUI" and not V.saved.installed then
		install()
	end
end
V.addToEvent(install_ADDON_LOADED, "ADDON_LOADED")