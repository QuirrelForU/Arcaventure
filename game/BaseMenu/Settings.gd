extends Control

onready var res_option_button = $VBoxContainer/Res/OptionButton

var is_borderless = false 
 
var resolution_key = "1920x1080" setget _set_resolution_key
var fullscreen_mode = OS.window_fullscreen setget _set_fullscreen_mode
var resolution_index = 0

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
	self.resolution_index = index
	self.resolution_key = res_option_button.get_item_text(index)
	
	

func _set_resolution_key(new_resolution):
	resolution_key = new_resolution
	var size = resolutions[resolution_key]
	OS.set_window_size(size)
	$VBoxContainer/Res/OptionButton.select(resolution_index)

func _on_WindowedCheck_pressed():
	is_borderless = !is_borderless
	OS.window_borderless = is_borderless
	

func _on_FullScreenCheck_pressed():
	self.fullscreen_mode = !OS.window_fullscreen
	
	
func _set_fullscreen_mode(new_fullscreen_state):
	fullscreen_mode = new_fullscreen_state
	OS.window_fullscreen = fullscreen_mode
	$VBoxContainer/Fullscreen2/FullScreenCheck.pressed = fullscreen_mode
	res_option_button.disabled = fullscreen_mode


func _on_SaveSettingsButton_pressed():
	$"../SaverLoader".save_game()
