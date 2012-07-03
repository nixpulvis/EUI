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
		print("Modules currently not being loaded: ")
		for i,v in ipairs(S.saved.noload) do
			print('-- '..v)
		end 
	elseif msg == 'all' then -- noload all
		for k,v in pairs(M) do
			tinsert(S.saved.noload, k)
		end
	else
		if M[msg] then -- if module exists
			print('Setting '..msg..' to not be loaded.')
			tinsert(S.saved.noload, msg)
		else
			print('No Module '..msg..' in EUI.')
		end
	end
end

SLASH_LOAD1 = '/load'
function SlashCmdList.LOAD( msg, editbox )
	if msg == '' then -- no args
		print('Would you like to load one of these modules? ') 
		for k,v in pairs(M) do
			print('-- '..k)
		end
	elseif msg == 'all' then -- load all
		S.saved.noload = { }
	else
		if M[msg] then -- if module exists
			print('Setting '..msg..' to be loaded.')
			for i,v in ipairs(S.saved.noload) do
				if v == msg then
					tremove(S.saved.noload, i)
				end
			end
		else
			print('No Module '..msg..' in EUI.')
		end
	end
end

-- :: Install Control :: ----------------------------------------------
-----------------------------------------------------------------------

-- install a module
SLASH_INSTALL1 = '/install'
function SlashCmdList.INSTALL( msg, editbox )
	if msg == '' then
		print('Specify a module to install')
	elseif msg == 'all' then
		for k,v in pairs(M) do
			if M[k].install then
				print('Installing '..k)
				M[k]:install()
			end
		end
	else
		if M[msg] then	
			if M[msg].install then
				print('Installing '..k)
				M[k]:install()
			else
				print(msg..' does not need to be installed')
			end
		else
			print('No Module '..msg..' in EUI.')
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




















