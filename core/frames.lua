local E, S, V = unpack(select(2, ...))

--[[
EUI:CreatePanel
	returns : new Frame
	param : name - the name of the frame being created
			parent - the frame this new frame will be parented to
	NOTE : FRAMES CREATED WITH THIS FUNCTION NEED TO BE POSITIONED STILL
]]
function V:CreatePanel(name, parent)
	local frame = CreateFrame("Frame", name, parent)
	frame:SetBackdrop({ 
	  bgFile = V.media.tex.blank, 
	  edgeFile = V.media.tex.blank, tile = false, tileSize = 0, edgeSize = 1, 
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
	NOTE : BUTTONS CREATED WITH THIS FUNCTION NEED TO BE POSITIONED STILL
	adding functionality shouls be done with a HookScript.
]]
function V:CreateButton(name, parent)
	local button = CreateFrame("Button", name, parent)
	button.hover = false

	button:SetBackdrop({ 
	  bgFile = V.media.tex.blank, 
	  edgeFile = V.media.tex.blank, tile = false, tileSize = 0, edgeSize = 1, 
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