extends Node2D

export (PackedScene) var foobar
export (PackedScene) var energy_ball
export var flump_target_path : NodePath = ""
export var doople_target_path : NodePath = ""
var main_phase := true
var breather_phase := false
var boss_phase := false
var round_number := 1

func _ready():
	get_node('/root/Globals')._play('main')
	set_active_energy(true)
	
func set_energy_sequence_mode(mode):
	for node in $EnergyPaths.get_children():
		node.sequence_mode = mode

func set_active_energy(val):
	for node in $EnergyPaths.get_children():
		node.set_active(val)

func set_turrets_active(val):
	for node in $TurretPaths.get_children():
		node.set_active(val)

func _process(delta):
	if main_phase and get_node('/root/Globals').current_song == "main" and get_node('/root/Globals').get_song_time_left() < 5.0:
		get_node('/root/Globals').fade_out_music()
		get_node('/root/Globals').set_next_song("breather")
		set_active_energy(false)
		set_turrets_active(false)
		main_phase = false
		$BreatherTimer.start()
		print("in first")
	elif breather_phase and get_node('/root/Globals').current_song == "breather" and get_node('/root/Globals').get_song_time_left() < 5.0:
		get_node('/root/Globals').fade_out_music()
		get_node('/root/Globals').set_next_song("main")
		set_active_energy(false)
		breather_phase = false
		$MainTimer.start()
		print("in second")
		

func start_main_phase():
	main_phase = true
	round_number += 1
	for n in range(round_number):
		for node in $TurretPaths.get_children():
			node.add_turret()
	set_energy_sequence_mode(false)
	set_active_energy(true)

func start_breather_phase():
	breather_phase = true
	for node in $TurretPaths.get_children():
		node.remove_turrets()
	set_energy_sequence_mode(true)
	set_active_energy(true)

func start_boss_phase():
	boss_phase = true
	pass
