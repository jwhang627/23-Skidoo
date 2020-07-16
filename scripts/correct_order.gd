extends Node

var actions = {}
var order = []

func _ready():
	randomize()
	
	# SHUFFLE made this way too difficult.
	#order.shuffle()
	#set_process(true)
	pass # Replace with function body.
func make_sequence():
	order.clear()
	actions = {
		"left":["germanic-left","frankish-left","break-left"],
		"front":["germanic-front","frankish-front","break-front"],
		"right":["germanic-right","frankish-right","break-right"]
	}
	var arr = [0,1,2]
	arr.shuffle()
	order.append(actions["right"][arr[0]])
	order.append(actions["left"][arr[1]])
	order.append(actions["front"][arr[2]])
	pass
