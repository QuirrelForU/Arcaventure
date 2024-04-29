extends Node

var catched_effect = preload("res://Catch_the_rhythm/Effects/Catched_particles.tscn")
onready var stats = $"../Stats"


func spawn_effect(effect_position):
	var instance : Particles2D = catched_effect.instance()
	instance.global_position = effect_position
	instance.emitting = true
	var normalized_combo = (stats.combo - 1.0) / (3.0 - 1.0)
	var random_color = random_float(0.0,0.17)
	instance.modulate = Color.from_hsv(random_color,normalized_combo,1.0,1.0)
	add_child(instance)




func random_float(_min: float, _max: float) -> float:
	return randf() * (_max - _min) + _min
