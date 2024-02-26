extends KinematicBody2D

var ball_captured  = true


onready var throw_ball_timer = $ThrowBallTimer
onready var ball = $"../Ball"
# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	throw_ball_timer.start()


func _physics_process(delta):
	if ball_captured:
		ball.position = position
		ball.position.y -=30
	#position.x = get_viewport().get_mouse_position().x
	#position.x = clamp(position.x,80,get_viewport().size.x-80)
	
	
func _unhandled_input(event):
	if event is InputEventMouseMotion:
		move_local_x(event.relative.x)
		position.x = clamp(position.x,80,get_viewport().size.x-80)
#		rotate_y(deg2rad(-event.relative.x * global_vars.mouse_sens))
#		eyes.rotate_x(deg2rad(-event.relative.y * global_vars.mouse_sens))
#		eyes.rotation.x = clamp(eyes.rotation.x,deg2rad(-80),deg2rad(80))



func _on_ThrowBallTimer_timeout():
	ball_captured = false
	ball.velocity.y -=5
	print('captured timeout')



