extends Control


var is_paused = false setget set_is_paused
onready var stats = $"../../Stats"
func _unhandled_input(event):
	if !stats.is_died and !stats.is_won:
		if event.is_action_pressed("pause"):
			self.is_paused = !is_paused



func set_is_paused(value):
	is_paused = value
	get_tree().paused = is_paused
	visible = is_paused
	
	if is_paused:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	elif stats.webcam_mode:
		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)



func _on_ResumeButton_pressed():
	self.is_paused = false
	


func _on_MenuButton_pressed():
	self.is_paused = false
	#get_tree().change_scene("res://BaseMenu/BaseMenu.tscn")
	ChangeScene.change_scene("res://BaseMenu/BaseMenu.tscn")
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
