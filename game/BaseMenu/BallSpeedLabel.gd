extends Label

var speed_coef = 1.0 setget _set_speed_coef


func _on_PlusLife_pressed():
	self.speed_coef +=0.25


func _on_MinusLife_pressed():
	self.speed_coef -=0.25


func _set_speed_coef(new_speed_coef):
	speed_coef = clamp(new_speed_coef,0.25,3.5)
	$".".text = str(speed_coef)
