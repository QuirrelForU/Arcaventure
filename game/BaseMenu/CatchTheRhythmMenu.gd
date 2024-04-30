extends Control


onready var game_setting_saver = $"../GameSettingsSaver"

# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer/HBoxContainer/VBoxContainer/Difficulties.add_item("Normal")
	$VBoxContainer/HBoxContainer/VBoxContainer/Difficulties.add_item("Easy")
	$VBoxContainer/HBoxContainer/VBoxContainer/Difficulties.add_item("Hard")



func _on_StartCatchTheRhythm1_pressed():
	game_setting_saver.save_catch_the_rhythm_settings()
	ChangeScene.change_scene("res://Catch_the_rhythm/BaseScene/BaseRhythm.tscn")


func _on_StartCatchTheRhythm2_pressed():
	print("easy")


func _on_StartCatchTheRhythm3_pressed():
	print("hard")


func _on_Difficulties_item_selected(index):
	var difficulty = $VBoxContainer/HBoxContainer/VBoxContainer/Difficulties.get_item_text(index)
	$VBoxContainer/HBoxContainer/StartCatchTheRhythm1.visible = false
	$VBoxContainer/HBoxContainer/StartCatchTheRhythmEasy.visible = false
	$VBoxContainer/HBoxContainer/StartCatchTheRhythmHard.visible = false
	if difficulty == "Normal":
		$VBoxContainer/HBoxContainer/StartCatchTheRhythm1.visible = true
	elif difficulty == "Easy":
		$VBoxContainer/HBoxContainer/StartCatchTheRhythmEasy.visible = true
	elif difficulty == "Hard":
		$VBoxContainer/HBoxContainer/StartCatchTheRhythmHard.visible = true
