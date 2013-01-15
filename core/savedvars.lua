local M, S, V, F = unpack(select(2, ...))
-----------------------------------------------------------------------
-- EUI Saved Variables
-----------------------------------------------------------------------
--[[ load in and save out the EUIData and EUIPerCharacterData. on load we pull
   the variables into S.xxx in order to remove complexity around
   savedvar usage in other areas of EUI. ]]

-- -- Load the saved variables into V.saved or V.savedperchar
-- local function load()
--   if not EUIData then EUIData = { } end
--   if not EUIPerCharacterData then EUIPerCharacterData = { } end

--   -- some tables are going to be needed, init here
--   if not EUIData.noload then EUIData.noload = { } end

--   S.saved = EUIData
--   S.savedperchar = EUIPerCharacterData
-- end

-- -- save V.saved and V.savedperchar to saved variables
-- local function save()
--   EUIData = S.saved
--   EUIPerCharacterData = S.savedperchar
-- end

-- -- EUI function to clear Saved vars
-- function S.clear()
--   S.saved = { }
--   S.savedperchar = { }
--   save()
-- end

-- -- :: Event :: --------------------------------------------------------
-- -----------------------------------------------------------------------

local handler, events = CreateFrame("Frame"), { }
function events:PLAYER_LOGOUT()

end
function events:ADDON_LOADED(name)
  if not name == "EUI" then return end

  EUIData = {
    ["test_color"] = {1,0,0}
  }
end

for k, v in pairs(events) do
  handler:RegisterEvent(k)
end
handler:SetScript("OnEvent", function(self, event, ...)
  events[event](self, ...)
end)

-- testing this shit

function load_this_thing()
  frame = CreateFrame("Frame")
  frame:SetBackdrop({
    bgFile = [[Interface\AddOns\EUI\media\textures\blank.tga]],
    edgeFile = [[Interface\AddOns\EUI\media\textures\blank.tga]],
    edgeSize = 1,
    insets = { left = 0, right = 0, top = 0, bottom = 0 }
  })
  frame:SetPoint("Center")
  frame:SetSize(150, 150)
  frame:SerBackdropColor(unpack(S.test_color))
end