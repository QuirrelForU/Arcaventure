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
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	randomize()
	$Conductor.play_with_beat_offset(8)
	#$Conductor.play_from_beat(330,8)

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
	if song_position_in_beats > 98:
		spawn_1_beat = 2
		spawn_2_beat = 0
		spawn_3_beat = 1
		spawn_4_beat = 0
	if song_position_in_beats > 132:
		spawn_1_beat = 4
		spawn_2_beat = 2
		spawn_3_beat = 6
		spawn_4_beat = 2
	if song_position_in_beats > 162:
		spawn_1_beat = 4
		spawn_2_beat = 4
		spawn_3_beat = 1
		spawn_4_beat = 1
	if song_position_in_beats > 194:
		spawn_1_beat = 2
		spawn_2_beat = 2
		spawn_3_beat = 1
		spawn_4_beat = 2
	if song_position_in_beats > 228:
		spawn_1_beat = 0
		spawn_2_beat = 2
		spawn_3_beat = 1
		spawn_4_beat = 2
	if song_position_in_beats > 258:
		spawn_1_beat = 1
		spawn_2_beat = 2
		spawn_3_beat = 1
		spawn_4_beat = 2
	if song_position_in_beats > 288:
		spawn_1_beat = 0
		spawn_2_beat = 2
		spawn_3_beat = 0
		spawn_4_beat = 2
	if song_position_in_beats > 322:
		spawn_1_beat = 3
		spawn_2_beat = 2
		spawn_3_beat = 2
		spawn_4_beat = 1
	if song_position_in_beats == 350:
		pass
		#ChangeScene.change_scene("res://BaseMenu/BaseMenu.tscn")



func _spawn_notes(to_spawn):
	if to_spawn > 0:
		lane = randi() % 8
		instance = note.instance()
		instance.connect("catched",self,"note_catched")
		instance.connect("missed",self,"note_missed")
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
		


func note_catched():
	stats.catched +=1


func note_missed():
	stats.missed +=1
