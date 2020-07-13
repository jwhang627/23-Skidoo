extends Node

onready var char_info = $char_info/order
onready var char_goal = $char_info/goal/order/description
onready var cur_time = $time_block/order/time

var physical = 0
var mental = 0

func _ready():
	physical = Global.default_physical
	mental = Global.default_mind
	
	char_info.get_node("chara_name").text = "name: " + Global.char_name
	char_info.get_node("physical_health").text = "physical: " + str(physical)
	char_info.get_node("mind_health").text = "mental: " + str(mental)
	cur_time.text = Global.default_time
	char_goal.text = "Hello World"
	pass # Replace with function body.
