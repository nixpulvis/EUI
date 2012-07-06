local M, S, V = unpack(select(2, ...))
-----------------------------------------------------------------------
-- EUI Frame Functions
-----------------------------------------------------------------------
--[[ these functions are to be added to all frames in the UI. styling,
     and new frame functionality should be added here. anything I'd
     want to call like Frame:SomeFunction() ]]

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

-- style the frame to EUI according to it's type
local function Style( frame, alpha )
  frame:StripTextures()

  local otype = frame:GetObjectType()
  V.style[otype](frame, alpha)
end

-- :: Integration :: --------------------------------------------------
-----------------------------------------------------------------------

local function AddFunctionsTo( frame )
  local meta = getmetatable(frame).__index
  meta.CreateString = CreateString  
  meta.Kill = Kill
  meta.StripTextures = StripTextures
  meta.Style = Style
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
AddFunctionsTo(temp['Frame']:CreateTexture())
AddFunctionsTo(temp['Frame']:CreateFontString())