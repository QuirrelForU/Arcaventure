extends Control


var leaderboards_line = load("res://BaseMenu/LeaderBoardsLine.tscn")

func _ready():
	if ResourceLoader.exists("user://catch_the_rhythm_leaderboards.tres"):
		var leaderboards = load("user://catch_the_rhythm_leaderboards.tres") as CatchTheRhythmTime
		var pos = 1
		for i in range(min(20,leaderboards.name_time.size())):
			var max_score = -1
			var max_name = ""
			for player_name in leaderboards.name_time:
				if leaderboards.name_time[player_name] > max_score:
					max_score = leaderboards.name_time[player_name]
					max_name = player_name
			leaderboards.name_time.erase(max_name)
			var new_leaderboard_line = leaderboards_line.instance()
			new_leaderboard_line.player_name = max_name
			new_leaderboard_line.score = max_score
			new_leaderboard_line.pos = pos
			new_leaderboard_line.initialize()
			$CatchTheRhythmScores.add_child(new_leaderboard_line)
			pos +=1
