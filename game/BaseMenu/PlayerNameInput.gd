extends HBoxContainer



func _on_PlayerName_text_changed(new_text):
	if new_text == "":
		$"../HBoxContainer/StartCatchTheRhythm1".disabled = true
		$"../HBoxContainer/StartCatchTheRhythmEasy".disabled = true
		$"../HBoxContainer/StartCatchTheRhythmHard".disabled = true
		$"../HBoxContainer3/StartCatchTheRhythm2".disabled = true
		$"../HBoxContainer3/StartCatchTheRhythmEasy2".disabled = true
		$"../HBoxContainer3/StartCatchTheRhythmHard2".disabled = true
	else:
		$"../HBoxContainer/StartCatchTheRhythm1".disabled = false
		$"../HBoxContainer/StartCatchTheRhythmEasy".disabled = false
		$"../HBoxContainer/StartCatchTheRhythmHard".disabled = false
		$"../HBoxContainer3/StartCatchTheRhythm2".disabled = false
		$"../HBoxContainer3/StartCatchTheRhythmEasy2".disable = false
		$"../HBoxContainer3/StartCatchTheRhythmHard2".disabled = false
