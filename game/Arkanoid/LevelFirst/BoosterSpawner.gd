extends Node


#enum enum_boosters {
#	NOTHING = 0,
#	EXTRALIFE = 1,
#	MULTIPLY = 2,
#	INVINCIBILITY = 3
#}

onready var bricks_node = $"../Bricks"
onready var deadzone = $"../DeadZone"
var life_booster_scene = preload("res://Arkanoid/boosters/BoosterLife.tscn")
var multiply_booster_scene = preload("res://Arkanoid/boosters/BoosterMultiply.tscn")
var invincibility_booster_scene = preload("res://Arkanoid/boosters/BoosterInvincibility.tscn")


onready var level_scene = get_parent()
onready var player_stats = $"../Stats"

onready var balls_node = $"../Balls"
func _ready():
	randomize()
	set_boosters()


func set_boosters():
	var bricks_list = bricks_node.get_children()
	# I need to come up with some better shit 
	# Cuz I dont like this multiply if state for weighted random
	for brick in bricks_list:
		brick.connect("booster_signal",self,"spawn_booster")
		var choice = randf()
		if choice < 0.15:
			brick.booster_type = 1 # life
		elif choice <0.5:
			brick.booster_type = 2 # mult
		elif choice <1.45:
			brick.booster_type = 3 # invinc
		else:
			brick.booster_type = 0 # noth
		

func spawn_booster(booster_type,booster_position):
	var booster_instance = null
	if booster_type == 1:
		booster_instance = life_booster_scene.instance()
		booster_instance.connect("lifebooster_taked",self,"lifebooster_taked")
		booster_instance.global_position = booster_position
		level_scene.add_child(booster_instance)
	elif booster_type == 2:
		booster_instance = multiply_booster_scene.instance()
		booster_instance.connect("multiplybooster_taked",self,"multiplybooster_taked")
		booster_instance.global_position = booster_position
		level_scene.add_child(booster_instance)
	elif booster_type == 3:
		booster_instance = invincibility_booster_scene.instance()
		booster_instance.connect("invincibilitybooster_taked",self,"invincibilitybooster_taked")
		booster_instance.global_position = booster_position
		level_scene.add_child(booster_instance)
		
func lifebooster_taked():
	player_stats.life_count +=1
	$"../Stats/PickUP".play()

func multiplybooster_taked():
	balls_node.multiply()
	$"../Stats/PickUP".play()
	balls_node.update_invincibility()

func invincibilitybooster_taked():
	deadzone.monitoring = false
	$InvincibilityTimer.start()
	balls_node.is_invincibility = true
	$"../Stats/PickUP".play()
	

func _on_InvincibilityTimer_timeout():
	balls_node.is_invincibility = false
	deadzone.monitoring = true
