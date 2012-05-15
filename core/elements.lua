local M, S, V = unpack(select(2, ...))

--[[ ELEMENTS within the MEF system.
an element is what the user will see on the screen as a individual part of the UI.
for example, the Left Chat Frame is an element, however there maw be more chat frames,
each one is an element, eventhough they are in the same module.
]]

--[[
EUI:CreateElement
	returns : new Frame
	param : name - the name of the frame being created
			module - the module this is a member of. (might remove this.)
			parent - the frame this new frame will be parented to
	NOTE : FRAMES CREATED WITH THIS FUNCTION NEED TO BE POSITIONED STILL
		   Additionally these Elements are the frames in charge of display settings.
]]
function V:CreateElement(module, name, parent)
	local element = { 
		tier = 0
	}
	
	-- Set the color of the tiers
	local function TierColor()
		if element.tier == 0 then
			return V.HexToColor("3FFF00")
		elseif element.tier == 1 then
			return V.HexToColor("FF8C00")
		else 
			return V.HexToColor("FF0000")
		end 
	end
	
	-- toggle through the tiers and update color.
	local function ToggleTier(self, button)
		element.tier = (element.tier+1)%3
		self.bg:SetTexture(TierColor())
		print(element.tier)
	end
	
	-- Making the frame
	local frame = V:CreateFrame(name, parent)
	element.frame = frame
	
	local mover = V:CreateFrame(name.."_Mover", element.frame)
	mover:SetPoint("TOPRIGHT", element.frame, "TOPLEFT", -3, 0)
	mover:SetPoint("BOTTOMRIGHT", element.frame, "BOTTOMLEFT", -3, 0)
	mover:SetWidth(15)
	mover:Hide()
	
	mover.bg = mover:CreateTexture(nil, "OVERLAY")
	mover.bg:SetPoint("TOPLEFT", 2, -2)
	mover.bg:SetPoint("BOTTOMRIGHT", -2, 2)
	mover.bg:SetTexture(TierColor())
	
	mover:SetScript("OnMouseUp", ToggleTier)
	
	element.mover = mover

	module.elements[name] = element
	return element.frame
end