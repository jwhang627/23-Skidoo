extends Node

onready var c_name = $naming/input
export var name_limit = 12

func _ready():
	pass # Replace with function body.

# warning-ignore:unused_argument
func _input(event):
	if Input.is_action_just_pressed("backspace"):
		if c_name.readonly == true:
			c_name.readonly = false
	pass

func _on_confirm_pressed():
	if c_name.text.length() != 0:
		Global.char_name = c_name.text.capitalize()
		if get_tree().change_scene("res://scenes/game.tscn") != 0:
				print("ERROR")
				get_tree().quit()
	else:
		$naming/error.visible = true
	pass # Replace with function body.

func _on_input_text_changed():
	if c_name.text.length() > name_limit:
		c_name.readonly = true
	pass # Replace with function body.
