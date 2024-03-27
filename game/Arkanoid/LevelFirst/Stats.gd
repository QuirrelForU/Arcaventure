extends Node


export var life_count = 3 setget _set_life_count
var time = 0.0 setget _set_time

var bricks_count setget _set_bricks_count

var balls_count setget _set_balls_count

var is_died = false
var is_won = false

var webcam_mode = null setget _set_webcam_mode

func _set_life_count(new_life_count):
	life_count = new_life_count
	$"../HUD/Control/VBoxContainer/LifeLabel".text = "Life: %d" % [life_count]
	if life_count == 0:
		self.is_died = true
		$"../HUD".show_deathscreen()

func _set_time(new_time):
	time = new_time
	$"../HUD/Control/TimeLabel".text = "Time %.3f" % time

func _set_bricks_count(new_bricks_count):
	bricks_count = new_bricks_count
	$"../HUD/Control/VBoxContainer/BricksLabel".text = "Bricks: %d" % [bricks_count] 
	if bricks_count == 0:
		self.is_won = true
		$"../HUD".show_winscreen()

func _set_balls_count(new_balls_count):
	balls_count = new_balls_count
	if balls_count <= 0:
		self.life_count-=1
		$Failed.play()
		$"../RespawnBallTimer".start()

func _on_RespawnBallTimer_timeout():
	$"../Balls".respawn()


func _set_webcam_mode(new_webcammode):
	webcam_mode = new_webcammode
	if webcam_mode:
		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	else:	
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
