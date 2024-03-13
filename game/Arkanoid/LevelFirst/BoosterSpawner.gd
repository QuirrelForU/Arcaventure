extends Node


#enum enum_boosters {
#	NOTHING = 0,
#	EXTRALIFE = 1,
#	MULTIPLY = 2,
#	INVINCIBILITY = 3
#}

onready var bricks_node = $"../Bricks"



func _ready():
	randomize()
	set_boosters()


func set_boosters():
	var bricks_list = bricks_node.get_children()
	for brick in bricks_list:
		#brick.connect("booster_signal",self)
		var choice = randf()
		if choice < 0.05:
			brick.booster_type = 1
		elif choice <0.1:
			brick.booster_type = 2
		elif choice <0.15:
			brick.booster_type = 3
		else:
			brick.booster_type = 0
		
