extends Node


var volume = 1.0 setget _set_volume


func _set_volume(new_volume):
	volume = new_volume
	AudioServer.set_bus_volume_db(0,linear2db(volume)*1.5)
