local M, S, V = unpack(select(2, ...))
-----------------------------------------------------------------------
-- EUI Frame Functions
-----------------------------------------------------------------------
--[[ these functions are to be added to all frames in the UI. styling,
     and new frame functionality should be added here. anything I'd
     want to call like Frame:SomeFunction() ]]

-- :: Style :: --------------------------------------------------------
-----------------------------------------------------------------------

-- make the frame look like an EUI frame.
local function StyleFrame( frame, alpha )
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

-- stlye button to highlight on hover.
local function StyleButton( frame )
  local hover_color = { .5, .5, .5, select(4, unpack(S.General.background_color)) }
  local mousedown_color = { .3, .3, .3, select(4, unpack(S.General.background_color)) }

  -- Set a variable for the state of the hover.
  frame.hover = false;

  -- Texture for the overlay effect.
  frame.overlay = frame:CreateTexture()
  frame.overlay:SetAllPoints()
  frame.overlay:SetTexture(unpack(hover_color))
  frame.overlay:Hide()

  frame:SetScript("OnEnter", function(self) 
    self.overlay:Show()
    self.hover = true
  end)
  frame:SetScript("OnLeave", function(self) 
    self.overlay:Hide()
    self.hover = false
  end)
  frame:SetScript("OnMouseDown", function(self) 
    self.overlay:Hide()
  end)
  frame:SetScript("OnMouseUp", function(self) 
    if self.hover then
      self.overlay:Show()
    else
      self.overlay:Hide()
    end
  end)
end

-- :: Creation / Destruction :: ---------------------------------------
-----------------------------------------------------------------------

-- make a string on a frame
function CreateString( frame, string, fontName, fontHeight, fontStyle )
  local text = frame:CreateFontString(nil, "OVERLAY")
  text:SetFont(fontName, fontHeight, fontStyle)
  text:SetText(string)
  text:SetJustifyH("LEFT")
  text:SetShadowColor(0, 0, 0)
  text:SetShadowOffset(1.25, -1.25)
  return text
end

-- remove a frame from the UI completely. 
local function Kill( frame )
  frame:Hide()
  _G[frame:GetName()] = nil
end

-- remove all Textures from a frame. useful for stripping Blizz / Other addon's style.
local function StripTextures( frame )
  for i=1, frame:GetNumRegions() do
    local region = select(i, frame:GetRegions())
    if region:GetObjectType() == "Texture" then
      region:SetTexture(nil)
    end
  end   
end

-- skin the frame, designed to handle all types of frames
local function Skin( frame, alpha )
  frame:StripTextures()

  local otype = frame:GetObjectType()
  if otype == "Frame" then
    StyleFrame(frame)
  elseif otype == "Button" then
    StyleButton(frame)
  elseif otype == "EditBox" then
    -- TODO: make this sexier :)
    StyleFrame(frame)       
  elseif otype == "GameTooltip" then
    -- TODO: make this sexier :)
    StyleFrame(frame)
  elseif otype == "StatusBar" then
    -- TODO: make this sexier :)
    StyleFrame(frame)
  else
    error("Skin() is not applicable for the type "..otype)
  end
end

-- :: Integration :: --------------------------------------------------
-----------------------------------------------------------------------

local function AddFunctionsTo( frame )
  local meta = getmetatable(frame).__index
  meta.StyleFrame = StyleFrame
  meta.StyleButton = StyleButton
  meta.CreateString = CreateString  
  meta.Kill = Kill
  meta.StripTextures = StripTextures
  meta.Skin = Skin
end

-- add functions to frames
for i,v in ipairs(V.frame_types) do
  AddFunctionsTo(CreateFrame(v))
end
-- add functions to layeredregions (manually cause this is a bitch)
AddFunctionsTo( CreateFrame('Frame'):CreateTexture() )
AddFunctionsTo( CreateFrame('Frame'):CreateFontString() )