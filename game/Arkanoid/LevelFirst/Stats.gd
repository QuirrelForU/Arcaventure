extends Node


var life_count = 3 setget _set_life_count
var time = 0.0 setget _set_time



func _set_life_count(new_life_count):
	life_count = new_life_count
	$"../HUD/Control/VBoxContainer/LifeLabel".text = "Life: %d" % [life_count]

func _set_time(new_time):
	time = new_time
	$"../HUD/Control/TimeLabel".text = "Time %.3f" % time
