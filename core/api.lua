local M, S, V = unpack(select(2, ...))
-----------------------------------------------------------------------
-- EUI Frame Functions
-----------------------------------------------------------------------

-- Set the style of the frame to EUI
local function StyleFrame(frame, alpha)
	local r,g,b,a = unpack(S.General.background_color)
	if not alpha then alpha = a end
	frame:SetBackdrop({ 
	  bgFile = V.media.tex.blank, 
	  edgeFile = V.media.tex.blank, tile = false, tileSize = 0, edgeSize = 1, 
	  insets = { left = -1, right = -1, top = -1, bottom = -1 }
	})
	frame:SetBackdropColor(r, g, b, alpha)
	frame:SetBackdropBorderColor(unpack(S.General.border_color))
end

-- Stlye frame to interavt with the mouse on hover.
local function StyleButton(frame)
	local hover_color = { .5, .5, .5, select(4, unpack(S.General.background_color)) }
	local mousedown_color = { .3, .3, .3, select(4, unpack(S.General.background_color)) }
	
	-- Set a variable for the state of the hover.
	frame.hover = false;
	
	-- Texture for the overlay effect.
	frame.overlay = frame:CreateTexture()
	frame.overlay:SetPoint("BOTTOMLEFT", frame, "BOTTOMLEFT", 2, 2)
	frame.overlay:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -2, -2)
	frame.overlay:SetTexture(unpack(hover_color))
	frame.overlay:Hide()
	
	frame:SetScript("OnEnter", function(self) 
		--self:SetBackdropColor(unpack(hover_color))
		self.overlay:Show()
		self.hover = true
	end)
	frame:SetScript("OnLeave", function(self) 
		--self:SetBackdropColor(unpack(S.General.background_color))
		self.overlay:Hide()
		self.hover = false
	end)
	frame:SetScript("OnMouseDown", function(self) 
		--self:SetBackdropColor(unpack(mousedown_color))
		self.overlay:Hide()
	end)
	frame:SetScript("OnMouseUp", function(self) 
		if self.hover then
			--self:SetBackdropColor(unpack(hover_color))
			self.overlay:Show()
		else
			--self:SetBackdropColor(unpack(S.General.background_color))
			self.overlay:Hide()
		end
	end)
end

-- Make a string on a frame
function CreateString(frame, string, fontName, fontHeight, fontStyle)
	local text = frame:CreateFontString(nil, "OVERLAY")
	text:SetFont(fontName, fontHeight, fontStyle)
	text:SetText(string)
	text:SetJustifyH("LEFT")
	text:SetShadowColor(0, 0, 0)
	text:SetShadowOffset(1.25, -1.25)
	return text
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

-----------------------------------------------------------------------
-- Integrate EUI functions to the frames
-----------------------------------------------------------------------

local function AddFunctionsTo(frame)
	local meta = getmetatable(frame).__index

	if not frame.StyleFrame then meta.StyleFrame = StyleFrame end
	if not frame.StyleButton then meta.StyleButton = StyleButton end
	if not frame.CreateString then meta.CreateString = CreateString end	
	if not frame.Kill then meta.Kill = Kill end
	if not frame.StripTextures then meta.StripTextures = StripTextures end
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