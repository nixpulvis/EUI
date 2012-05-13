local M, S, V = unpack(select(2, ...))
-----------------------------------------------------------------------
-- EUI Media
-----------------------------------------------------------------------

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

------------ Icons -------------
icons["mail"] = [[Interface\AddOns\EUI\media\icons\mail.tga]]

------------ Fonts -------------
fonts["main"] = [[Interface\AddOns\EUI\media\fonts\HelveticaWorld-Regular.ttf]]