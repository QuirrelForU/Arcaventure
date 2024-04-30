extends HBoxContainer



func _on_PlayerName_text_changed(new_text):
	if new_text == "":
		$"../HBoxContainer/StartCatchTheRhythm1".disabled = true
		$"../HBoxContainer/StartCatchTheRhythmEasy".disabled = true
		$"../HBoxContainer/StartCatchTheRhythmHard".disabled = true
	else:
		$"../HBoxContainer/StartCatchTheRhythm1".disabled = false
		$"../HBoxContainer/StartCatchTheRhythmEasy".disabled = false
		$"../HBoxContainer/StartCatchTheRhythmHard".disabled = false
