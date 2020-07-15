extends Node

onready var char_info = $non_interactive/char_info/order
onready var char_goal = $non_interactive/char_info/goal/description
onready var cur_time = $non_interactive/time_block/order/time
onready var his_text = $non_interactive/texts/history_color/history
onready var des_text = $non_interactive/texts/description_color/description
onready var pic = $non_interactive/picture
onready var button_list = $interactive/buttons/order

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
var used_invinci = false

"""
theoretically

if location == \"center\" and rand_range(0,demon_spawn) == 0:
	game_mode = MODE.BATTLE
"""

var p_pages = 0
var p_page = 0
var p_scrpt = Dialogues.p_scrpt
var game_map = Dialogues.game_map

var state = {}
var dialogue = {}

#var history = []
var goals = []
var order = []
var correct_order = CorrectOrder.order

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
				#history.push_back(p_scrpt[p_page]["line"])
				add_history(p_scrpt[p_page]["line"])
				#his_text.text += history[p_page] + "\n"
				#des_text.clear()
				p_page += 1
				des_text.text = p_scrpt[p_page]["line"]
				pic.texture = load(p_scrpt[p_page]["image"])
			else:
				#add_history(p_scrpt[p_page]["line"])
				
				Input.set_custom_mouse_cursor(game_cursor)
				toggle_buttons(false)
				set_state(game_map["init_center"])
				set_dialogue(game_map)
				process_state(state)
				game_mode = MODE.GAME
				add_goal("GET OUT OF HERE.")
				#$interactive/buttons/order/option4.text = "Toggle invincibility"
				button_list.get_node("option4").text = "Toggle invincibility"
				#set_state(game_map["init_center"])
				#print("start the game")
	pass

func _process(delta):
	if delta:
		if mental < 0:
			mental = 0
		if demon_spawn < 23:
			demon_spawn = 23
		cur_time.text = time_format(minutes)
		char_info.get_node("physical_health").text = "phsyical: " + str(physical)
		char_info.get_node("mind_health").text = "mind: " + str(mental)
		char_info.get_node("invincible").text = "invinci: " + invinci
		
	pass

func add_history(txt):
	var head = "+ "
	if game_mode == MODE.GAME or game_mode == MODE.BATTLE:
		head = "[" + cur_time.text + "] "
	his_text.text += head + txt + "\n"
	des_text.clear()
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
	g = "+ " + g
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

func set_location(loc):
	match(loc):
		"center":
			location = LOCATION.CENTER
		"left":
			location = LOCATION.LEFT
		"front":
			location = LOCATION.FRONT
		"right":
			location = LOCATION.RIGHT
	pass

func display_state(dis_state):
	if game_mode == MODE.PROLOGUE:
		add_history(p_scrpt[p_page]["line"])
	else:
		add_history(des_text.text)
	pic.texture = load(dis_state["picture"])
	set_location(dis_state["location"])
	#des_text.clear()
	
	if location == LOCATION.CENTER:
		var demon_chance = floor(rand_range(0,demon_spawn))
		print(demon_chance)
		if order.size() == 1:
			des_text.text += "By the way, did you know that you can come back to the same wall, and it again?"
			add_goal("Do the remaining two.")
		elif order.size() == 2:
			remove_goal()
			add_goal("Do the rest.")
		
		if demon_chance == 0:
			#game_mode = MODE.BATTLE
			des_text.text += "The demon appears in the middle of the Place."
			print("spwan demon")
		else:
			if order.size() >= 3:
				if order.size() == 4:
					remove_goal()
				if order != correct_order:
					remove_goal()
					if invinci == "off":
						physical -= 10
					mental -= 5
					demon_spawn -= 2
					# I dropped the hint there.
					des_text.text += "You got the wrong sequence, and you felt nauseous in the end. You realized you need to go RIGHT first and FRONT last. Try again."
					add_goal("Figure out the correct sequence.")
					order.clear()
				else:
					print("ENDING!")
	
	if dis_state["type"] == "result":
		order.append(dis_state["result"])
	toggle_buttons(false)
	des_text.text = dis_state["line"]
	button_list.get_node("option1").text = dis_state["option1"]["text"]
	button_list.get_node("option2").text = dis_state["option2"]["text"]
	button_list.get_node("option3").text = dis_state["option3"]["text"]
	#add_history(des_text.text)
	pass

func set_state(new_state):
	state = new_state
	pass

func set_dialogue(new_dialogue):
	dialogue = new_dialogue
	pass

func process_state(p_state):
	if p_state.has("line"):
		display_state(p_state)
		set_state(p_state)
	pass

func toggle_buttons(swi: bool):
	var child_num = button_list.get_child_count()
	for i in range(child_num):
		var opt = "option" + str(i + 1)
		button_list.get_node(opt).disabled = swi

	pass

# Buttons #
## OPTION 1
func _on_option1_pressed():
	process_state(dialogue[state["option1"]["value"]])
	minutes += minute
	if invinci == "on":
		demon_spawn -= 1
		mental -= mental_drop
	
	pass # Replace with function body.
## OPTION 2
func _on_option2_pressed():
	process_state(dialogue[state["option2"]["value"]])
	minutes += minute
	if invinci == "on":
		demon_spawn -= 1
		mental -= mental_drop
	
	pass # Replace with function body.
## OPTION 3
func _on_option3_pressed():
	process_state(dialogue[state["option3"]["value"]])
	minutes += minute
	if invinci == "on":
		demon_spawn -= 1
		mental -= mental_drop
	
	pass # Replace with function body.
## OPTION 4 (INVINCIBLE)
func _on_option4_pressed():
	if used_invinci == false:
		used_invinci = true
	minutes += minute
	add_history(des_text.text)
	#his_text.text += history[history.size() - 1] + "\n"
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
