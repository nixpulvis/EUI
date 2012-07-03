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
	if msg == '' then 
		for k,v in pairs(S.saved.noload) do
			print(k,v)
		end
		return	-- don't continue 
	end

	if M[msg] then
		print('Setting '..msg..' to not be loaded.')
		tinsert(S.saved.noload, msg)
	else
		print('No Module '..msg..' in EUI.')
	end
end

SLASH_LOAD1 = '/load'
function SlashCmdList.LOAD( msg, editbox )
	if msg == '' then 
		print('Would you like to load one of these modules? ') 
		for k,v in pairs(M) do
			print('-- '..k)
		end
		return
	end

	if M[msg] then
		print('Setting '..msg..' to be loaded.')
		for i,v in ipairs(S.saved.noload) do
			if v == msg then 
				S.saved.noload[i] = nil 
				break 
			end
		end
	else
		print('No Module '..msg..' in EUI.')
	end
end