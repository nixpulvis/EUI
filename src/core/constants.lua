local E, S, M = unpack(select(2, ...))
-----------------------------------------------------------------------
-- EUI Constants
-----------------------------------------------------------------------
--[[ Holds values that EUI might need in any function or module. ]]

-- EUI version number
E.VERSIONNUMBER = tonumber(GetAddOnMetadata("EUI", "Version"))

-- values to crop icon's borders
E.ICONCROP = { .07, .93, .07, .93 }
