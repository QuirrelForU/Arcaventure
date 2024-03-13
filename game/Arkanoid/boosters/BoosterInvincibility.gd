extends Node2D

signal invincibilitybooster_taked

func die():
	emit_signal("invincibilitybooster_taked")
	queue_free()
