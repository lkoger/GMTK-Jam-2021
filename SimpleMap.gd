extends Node2D

export (PackedScene) var foobar
export (PackedScene) var energy_ball
export var flump_target_path : NodePath = ""
export var doople_target_path : NodePath = ""

func _ready():
	get_node('/root/Globals')._play('main')

#func _spawn_energy():
#	for node in $EnergyPaths.get_children():
#		node.spawn_random_ball()
