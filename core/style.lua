local M, S, V = unpack(select(2, ...))
-----------------------------------------------------------------------
-- EUI Style
-----------------------------------------------------------------------
--[[ these are functions designed to be called from within
     the EUI api ]]

-- gorup these functions into a table
V['style'] = { }

-- :: Frames :: -------------------------------------------------------
-----------------------------------------------------------------------
function V.style.Frame( frame, alpha )
  local r,g,b,a = unpack(S.General.background_color)
  if not alpha then alpha = a end
  frame:SetBackdrop({
    bgFile = V.media.tex.blank,
    edgeFile = V.media.tex.blank, tile = false, tileSize = 0, edgeSize = 1,
  })
  frame:SetBackdropColor(r, g, b, alpha)
  frame:SetBackdropBorderColor(unpack(S.General.border_color))
end

-- :: Buttons :: ------------------------------------------------------
-----------------------------------------------------------------------
function V.style.Button( frame )
  V.style.Frame(frame)

  local hover_color = { .5, .5, .5, select(4, unpack(S.General.background_color)) }
  local mousedown_color = { .3, .3, .3, select(4, unpack(S.General.background_color)) }

  -- Texture for the overlay effect.
  frame.overlay = frame:CreateTexture(nil, "HIGHLIGHT")
  frame.overlay:SetPoint("TOPLEFT", 1, -1)
  frame.overlay:SetPoint("BOTTOMRIGHT", -1, 1)
  frame.overlay:SetTexture(unpack(hover_color))

  frame:HookScript("OnMouseDown", function(self)
    self.overlay:SetTexture(unpack(mousedown_color))
  end)
  frame:HookScript("OnMouseUp", function(self)
    self.overlay:SetTexture(unpack(hover_color))
  end)
end

-- :: StatusBar :: ----------------------------------------------------
-----------------------------------------------------------------------
function V.style.StatusBar( frame )
  V.style.Frame(frame)
end

-- :: GameTooltip :: --------------------------------------------------
-----------------------------------------------------------------------
function V.style.GameTooltip( frame )
  V.style.Frame(frame)
end

-- :: EditBox :: ----------------------------------------------------
-----------------------------------------------------------------------
function V.style.EditBox( frame )
  V.style.Frame(frame)
end

-- :: Assure Complete Skin Set :: -------------------------------------
-----------------------------------------------------------------------
-- remove once passing, this is just for me
-- for i,v in ipairs(V.frame_types) do
--   assert(V.style[v])
-- end