extends Node

var actions = {}
var order = []
var diff_mode = 0

func _ready():
	randomize()
	
	# SHUFFLE made this way too difficult.
	#order.shuffle()
	#set_process(true)
	pass # Replace with function body.
func make_sequence(dif):
	order.clear()
	
	actions = {
				"left":["germanic-left","frankish-left","break-left"],
				"front":["germanic-front","frankish-front","break-front"],
				"right":["germanic-right","frankish-right","break-right"]
			}
	
	match dif:
		0:# Not Easy
			var arr = [0,1,2]
			arr.shuffle()
			order.append(actions["right"][arr[0]])
			order.append(actions["left"][arr[1]])
			order.append(actions["front"][arr[2]])
			diff_mode = 0
		1:# So Hard
			order.append(actions["right"][floor(rand_range(0,3))])
			order.append(actions["left"][floor(rand_range(0,3))])
			order.append(actions["front"][floor(rand_range(0,3))])
			diff_mode = 1
		2:# Very Hard
			order.append(actions["right"][floor(rand_range(0,3))])
			order.append(actions["left"][floor(rand_range(0,3))])
			order.append(actions["front"][floor(rand_range(0,3))])
			order.shuffle()
			diff_mode = 2
	pass
