extends Node2D

var energy_ball = preload("res://Energy.tscn")
onready var paths_size = $PatternedPaths.get_child_count()
onready var current_path_idx = randi() % paths_size
onready var current_path = $PatternedPaths.get_child(current_path_idx)
onready var pathf = current_path.get_child(0)
var active = false
var mode = 0
export var random_mode_time = 5.0
export var secquence_time = 20.0

func _ready():
	if active:
		$Timer.start(random_mode_time)

func spawn():
	if mode == 0:
		spawn_random_ball()
	elif mode == 1:
		spawn_uniform_sequence()
	elif mode == 2:
		spawn_boss_balls()

func spawn_random_ball():
	$StandardPath.spawn_random_ball()

func spawn_uniform_sequence():
	current_path.spawn_uniform_sequence()
	change_path()

func spawn_boss_balls():
	$BossPath.spawn_random_ball()
	
func change_path():
	current_path_idx = randi() % paths_size
	current_path = $PatternedPaths.get_child(current_path_idx)
	pathf = current_path.get_child(0)

func set_active(val):
	active = val
	if active:
		spawn()
		if mode == 1:
			$Timer.start(secquence_time)
		elif mode == 0 or mode == 2:
			$Timer.start(random_mode_time)
	else:
		$Timer.stop()
