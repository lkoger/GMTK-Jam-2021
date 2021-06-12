extends Node2D

var energy_ball = preload("res://Energy.tscn")
onready var paths_size = $PatternedPaths.get_child_count()
onready var current_path_idx = randi() % paths_size
onready var current_path = $PatternedPaths.get_child(current_path_idx)
onready var pathf = current_path.get_child(0)

func _ready():
	pass

func spawn_random_ball():
	$StandardPath.spawn_random_ball()

func spawn_uniform_sequence():
	current_path.spawn_uniform_sequence()
	change_path()
	
func change_path():
	current_path_idx = randi() % paths_size
	current_path = $PatternedPaths.get_child(current_path_idx)
	pathf = current_path.get_child(0)
