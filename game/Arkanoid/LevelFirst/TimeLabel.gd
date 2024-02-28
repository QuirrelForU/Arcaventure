extends Label

onready var global_vars = get_node("/root/Global")

func _process(delta):
	global_vars.total_time +=delta
	text = "Time %.3f" % global_vars.total_time
