extends RayCast2D

var foo = preload("res://Foo.tscn")
var active = false

func set_active(val):
	active = val
	if active:
		$Timer.start()
	else:
		$Timer.stop()

func fire():
	var f = foo.instance()
	get_tree().root.add_child(f)
	f.speed = 60.0
	f.scale *= 0.5
	f.global_position = global_position
	f.direction = to_global(cast_to) - f.global_position
