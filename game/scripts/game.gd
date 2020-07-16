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

enum BATTLE_TURN{
	YOU,
	DEMON
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
var demon_strength_attack = 0
var demon_strength_health = 0

"""
theoretically

if location == \"center\" and rand_range(0,demon_spawn) == 0:
	game_mode = MODE.BATTLE
"""

var p_pages = 0
var p_page = 0
var p_scrpt = Dialogues.p_scrpt
var e_script = []
var e_page = 0
var e_pages = 0
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
	music_selection()
	toggle_buttons(true)
	p_pages = p_scrpt.size()
	physical = Global.default_physical
	mental = Global.default_mind
	invinci = Global.default_invinci
	minutes = Global.default_minutes
	
	his_text.text = ""
	des_text.text = p_scrpt[p_page]["line"]
	pic.texture = load(p_scrpt[p_page]["image"])
	
	
	char_info.get_node("chara_name").text = "name:" + Global.char_name
	char_info.get_node("physical_health").text = "physical:" + str(physical)
	char_info.get_node("mind_health").text = "mental:" + str(mental)
	char_info.get_node("invincible").text = "invincible:" + "off"
	char_info.get_node("used_invinci").text = "used:" + str(used_invinci)
	char_info.get_node("sequence").text = "tasks:" + str(3 - order.size())
	$non_interactive/location.text = "CENTER"
	cur_time.text = time_format(minutes)
	#print(order.size())
	pass # Replace with function body.

func _input(event):
	if game_mode == MODE.PROLOGUE:
		if event.is_action_pressed("mouse_left"):
			if p_page < (p_pages-1):
				add_history(p_scrpt[p_page]["line"])
				p_page += 1
				des_text.text = p_scrpt[p_page]["line"]
				pic.texture = load(p_scrpt[p_page]["image"])
			else:
				Input.set_custom_mouse_cursor(game_cursor)
				toggle_buttons(false)
				set_state(game_map["init_center"])
				set_dialogue(game_map)
				process_state(state)
				game_mode = MODE.GAME
				music_selection()
				add_goal("GET OUT OF HERE.")
				button_list.get_node("option4").text = "Toggle invincibility"
	elif game_mode == MODE.ENDING:
		if event.is_action_pressed("mouse_left"):
			if e_page < (e_pages-1):
				add_history(e_script[e_page]["line"])
				e_page += 1
				des_text.text = e_script[e_page]["line"]
				pic.texture = load(e_script[e_page]["image"])
			else:
				if get_tree().change_scene("res://scenes/game_over.tscn") != 0:
					get_tree().quit()
	pass

func _process(delta):
	if delta:
		if mental <= 0:
			mental = 0
		if demon_spawn <= 23:
			demon_spawn = 23
		if demon_strength_attack >= 23:
			demon_strength_attack = 23
		if demon_strength_health >= 23:
			demon_strength_health = 23
		if physical <= 0:
			physical = 0
		if game_mode == MODE.ENDING:
			toggle_buttons(true)
		
		if location == LOCATION.CENTER:
			$non_interactive/location.text = "CENTER"
		elif location == LOCATION.LEFT:
			$non_interactive/location.text = "LEFT"
		elif location == LOCATION.FRONT:
			$non_interactive/location.text = "FRONT"
		elif location == LOCATION.RIGHT:
			$non_interactive/location.text = "RIGHT"
		
		cur_time.text = time_format(minutes)
		char_info.get_node("physical_health").text = "phsyical:"+ str(physical)
		char_info.get_node("mind_health").text = "mind:" + str(mental)
		char_info.get_node("invincible").text = "invincible:" + invinci
		char_info.get_node("used_invinci").text = "used:" + str(used_invinci)
		char_info.get_node("sequence").text = "tasks:" + str(3 - order.size())
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
	
	if minutes >= Global.finished_time:
		if used_invinci:
			choosing_ending(Dialogues.assimilation,1)
		else:
			choosing_ending(Dialogues.twentyThreeHundred,3)
		
	if location == LOCATION.CENTER and game_mode == MODE.GAME:
		var demon_chance = 23
		if minutes > Global.default_minutes:
			demon_chance = floor(rand_range(0,demon_spawn))
		#print(demon_chance) # debugging purpose
		#if order.size() == 1:
		des_text.text += "By the way, did you know that you can come back to the same wall, and it again? "
		#	add_goal("Do the remaining two.")
		#elif order.size() == 2:
		#	remove_goal()
		#	add_goal("Do the rest.")
		
