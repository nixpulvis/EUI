local M, S, V = unpack(select(2, ...))
-----------------------------------------------------------------------
-- EUI Media
-----------------------------------------------------------------------
--[[ links to media for use in EUI. all media located in V.media ]]

V.media = {
	tex = { },
	icons = { },
	fonts = { }
}

local tex = V.media.tex
local icons = V.media.icons
local fonts = V.media.fonts

---------- Textures -----------
tex["blank"] = [[Interface\AddOns\EUI\media\textures\blank.tga]]
tex["norm"] = [[Interface\AddOns\EUI\media\textures\normTex.tga]]

------------ Icons -------------
icons["mail"] = [[Interface\AddOns\EUI\media\icons\mail.tga]]

------------ Fonts -------------
fonts["main"] = [[Interface\AddOns\EUI\media\fonts\HelveticaWorld-Regular.ttf]]