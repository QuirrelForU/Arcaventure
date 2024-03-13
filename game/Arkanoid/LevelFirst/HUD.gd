extends CanvasLayer



var bricks_amount = null

onready var lifelabel = $Control/VBoxContainer/LifeLabel
onready var brickslabel = $Control/VBoxContainer/BricksLabel
onready var ball = $"../Ball"
onready var player_stats = $"../Stats"
export var bricks_path : NodePath
onready var bricks_node = get_node(bricks_path)

func _ready():
	ball.connect("update_bricks",self,"update_bricks_label")
	ball.connect("lost_game",self,"show_deathscreen")
	player_stats.bricks_count = bricks_node.get_child_count()
	lifelabel.text = "Life: %d" % [player_stats.life_count]

	
func update_bricks_label():
	player_stats.bricks_count -=1
	if player_stats.bricks_count == 0:
		show_winscreen()

func show_deathscreen():
	get_tree().paused = true
	$DeathScreen.visible = true
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
func show_winscreen():
	get_tree().paused = true
	$WinScreen.visible = true
	$WinScreen/CenterContainer/VBoxContainer/WinTime.text = "Congratulations! Your win time: %.3f" % player_stats.time
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


