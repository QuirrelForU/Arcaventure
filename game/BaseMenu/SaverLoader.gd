class_name SaverLoader
extends Node

onready var profile_settings = $"../Settings"
onready var profile_index_choosing = $"../ChoosingProfile"

func save_game():
	var saved_game := SavedGame.new()
	
	saved_game.current_resolution = profile_settings.resolution_key
	saved_game.curren_fullscreen_mode = profile_settings.fullscreen_mode
	saved_game.current_profile = profile_index_choosing.profile_index
	
	ResourceSaver.save("user://savegame_" + str(profile_index_choosing.profile_index)+".tres",saved_game)


func load_game():
	var saved_game : SavedGame = load("user://savegame_" + str(profile_index_choosing.profile_index)+".tres") as SavedGame
	profile_settings.resolution_key = saved_game.current_resolution
	profile_settings.fullscreen_mode = saved_game.curren_fullscreen_mode
	profile_index_choosing.profile_index = saved_game.current_profile
