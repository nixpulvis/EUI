# Code Style

## Naming
Naming conventions for EUI, to help keep myself in check. These are guidelines I will try to stick to religiously, but like all religious people I am bound to go outside the rules here and there. (yea I'm an atheist, sorry christians)

### Functions
Function naming will be descriptive of the task the function will perform. This plays nicely with a function based design approach, every task should be broken into it's lower level function pieces.

A good example might help, lets say I want to make some ramen.

	function MakeRamen()
		-- fill pot with 2 cups of water
		pot = FillPot( 2 )
		-- cook for 1.5 min
		Cook( pot, 1.5 )
	end

* Function name `MakeRamen` is camel-cased, with the initial letter capitalized.
* Function call arguments are given 1 space padding.

### Variables
To help keep variables scope, and use organized and readable I'll follow these naming conventions.

| Scope     | Prefix   | Suffix | Case  | Space Char | Example          |
|:----------|:---------|:-------|:------|:-----------|:-----------------|
| local     |  `none`  | `none` | lower | `_`        | `start_time`     |
| global    |  `V.`    | `none` | lower | `_`        | `V.my_level`     |
| constants |  `none`  | `none` | caps  | `_`        | `VERSION_NUMBER` |
| temporary |  `none`  | `_tmp` | lower | `_`        | `frames_tmp`     |

*note:* EUI doesn't actually store any variables in _G except, global frame names, and EUI addon namespace.

### Frames
Frames are all named according to what they represent, prefixed with `EUI_`. The actual name is camel-cased. 

#### Examples:
`EUI_ChatFrame`  
`EUI_Minimap`  
`EUI_PlayerBuffs`  
`EUI_RecountSkin`  

### Files
Files names are lowercase connected by `_`. Files with general functionality will be plural, this is because functionality should be applicable more then once. Files with singular naming are implementations, these files contain actual setup and display of features.