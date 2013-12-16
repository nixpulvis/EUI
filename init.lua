-----------------------------------------------------------------------
-- EUI Initialization
-----------------------------------------------------------------------
--[[ Setup EUI's namespace, splitting it into 3 parts.
  1 = E, for modules
  2 = S, for saved variables
  3 = M, for all other variables ]]

local addon, ns = ...

ns[1] = {}
ns[2] = {}
ns[3] = {}

ns[1].DEBUG = true -- Toggle EUI debugging, prints extra details in some cases.
ns[1].TEST = false -- Toggle EUI's testing, located in dev/tests.lua.

EUI = ns -- Expose ourselves. (dirty I know)
