extends Node2D

signal lifebooster_taked

func die():
	emit_signal("lifebooster_taked")
	queue_free()
