extends Node
#this is used to store a string to file path converter
var macrofile = {
	"base_ship":"res://CraftComponents/base_ship.tscn",
	"base_pilot":"res://CraftComponents/pilot.tscn"
	}
func str_to_file(str):
	return macrofile[str]
