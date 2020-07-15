extends Node

onready var char_info = $non_interactive/char_info/order
onready var char_goal = $non_interactive/char_info/goal/description
onready var cur_time = $non_interactive/time_block/order/time
onready var his_text = $non_interactive/texts/history_color/history
onready var des_text = $non_interactive/texts/description_color/description
onready var pic = $non_interactive/picture
#onready var button_list = $interactive/buttons/order

enum MODE{
	PROLOGUE,
	GAME,
	BATTLE,
	ENDING
}

enum LOCATION{
	CENTER,
	LEFT,
	FRONT,
	RIGHT
}

export var minute = 1
export var mental_drop = 5
export var demon_spawn = 50
export var location = LOCATION.CENTER

var physical = 0
var mental = 0
var invinci = "on"
var minutes = 0

"""
theoretically

if location == \"center\" and rand_range(0,demon_spawn) == 0:
	game_mode = MODE.BATTLE
"""

var p_pages = 0
var p_page = 0
var p_scrpt = Dialogues.p_scrpt

var state = {}
var dialogue = {}

var history = []
var goals = []

var game_cursor = load("res://images/hammer_cursor.png")

var game_mode = MODE.PROLOGUE

func _ready():
	randomize()
	toggle_buttons(true)
	p_pages = p_scrpt.size()
	physical = Global.default_physical
	mental = Global.default_mind
	invinci = Global.default_invinci
	minutes = Global.default_minutes
	
	his_text.text = ""
	des_text.text = p_scrpt[p_page]["line"]
	pic.texture = load(p_scrpt[p_page]["image"])
	
	
	char_info.get_node("chara_name").text = "name: " + Global.char_name
	char_info.get_node("physical_health").text = "physical: " + str(physical)
	char_info.get_node("mind_health").text = "mental: " + str(mental)
	char_info.get_node("invincible").text = "invinci: " + "off"
	cur_time.text = time_format(minutes)
	
	pass # Replace with function body.

func _input(event):
	if game_mode == MODE.PROLOGUE:
		if event.is_action_pressed("mouse_left"):
			if p_page < (p_pages-1):
				history.push_back(p_scrpt[p_page]["line"])
				his_text.text += history[p_page] + "\n"
				p_page += 1
				des_text.text = p_scrpt[p_page]["line"]
				pic.texture = load(p_scrpt[p_page]["image"])
			else:
				game_mode = MODE.GAME
				Input.set_custom_mouse_cursor(game_cursor)
				toggle_buttons(false)
				add_goal("+ GET OUT OF HERE")
				$interactive/buttons/order/option4.text = "Toggle invincibility"
				
				#print("start the game")
	pass

func _process(delta):
	if delta:
		cur_time.text = time_format(minutes)
		char_info.get_node("mind_health").text = "mind: " + str(mental)
		char_info.get_node("invincible").text = "invinci: " + invinci
		
	pass

func time_format(minu):
	var h = str(int(minu/60))
	var m = str(int(minu%60))
	
	if int(minu%60) < 10:
		m = "0" + m
	
	return h + ":" + m
	pass

# example: add_goal("+ ADD THIS")
func add_goal(g):
	g += "\n"
	goals.push_back(g)
	#char_goal.text = str(goals)
	char_goal.clear()
	for i in range(goals.size()):
		char_goal.text += goals[i]
	pass

# example: remove_goal() - remove the last
func remove_goal():
	goals.pop_back()
	#char_goal.text = str(goals)
	char_goal.clear()
	for i in range(goals.size()):
		char_goal.text += goals[i]
	pass

func display_state(dis_state):
	pass

func set_state(new_state):
	pass

func set_dialogue(new_dialogue):
	pass

func process_state(p_state):
	pass

func toggle_buttons(swi: bool):
	var child_num = $interactive/buttons/order.get_child_count()
	for i in range(child_num):
		var opt = "option" + str(i + 1)
		$interactive/buttons/order.get_node(opt).disabled = swi

	pass

# Buttons #
## OPTION 1
func _on_option1_pressed():
	minutes += minute
	if invinci == "on":
		mental -= mental_drop
	pass # Replace with function body.
## OPTION 2
func _on_option2_pressed():
	minutes += minute
	if invinci == "on":
		mental -= mental_drop
	pass # Replace with function body.
## OPTION 3
func _on_option3_pressed():
	minutes += minute
	if invinci == "on":
		mental -= mental_drop
	pass # Replace with function body.
## OPTION 4 (INVINCIBLE)
func _on_option4_pressed():
	minutes += minute
	history.push_back(des_text.text)
	his_text.text += history[history.size() - 1] + "\n"
	if game_mode != MODE.PROLOGUE and game_mode != MODE.ENDING:
		if $non_interactive/monochrome.visible == true:
			$non_interactive/monochrome.visible = false
			invinci = "off"
			des_text.text = "Invincible mode off."
		else:
			$non_interactive/monochrome.visible = true
			invinci = "on"
			des_text.text = "Invincible mode on."
	pass # Replace with function body.
