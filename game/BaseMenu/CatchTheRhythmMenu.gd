extends Control


onready var game_setting_saver = $"../GameSettingsSaver"

# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer/HBoxContainer/VBoxContainer/Difficulties.add_item("difficulty_1")
	$VBoxContainer/HBoxContainer/VBoxContainer/Difficulties.add_item("difficulty_2")
	$VBoxContainer/HBoxContainer/VBoxContainer/Difficulties.add_item("difficulty_3")



func _on_StartCatchTheRhythm1_pressed():
	game_setting_saver.save_catch_the_rhythm_settings()
	ChangeScene.change_scene("res://Catch_the_rhythm/BaseScene/BaseRhythm.tscn")
