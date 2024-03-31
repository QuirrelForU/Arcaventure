extends KinematicBody2D




	
func _physics_process(delta):
	pass
#	if stats.webcam_mode:
#		position.x = get_global_mouse_position().x
#		position.x = clamp(position.x,80*stats.platform_size_coef,get_viewport().size.x-80*stats.platform_size_coef)


func _unhandled_input(event):
	if event is InputEventMouseMotion:
		move_local_x(event.relative.x)
		position.x = clamp(position.x,80,get_viewport().size.x-80)


