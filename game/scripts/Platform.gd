extends KinematicBody2D

var ball_captured  = true


onready var throw_ball_timer = $ThrowBallTimer
onready var ball = $"../Ball"



func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	throw_ball_timer.start()
	ball.connect("ball_respawned",self,"respawn_ball")


func _physics_process(delta):
	if ball_captured:
		ball.position = position
		ball.position.y -=30



func _unhandled_input(event):
	if event is InputEventMouseMotion:
		move_local_x(event.relative.x)
		position.x = clamp(position.x,80,get_viewport().size.x-80)



func _on_ThrowBallTimer_timeout():
	ball_captured = false
	ball.velocity.y = -10


func respawn_ball():
	ball_captured = true
	throw_ball_timer.start()
	

