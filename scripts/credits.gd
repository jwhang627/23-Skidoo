extends Node

func _on_return_pressed():
	if get_tree().change_scene("res://scenes/name.tscn") != 0:
		get_tree().quit()
	pass # Replace with function body.
