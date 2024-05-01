extends Control


onready var game_setting_saver = $"../GameSettingsSaver"
onready var difficulties = $VBoxContainer/Difficulties
# Called when the node enters the scene tree for the first time.
func _ready():
	difficulties.add_item("Normal")
	difficulties.add_item("Easy")
	difficulties.add_item("Hard")



func _on_StartCatchTheRhythm1_pressed():
	game_setting_saver.save_catch_the_rhythm_settings()
	ChangeScene.change_scene("res://Catch_the_rhythm/BaseScene/BaseRhythm.tscn")



func _on_Difficulties_item_selected(index):
	var difficulty = difficulties.get_item_text(index)
	$VBoxContainer/HBoxContainer/StartCatchTheRhythm1.visible = false
	$VBoxContainer/HBoxContainer/StartCatchTheRhythmEasy.visible = false
	$VBoxContainer/HBoxContainer/StartCatchTheRhythmHard.visible = false
	$VBoxContainer/HBoxContainer3/StartCatchTheRhythm2.visible = false
	$VBoxContainer/HBoxContainer3/StartCatchTheRhythmEasy2.visible = false
	$VBoxContainer/HBoxContainer3/StartCatchTheRhythmHard2.visible = false
	if difficulty == "Normal":
		$VBoxContainer/HBoxContainer/StartCatchTheRhythm1.visible = true
		$VBoxContainer/HBoxContainer3/StartCatchTheRhythm2.visible = true
	elif difficulty == "Easy":
		$VBoxContainer/HBoxContainer/StartCatchTheRhythmEasy.visible = true
		$VBoxContainer/HBoxContainer3/StartCatchTheRhythmEasy2.visible = true
	elif difficulty == "Hard":
		$VBoxContainer/HBoxContainer/StartCatchTheRhythmHard.visible = true
		$VBoxContainer/HBoxContainer3/StartCatchTheRhythmHard2.visible = true


func _on_StartCatchTheRhythmEasy_pressed():
	pass # Replace with function body.


func _on_StartCatchTheRhythmHard_pressed():
	pass # Replace with function body.


func _on_StartCatchTheRhythm2_pressed():
	pass # Replace with function body.


func _on_StartCatchTheRhythmEasy2_pressed():
	pass # Replace with function body.


func _on_StartCatchTheRhythmHard2_pressed():
	pass # Replace with function body.
