extends KinematicBody2D



var velocity = Vector2.ZERO
var speed_mult = 1.0
var speed_mult_min = 1.0
var speed_mult_acc = 0.1
var lerp_speed = 0.8
var speed = 1.0

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
	var collision = move_and_collide(velocity * speed_mult * speed)
	if collision:
		$AudioHit.play()
		speed_mult +=speed_mult_acc
		if collision.get_collider().get_collision_layer() == 2: # 2 for Platform cant assign it with name 
			bounce_of_platform(collision)
		elif collision.get_collider().get_collision_layer() == 4: # Fun fact that collision layer returns not an actual number but his 2^number-1
			velocity = velocity.bounce(collision.normal)
			collision.get_collider().die()
			player_stats.bricks_count -=1
		else:
			velocity = velocity.bounce(collision.normal)
			

func bounce_of_platform(collision):
	
	var min_angle := PI/18
	var max_angle := PI / 2
	var normalized_hit_position = (global_position.x - platform.positionM) / platform.platform_size * 1.8
	velocity = Vector2.UP * 10
	print("global y pos",global_position.y)
	print("global collider y pos",collision.get_collider().global_position.y)
	if global_position.y > collision.get_collider().global_position.y:
		velocity = Vector2.DOWN * 10
	velocity = velocity.rotated(max_angle * normalized_hit_position)	
	
func die():
	player_stats.balls_count -=1
	queue_free()

func invincibility_on():
	$CollisionShape2D/RainbowShader.visible = true
	
func invincibility_off():
	$CollisionShape2D/RainbowShader.visible = false


func turn_invincibility(is_active:bool):
	$CollisionShape2D/RainbowShader.visible = is_active
