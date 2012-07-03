-----------------------------------------------------------------------
-- EUI Initialization
-----------------------------------------------------------------------
--[[ setup EUI's namespace, splitting it into 3 part
	 1 = M, for modules
	 2 = S, for saved variables
	 3 = V, for all other functions and variables ]]

local addon, ns = ...

-- Modules
ns[1] = { }

-- Saved Vars
ns[2] = { }	

-- Variables
ns[3] = { 
	-- event handling data storage
	events = { }
}

EUI = ...