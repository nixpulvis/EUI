# Code Style
This is a collection of information on how EUI is written. I'm writing this for the main purpose of documenting my thoughts, to help keep myself on track.

## Naming
Naming conventions for EUI, to help keep myself in check. These are guidelines I will try to stick to religiously, but like all religious people I am bound to go outside the rules here and there. (yea I'm an atheist, sorry Christians)

### Functions
Function naming will be descriptive of the task the function will perform. This plays nicely with a function based design approach, every task should be broken into it's lower level function pieces.

A good example might help, lets say I want to make some ramen.

  function MakeRamen()
    -- fill pot with 2 cups of water
    pot = FillPot( 2 )
    -- cook for 1.5 min
    Cook( pot, 1.5 )
  end

| Scope     | Case  | Space Char | Example                          |
|:----------|:------|:-----------|:---------------------------------|
| local     | lower | `_`        | `read_table()`                   |
| global    | camel | `none`     | `V.AddEventListener( ..., ... )` |

*Function call arguments are given 1 space padding.*

### Variables
To help keep variables scope, and use organized and readable I'll follow these naming conventions.

| Scope     | Prefix   | Suffix | Case  | Space Char | Example          |
|:----------|:---------|:-------|:------|:-----------|:-----------------|
| local     |  `none`  | `none` | lower | `_`        | `start_time`     |
| global    |  `V.`    | `none` | lower | `_`        | `V.my_level`     |
| constants |  `none`  | `none` | caps  | `_`        | `VERSION_NUMBER` |
| temporary |  `none`  | `_tmp` | lower | `_`        | `frames_tmp`     |

*note:* EUI doesn't actually store any variables in _G except, global frame names, and EUI addon name-space.

### Frames
Frames are all named according to what they represent, prefixed with `EUI_`. The actual name is camel-cased.

#### Examples:
  EUI_ChatFrame
  EUI_Minimap
  EUI_PlayerBuffs
  EUI_RecountSkin

### Files
Files names are lowercase connected by `_`. Files with general functionality will be plural, this is because functionality should be applicable more then once. Files with singular naming are implementations, these files contain actual setup and display of features.

## Comments
Comments are a critical part of any piece of software. They are what pulls together the thought and the implementation. Writing short and informative comments is an art in it of itself.

### File Header
Each file will have a header describing the goal of that file. It will contain information about the functionalities the code adds and any unusual dependents.

Example:

  -----------------------------------------------------------------------
  -- EUI Event Handler
  -----------------------------------------------------------------------
  --[[ this is designed to make updating information possible without the
     need to make a frame just for event handling. ]]

Notice that the "title" of the file is surrounded by horizontal lines each 72 chars long. The file title should include EUI in the name, and the first letter of each word should be capitalized. Following the title should be a block comment for the description. The description should be no more then 3-4 lines, lowercase.

### Code Comments
These are the most important part of commenting. The comments that are put into the code should make it clear what functions are doing. What variables are storing (if not clear implicitly). The main goal here is to make going back later and reading through the code as painless as possible, and to assist with the thought process before writing the code.

Example:

  -- binds the functions in V.events to the event-handler.

This is an example of a good comment in EUI. It clearly explains what the code will do. It starts with a lower case and ends with appropriate punctuation.

### Sections
Many files have a few somewhat distinct sections, in some cases these could be broken into their own files, however more often it's better to keep them in the same file.

Example:

  -- :: Style :: --------------------------------------------------------
  -----------------------------------------------------------------------

This defines a new section of the file. The lines should also be 72 chars long, consistent with the file header.

### Long Function Comments
Some functions, generally ones that implement major functionality, need more information documented then just one or two line comments. These functions should be documented with the following information.

1. return value(s)
2. parameters
3. functionality
4. use

Example:

  --[[
  EUI:CreateElement
    returns : Frame
    param   : name   - the name of the frame being created.
          module - the module this is a member of.
          parent - the frame this new frame will be parented to
    use     : every display item as part of a module should part of a containing
          element. use this function to setup the element.
    note    : Elements are the frames in charge of display settings.
  ]]