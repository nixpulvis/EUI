# Printing
EUI's custom outputs are formatted for consistency. These functions are intended to be used for all EUI chat text interaction with the user.

This is an example of EUI printing <code><span style='color:orange;'>EUI:</span> use /eui to move and configure elements.</code>

## Uses
There are many uses for chat output in a user interface. Slash command information, Detailed descriptions of features, Warnings and Errors, and more are all best displayed in the chat. To ensure a consistent user experience it is critical that these chat messages are formatted and style the same in every invocation. EUI's printing functionality assures this.

### Single Line Information
When simple information needs to be displayed on screen this is the best way to output it. These messages are minimally styled, and can provide the user with small amounts of guidance where needed.

Examples:

<code><span style='color:orange;'>EUI:</span> CONFIG MODE, press ok to save changes</code>
<code><span style='color:orange;'>EUI:</span> NAMEPLATES [Disabled]</code>
<code><span style='color:orange;'>EUI:</span> copied character settings to [Epicelement]</code>

### Block Style Information
When it is needed to display more information to the user. These messages should be displayed has blocks, with headers. Common uses for these type of messages are slash command help.

Example:

<pre><span style='color:orange;'>/eui:</span> <span style='color:tan;'>EUI configuration</span>
  /eui    : toggle EUI's configuration
  /eui -h : show this documentation
  /eui -m : move-only
  /eui -reset : reset to default positions
</pre>

### Warnings and Errors
Unlike errors and warnings to developers, users to can experience intended warnings are errors. Things like attempting to call /eui in combat should result in a error (non operational command). Likewise a user neglecting to repair his gear before a fight could result in a warning (functionally irrelevant issue).

Examples:

<code><span style='color:red;'>EUI ERROR:</span> Cannot do /eui in combat</code>
<code><span style='color:red;'>EUI ERROR:</span> Not a valid Spellid [sid23]</code>

<code><span style='color:orange;'>EUI WARNING:</span> Gear condition at 20%</code>
<code><span style='color:orange;'>EUI WARNING:</span> Symbiosis faded from [Kione]</code>