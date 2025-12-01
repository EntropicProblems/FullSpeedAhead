extends Node
#this is used to store a string to file path converter
const macrofile = {
	"base_pilot":"res://CraftComponents/pilot.tscn"
	}
const shipfile = {
	"base":"res://CraftComponents/base_ship.tscn"
}
func str_to_file(str):
	return macrofile[str]
