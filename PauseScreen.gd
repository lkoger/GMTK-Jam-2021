extends Control

func _input(event):
	if(event.is_action_pressed("ui_cancel")):
		get_tree().paused = not get_tree().paused
		visible = not visible
