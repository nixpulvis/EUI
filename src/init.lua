-----------------------------------------------------------------------
-- EUI Initialization
-----------------------------------------------------------------------
--[[ Setup EUI's namespace, splitting it into 3 parts.
  1 = E, for the core functions and "classes".
  2 = S, for saved variables, aka settings.
  3 = M, for modules, like the maps, unitframes, etc. ]]

local addon, ns = ...

ns[1] = {}
ns[2] = {}
ns[3] = {}

-- Expose ourselves. (dirty I know)
EUI = ns
