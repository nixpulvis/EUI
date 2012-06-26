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

-- Stlye frame to interact with the mouse on hover.
local function StyleButton(frame)
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

------------------------------------------------------------------

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

-- Skins the frame, designed to handle all types of frames
local function Skin(frame, alpha)
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
-----------------------------------------------------------------------
-- Integrate EUI functions to the frames  
-- TODO optimize this, currently taken from TUKUI
-----------------------------------------------------------------------

local function AddFunctionsTo(frame)
  local meta = getmetatable(frame).__index
  meta.StyleFrame = StyleFrame
  meta.StyleButton = StyleButton
  meta.CreateString = CreateString  
  meta.Kill = Kill
  meta.StripTextures = StripTextures
  meta.Skin = Skin
end

local temp = {}
-- add functions to frames
for i,v in ipairs(V.frame_types) do
  temp[v] = CreateFrame(v, "Registration_"..v)
  AddFunctionsTo(temp[v])

  -- remove this silly silly frame
  temp[v]:Hide()
  _G[temp[v]:GetName()] = nil
end
-- add functions to layeredregions (manually cause this is a bitch)
AddFunctionsTo(temp['Frame']:CreateTexture())
AddFunctionsTo(temp['Frame']:CreateFontString())