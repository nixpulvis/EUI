-----------------------------------------------------------------------
-- EUI Initialization
-----------------------------------------------------------------------
--[[ setup EUI's namespace, splitting it into 3 part
   1 = M, for modules
   2 = S, for saved variables
   3 = V, for all other variables
   4 = F, for EUI's global functions ]]

local addon, ns = ...

ns[1] = { }
ns[2] = { }
ns[3] = { }
ns[4] = { }

EUI = ... -- expose ourselves (dirty I know)