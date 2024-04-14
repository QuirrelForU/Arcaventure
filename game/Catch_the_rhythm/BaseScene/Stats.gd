extends Node


var missed = 0 setget _set_missed
var catched = 0 setget _set_catched
var webcam_mode = false

var wheights = [1,1,1,1,1,1,1,1]

func _set_missed(new_value):
	missed = new_value
	$"../Missed".text = "Missed: %d" % [missed]


func _set_catched(new_value):
	catched = new_value
	$"../Catched".text = "Catched: %d" % [catched]
