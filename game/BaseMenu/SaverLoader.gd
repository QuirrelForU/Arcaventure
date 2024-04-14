class_name SaverLoader
extends Node

onready var profile_settings = $"../Settings"
onready var profile_index_choosing = $"../ChoosingProfile"

func save_game():
	var saved_game := SavedGame.new()
	
	saved_game.current_resolution = profile_settings.resolution_key
	saved_game.curren_fullscreen_mode = profile_settings.fullscreen_mode
	saved_game.current_profile = profile_index_choosing.profile_index
	saved_game.current_resolution_index = profile_settings.resolution_index
	saved_game.current_volume = Globals.volume
	
	if ResourceSaver.save("user://savegame_" + str(profile_index_choosing.profile_index)+".tres",saved_game) != OK:
		print("Error when trying to save a settings")


func load_game():
	var saved_game : SavedGame = load("user://savegame_" + str(profile_index_choosing.profile_index)+".tres") as SavedGame
	profile_settings.resolution_index = saved_game.current_resolution_index
	profile_settings.resolution_key = saved_game.current_resolution
	profile_settings.fullscreen_mode = saved_game.curren_fullscreen_mode
	profile_index_choosing.profile_index = saved_game.current_profile
	Globals.volume = saved_game.current_volume
	$"../Settings/VBoxContainer/Volume".update_value()


func save_last_choice():
	var last_session := LastSession.new()
	last_session.choosed_profile = $"../ChoosingProfile".profile_index
	if ResourceSaver.save("user://last_session.tres",last_session) != OK:
		print("Error when trying to save a last session")

func load_last_choice():
	if File.new().file_exists("user://last_session.tres"):
		var last_session : LastSession = load("user://last_session.tres") as LastSession
		$"../ChoosingProfile".profile_index = last_session.choosed_profile
		$"../ChoosingProfile/ProfilesChoose".select(last_session.choosed_profile)
		load_game()
