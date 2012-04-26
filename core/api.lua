local M, S, V = unpack(select(2, ...))
-----------------------------------------------------------------------
-- EUI Frame Functions
-----------------------------------------------------------------------

-- Set the style of the frame to EUI
local function StyleFrame(frame)
	frame:SetBackdropColor(unpack(S.General.background_color))
	frame:SetBackdropBorderColor(unpack(S.General.border_color))
end

-- Really Really Kill something
local function Kill(frame)
	frame:Hide()
	_G[frame:GetName()] = nil
end

-- Remove all Textures from a frame. Usefull for stripping Blizz / Other addons style.
local function StripTextures(frame)
	for i=1, frame:GetNumRegions() do
		local region = select(i, frame:GetRegions())
		if region:GetObjectType() == "Texture" then
			region:SetTexture(nil)
		end
	end		
end

-- Set a frames points to it's parent 
local function SetAllPointsOffset(frame, offset, anchor_frame)
	anchor_frame = anchor_frame or frame:GetParent()
	
	frame:SetPoint("TOPLEFT", anchor_frame, "TOPLEFT", -offset, offset)
	frame:SetPoint("BOTTOMRIGHT", anchor_frame, "BOTTOMRIGHT", offset, -offset)
end	

-----------------------------------------------------------------------
-- Integrate EUI functions to the frames
-----------------------------------------------------------------------

local function AddFunctionsTo(frame)
	local meta = getmetatable(frame).__index

	if not frame.StyleFrame then meta.StyleFrame = StyleFrame end
	if not frame.Kill then meta.Kill = Kill end
	if not frame.StripTextures then meta.StripTextures = StripTextures end
	if not frame.SetAllPointsOffset then meta.SetAllPointsOffset = SetAllPointsOffset end	
end


local type_handled = {}
local frame = EnumerateFrames()
while frame do
	if not type_handled[frame:GetObjectType()] then
		AddFunctionsTo(frame)
		type_handled[frame:GetObjectType()] = true
	end

	frame = EnumerateFrames(frame)
end