extends Area2D
onready var stats = $"../Stats"

func _on_NoteDestroy_area_entered(area):
	area.get_parent().queue_free()
	stats.missed +=1
	stats.combo = 1.0
	stats.score -=75
