extends KinematicBody2D



var velocity = Vector2.ZERO
var speed_mult = 1.0
var speed_mult_min = 1.0
var speed_mult_acc = 0.1
var lerp_speed = 0.8
	

onready var platform = $"../../Platform"

onready var respawn_timer = $RespawnTimer


onready var player_stats = $"../../Stats"


# multiply vars
onready var balls_node = $".."


signal ball_respawned
signal update_life
signal lost_game


func _ready():
	speed_mult = speed_mult_min
	
	


func _physics_process(delta):
	speed_mult = lerp(speed_mult,speed_mult_min,lerp_speed * delta)
	var collision = move_and_collide(velocity * speed_mult)
	if collision:
		speed_mult +=speed_mult_acc
		if collision.get_collider().get_collision_layer() == 2: # 2 for Platform cant assign it with name 
			bounce_of_platform()
		elif collision.get_collider().get_collision_layer() == 4: # Fun fact that collision layer returns not an actual number but his 2^number-1
			velocity = velocity.bounce(collision.normal)
			collision.get_collider().die()
			player_stats.bricks_count -=1
		else:
			velocity = velocity.bounce(collision.normal)
			

func bounce_of_platform():
	
	var offset = global_position.x - platform.positionL
	var min_angle := PI/18
	var max_angle := PI / 2
	var normalized_hit_position = (global_position.x - platform.positionM) / platform.platform_size * 1.75
	velocity = Vector2.UP * 10
	velocity = velocity.rotated(max_angle * normalized_hit_position)	
	
func die():
	player_stats.balls_count -=1
	queue_free()
#	velocity = Vector2.ZERO
#	speed_mult = speed_mult_min
#	visible = false
#	position = Vector2(-500,300)
#	$CollisionShape2D.set_deferred("disabled",true)
#	if player_stats.life_count  > 0 :
#		respawn_timer.start()
#		player_stats.life_count-=1
#	else:
#		emit_signal("lost_game")
	


#func _on_RespawnTimer_timeout():
#	visible = true
#	$CollisionShape2D.set_deferred("disabled",false)
#	emit_signal("ball_respawned")

