local E, S, V = unpack(select(2, ...))

--[[
This needs to be at the beginning of every element. It loads the Element and holds sets up the table for the 
Element's data.
]]
function V:NewElement(name)
	E[name] = { }
	E[name].loader = CreateFrame("Frame")
	E[name].loader:RegisterEvent("ADDON_LOADED")
	E[name].loader:SetScript("OnEvent", function(self, event, ...)
		if ... == "EUI" then
			if not V.saved.noload then V.saved.noload = { } end
			if not tContains(V.saved.noload, name) then
				E[name]:load()
			end
		end
	end)
	return E[name]
end