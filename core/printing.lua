-- local M, S, V = unpack(select(2, ...))
-- -----------------------------------------------------------------------
-- -- EUI Printing
-- -----------------------------------------------------------------------
-- --[[ help support informative errors, warnings and general purpose
--      output to the user through the chat box. ]]

-- -- create colored, and formatted strings for output.
-- local function eui_print_string( prefix, message, pcolor, color )
--   prefix  = '|cFF'..pcolor..prefix..': '..'|r'
--   message = '|cFF'..color..message..'|r'
--   return prefix..message
-- end

-- -- :: Colors :: -------------------------------------------------------
-- -----------------------------------------------------------------------

-- local header_color   = 'D2B48C'
-- local warning_color1 = 'FFFF00'
-- local warning_color2 = 'FFFFBB'
-- local error_color1   = 'FF0000'
-- local error_color2   = 'FF4444'
-- local white_color    = 'FFFFFF'

-- -- :: General :: ------------------------------------------------------
-- -----------------------------------------------------------------------
-- function V.Print( message )
--   m_out = eui_print_string('EUI', message, V.euicolor, white_color)
--   print(m_out)
-- end

-- function V.PrintCustom( prefix, message )
--   m_out = eui_print_string(prefix, message, V.euicolor, header_color)
--   print(m_out)
-- end

-- function V.PrintBlock( prefix, header, message )
--   h_out = eui_print_string(prefix, header, V.euicolor, header_color)
--   print(h_out..'\n'..message)
-- end

-- -- :: Warnings :: -----------------------------------------------------
-- -----------------------------------------------------------------------
-- function V.PrintWarning( message )
--   m_out = eui_print_string('EUI WARNING', message, warning_color1, warning_color2)
--   print(m_out)
-- end

-- -- :: Errors :: -------------------------------------------------------
-- -----------------------------------------------------------------------
-- function V.PrintError( message )
--   m_out = eui_print_string('EUI ERROR', message, error_color1, error_color2)
--   print(m_out)
-- end