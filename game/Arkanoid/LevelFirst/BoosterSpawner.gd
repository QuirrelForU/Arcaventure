extends Node


#enum enum_boosters {
#	NOTHING = 0,
#	EXTRALIFE = 1,
#	MULTIPLY = 2,
#	INVINCIBILITY = 3
#}

onready var bricks_node = $"../Bricks"

var life_booster_scene = preload("res://Arkanoid/boosters/BoosterLife.tscn")
onready var level_scene = get_parent()

func _ready():
	randomize()
	set_boosters()


func set_boosters():
	var bricks_list = bricks_node.get_children()
	for brick in bricks_list:
		brick.connect("booster_signal",self,"spawn_booster")
		var choice = randf()
		if choice < 1.05:
			brick.booster_type = 1 # life
		elif choice <0.1:
			brick.booster_type = 2 # mult
		elif choice <0.15:
			brick.booster_type = 3 # invinc
		else:
			brick.booster_type = 0 # noth
		

func spawn_booster(booster_type,booster_position):
	var booster_instance = null
	if booster_type == 1:
		booster_instance = life_booster_scene.instance()
		booster_instance.global_position = booster_position
		level_scene.add_child(booster_instance)
		
