extends Node2D


onready var player_stats = $Stats

func _ready():
	load_settings()
	player_stats.time = 0.0

func _on_RetryButton_pressed():
	player_stats.life_count = 3
	player_stats.is_died = false
	get_tree().paused = false
	get_tree().change_scene("res://Arkanoid/LevelFirst/LevelFirst.tscn")
	


func _on_RetryButtonLoose_pressed():
	player_stats.life_count = 3
	player_stats.is_won = false
	get_tree().paused = false
	get_tree().change_scene("res://Arkanoid/LevelFirst/LevelFirst.tscn")


func load_settings():
		var game_settings : ArkanoidSettings = load("user://arkanoid_first_level.tres") as ArkanoidSettings
		player_stats.webcam_mode = game_settings.webcam_mode
		player_stats.life_count = game_settings.life_count
		player_stats.ball_speed_coef = game_settings.ball_speed_coef
		$Balls/Ball.speed = player_stats.ball_speed_coef
