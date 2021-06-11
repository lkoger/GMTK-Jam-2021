extends Control

var max_energy := 100.0
var energy := max_energy
var bar_length := 1024.0

func _physics_process(delta):
	energy -= delta
	$ColorRect.rect_size.x = (energy / max_energy) * bar_length

func add_energy(amnt):
	energy = min(energy + amnt, max_energy)
