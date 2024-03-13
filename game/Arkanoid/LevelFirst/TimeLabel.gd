extends Label

onready var player_stats = $"../../../Stats"


func _process(delta):
	player_stats.time +=delta
