extends Node

export var demon_health = 230
export var demon_image = 0
export var attack_pt = 23

onready var button_list = $battle_screen/buttons/order

var player_t = true
var defend_on = false
var image_link = ""

func _ready():
	randomize()
	#get_parent().toggle_buttons(true)
	pass # Replace with function body.

func spawn(health, image, attack):
	demon_health += health
	demon_image = image
	attack_pt += attack
	
	image_link = "res://images/demon_" + str(demon_image) + ".png"
	$battle_screen/image.texture = load(image_link)
	player_turn()
	pass

func demon_turn():
	button_list.get_node("attack").disabled = true
	button_list.get_node("defend").disabled = true
	button_list.get_node("invincible").disabled = true
	attack_opponent()
	pass

func player_turn():
	button_list.get_node("attack").disabled = false
	button_list.get_node("defend").disabled = false
	button_list.get_node("invincible").disabled = false
	pass

func get_attacked(pt):
	get_parent().get_node("animation").play("attack_demon")
	demon_health -= pt
	pass

func attack_opponent():
	get_parent().minutes += 1
	var attk = floor(rand_range(attack_pt - 5, attack_pt + 5))
	if get_parent().invinci == "off":
		if defend_on:
			get_parent().physical -= int((attk - attk*((get_parent().mental*0.8)/Global.default_mind)))
		else:
			get_parent().physical -= attk
		get_parent().get_node("animation").play("attack_player")
	else:
		get_parent().physical -= 0
		get_parent().get_node("animation").play("invincibility_defense")
	pass

func reset():
	player_t = true
	defend_on = false
	image_link = ""
	demon_health = 230
	demon_image = 0
	attack_pt = 23
	pass

# Buttons #
func _on_attack_pressed():
	get_attacked(floor(rand_range(50,73)))
	get_parent().minutes += 1
	
	pass # Replace with function body.

func _on_defend_pressed():
	defend_on = true
	get_parent().minutes += 1
	if get_parent().minutes >= Global.finished_time:
		get_parent().battle_stage(false,true)
	else:
		demon_turn()
	pass # Replace with function body.

func _on_invincible_pressed():
	get_parent().minutes += 1
	if get_parent().invinci == "on":
		get_parent().invinci = "off"
	else:
		get_parent().invinci = "on"
	pass # Replace with function body.

func _on_animation_finished(anim_name):
	if anim_name == "attack_demon":
		if demon_health <= 0:
			button_list.get_node("attack").disabled = true
			button_list.get_node("defend").disabled = true
			button_list.get_node("invincible").disabled = true
			get_parent().battle_stage(false,true)
		elif get_parent().minutes >= Global.finished_time:
			get_parent().battle_stage(false,true)
		else:
			demon_turn()
	elif anim_name == "attack_player":
		if get_parent().physical <= 0:
			get_parent().battle_stage(false,false)
		player_turn()
	pass # Replace with function body.
