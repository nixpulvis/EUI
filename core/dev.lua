-- local M, S, V = unpack(select(2, ...))
-- -----------------------------------------------------------------------
-- -- EUI Development Tools
-- -----------------------------------------------------------------------
-- --[[ these are some tools and functions to assist in development of
--    EUI, they will be included with the release, but are designed
--    to use as little resources as possible when not in use. ]]

-- -- :: /rl :: ----------------------------------------------------------
-- -----------------------------------------------------------------------
-- SLASH_RELOAD1 = '/rl'
-- function SlashCmdList.RELOAD( msg, editbox )
--   ReloadUI()
-- end

-- -- :: Install Control :: ----------------------------------------------
-- -----------------------------------------------------------------------

-- -- install a module
-- SLASH_INSTALL1 = '/install'
-- function SlashCmdList.INSTALL( msg, editbox )
--   if msg == '' then
--     V.PrintCustom('/install', 'specify a module to install')
--   elseif msg == 'all' then
--     for k,v in pairs(M) do
--       if M[k].install then
--         V.PrintCustom('/install', k..' [installing...]')
--         M[k]:install()
--       end
--     end
--   else
--     if M[msg] then
--       if M[msg].install then
--         V.PrintCustom('/install', msg..' [installing...]')
--         M[msg]:install()
--       else
--         V.PrintCustom('/install', msg..' does not need to be installed')
--       end
--     else
--       V.PrintCustom('/install', 'no module '..msg..' in EUI')
--     end
--   end
-- end

-- -- :: Reset :: --------------------------------------------------------
-- -----------------------------------------------------------------------

-- -- reset saved vars
-- SLASH_RESET1 = '/reset'
-- function SlashCmdList.RESET( msg, editbox )

--   S.saved = { }
--   S.savedperchar = { }

--   ReloadUI()
-- end