extends Control



func _ready():
	$SaverLoader.load_game()
	$SaverLoader.load_last_choice()


func update_after_load():
	pass


