local E, S, M = unpack(select(2, ...))
-----------------------------------------------------------------------
-- EUI Minimap
-----------------------------------------------------------------------
--[[ setup for EUIs minimap ]]

-- local minimap = V:NewModule("minimap")
M.minimap = {}
S.minimap = {}
S.minimap.size = 200

function M.minimap:load()
  -- TODO: use `E.CreateFrame`
  local EUIMinimap = CreateFrame("Frame", "EUIMinimap", UIParent)
  EUIMinimap:SetPoint("TOPRIGHT", UIParent, "TOPRIGHT", -20, -20)
  EUIMinimap:SetSize(S.minimap.size, S.minimap.size)
  EUIMinimap:SetFrameStrata("LOW")

  -- squarifies the map
  Minimap:SetMaskTexture(E.media.textures.blank)
  function GetMinimapShape() return "SQUARE" end

  -- sets blizz.Minimap's parent to EUIMinimap and anchors it correctly
  Minimap:SetParent(EUIMinimap)
  Minimap:ClearAllPoints()
  Minimap:SetPoint("TOPLEFT", 2, -2)
  Minimap:SetPoint("BOTTOMRIGHT", -2, 2)
  Minimap:SetSize(S.minimap.size,S.minimap.size)

  -- :: Hiding :: --------------------------
  ------------------------------------------
  -- hides border
  MinimapBorder:Hide()
  MinimapBorderTop:Hide()
  -- hides the zone text
  MinimapZoneTextButton:Hide()
  -- hides world map button
  MiniMapWorldMapButton:Hide()
  -- hide "N"
  MinimapNorthTag:SetTexture(nil)
  -- hide the zoom
  MinimapZoomIn:Hide()
  MinimapZoomOut:Hide()
  -- hide voice chat
  MiniMapVoiceChatFrame:Hide()
  -- hide calendar
  GameTimeFrame:Hide()
  -- hide tracking
  MiniMapTracking:Hide()
  -- hide garrison report
  GarrisonLandingPageMinimapButton:UnregisterAllEvents()
  GarrisonLandingPageMinimapButton:Hide()

  -- skin and move mail icon
  MiniMapMailFrame:ClearAllPoints()
  MiniMapMailFrame:SetPoint("TOPRIGHT", Minimap, 3, 3)
  MiniMapMailIcon:SetTexture(E.media.icons.mail)
  MiniMapMailBorder:Hide()

  -- puts dungeon difficulty in TOPLEFT corner
  MiniMapInstanceDifficulty:ClearAllPoints()
  MiniMapInstanceDifficulty:SetParent(Minimap)
  MiniMapInstanceDifficulty:SetPoint("TOPLEFT", Minimap, "TOPLEFT", 0, 0)
  GuildInstanceDifficulty:ClearAllPoints()
  GuildInstanceDifficulty:SetParent(Minimap)
  GuildInstanceDifficulty:SetPoint("TOPLEFT", Minimap, "TOPLEFT", 0, 0)

  -- put LFG/LFR icon in BOTTOMLEFT corner
  QueueStatusMinimapButton:ClearAllPoints()
  QueueStatusMinimapButton:SetPoint("BOTTOMLEFT", Minimap, 0, 0)
  QueueStatusMinimapButtonBorder:Hide()

  --right clicking minimap brings up tracking menu
  Minimap:SetScript("OnMouseUp", function(self, button)
    if button == "RightButton" then
      UIDropDownMenu_SetAnchor(MiniMapTrackingDropDown, -5, 0, "TOPRIGHT", EUIMinimap, "TOPLEFT")
      ToggleDropDownMenu(1, nil, MiniMapTrackingDropDown)
    else
      Minimap_OnClick(self)
    end
  end)

  --scrolling to zoom
  Minimap:EnableMouseWheel(true)
  Minimap:SetScript("OnMouseWheel", function(self, direction)
    if direction > 0 then
      _G.MinimapZoomIn:Click()
    elseif direction < 0 then
      _G.MinimapZoomOut:Click()
    end
  end)
end
