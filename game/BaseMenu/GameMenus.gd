extends Control

var arkanoid_level_first = load("res://Arkanoid/LevelFirst/LevelFirst.tscn")


onready var game_setting_saver = $GameSettingsSaver

func _on_ArkanoidLevel1_pressed():
	game_setting_saver.save_arkanoid_settings()
	get_tree().change_scene_to(arkanoid_level_first)
	
