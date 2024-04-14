extends CenterContainer




func _on_ExitButton_pressed():
	get_tree().quit()


func _on_CreditsButton_pressed():
	$"../ColorRect".visible = true
	$"../AnimationPlayer".play("Fade")
	yield($"../AnimationPlayer","animation_finished")
	$"../Credits".visible = true
	$".".visible = false
	$"../AnimationPlayer".play_backwards("Fade")
	yield($"../AnimationPlayer","animation_finished")
	$"../ColorRect".visible = false



func _on_CloseCreditsButton_pressed():
	$"../ColorRect".visible = true
	$"../AnimationPlayer".play("Fade")
	yield($"../AnimationPlayer","animation_finished")
	$"../Credits".visible = false
	$".".visible = true
	$"../AnimationPlayer".play_backwards("Fade")
	yield($"../AnimationPlayer","animation_finished")
	$"../ColorRect".visible = false


func _on_SettingsButton_pressed():
	$"../ColorRect".visible = true
	$"../AnimationPlayer".play("Fade")
	yield($"../AnimationPlayer","animation_finished")
	$"../Settings".visible = true
	$"../AnimationPlayer".play_backwards("Fade")
	yield($"../AnimationPlayer","animation_finished")
	$"../ColorRect".visible = false


func _on_CloseSettingsButton_pressed():
	$"../ColorRect".visible = true
	$"../AnimationPlayer".play("Fade")
	yield($"../AnimationPlayer","animation_finished")
	$"../Settings".visible = false
	$"../AnimationPlayer".play_backwards("Fade")
	yield($"../AnimationPlayer","animation_finished")
	$"../ColorRect".visible = false


func _on_StartButton_pressed():
	$"../ColorRect".visible = true
	$"../AnimationPlayer".play("Fade")
	yield($"../AnimationPlayer","animation_finished")
	
	$"../ChooseGame".visible = true
	
	$"../AnimationPlayer".play_backwards("Fade")
	yield($"../AnimationPlayer","animation_finished")
	$"../ColorRect".visible = false


func _on_CloseGameMenusButton_pressed():
	$"../ColorRect".visible = true
	$"../AnimationPlayer".play("Fade")
	yield($"../AnimationPlayer","animation_finished")
	
	$"../GameMenus".visible = false
	$"../ChooseGame".visible = true
	
	$"../AnimationPlayer".play_backwards("Fade")
	yield($"../AnimationPlayer","animation_finished")
	$"../ColorRect".visible = false


func _on_CloseChooseGameButton2_pressed():
	$"../ColorRect".visible = true
	$"../AnimationPlayer".play("Fade")
	yield($"../AnimationPlayer","animation_finished")

	$"../ChooseGame".visible = false
	
	$"../AnimationPlayer".play_backwards("Fade")
	yield($"../AnimationPlayer","animation_finished")
	$"../ColorRect".visible = false


func _on_ChooseArkanoid_pressed():
	$"../ColorRect".visible = true
	$"../AnimationPlayer".play("Fade")
	yield($"../AnimationPlayer","animation_finished")

	$"../ChooseGame".visible = false
	$"../GameMenus".visible = true
	$"../AnimationPlayer".play_backwards("Fade")
	yield($"../AnimationPlayer","animation_finished")
	$"../ColorRect".visible = false


func _on_ChooseCatchTheRhytm_pressed():
	#ChangeScene.change_scene("res://Catch_the_rhythm/BaseScene/BaseRhythm.tscn")
	$"../ColorRect".visible = true
	$"../AnimationPlayer".play("Fade")
	yield($"../AnimationPlayer","animation_finished")
	
	$"../ChooseGame".visible = false
	$"../CatchTheRhythmMenu".visible = true
	$"../AnimationPlayer".play_backwards("Fade")
	yield($"../AnimationPlayer","animation_finished")
	$"../ColorRect".visible = false


func _on_CloseCatchTheRhythmMenu_pressed():
	$"../ColorRect".visible = true
	$"../AnimationPlayer".play("Fade")
	yield($"../AnimationPlayer","animation_finished")
	
	$"../ChooseGame".visible = true
	$"../CatchTheRhythmMenu".visible = false
	$"../AnimationPlayer".play_backwards("Fade")
	yield($"../AnimationPlayer","animation_finished")
	$"../ColorRect".visible = false
