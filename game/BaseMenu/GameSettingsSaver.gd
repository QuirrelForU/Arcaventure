extends Node




func save_arkanoid_settings():
	var new_arkanoid_settings = ArkanoidSettings.new()
	new_arkanoid_settings.webcam_mode = $"../GameMenus/VBoxContainer/HBoxContainer/SettingsList/WebcamModeCheckbox".pressed
	new_arkanoid_settings.life_count = $"../GameMenus/VBoxContainer/HBoxContainer/SettingsList/LifeCount/LifeCountLabel".life_count
	new_arkanoid_settings.ball_speed_coef = $"../GameMenus/VBoxContainer/HBoxContainer/SettingsList/BallSpeed/BallSpeedLabel".speed_coef
	new_arkanoid_settings.platform_size_coef = $"../GameMenus/VBoxContainer/HBoxContainer/SettingsList/PlatformSize/PlatformSize".platform_size_coef
	if ResourceSaver.save("user://arkanoid_first_level.tres",new_arkanoid_settings) != OK:
		print("Error when trying to save a game settings")




func save_catch_the_rhythm_settings():
	var new_rhythm_settings = CatchTheRhythmSettings.new()
	
	var random_wheights = [
		$"../CatchTheRhythmMenu/VBoxContainer/WheightRandoms/SpinBox".value,
		$"../CatchTheRhythmMenu/VBoxContainer/WheightRandoms/SpinBox2".value,
		$"../CatchTheRhythmMenu/VBoxContainer/WheightRandoms/SpinBox3".value,
		$"../CatchTheRhythmMenu/VBoxContainer/WheightRandoms/SpinBox4".value,
		$"../CatchTheRhythmMenu/VBoxContainer/WheightRandoms/SpinBox5".value,
		$"../CatchTheRhythmMenu/VBoxContainer/WheightRandoms/SpinBox6".value,
		$"../CatchTheRhythmMenu/VBoxContainer/WheightRandoms/SpinBox7".value,
		$"../CatchTheRhythmMenu/VBoxContainer/WheightRandoms/SpinBox8".value,
	]
	new_rhythm_settings.name = $"../CatchTheRhythmMenu/VBoxContainer/PlayerNameInput/PlayerName".text
	new_rhythm_settings.webcam_mode = $"../CatchTheRhythmMenu/VBoxContainer/HBoxContainer2/WebcamMode".pressed
	new_rhythm_settings.random_wheights = random_wheights
	if ResourceSaver.save("user://catch_the_rhythm.tres",new_rhythm_settings) != OK:
		print("Error when trying to save a game settings")

