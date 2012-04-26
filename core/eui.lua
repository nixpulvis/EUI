local M, S, V = unpack(select(2, ...))
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
function EUI:CreatePanel(name, parent)
	local frame = CreateFrame("Frame", name, parent)
	frame:SetBackdrop({ 
	  bgFile = [[Interface\AddOns\EUI\media\blank]], 
	  edgeFile = [[Interface\AddOns\EUI\media\blank]], tile = false, tileSize = 0, edgeSize = 1, 
	  insets = { left = -1, right = -1, top = -1, bottom = -1 }
	})
	frame:SetBackdropColor(unpack(S.General.background_color))
	frame:SetBackdropBorderColor(unpack(S.General.border_color))
	
	return frame
end

--[[
EUI:CreateButton
	returns : new Button (frame)
	param : name - the name of the button being created
			parent - the frame this new frame will be parented to
			width - the width of the new frame
			height - the height of the new frame
	NOTE : BUTTONS CREATED WITH THIS FUNCTION NEED TO BE POSITIONED STILL
	adding functionality shouls be done with a HookScript.
]]
function EUI:CreateButton(name, parent)
	local button = CreateFrame("Button", name, parent)
	button.hover = false

	button:SetBackdrop({ 
	  bgFile = [[Interface\AddOns\EUI\media\blank]], 
	  edgeFile = [[Interface\AddOns\EUI\media\blank]], tile = false, tileSize = 0, edgeSize = 1, 
	  insets = { left = 0, right = 0, top = 0, bottom = 0 }
	})
	button:SetBackdropColor(unpack(S.General.background_color))
	button:SetBackdropBorderColor(unpack(S.General.border_color))
	
	button:SetWidth(20)
	button:SetHeight(20)
	
	local hover_color = { .5, .5, .5, select(4, unpack(S.General.background_color)) }
	local mousedown_color = { .3, .3, .3, select(4, unpack(S.General.background_color)) }
	button:SetScript("OnEnter", function(self) 
		self:SetBackdropColor(unpack(hover_color))
		button.hover = true
	end)
	button:SetScript("OnLeave", function(self) 
		self:SetBackdropColor(unpack(S.General.background_color))
		button.hover = false
	end)
	button:SetScript("OnMouseDown", function(self) 
		self:SetBackdropColor(unpack(mousedown_color))
	end)
	button:SetScript("OnMouseUp", function(self) 
		if button.hover then
			self:SetBackdropColor(unpack(hover_color))
		else
			self:SetBackdropColor(unpack(S.General.background_color))
		end
	end)
	
	return button
end

function EUI:LoadModule(name)
	M[name] = { }
	if V
end