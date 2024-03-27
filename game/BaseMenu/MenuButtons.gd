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
	
	$"../GameMenus".visible = true
	
	$"../AnimationPlayer".play_backwards("Fade")
	yield($"../AnimationPlayer","animation_finished")
	$"../ColorRect".visible = false


func _on_CloseGameMenusButton_pressed():
	$"../ColorRect".visible = true
	$"../AnimationPlayer".play("Fade")
	yield($"../AnimationPlayer","animation_finished")
	
	$"../GameMenus".visible = false
	
	$"../AnimationPlayer".play_backwards("Fade")
	yield($"../AnimationPlayer","animation_finished")
	$"../ColorRect".visible = false
