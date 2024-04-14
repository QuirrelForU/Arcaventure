extends KinematicBody2D

signal note_catched

onready var stats = $"../Stats"


func _physics_process(delta):
	if stats.webcam_mode:
		position.x = get_global_mouse_position().x
		position.x = clamp(position.x,80,get_viewport().size.x-80)




func _unhandled_input(event):
	
	if event is InputEventMouseMotion:
		move_local_x(event.relative.x)
		position.x = clamp(position.x,80,get_viewport().size.x-80)




func _on_AreaCatcher_area_entered(area):
	emit_signal("note_catched")
	area.get_parent().queue_free()
