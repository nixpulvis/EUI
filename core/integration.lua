local FUNCTIONS, SETTINGS = unpack(_G.EUI)
-----------------------------------------------------------------------
-- Integrate EUI functions to the frames
-----------------------------------------------------------------------

local function AddFunctionsTo(frame)
	local meta = getmetatable(frame).__index
	
	for k,v in pairs(FUNCTIONS) do
		if not frame.k then meta.k = v end
	end	
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