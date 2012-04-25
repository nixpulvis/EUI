local E, S = unpack(select(2, ...))
-----------------------------------------------------------------------
-- EUI Frame Functions
-----------------------------------------------------------------------

local function StyleFrame(frame)
	frame:SetBackdropColor(unpack(S.General.background_color))
	frame:SetBackdropBorderColor(unpack(S.General.border_color))
end

local function StripTextures(frame)
	for i=1, frame:GetNumRegions() do
		local region = select(i, frame:GetRegions())
		if region:GetObjectType() == "Texture" then
			region:SetTexture(nil)
		end
	end		
end

-----------------------------------------------------------------------
-- Integrate EUI functions to the frames
-----------------------------------------------------------------------

local function AddFunctionsTo(frame)
	local meta = getmetatable(frame).__index
	
	--for k,v in pairs(FUNCTIONS) do
		if not frame.StyleFrame then meta.StyleFrame = StyleFrame end
		if not frame.StripTextures then meta.StripTextures = StripTextures end
	--end	
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