extends HBoxContainer



func _ready():
	update_value()
func _on_VolumeSlider_value_changed(value):
	Globals.volume = value


func _on_Soundtest_button_pressed():
	$Soundtest_button/Audiotest.play()


func update_value():
	$VolumeSlider.value = Globals.volume
