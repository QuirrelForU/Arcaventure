extends Node2D


onready var global_vars = get_node("/root/Global")

func _ready():
	global_vars.total_time = 0.0

func _on_RetryButton_pressed():
	global_vars.life_count = 3
	get_tree().paused = false
	get_tree().change_scene("res://Arkanoid/LevelFirst/LevelFirst.tscn")


func _on_RetryButtonLoose_pressed():
	global_vars.life_count = 3
	get_tree().paused = false
	get_tree().change_scene("res://Arkanoid/LevelFirst/LevelFirst.tscn")
