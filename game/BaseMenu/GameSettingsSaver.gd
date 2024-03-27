extends Node




func save_arkanoid_settings():
	var new_arkanoid_settings = ArkanoidSettings.new()
	new_arkanoid_settings.webcam_mode = $"../VBoxContainer/HBoxContainer/SettingsList/WebcamModeCheckbox".pressed
	new_arkanoid_settings.life_count = $"../VBoxContainer/HBoxContainer/SettingsList/LifeCount/LifeCountLabel".life_count
	new_arkanoid_settings.ball_speed_coef = $"../VBoxContainer/HBoxContainer/SettingsList/BallSpeed/BallSpeedLabel".speed_coef
	
	ResourceSaver.save("user://arkanoid_first_level.tres",new_arkanoid_settings)
