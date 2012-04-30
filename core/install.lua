local M, S, V = unpack(select(2, ...))
-----------------------------------------------------------------------
-- EUI Install
-----------------------------------------------------------------------

-- Install all modules that have a install function.
local function installAll()
	for k,v in pairs(M) do
		local module = M[k]
		if module.install then
			module.install()
		end
	end
end

local function install(module)
	if M[module] and M[module].install then
		M[module].install()
	else
		error("No Module "..module)
	end
end

local function install_ADDON_LOADED(self, name)
	if name == "EUI" and not V.saved.installed then
		installAll()
	end
end
V.addToEvent(install_ADDON_LOADED, "ADDON_LOADED")