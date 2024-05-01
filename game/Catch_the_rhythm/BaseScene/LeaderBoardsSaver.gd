extends Node

onready var stats = $"../Stats"


func save_leaderboards():
	var new_leaderboards := CatchTheRhythmTime.new()
	if ResourceLoader.exists("user://catch_the_rhythm_leaderboards.tres"):
		var prev_leaderboards = load("user://catch_the_rhythm_leaderboards.tres") as CatchTheRhythmTime
		new_leaderboards.name_time = prev_leaderboards.name_time
	else:
		new_leaderboards.name_time = {}

	if stats.player_name in new_leaderboards.name_time.keys():
		if stats.score > new_leaderboards.name_time[stats.player_name]:
			new_leaderboards.name_time[stats.player_name] = stats.score
	else:
		new_leaderboards.name_time[stats.player_name] = stats.score
	if ResourceSaver.save("user://catch_the_rhythm_leaderboards.tres",new_leaderboards) != OK:
		print("Error when trying to save a last session")
