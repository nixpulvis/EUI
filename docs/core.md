# CORE
The folder `eui/core` is EUI's main location for functionality needed for implementing modules, and handling data.

## API
These EUI's functions added to all frames. These functions are generalized to be usefull in many cases. Specific frame functionality should NOT be added here.

Usage: `Frame:Function( frame, args... )`

Example:
	
	local frame = CreateFrame("Frame")
	frame:CreateString('hi', helvetica, 12)


### :StyleFrame
Styles the frame for EUI, with the default alpha. An optional argument can be provided to override the default alpha.

Usage:

	frame:StyleFrame()
	frame2:StyleFrame(.5)

Added Fields:

	none


### :StyleButton
Styles a frame (generally a button) to react to a mouse hover and click. It will glow and depress accordingly.

Warning: Use caution when using this function with frames that have scripts bound to `OnEnter`, `OnLeave`, `OnMouseDown`, and `OnMouseUp`.

Usage:

	frame:StyleButton()

Added Fields:

	frame.hover 		<-- boolean
	frame.overlay 		<-- Texture


### :CreateString
Creates a FontString for the frame. It needs a value for the text, and the font style. After creation this text field needs to be positioned. Updates to the text value should be done with `:SetText()`

Usage:
	
	frame:CreateString('hi', helvetica, 12, 'MONOCHROME')

Added Fields:

	frame.text


### :Kill
Completely remove the frame, this function should be used with caution. It hides the frame and then sets it equal to nil in the global scope. Attempts to call a frame that has been killed will end poorly.

Usage:

	frame:Kill()

Added Fields:

	none


### :Skin
Skins the frame according to it's type, this function can be provided an optional argument to override the default alpha of the frame. The goal of this function is to replace all Style... functions.

Usage:

	frame:Skin()
	frame2:Skin(.5)

Added Fields:

	TBD

## M.E.F (Module, Element, Frame) System
EUI is comprised of a collection of modules. These modules are encapsulated such that any of the modules could run without any other module. This allows for better user customization, and better code reliability. 

### Modules
A module is the high level container for a functional UI piece. Things like the Chat, Minimap, and Unitframes, are all modules. Modules can have multiple detached elements, but must have at least one. 

Modules have their own namespace, and act as much like a complete addon. The namespace is the table that is returned by `V:NewModule`

Use `V:NewModule` to define a new module, this function should be near the top of the file and should only be used in files within the "modules" folder.

Usage:

	local chat = V:NewModule("chat")

In this example `chat` is this modules namespace and `chat:load()` will be called on AddonLoaded. Every module needs a load function in order to be enabled.

### Elements
An element is what the user would think of as a panel, it's a collection of frames that makes up a functional element. It's frames are generally all positioned on or around the main element frame. Examples of elements are: PlayerFrame, Minimap, Chatframes.

Elements are all also able to be moved and hidden based on combat state. When an element is created it is given a mover frame, this frame is in charge of handling the positioning and display settings. 

### Frames
Frames are just standard blizz frames, however `V:CreateFrame()` is advised to be used since it will create a styled frame. This is completely optional however. It's worth mentioning again, elements ARE frames themselves and can be operated on like any other frame.

## Events
EUI provides a clean way to deal with events that are not directly related to any frame. The event handler stores a table of event function pairs, then registers and fires the appropriate function on the appropriate event.

Usage:

	V.AddEventListener(function, event)
	V.RemoveEventLisener(function, event)

Example:
	
	local lvl = UnitLevel('player')

	local function update_level()
		  lvl = UnitLevel('player')
	end

	V.AddEventListener(update_level, "PLAYER_LEVEL_UP")

Some events provide arguments. To use these arguments, simply add arguments to the function ad follows.

	local function get_auras(self, uid)
		print(uid)
	end

	V.AddEventListener(get_auras, "UNIT_AURA")

Notice the first argument is self, this is a reference to the event handler.

## Functions
Here lies what will surely be a massive amount of important stuff. Functions for all of EUI. Basically anything that more then one module will need will end up here.

*ADD MORE DOCUMENTATION HERE*

## Dev
This is a place where dev tools and convieance functions should go. Nothing in this file should be depended on, that is to say, if I deleted this file, nothing would break.

### /rl
Best slash command ever! You alias for /reload or /reloadui










