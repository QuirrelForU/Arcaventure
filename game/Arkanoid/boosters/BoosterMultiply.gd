extends Node2D

signal multiplybooster_taked

func die():
	emit_signal("multiplybooster_taked")
	queue_free()
