# Namespace
EUI contains variables for colors, metadata, config settings, users data... This data is organized into 3 logical subsection of the EUI namespace.

	local M, S, V = unpack(select(2, ...))

## Modules
This is where all EUI's modules are stored, this includes the frames along with data that they need to operate. When a module is created it creates a table in `M` for this data.

## Saved Variables
World of Warcraft allows addon developers to store data in a persistent location between sessions, for convenience EUI accesses this storage once on load and once on logout, all data that will be stored persistently is stored in `S`

## Variables
Many variables are needed to run EUI. `V` is EUI's function and value namespace. All functions and values needed throughout EUI are located here. For more information about functions in this table see _functions.md_