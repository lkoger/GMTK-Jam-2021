extends Path2D

export (int) var num_energy_balls := 120
export (float) var energy_amount_per_ball := 1.0
export (float) var energy_life_time := 1.0
var energy_ball = preload("res://Energy.tscn")
onready var pathf = $SpawnLocation

func _ready():
	pass

func spawn_random_ball():
	var e = energy_ball.instance()
	pathf.offset = randi()
	e.global_position = pathf.global_position
	get_tree().root.add_child(e)

func spawn_uniform_sequence():
	for i in range(num_energy_balls):
		var unit_length = (1.0 / num_energy_balls) * i
		clamp(unit_length, 0.0, 1.0)
		var e = energy_ball.instance()
		e.lifetime = energy_life_time
		e.amount = energy_amount_per_ball
		e.scale *= 0.5
		pathf.unit_offset = unit_length
		e.global_position = pathf.global_position
		get_tree().root.add_child(e)
