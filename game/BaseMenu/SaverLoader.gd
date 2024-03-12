class_name SaverLoader
extends Node

onready var profile_settings = $"../Settings"

func save_game():
	var saved_game := SavedGame.new()
	
	saved_game.current_resolution = profile_settings.resolution_key
	saved_game.curren_fullscreen_mode = profile_settings.fullscreen_mode
	
	
	ResourceSaver.save("user://savegame.tres",saved_game)


func load_game():
	var saved_game : SavedGame = load("user://savegame.tres") as SavedGame
	
	profile_settings.resolution_key = saved_game.current_resolution
	profile_settings.fullscreen_mode = saved_game.curren_fullscreen_mode
