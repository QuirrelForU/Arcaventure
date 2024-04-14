extends Control


var is_paused = false setget set_is_paused
onready var stats = $"../../Stats"



func _ready():
	$CenterContainer/VBoxContainer/VolumeSlider.value = Globals.volume

func _unhandled_input(event):
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
	ChangeScene.change_scene("res://BaseMenu/BaseMenu.tscn")
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


func _on_VolumeSlider_value_changed(value):
	Globals.volume = value
