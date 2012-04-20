local EUI = _G.EUI
-----------------------------------------------------------------------
-- These are the functions that make the frames & other elements of the 
-- user interface.
-----------------------------------------------------------------------

--[[
EUI:CreatePanel
	returns : new Frame
	param : name - the name of the frame being created
			parent - the frame this new frame will be parented to
			width - the width of the new frame
			height - the height of the new frame
	NOTE : FRAMES CREATED WITH THIS FUNCTION NEED TO BE POSITIONED STILL
]]
function EUI:CreatePanel(name, parent, width, height)
	local frame = CreateFrame("Frame", name, parent)
	frame:SetBackdrop({ 
	  bgFile = [[Interface\AddOns\EUI\media\blank]], 
	  edgeFile = [[Interface\AddOns\EUI\media\blank]], tile = false, tileSize = 0, edgeSize = 2, 
	  insets = { left = 0, right = 0, top = 0, bottom = 0 }
	})
	frame:SetBackdropColor(1,0,0)
	frame:SetBackdropBorderColor(0,1,0)
	
	frame:SetWidth(width)
	frame:SetHeight(height)
	
	return frame
end