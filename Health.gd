extends Control

var max_energy := 100.0
var energy := max_energy
var bar_length := 1280.0
var energy_loss_per_second := 5.0

func _physics_process(delta):
	energy -= delta * energy_loss_per_second
	$Bar.rect_size.x = (energy / max_energy) * bar_length
	if energy <= 0.0:
		get_tree().change_scene("res://TitleScreen/TitleScreen.tscn")
		set_physics_process(false)

func add_energy(amnt):
	energy = min(energy + amnt, max_energy)
	
