extends Control




func _on_StartButton_pressed():
		ChangeScene.change_scene("res://Arkanoid/LevelFirst/LevelFirst.tscn")


func _ready():
	#$SaverLoader.load_game()
	pass
	


func update_after_load():
	pass
