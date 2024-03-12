extends Control

onready var res_option_button = $VBoxContainer/Res/OptionButton

var is_borderless = false
 
var resolution_key = "1920x1080"
var fullscreen_mode = OS.window_fullscreen

var resolutions: Dictionary = {
			  "1920x1080": Vector2(1920, 1080),
			  "1600x900": Vector2(1600, 900),
			  "1280x720": Vector2(1280, 720),
			  "960x540": Vector2(960, 540)
			}

func _ready():
	AddResolutions()
	

func AddResolutions():
	for r in resolutions:
		res_option_button.add_item(r)



func _on_OptionButton_item_selected(index):
	var size = resolutions.get(res_option_button.get_item_text(index))
	OS.set_window_size(size)
	


func _on_WindowedCheck_pressed():
	is_borderless = !is_borderless
	OS.window_borderless = is_borderless


func _on_FullScreenCheck_pressed():
	OS.set_window_fullscreen(!OS.window_fullscreen) 
	res_option_button.disabled = OS.window_fullscreen
	
	
