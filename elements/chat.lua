local E, S = unpack(select(2, ...))
-----------------------------------------------------------------------
-- EUI Chat
-----------------------------------------------------------------------

local chat_frame = ChatFrame1

chat_frame:StripTextures()
chat_frame:SetBackdrop( { 
  bgFile = [[Interface\AddOns\EUI\media\blank]], 
  edgeFile = [[Interface\AddOns\EUI\media\blank]], tile = false, tileSize = 0, edgeSize = 1, 
  insets = { left = -3, right = -3, top = -3, bottom = -3 }
});


ChatFrame1EditBox:StripTextures()