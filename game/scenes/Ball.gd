extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var velocity = Vector2.ZERO
var speed = 5
var lerp_speed = 1.0

onready var platform = $"../Platform"
onready var platform_position_l = $"../Platform/Platform positions".get_child(0)
onready var platform_position_r = $"../Platform/Platform positions".get_child(1)
onready var platform_position_m = $"../Platform/Platform positions".get_child(2)

# Called when the node enters the scene tree for the first time.
func _ready():
	velocity = Vector2.UP.rotated(PI/4) * 5
	


func _physics_process(delta):
	print(velocity)
	#print(platform_position_l.global_position,platform_position_r)
	var collision = move_and_collide(velocity)
	if collision:
		if collision.get_collider().get_collision_layer() == 2: # 2 for Platform cant assign it with name 
			bounce_of_platform()
		else:
			velocity = velocity.bounce(collision.normal)
			


func bounce_of_platform():
	var platform_size = platform_position_r.global_position.x - platform_position_l.global_position.x
#	var offset = position.x - 
	var offset = position.x - platform_position_l.global_position.x
	
	var min_angle := PI/18
	var max_angle := PI / 2
	var normalized_hit_position = (position.x - platform_position_m.global_position.x) / platform_size * 1.75

	velocity = Vector2.UP * speed * 2
	velocity = velocity.rotated(max_angle * normalized_hit_position)
