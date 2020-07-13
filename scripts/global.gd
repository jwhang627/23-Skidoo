extends Node

var char_name
const default_physical = 200
const default_mind = 200
const default_time = "19:10"

func _ready():
	char_name = ""
	pass # Replace with function body.

func _input(event):
	if event.is_action("ui_esc"): # For debugging
		get_tree().quit()
	pass
