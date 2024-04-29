extends Particles2D

onready var stats = $"../../Stats"

func _on_MusicPlatform_note_catched():
	var normalized_combo = (stats.combo) / (3.0)
	var int_value = int(normalized_combo * 60.0)
	amount = int_value
