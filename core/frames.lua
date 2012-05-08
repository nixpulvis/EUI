local M, S, V = unpack(select(2, ...))

--[[ Frames within the MEF system
A frame is a single LUA frame (or derivitive) that is used to make a element.
some elements will not need any other frames then the one that is created for the
element, but most will. These are styled to fit the UI. These are most like the
CreateFrame function provided by blizz.
]]

--[[
EUI:CreateFrame
	returns : new Frame
	param : name   - the name of the frame being created
			parent - the frame this new frame will be parented to
			width  - the width of the frame
			height - the height of the frame
	NOTE : FRAMES CREATED WITH THIS FUNCTION NEED TO BE POSITIONED STILL
]]
function V:CreateFrame(name, parent, width, height)
	local frame = CreateFrame("Frame", name, parent)
	frame:SetBackdrop({ 
	  bgFile = V.media.tex.blank, 
	  edgeFile = V.media.tex.blank, tile = false, tileSize = 0, edgeSize = 1, 
	  insets = { left = -1, right = -1, top = -1, bottom = -1 }
	})
	frame:SetBackdropColor(unpack(S.General.background_color))
	frame:SetBackdropBorderColor(unpack(S.General.border_color))
	
	button:SetWidth(width)
	button:SetHeight(height)
	
	return frame
end

--[[
EUI:CreateButton
	returns : new Button (frame)
	param : name   - the name of the button being created
			parent - the frame this new frame will be parented to
	NOTE  :	BUTTONS CREATED WITH THIS FUNCTION NEED TO BE POSITIONED STILL
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
	button:HoverClickStyle()
	
	-- default button width and height
	button:SetWidth(20)
	button:SetHeight(20)
	
	button.text = button:SetFontString(V.media.fonts.main, 12, "OUTLINE")
	button.text:SetPoint("CENTER")
		
	return button
end