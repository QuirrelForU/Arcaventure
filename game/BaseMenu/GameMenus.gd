extends Control



onready var game_setting_saver = $"../GameSettingsSaver"

func _on_ArkanoidLevel1_pressed():
	game_setting_saver.save_arkanoid_settings()
	ChangeScene.change_scene("res://Arkanoid/LevelFirst/LevelFirst.tscn")


func _on_ArkanoidLevel2_pressed():
	game_setting_saver.save_arkanoid_settings()
	ChangeScene.change_scene("res://Arkanoid/LevelFirst/LevelTwo.tscn")


func _on_ArkanoidLevel3_pressed():
	game_setting_saver.save_arkanoid_settings()
	ChangeScene.change_scene("res://Arkanoid/LevelFirst/LevelThree.tscn")



