local M, S, V = unpack(select(2, ...))
-----------------------------------------------------------------------
-- EUI Printing
-----------------------------------------------------------------------
--[[ help support informative errors, warnings and general purpose
		 output to the user through the chat box. ]]

-- create colored, and formatted strings for output.
local function eui_print_string( prefix, message, pcolor, color )
	prefix  = '|c'..V.ColorToHex(pcolor)..prefix..'|r'
	message = '|c'..V.ColorToHex(color)..message..'|r'
	return prefix..": "..message
end

-- :: Colors :: -------------------------------------------------------
-----------------------------------------------------------------------

local header_color   = { .33, .15, .15 }
local warning_color1 = { .95, .55, .08 }
local warning_color2 = { .75, .35, 0.0 }
local error_color1   = { .91, .15, .02 }
local error_color2   = { .71, 0.0, 0.0 }
local white_color    = { 0.0, 0.0, 0.0 }

-- :: General :: ------------------------------------------------------
-----------------------------------------------------------------------
function V.Print( message )
	m_out = eui_print_string('EUI', message, V.euicolor, white_color)
	print(m_out)
end

function V.PrintBlock( header, message )
	h_out = eui_print_string('EUI', header, V.euicolor, header_color)
	print(h_out)
	print(message)
end

-- :: Warnings :: -----------------------------------------------------
-----------------------------------------------------------------------
function V.PrintWarning( message )
	m_out = eui_print_string('EUI WARNING', message, warning_color1, warning_color2)
	print(m_out)
end

-- :: Errors :: -------------------------------------------------------
-----------------------------------------------------------------------
function V.PrintError( message )
	m_out = eui_print_string('EUI ERROR', message, error_color1, error_color2)
	print(m_out)
end