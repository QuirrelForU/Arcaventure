extends CanvasLayer



var bricks_amount = null

onready var lifelabel = $Control/VBoxContainer/LifeLabel
onready var brickslabel = $Control/VBoxContainer/BricksLabel
onready var global_vars = get_node("/root/Global")
onready var ball = $"../Ball"
# Called when the node enters the scene tree for the first time.
func _ready():
	ball.connect("update_life",self,"update_life_label")
	ball.connect("update_bricks",self,"update_bricks_label")
	bricks_amount = $"../Bricks".get_child_count()
	lifelabel.text = "Life: %d" % [global_vars.life_count]
	brickslabel.text = "Brciks: %d" % [bricks_amount]


func update_life_label():
	lifelabel.text = "Life: %d" % [global_vars.life_count]
	
func update_bricks_label():
	bricks_amount -=1
	brickslabel.text = "Brciks: %d" % [bricks_amount]
