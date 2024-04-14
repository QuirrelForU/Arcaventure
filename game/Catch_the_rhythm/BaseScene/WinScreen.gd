extends Control

onready var stats = $"../../Stats"


func show_winscreen():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	$WinScreenPlayer.play("ShowWinscreen")
	$CenterContainer/VBoxContainer/GridContainer/Score.text = "Score: %d" % [stats.score]
	$CenterContainer/VBoxContainer/GridContainer/Catched.text = "Catched: %d" % [stats.catched]
	$CenterContainer/VBoxContainer/GridContainer/Missed.text = "Missed: %d" % [stats.missed]
	$CenterContainer/VBoxContainer/GridContainer/MaxCombo.text = "Max combo: %d" % [stats.max_combo]


func _on_BackToMenu_pressed():
	ChangeScene.change_scene("res://BaseMenu/BaseMenu.tscn")


func _on_Retry_pressed():
	ChangeScene.change_scene("res://Catch_the_rhythm/BaseScene/BaseRhythm.tscn")
