local M, S, V = unpack(select(2, ...))

--[[
EUI:CreatePanel
	returns : new Frame
	param : name - the name of the frame being created
			parent - the frame this new frame will be parented to
	NOTE : FRAMES CREATED WITH THIS FUNCTION NEED TO BE POSITIONED STILL
		   Additionally these Elements are the frames in charge of display settings.
]]
function V:CreateElement(name, module, parent)
	local element = { 
		tier = 1
	}
	
	-- Making the frame
	element.frame = V:CreatePanel(name, parent)
	
	element.mover = V:CreatePanel(name.."_Mover", element.frame)
	element.mover:SetPoint("TOPRIGHT", element.frame, "TOPLEFT", -3, 0)
	element.mover:SetPoint("BOTTOMRIGHT", element.frame, "BOTTOMLEFT", -3, 0)
	element.mover:SetWidth(15)
	element.mover:SetBackdropColor(.1,.7,.1,select(4, unpack(S.General.background_color)))
	element.mover:Hide()
	
	module.elements[name] = element
	return element.frame
end