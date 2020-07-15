extends Node

var actions = {}
var order = []

func _ready():
	randomize()
	actions = {
		"left":["germanic-left","frankish-left","break-left"],
		"front":["germanic-front","frankish-front","break-front"],
		"right":["germanic-right","frankish-right","break-right"]
	}
	
	order.append(actions["right"][floor(rand_range(0,3))])
	order.append(actions["left"][floor(rand_range(0,3))])
	order.append(actions["front"][floor(rand_range(0,3))])
	
	# SHUFFLE made this way too difficult.
	#order.shuffle()
	set_process(true)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
