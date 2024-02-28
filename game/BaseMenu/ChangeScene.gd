extends CanvasLayer

var target_scene = null

func change_scene(target):
	visible = true
	$AnimationPlayer.play("Dissolve")
	target_scene = target
	yield($AnimationPlayer,"animation_finished")
	get_tree().change_scene(target)
	$AnimationPlayer.play_backwards("Dissolve")
	yield($AnimationPlayer,"animation_finished")
	visible = false
