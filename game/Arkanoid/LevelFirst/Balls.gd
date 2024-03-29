extends Node2D


var ball_scene = preload("res://Arkanoid/Ball/Ball.tscn")
var is_invincibility = false setget _set_is_invincibility
onready var player_stats =$"../Stats"


func _ready():
	player_stats.balls_count =$".".get_child_count()

	#

func multiply():
	for ball in $".".get_children():
		player_stats.balls_count += 1
		var new_ball = ball_scene.instance()
		new_ball.global_position = ball.global_position
		new_ball.speed = player_stats.ball_speed_coef
		new_ball.velocity = ball.velocity
		new_ball.velocity = new_ball.velocity.rotated(PI/4)
		$".".add_child(new_ball)

func respawn():
	var new_ball = ball_scene.instance()
	new_ball.speed = player_stats.ball_speed_coef
	$".".add_child(new_ball)
	$"../Platform".respawn_ball()
	$"../Platform".ball = new_ball
	player_stats.balls_count = 1


func _set_is_invincibility(new_state):
	is_invincibility = new_state
	for ball in $".".get_children():
		ball.turn_invincibility(is_invincibility)

func update_invincibility():
	for ball in $".".get_children():
		ball.turn_invincibility(is_invincibility)

func kill_balls():
	for ball in $".".get_children():
		ball.die()
