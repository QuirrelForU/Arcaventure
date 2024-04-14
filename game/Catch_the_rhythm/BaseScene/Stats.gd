extends Node

var score = 1000 setget _set_score
var missed = 0 setget _set_missed
var catched = 0 setget _set_catched
var combo = 1.0 setget _set_combo


var webcam_mode = false

var wheights = [1,1,1,1,1,1,1,1]

func _set_missed(new_value):
	missed = new_value
	$"../Missed".text = "Missed: %d" % [missed]


func _set_catched(new_value):
	catched = new_value
	$"../Catched".text = "Catched: %d" % [catched]

func _set_score(new_score):
	score = new_score
	$"../Score".text= "Score: %d" % [score] 

func _set_combo(new_combo):
	combo = clamp(new_combo,1.0,3.0)
