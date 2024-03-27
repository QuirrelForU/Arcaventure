extends Label

var life_count = 3 setget _set_lifecount


func _on_PlusLife_pressed():
	self.life_count +=1


func _on_MinusLife_pressed():
	self.life_count -=1


func _set_lifecount(new_lifecount):
	life_count = clamp(new_lifecount,1,15)
	$".".text = str(life_count)
