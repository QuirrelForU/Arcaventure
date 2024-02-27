extends Node2D


onready var global_vars = get_node("/root/Global")

func _ready():
	pass

func _on_RetryButton_pressed():
	global_vars.life_count = 3
	get_tree().paused = false
	get_tree().change_scene("res://scenes/LevelFirst.tscn")
