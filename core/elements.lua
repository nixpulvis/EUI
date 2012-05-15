local M, S, V = unpack(select(2, ...))

--[[ ELEMENTS within the MEF system.
an element is what the user will see on the screen as a individual part of the UI.
for example, the Left Chat Frame is an element, however there maw be more chat frames,
each one is an element, eventhough they are in the same module.
]]

--[[
EUI:CreateElement
	returns : new Frame
	param : name - the name of the frame being created
			module - the module this is a member of. (might remove this.)
			parent - the frame this new frame will be parented to
	NOTE : FRAMES CREATED WITH THIS FUNCTION NEED TO BE POSITIONED STILL
		   Additionally these Elements are the frames in charge of display settings.
]]
function V:CreateElement(module, name, parent)
	local element = { 
		tier = 1
	}
	
	-- Making the frame
	local frame = V:CreateFrame(name, parent)
	element.frame = frame
	
	local mover = V:CreateFrame(name.."_Mover", element.frame)
	mover:SetPoint("TOPRIGHT", element.frame, "TOPLEFT", -3, 0)
	mover:SetPoint("BOTTOMRIGHT", element.frame, "BOTTOMLEFT", -3, 0)
	mover:SetWidth(15)
	mover:Hide()
	
	mover.bg = mover:CreateTexture(nil, "OVERLAY")
	mover.bg:SetPoint("TOPLEFT", 2, -2)
	mover.bg:SetPoint("BOTTOMRIGHT", -2, 2)
	mover.bg:SetTexture(.1,.7,.1,select(4, unpack(S.General.background_color)))
	
	element.mover = mover
	
	module.elements[name] = element
	return element.frame
end