		if demon_chance == 0:
			# This will be turn-based battle
			game_mode = MODE.BATTLE
			music_selection()
			#des_text.text = "The demon appears in the middle of the Place."
			#print("spwan demon")
			des_text.text += "Oh no! A wild demon appears!"
			battle_stage(true,true)
		else:
			if order.size() >= 3:
			#	if order.size() == 4:
			#		remove_goal()
				if order != correct_order:
					#remove_goal()
					if invinci == "off":
						physical -= 10
					mental -= 5
					demon_spawn -= 2
					# I dropped the hint there.
					des_text.text += "You got the wrong sequence, and you felt nauseous in the end. You realized you need to go RIGHT first and FRONT last. Try again."
					if goals.size() >= 2:
						remove_goal()
					add_goal("Figure out the correct sequence.")
					order.clear()
				else:
					#print("CORRECT!")
					if used_invinci:
						choosing_ending(Dialogues.aboveHuman,2) 
					else:
						choosing_ending(Dialogues.fullExit,5)
				make_decision(dis_state)
			else:
				make_decision(dis_state)
	else:
		if physical <= 0:
			#print("DEAD MEAT.")
			choosing_ending(Dialogues.deadMeat,4)
		if dis_state["type"] == "result":
			order.append(dis_state["result"])
		make_decision(dis_state)
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

func make_decision(dis_state):
	toggle_buttons(false)
	des_text.text += dis_state["line"]
	button_list.get_node("option1").text = dis_state["option1"]["text"]
	button_list.get_node("option2").text = dis_state["option2"]["text"]
	button_list.get_node("option3").text = dis_state["option3"]["text"]
	pass

func battle_stage(swi,player_status):
	if swi:
		if player_status:
			add_history(des_text.text)
			var demon_hth = floor(rand_range(0,demon_strength_health))
			var demon_img = floor(rand_range(0,6))
			var demon_attk = floor(rand_range(0,demon_strength_attack))
			$demon.spawn(demon_hth,demon_img,demon_attk)
			$animation.play("battle_mode")
			toggle_buttons(true)
	else:
		des_text.text = "You finished the fight."
		add_history(des_text.text)
		$animation.play_backwards("battle_mode")
		
		if minutes >= Global.finished_time:
			#print("ENDING - 2300")
			choosing_ending(Dialogues.twentyThreeHundred,3)
		else:
			if player_status == false:
				choosing_ending(Dialogues.deadMeat,4)
			else:
				des_text.text += "You win the battle between demon!"
				$demon.reset()
				game_mode = MODE.GAME
				music_selection()
				process_state(state)
	pass

# warning-ignore:unused_argument
func choosing_ending(choice,num):
	"""
	1. ASSIMILATION
	2. ABOVE HUMAN
	3. 2300
	4. DEAD MEAT
	5. FULL EXIT
	"""
	if game_mode == MODE.BATTLE:
		$demon/battle_screen/buttons/order/attack.disabled = true
		$demon/battle_screen/buttons/order/defend.disabled = true
		$demon/battle_screen/buttons/order/invincible.disabled = true
		$animation.play_backwards("battle_mode")
	toggle_buttons(true)
	game_mode = MODE.ENDING
	Global.ending = num
	music_selection()
	e_script = choice
	e_pages = e_script.size()
	des_text.text = e_script[e_page]["line"]
	pic.texture = load(e_script[e_page]["image"])
	pass

func music_selection():
	# Stop everying
	$soundtrack/prologue_music.playing = false
	$soundtrack/game_music.playing = false
	$soundtrack/battle_music.playing = false
	$soundtrack/ending_1.playing = false
	$soundtrack/ending_2.playing = false
	$soundtrack/ending_3.playing = false
	$soundtrack/ending_4.playing = false
	$soundtrack/ending_5.playing = false
	
	
	if game_mode == MODE.PROLOGUE:
			$soundtrack/prologue_music.play()
	elif game_mode == MODE.GAME:
			$soundtrack/game_music.play()
	elif game_mode == MODE.BATTLE:
			$soundtrack/battle_music.play()
	elif game_mode == MODE.ENDING:
			if Global.ending == 1:
				$soundtrack/ending_1.play()
			elif Global.ending == 2:
				$soundtrack/ending_2.play()
			elif Global.ending == 3:
				$soundtrack/ending_3.play()
			elif Global.ending == 4:
				$soundtrack/ending_4.play()
			elif Global.ending == 5:
				$soundtrack/ending_5.play()
	pass

# Buttons #
## OPTION 1
func _on_option1_pressed():
	if game_mode == MODE.GAME:
		process_state(dialogue[state["option1"]["value"]])
		minutes += minute
		if invinci == "on":
			demon_spawn -= 1
			mental -= mental_drop
			demon_strength_attack += 1
			demon_strength_health += 1
	
	pass # Replace with function body.
## OPTION 2
func _on_option2_pressed():
	if game_mode == MODE.GAME:
		process_state(dialogue[state["option2"]["value"]])
		minutes += minute
		if invinci == "on":
			demon_spawn -= 1
			mental -= mental_drop
			demon_strength_attack += 1
			demon_strength_health += 1
	
	pass # Replace with function body.
## OPTION 3
func _on_option3_pressed():
	process_state(dialogue[state["option3"]["value"]])
	minutes += minute
	if invinci == "on":
		demon_spawn -= 1
		mental -= mental_drop
		demon_strength_attack += 1
		demon_strength_health += 1
	
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
