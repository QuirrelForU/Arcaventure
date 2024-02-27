extends KinematicBody2D



var velocity = Vector2.ZERO
var speed = 5
var lerp_speed = 1.0

onready var platform = $"../Platform"
onready var platform_position_l = $"../Platform/Platform positions".get_child(0)
onready var platform_position_r = $"../Platform/Platform positions".get_child(1)
onready var platform_position_m = $"../Platform/Platform positions".get_child(2)
onready var respawn_timer = $RespawnTimer
onready var global_vars = get_node("/root/Global")


signal ball_respawned
signal update_life
signal update_bricks
signal lost_game

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	#velocity = Vector2.UP.rotated(PI/4) * 5
	


func _physics_process(delta):
	var collision = move_and_collide(velocity)
	if collision:
		if collision.get_collider().get_collision_layer() == 2: # 2 for Platform cant assign it with name 
			bounce_of_platform()
		elif collision.get_collider().get_collision_layer() == 4: # Fun fact that collision layer returns not an actual number but his 2^number-1
			velocity = velocity.bounce(collision.normal)
			collision.get_collider().die()
			
			emit_signal("update_bricks")
		else:
			velocity = velocity.bounce(collision.normal)
			
		#emit_signal("update_labels")


func bounce_of_platform():
	var platform_size = platform_position_r.global_position.x - platform_position_l.global_position.x
#	var offset = position.x - 
	var offset = position.x - platform_position_l.global_position.x
	
	var min_angle := PI/18
	var max_angle := PI / 2
	var normalized_hit_position = (position.x - platform_position_m.global_position.x) / platform_size * 1.75

	velocity = Vector2.UP * speed * 2
	velocity = velocity.rotated(max_angle * normalized_hit_position)


func die():
	visible = false
	$CollisionShape2D.set_deferred("disabled",true)
	if global_vars.life_count  > 0 :
		respawn_timer.start()
		global_vars.life_count-=1
		emit_signal("update_life")
	else:
		emit_signal("lost_game")
	


func _on_RespawnTimer_timeout():
	visible = true
	$CollisionShape2D.set_deferred("disabled",false)
	emit_signal("ball_respawned")
