extends Node2D

const TARGET_Y = 993 #1080
const SPAWN_Y = -16
const DIST_TO_TARGET = TARGET_Y - SPAWN_Y
# Screen 1920 
# space for squares 150 from each side
# 1620 / 9 = 180
const FIRS_LANE = Vector2(330, SPAWN_Y)
const SECOND_LANE = Vector2(510, SPAWN_Y)
const THIRD_LANE = Vector2(690, SPAWN_Y)
const FOURTH_LANE = Vector2(870, SPAWN_Y)
const FIFTH_LANE = Vector2(1050, SPAWN_Y)
const SIXTH_LANE = Vector2(1230, SPAWN_Y)
const SEVENTH_LANE = Vector2(1410, SPAWN_Y)
const EIGHTH_LANE = Vector2(1590, SPAWN_Y)

var speed = 0
var hit = false
export var time_to_target = 2.1052

signal catched
signal missed

func _physics_process(delta):
	position.y += speed * delta
#	if position.y > 1300:
#		queue_free()
#		emit_signal("missed")

func initialize(lane):
	if lane == 0:
		position = FIRS_LANE
	elif lane == 1:
		position = SECOND_LANE
	elif lane == 2:
		position = THIRD_LANE
	elif lane == 3:
		position = FOURTH_LANE
	elif lane == 4:
		position = FIFTH_LANE
	elif lane == 5:
		position = SIXTH_LANE
	elif lane == 6:
		position = SEVENTH_LANE
	elif lane == 7:
		position = EIGHTH_LANE
	else:
		printerr("Invalid lane set for note: " + str(lane))
		return
	
	speed = DIST_TO_TARGET / time_to_target #0.52#2.0, so here you set a time to reach a distn, but the time should be
	# multiply by secs per bit 60 / 114 * 4 = 2.1052..
