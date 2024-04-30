extends HBoxContainer



var player_name = ""

var score = 0


var pos = 0

func initialize():
	$Name.text = player_name
	$Score.text = str(score)
	$Pos.text = str(pos)
