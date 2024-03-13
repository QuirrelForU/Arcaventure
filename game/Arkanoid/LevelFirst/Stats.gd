extends Node


var life_count = 3 setget _set_life_count
var time = 0.0 setget _set_time

var bricks_count setget _set_bricks_count

var balls_count setget _set_balls_count


func _set_life_count(new_life_count):
	life_count = new_life_count
	$"../HUD/Control/VBoxContainer/LifeLabel".text = "Life: %d" % [life_count]

func _set_time(new_time):
	time = new_time
	$"../HUD/Control/TimeLabel".text = "Time %.3f" % time

func _set_bricks_count(new_bricks_count):
	bricks_count = new_bricks_count
	$"../HUD/Control/VBoxContainer/BricksLabel".text = "Bricks: %d" % [bricks_count] 
	if bricks_count == 0:
		$"../HUD".show_winscreen()

func _set_balls_count(new_balls_count):
	balls_count = new_balls_count
