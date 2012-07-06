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
    insets = { left = -1, right = -1, top = -1, bottom = -1 }
  })
  frame:SetBackdropColor(r, g, b, alpha)
  frame:SetBackdropBorderColor(unpack(S.General.border_color))
end

-- :: Buttons :: ------------------------------------------------------
-----------------------------------------------------------------------
function V.style.Button( frame )
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


-- :: Assure Complete Skin Set :: -------------------------------------
-----------------------------------------------------------------------
-- remove once passing, this is just for me
for i,v in ipairs(V.frame_types) do
	assert(V.style[v])
end