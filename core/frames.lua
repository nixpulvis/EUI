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
	frame:StyleFrame()
	
	-- if we have the width arg, then we should require the height as well.
	if width then
		frame:SetSize(width, height)
	end
	
	return frame
end

--[[
EUI:CreateButton
	returns : new Button (frame)
	param : name   - the name of the button being created
			parent - the frame this new frame will be parented to
			text   - the text on the button
	NOTE  :	BUTTONS CREATED WITH THIS FUNCTION NEED TO BE POSITIONED STILL
			adding functionality shouls be done with a HookScript.
]]
function V:CreateButton(name, parent, text)
	local button = CreateFrame("Button", name, parent)

	button:StyleFrame()
	button:StyleButton()
	
	-- default button width and height
	button:SetSize(20, 20)
	
	button.text = button:CreateString(text, V.media.fonts.main, 12)
	button.text:SetPoint("CENTER")
		
	return button
end