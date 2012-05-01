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
	S.savedperchar.installed = true
end

-- not sure if this is worth keeping
local function install(module)
	if module and module.install then
		module.install()
	else
		error("No Module install function")
	end
end

local function install_PLAYER_ENTERING_WORLD(self)
	if not S.savedperchar.installed then
		installAll()
	end
end
V.addToEvent(install_PLAYER_ENTERING_WORLD, "PLAYER_ENTERING_WORLD")