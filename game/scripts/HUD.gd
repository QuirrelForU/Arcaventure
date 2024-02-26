extends CanvasLayer


onready var lifelabel = $Control/VBoxContainer/LifeLabel
onready var brickslabel = $Control/VBoxContainer/BricksLabel
onready var global_vars = get_node("/root/Global")
onready var ball = $"../Ball"
# Called when the node enters the scene tree for the first time.
func _ready():
	ball.connect("ball_colided",self,"update_labels")
	var bricks_amount = $"../Bricks".get_child_count()
	brickslabel.text = "Brciks: %d" % [bricks_amount]
	lifelabel.text = "Life: %d" % [global_vars.life_count]



func update_labels():
	var bricks_amount = $"../Bricks".get_child_count()
	brickslabel.text = "Brciks: %d" % [bricks_amount]
	lifelabel.text = "Life: %d" % [global_vars.life_count]
