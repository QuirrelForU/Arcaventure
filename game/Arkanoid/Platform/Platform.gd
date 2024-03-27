extends KinematicBody2D

var ball_captured  = true


onready var throw_ball_timer = $ThrowBallTimer
onready var ball = $"../Balls/Ball"
onready var stats = $"../Stats"


var platform_size setget ,_get_platform_size
var positionL setget ,_get_positionL
var positionR setget ,_get_positionR
var positionM setget ,_get_positionM


func _ready():
	throw_ball_timer.start()
	ball.connect("ball_respawned",self,"respawn_ball")
	platform_size = $"Platform positions/PositionR".global_position.x - $"Platform positions/PositionL".global_position.x
	positionL = $"Platform positions/PositionL".global_position.x
	positionR = $"Platform positions/PositionR".global_position.x
	positionM = $"Platform positions/PositionM".global_position.x
	
	#scale.x = stats.platform_size_coef
	
func _physics_process(delta):
	
	if stats.webcam_mode:
		position.x = get_global_mouse_position().x
		position.x = clamp(position.x,80*stats.platform_size_coef,get_viewport().size.x-80*stats.platform_size_coef)
	if ball_captured:
		$CollisionShape2D.disabled = true
		ball.position = position
		ball.position.y -=30
	



func _unhandled_input(event):
	if event is InputEventMouseMotion:
		move_local_x(event.relative.x)
		position.x = clamp(position.x,80*stats.platform_size_coef,get_viewport().size.x-80*stats.platform_size_coef)



func _on_ThrowBallTimer_timeout():
	ball_captured = false
	ball.velocity.y = -10
	$CollisionShape2D.disabled = false


func respawn_ball():
	ball_captured = true
	throw_ball_timer.start()
	
func _get_positionL():
	positionL = $"Platform positions/PositionL".global_position.x
	return positionL

func _get_positionM():
	positionM = $"Platform positions/PositionM".global_position.x
	return positionM

func _get_positionR():
	positionR = $"Platform positions/PositionR".global_position.x
	return positionR 

func _get_platform_size():
	platform_size = $"Platform positions/PositionR".global_position.x - $"Platform positions/PositionL".global_position.x
	return platform_size
