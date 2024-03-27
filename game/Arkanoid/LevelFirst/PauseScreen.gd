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
	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

