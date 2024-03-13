extends Node2D


var ball_scene = preload("res://Arkanoid/Ball/Ball.tscn")

onready var player_stats =$"../Stats"

export(float) var ball_speed_scale


func _ready():
	player_stats.balls_count =$".".get_child_count()
	
	# apply modifiers from editor
	if ball_speed_scale:
		$Ball.speed = ball_speed_scale

func multiply():
	for ball in $".".get_children():
		player_stats.balls_count += 1
		var new_ball = ball_scene.instance()
		new_ball.global_position = ball.global_position
		if ball_speed_scale:
			new_ball.speed = ball_speed_scale
		new_ball.velocity = ball.velocity
		new_ball.velocity = new_ball.velocity.rotated(PI/4)
		$".".add_child(new_ball)

func respawn():
	var new_ball = ball_scene.instance()
	if ball_speed_scale:
		new_ball.speed = ball_speed_scale
	$".".add_child(new_ball)
	$"../Platform".respawn_ball()
	$"../Platform".ball = new_ball
	player_stats.balls_count = 1
