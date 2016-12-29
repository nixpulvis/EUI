local E, S, M = unpack(select(2, ...))
-----------------------------------------------------------------------
-- EUI Frame Functions
-----------------------------------------------------------------------
--[[ these functions are to be added to all EUI frames in the UI. ]]

-- TODO: This interface needs love.
do return end

-- Saving all functions to `V.meta.frame` to be referenced as the
-- meta frame for EUI's frames.
local meta = V.meta.frame

-- :: Constructors :: -------------------------------------------------
-----------------------------------------------------------------------

function F.createframe(name, parent, width, height, inherits)
  local frame = CreateFrame("Frame", name, parent, inherits)
  F.extend(frame, meta) -- apply the API to this frame

  -- style the frame
  frame:Style()

  -- if we have the width arg, then we can assume we have height
  if width then
    frame:SetSize(width, height)
  end

  return frame
end

function F.createbutton(name, parent, inherits)
  local frame = CreateFrame("Button", name, parent, inherits)
  F.extend(frame, meta) -- apply the API to this frame

  -- style the button
  frame:Style()

  -- default button width and height
  frame:SetSize(20, 20)

  return frame
end

-- :: Functions :: ----------------------------------------------------
-----------------------------------------------------------------------

-- make a string on a frame
function meta.createstring(self, string, font, height, flags)
  if not font then font = V.media.fonts.mono end
  if not height then height = 10 end
  if not flags then flags = "OUTLINE" end
  local text = self:CreateFontString(nil, "OVERLAY")
  text:SetFont(font, height, flags)
  text:SetText(string)
  text:SetJustifyH("CENTER")
  text:SetShadowOffset(0, 0)
  return text
end

-- remove a frame from the UI completely.
function meta.kill(self)
  self:Hide()
  _G[self:GetName()] = nil
end

function meta.setin(self, host)
  self:SetPoint("TOPLEFT", host, "TOPLEFT", 1, -1)
  self:SetPoint("BOTTOMRIGHT", host, "BOTTOMRIGHT", -1, 1)
end

-- remove all Textures from a frame. useful for stripping Blizz / Other addon's style.
function meta.striptextures(self)
  for i=1, self:GetNumRegions() do
    local region = select(i, self:GetRegions())
    if region:GetObjectType() == "Texture" then
      region:SetTexture(nil)
    end
  end
end

-- style the frame to EUI according to it's type
function meta.style(self, alpha)
  self:striptextures()
  F.Style[self:GetObjectType()](self)
end
