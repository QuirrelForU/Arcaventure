extends KinematicBody2D

signal multiplybooster_taked

export var speed = 5

var velocity = Vector2.DOWN
#
#
func _physics_process(delta):
	var collision = move_and_collide(velocity*speed)
	if collision:
		if collision.get_collider().get_collision_layer() == 2: # collide with platform
			emit_signal("multiplybooster_taked")
			queue_free()
		else:
			queue_free()
