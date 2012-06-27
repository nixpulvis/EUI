local M, S, V = unpack(select(2, ...))
-----------------------------------------------------------------------
-- EUI Install
-----------------------------------------------------------------------
--[[ this file is in charge of installing modules on a per char basis.
	 it also adds manual ways to install in needed.  ]]

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
local function installModule(module)
	if module then
		if module.install then
			module.install()
		else
			error("No Module Install Function for "..module)
		end
	else
		error("No Module "..module)
	end
end

local function install(self)
	if not S.savedperchar.installed then
		installAll()
	end
end
V.addEventListener(install_PLAYER_ENTERING_WORLD, "PLAYER_ENTERING_WORLD")

-- :: Manual Install :: -----------------------------------------------
-----------------------------------------------------------------------

-- install a module
SLASH_INSTALL1 = '/install'
function SlashCmdList.INSTALL(msg, editbox)
	if msg ~= "" then
		installModule(msg)	
	else
		installAll()
	end
end

-- reset saved vars
SLASH_RESET1 = '/reset'
function SlashCmdList.RESET(msg, editbox)
	V.resetSavedVars()
	ReloadUI()
end