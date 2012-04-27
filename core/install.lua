local E, S, V = unpack(select(2, ...))
-----------------------------------------------------------------------
-- EUI Install
-----------------------------------------------------------------------

local function install()
	E.chat.install()
end

local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, ...) 
	if ... == "EUI" and not V.saved.installed then
		install()
	end
end)