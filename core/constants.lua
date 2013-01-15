local M, S, V, F = unpack(select(2, ...))
-----------------------------------------------------------------------
-- EUI Constants
-----------------------------------------------------------------------
--[[ holds values that EUI might need in any function or module ]]

-- EUI version number
V.versionnumber = tonumber(GetAddOnMetadata("EUI", "Version"))

-- values to crop icon's borders
V.iconcrop = { .07, .93, .07, .93 }

-- EUI's very own thematic color
V.euicolor = 'FF8C00'

-- No Op function
V.noop = function() end