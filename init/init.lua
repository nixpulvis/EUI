-----------------------------------------------------------------------
-- Initialize EUI
-----------------------------------------------------------------------
local addon, ns = ...

-- Elements
ns[1] = { }

-- Settings
ns[2] = { }	

-- Variables
ns[3] = { 
	events = { }		-- place to store functions to be called on event. in the form: ns[3].events:EVENT_NAME(args, ...)
}