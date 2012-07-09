local M, S, V = unpack(select(2, ...))
-----------------------------------------------------------------------
-- EUI Development Tools
-----------------------------------------------------------------------
--[[ these are some tools and functions to assist in development of
	 EUI, they will be included with the release, but are designed
	 to use as little resources as possible when not in use. ]]

-- :: /rl :: ----------------------------------------------------------
-----------------------------------------------------------------------
SLASH_RELOAD1 = '/rl'
function SlashCmdList.RELOAD( msg, editbox )
	ReloadUI()
end

-- :: Load Control :: -------------------------------------------------
-----------------------------------------------------------------------

SLASH_NOLOAD1 = '/noload'
function SlashCmdList.NOLOAD( msg, editbox )
	if msg == '' then -- no args
		local m = ''
		for i,v in ipairs(S.saved.noload) do
			m = m..v..'\n'
		end
		V.PrintBlock('/noload', "modules currently not being loaded", m)
	elseif msg == 'all' then -- noload all
		for k,v in pairs(M) do
			tinsert(S.saved.noload, k)
		end
		V.PrintCustom('/noload', 'setting all modules to not be loaded')
	else
		if M[msg] then -- if module exists
			tinsert(S.saved.noload, msg)
			V.PrintCustom('/noload', 'setting '..msg..' to not be loaded')
		else
			V.PrintCustom('/noload', 'no module '..msg..' in EUI')
		end
	end
end

SLASH_LOAD1 = '/load'
function SlashCmdList.LOAD( msg, editbox )
	if msg == '' then -- no args
		local m = ''
		for k,v in pairs(M) do
			m = m..k..'\n'
		end
		V.PrintBlock('/load', "modules in EUI", m)
	elseif msg == 'all' then -- load all
		S.saved.noload = { }
		V.PrintCustom('/load', 'setting all modules to be loaded')
	else
		if M[msg] then -- if module exists
			for i,v in ipairs(S.saved.noload) do
				if v == msg then
					tremove(S.saved.noload, i)
				end
			end
			V.PrintCustom('/load', 'setting '..msg..' to be loaded')
		else
			V.PrintCustom('/load', 'no module '..msg..' in EUI')
		end
	end
end

-- :: Install Control :: ----------------------------------------------
-----------------------------------------------------------------------

-- install a module
SLASH_INSTALL1 = '/install'
function SlashCmdList.INSTALL( msg, editbox )
	if msg == '' then
		V.PrintCustom('/install', 'specify a module to install')
	elseif msg == 'all' then
		for k,v in pairs(M) do
			if M[k].install then
				V.PrintCustom('/install', k..' [installing...]')
				M[k]:install()
			end
		end
	else
		if M[msg] then	
			if M[msg].install then
				V.PrintCustom('/install', k..' [installing...]')
				M[k]:install()
			else
				V.PrintCustom('/install', msg..' does not need to be installed')
			end
		else
			V.PrintCustom('/install', 'no module '..msg..' in EUI')
		end
	end
end

-- :: Reset :: --------------------------------------------------------
-----------------------------------------------------------------------

-- reset saved vars
SLASH_RESET1 = '/reset'
function SlashCmdList.RESET( msg, editbox )
	
	S.saved = { }
	S.savedperchar = { }

	ReloadUI()
end




















