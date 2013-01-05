local M, S, V, F = unpack(select(2, ...))
-----------------------------------------------------------------------
-- EUI Style
-----------------------------------------------------------------------
--[[ Every frame-type that EUI can create needs a styling function.
     To make dynamically calling these functions easier I'm going
     to break convention and name the functions starting with a
     capitol letter. ]]

F.Style = { }

-- :: Frames :: -------------------------------------------------------
-----------------------------------------------------------------------
function F.Style.Frame(frame, alpha)
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
function F.Style.Button(frame, alpha)
  F.Style.frame(frame, alpha)

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