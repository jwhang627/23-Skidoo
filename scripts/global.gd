extends Node

var char_name
const default_physical = 230
const default_mind = 230
const default_time = "19:10"
const default_minutes = 1150
const finished_time = 1380
const default_invinci = "off"

"""
0 - DEFAULT
1 - ASSIMILATION
2 - ABOVE HUMAN
3 - 2300
4 - DEAD MEAT
5 - FULL EXIT
"""
var ending = 0

func _ready():
	char_name = ""
	pass # Replace with function body.

func _input(event):
	if event.is_action("ui_esc"): # For debugging
		get_tree().quit()
	pass
