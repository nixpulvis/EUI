local E, S, V = unpack(select(2, ...))
-----------------------------------------------------------------------
-- EUI Saved Variables
-----------------------------------------------------------------------

-- Load the saved variables into V.saved or V.savedperchar
local function loadvars()
	if not EUIData then EUIData = { } end
	if not EUIToonData then EUIToonData = { } end
	
	V.saved = EUIData
	V.savedperchar = EUIToonData	
end

-- save V.saved and V.savedperchar to saved variables
local function savevars()
	EUIData = V.saved
	EUIToonData = V.savedperchar
end

local handler, events = CreateFrame("Frame"), { }
local function events:PLAYER_LOGOUT(...)
	savevars()
end
local function events:ADDON_LOADED(...)
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