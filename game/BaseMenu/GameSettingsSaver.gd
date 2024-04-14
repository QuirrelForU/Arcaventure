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
	new_rhythm_settings.webcam_mode = $"../CatchTheRhythmMenu/VBoxContainer/HBoxContainer2/WebcamMode".pressed

	if ResourceSaver.save("user://catch_the_rhythm.tres",new_rhythm_settings) != OK:
		print("Error when trying to save a game settings")

