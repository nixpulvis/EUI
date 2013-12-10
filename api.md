EUI API
=======

This document is intended to give detailed explanations and examples of every function in EUI's toolkit. I'm building this as I go to use personally. Functions parameters and return values are described as well as the funtions effects. There is a section on constants and settings, these are like environment variables, they don't change mid run.  See [this](http://wowprogramming.com/docs/api_types) for the base types infered from wow's api. Then there ar e

## Types

LUA is a dynamically typed language, dispite this I'll be strictly typing my functions with the following types. Taken from LUA, WoW, or created for EUI.

### LUA Types
- [nil](http://www.lua.org/pil/2.1.html)
- [boolean](http://www.lua.org/pil/2.2.html)
- [number](http://www.lua.org/pil/2.3.html)
- [string](http://www.lua.org/pil/2.4.html)
- [table](http://www.lua.org/pil/2.5.html)
- [function](http://www.lua.org/pil/2.6.html)

I'm not going to go into `userdata` here.

### WoW Types
- [1nil](http://wowprogramming.com/docs/api_types#1nil)
- [accessID](http://wowprogramming.com/docs/api_types#accessID)
- [actionID](http://wowprogramming.com/docs/api_types#actionID)
- [ah-list-type](http://wowprogramming.com/docs/api_types#ah-list-type)
- [anchorPoint](http://wowprogramming.com/docs/api_types#anchorPoint)
- [arenaTeamID](http://wowprogramming.com/docs/api_types#arenaTeamID)
- [auraFilter](http://wowprogramming.com/docs/api_types#auraFilter)
- [backdrop](http://wowprogramming.com/docs/api_types#backdrop)
- [blizzid](http://wowprogramming.com/docs/api_types#blizzid)
- [bitfield](http://wowprogramming.com/docs/api_types#bitfield)
- [binding](http://wowprogramming.com/docs/api_types#binding)
- [chatMsgType](http://wowprogramming.com/docs/api_types#chatMsgType)
- [colorString](http://wowprogramming.com/docs/api_types#colorString)
- [containerID](http://wowprogramming.com/docs/api_types#containerID)
- [containerSlotID](http://wowprogramming.com/docs/api_types#containerSlotID)
- [expansionID](http://wowprogramming.com/docs/api_types#expansionID)
- [frameStrata](http://wowprogramming.com/docs/api_types#frameStrata)
- [glyphIndex](http://wowprogramming.com/docs/api_types#glyphIndex)
- [GUID](http://wowprogramming.com/docs/api_types#GUID)
- [|K string](http://wowprogramming.com/docs/api_types#Kstring)
- [hyperlink](http://wowprogramming.com/docs/api_types#hyperlink)
- [inventoryID](http://wowprogramming.com/docs/api_types#inventoryID)
- [itemID](http://wowprogramming.com/docs/api_types#itemID)
- [itemLocation](http://wowprogramming.com/docs/api_types#itemLocation)
- [itemQuality](http://wowprogramming.com/docs/api_types#itemQuality)
- [itemString](http://wowprogramming.com/docs/api_types#itemString)
- [justifyH](http://wowprogramming.com/docs/api_types#justifyH)
- [justifyV](http://wowprogramming.com/docs/api_types#justifyV)
- [layer](http://wowprogramming.com/docs/api_types#layer)
- [macroID](http://wowprogramming.com/docs/api_types#macroID)
- [presenceID](http://wowprogramming.com/docs/api_types#presenceID)
- [powerType](http://wowprogramming.com/docs/api_types#powerType)
- [reportType](http://wowprogramming.com/docs/api_types#reportType)
- [rollID](http://wowprogramming.com/docs/api_types#rollID)
- [specID](http://wowprogramming.com/docs/api_types#specID)
- [spellbookID](http://wowprogramming.com/docs/api_types#spellbookID)
- [spellID](http://wowprogramming.com/docs/api_types#spellID)
- [standingID](http://wowprogramming.com/docs/api_types#standingID)
- [unitID](http://wowprogramming.com/docs/api_types#unitID)

## Frame Function
- [E.CreateFrame](#ecreateframe)
- [E.CreateButton](#ecreatebutton)
- [E.AddString](#eaddstring)
- [E.Kill](#ekill)
- [E.StripTextures](#estriptextures)

## General Utilities
- [E.CopyTable](#ecopytable)
- [E.Round](#eround)
- [E.HexToColor](#ehextocolor)
- [E.ColorToHex](#ecolortohex)
- [E.FormatTime](#eformattime)
