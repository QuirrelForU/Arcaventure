extends Node

var catched_effect = preload("res://Catch_the_rhythm/Effects/Catched_particles.tscn")



func spawn_effect(effect_position):
	var instance = catched_effect.instance()
	instance.global_position = effect_position
	instance.emitting = true
	add_child(instance)
	print("spawned effect")

