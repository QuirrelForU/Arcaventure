extends Node2D

var song_position = 0.0
var song_position_in_beats = 0
var last_spawned_beat = 0

var spawn_1_beat = 0
var spawn_2_beat = 0
var spawn_3_beat = 1
var spawn_4_beat = 0


var lane = 0
var rand = 0
var note = load("res://Catch_the_rhythm/BaseScene/Note.tscn")
var instance



onready var stats = $Stats

func _ready():
	load_settings()
	
	randomize()
	$Conductor.play_with_beat_offset(8)
	#$Conductor.play_from_beat(115,8)

func load_settings():
	var game_settings : CatchTheRhythmSettings = load("user://catch_the_rhythm.tres") as CatchTheRhythmSettings
	stats.webcam_mode = game_settings.webcam_mode
	if stats.webcam_mode:
		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	stats.wheights = game_settings.random_wheights
func _on_Conductor_measure(position):
	if position == 1:
		_spawn_notes(spawn_1_beat)
	elif position == 2:
		_spawn_notes(spawn_2_beat)
	elif position == 3:
		_spawn_notes(spawn_3_beat)
	elif position == 4:
		_spawn_notes(spawn_4_beat)

func _on_Conductor_beat(position):
	song_position_in_beats = position
	if song_position_in_beats > 36:
		spawn_1_beat = 1
		spawn_2_beat = 1
		spawn_3_beat = 1
		spawn_4_beat = 1
	if song_position_in_beats > 116:
		spawn_1_beat = 2
		spawn_2_beat = 0
		spawn_3_beat = 2
		spawn_4_beat = 0
	if song_position_in_beats > 132:
		spawn_1_beat = 4
		spawn_2_beat = 2
		spawn_3_beat = 6
		spawn_4_beat = 2
	if song_position_in_beats > 162:
		spawn_1_beat = 0
		spawn_2_beat = 0
		spawn_3_beat = 1
		spawn_4_beat = 1
	if song_position_in_beats > 194:
		spawn_1_beat = 1
		spawn_2_beat = 1
		spawn_3_beat = 1
		spawn_4_beat = 1
	if song_position_in_beats > 228:
		spawn_1_beat = 0
		spawn_2_beat = 2
		spawn_3_beat = 1
		spawn_4_beat = 2
	if song_position_in_beats > 255:
		spawn_1_beat = 2
		spawn_2_beat = 0
		spawn_3_beat = 2
		spawn_4_beat = 0
	if song_position_in_beats > 288:
		spawn_1_beat = 0
		spawn_2_beat = 2
		spawn_3_beat = 0
		spawn_4_beat = 2
	if song_position_in_beats > 330:
		spawn_1_beat = 1
		spawn_2_beat = 0
		spawn_3_beat = 0
		spawn_4_beat = 0
	if song_position_in_beats > 340:
		spawn_1_beat = 0
		spawn_2_beat = 0
		spawn_3_beat = 0
		spawn_4_beat = 0
	if song_position_in_beats == 350:
		pass
		#ChangeScene.change_scene("res://BaseMenu/BaseMenu.tscn")



func _spawn_notes(to_spawn):
	if to_spawn > 0:
		#lane = randi() % 8
		lane = _weighted_choice(stats.wheights)
		instance = note.instance()
		instance.initialize(lane)
		add_child(instance)
	if to_spawn > 1:
		var neighbours = [lane - 1,lane + 1]
		if neighbours[0] < 0:
			lane = neighbours[1]
		elif neighbours[1] > 7:
			lane = neighbours[0]
		else:
			rand = randi() % 2
			lane = neighbours[rand]
		instance = note.instance()
		instance.initialize(lane)
		add_child(instance)
		

# Function to select an item based on weights
func _weighted_choice(weights):
	var total = 0
	for i in range(weights.size()):
		total += weights[i]
	var rand_val = randf() * total
	for i in range(weights.size()):
		rand_val -= weights[i]
		if rand_val <= 0:
			return i
	return weights.size() - 1




func _on_MusicPlatform_note_catched():
	stats.catched +=1
