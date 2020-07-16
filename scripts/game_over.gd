extends Node


var ending_title = ""


# Called when the node enters the scene tree for the first time.
func _ready():
	"""
	1. ASSIMILATION
	2. ABOVE HUMAN
	3. 2300
	4. DEAD MEAT
	5. FULL EXIT
	"""
	match Global.ending:
		0:
			ending_title = "DEFAULT"
		1:
			ending_title = "ASSIMILATION"
		2:
			ending_title = "ABOVE HUMAN"
		3:
			ending_title = "2300"
		4:
			ending_title = "DEAD MEAT"
		5:
			ending_title = "FULL EXIT"
	var ending = "You got: " + ending_title
	$ending_text.text = ending
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_credits_pressed():
	if get_tree().change_scene("res://scenes/credits.tscn") != 0:
		get_tree().quit()
	pass # Replace with function body.

func _on_return_pressed():
	if get_tree().change_scene("res://scenes/name.tscn") != 0:
		get_tree().quit()
	pass # Replace with function body.
