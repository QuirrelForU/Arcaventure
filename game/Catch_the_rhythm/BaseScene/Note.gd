extends Node2D

const TARGET_Y = 1080
const SPAWN_Y = -16
const DIST_TO_TARGET = TARGET_Y - SPAWN_Y

const LEFT_LANE_SPAWN = Vector2(120, SPAWN_Y)
const CENTRE_LANE_SPAWN = Vector2(160, SPAWN_Y)
const RIGHT_LANE_SPAWN = Vector2(200, SPAWN_Y)

var speed = 0
var hit = false


func _ready():
	pass


func _physics_process(delta):
	if !hit:
		position.y += speed * delta
		if position.y > 1080:
			queue_free()
	else:
		$Node2D.position.y -= speed * delta


func initialize(lane):
	if lane == 0:
		position = LEFT_LANE_SPAWN
	elif lane == 1:
		position = CENTRE_LANE_SPAWN
	elif lane == 2:
		position = RIGHT_LANE_SPAWN
	else:
		printerr("Invalid lane set for note: " + str(lane))
		return
	
	speed = DIST_TO_TARGET / 2.0


func destroy(score):
	$AnimatedSprite.visible = false
	$Timer.start()
	hit = true


func _on_Timer_timeout():
	queue_free()
