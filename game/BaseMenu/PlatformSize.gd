extends Label

var platform_size_coef = 1.0 setget _set_platform_size_coef


func _set_platform_size_coef(new_size_coef):
	platform_size_coef = clamp(new_size_coef,0.25,4)
	$".".text = str(platform_size_coef)


func _on_PlusSize_pressed():
	self.platform_size_coef +=0.25


func _on_MinusSize_pressed():
	self.platform_size_coef -=0.25
