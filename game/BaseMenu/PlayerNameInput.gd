extends HBoxContainer



func _on_PlayerName_text_changed(new_text):
	if new_text == "":
		$"../HBoxContainer/StartCatchTheRhythm1".disabled = true
	else:
		$"../HBoxContainer/StartCatchTheRhythm1".disabled = false
