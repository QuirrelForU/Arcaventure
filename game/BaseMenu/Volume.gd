extends HBoxContainer



func _ready():
	$VolumeSlider.value = db2linear(Globals.volume)

func _on_VolumeSlider_value_changed(value):
	Globals.volume = value


func _on_Soundtest_button_pressed():
	$Soundtest_button/Audiotest.play()
