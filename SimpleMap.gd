extends Node2D

export (PackedScene) var foobar
export (PackedScene) var energy_ball
export var flump_target_path : NodePath = ""
export var doople_target_path : NodePath = ""

func _ready():
	get_node('/root/Globals')._play('main')
	print(len(get_tree().get_nodes_in_group("health")))

func _spawn_energy():
	$EnergyOrbPath/SpawnLocation.offset = randi()
	$EnergyOrbPath2/SpawnLocation.offset = randi()
	
	var energy = energy_ball.instance()
	energy.global_position = $EnergyOrbPath/SpawnLocation.global_position
	add_child(energy)

	energy = energy_ball.instance()
	energy.global_position = $EnergyOrbPath2/SpawnLocation.global_position
	add_child(energy)
