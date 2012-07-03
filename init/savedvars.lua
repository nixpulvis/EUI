local M, S, V = unpack(select(2, ...))
-----------------------------------------------------------------------
-- EUI Saved Variables
-----------------------------------------------------------------------
--[[ load in and save out the EUIData and EUIToonData. on load we pull
	 the variables into S.xxx in order to remove complexity around
	 savedvar usage in other areas of EUI. ]]

-- assigns the given name to a table if nil
local function ensure( name )
	if not name then name = { } end
end

-- Load the saved variables into V.saved or V.savedperchar
local function LoadVariables()
	ensure(EUIData)
	ensure(EUIToonData)

	-- some tables are going to be needed, init here
	ensure(EUIData.noload)
	
	S.saved = EUIData
	S.savedperchar = EUIToonData	
end

-- save V.saved and V.savedperchar to saved variables
local function SaveVariables()
	EUIData = S.saved
	EUIToonData = S.savedperchar
end

-- EUI function to clear Saved vars
function V.ClearSavedVars()
	S.saved = { }
	S.savedperchar = { }
	SaveVariables()
end

-- :: Event :: --------------------------------------------------------
-----------------------------------------------------------------------

local handler, events = CreateFrame("Frame"), { }
function events:PLAYER_LOGOUT(...)
	SaveVariables()
end
function events:ADDON_LOADED(...)
	local name = ...
	if name == "EUI" then
		LoadVariables()
	end
end

for k, v in pairs(events) do
	handler:RegisterEvent(k)
end
handler:SetScript("OnEvent", function(self, event, ...) 
	events[event](self, ...)
end)