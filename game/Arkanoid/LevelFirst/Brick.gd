class_name Brick
extends StaticBody2D

enum enum_boosters {
	NOTHING = 0,
	EXTRALIFE = 1,
	MULTIPLY = 2,
	INVINCIBILITY = 3
}
signal booster_signal(booster_type,brick_position)

var booster_type = null

func die():
	print(booster_type,' ',enum_boosters.keys()[booster_type],'',global_position)
	emit_signal("booster_signal",booster_type,global_position)
	queue_free()
	
