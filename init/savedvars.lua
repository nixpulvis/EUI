local M, S, V = unpack(select(2, ...))
-----------------------------------------------------------------------
-- EUI Saved Variables
-----------------------------------------------------------------------

-- Load the saved variables into V.saved or V.savedperchar
local function loadvars()
	if not EUIData then EUIData = { } end
	if not EUIToonData then EUIToonData = { } end
	
	S.saved = EUIData
	S.savedperchar = EUIToonData	
end

-- save V.saved and V.savedperchar to saved variables
local function savevars()
	EUIData = S.saved
	EUIToonData = S.savedperchar
end

--------------------------------------------------------------------------

function V.resetSavedVars()
	S.saved = { }
	S.savedperchar = { }
	savevars()
end

--------------------------------------------------------------------------

local handler, events = CreateFrame("Frame"), { }
function events:PLAYER_LOGOUT(...)
	savevars()
end
function events:ADDON_LOADED(...)
	local name = ...
	if name == "EUI" then
		loadvars()
	end
end

for k, v in pairs(events) do
	handler:RegisterEvent(k)
end
handler:SetScript("OnEvent", function(self, event, ...) 
	events[event](self, ...)
end)