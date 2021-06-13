extends Node2D

export (PackedScene) var foobar
export (PackedScene) var energy_ball
var boss_scene = preload("res://Boss.tscn")
export var flump_target_path : NodePath = ""
export var doople_target_path : NodePath = ""
var main_phase := true
var breather_phase := false
var boss_phase := false
var left_has_boss := true
var round_number := 1

func _ready():
	Globals.time_alive_score = 0
	Globals.rounds_alive_score = 0
	Globals.ambi_energy_collected = 0
	Globals.dextr_energy_collected = 0
	Globals.ambi_hits_taken = 0
	Globals.dextr_hits_taken = 0
	get_node('/root/Globals')._play('main')
	set_active_energy(true)
	
func set_energy_sequence_mode(mode):
	for node in $EnergyPaths.get_children():
		node.mode = mode

func set_active_energy(val):
	$Health.normal_decay_rate = val
	for node in $EnergyPaths.get_children():
		node.set_active(val)

func set_turrets_active(val):
	for node in $TurretPaths.get_children():
		node.set_active(val)

func _process(delta):
	if main_phase and get_node('/root/Globals').current_song == "main" and get_node('/root/Globals').get_song_time_left() < 5.0:
		get_node('/root/Globals').fade_out_music(5.0)
		get_node('/root/Globals').set_next_song("breather")
		set_active_energy(false)
		set_turrets_active(false)
		main_phase = false
		Globals.increment_round_score()
		$BreatherTimer.start()
	elif breather_phase and get_node('/root/Globals').current_song == "breather" and get_node('/root/Globals').get_song_time_left() < 5.0:
		get_node('/root/Globals').fade_out_music(5.0)
		get_node('/root/Globals').set_next_song("boss")
		set_active_energy(false)
		breather_phase = false
		Globals.increment_round_score()
		$BossTimer.start()
	elif boss_phase and get_node('/root/Globals').current_song == "boss" and get_node('/root/Globals').get_song_time_left() < 8.0:
		get_node('/root/Globals').fade_out_music(8.0)
		get_node('/root/Globals').set_next_song("main")
		set_active_energy(false)
		get_tree().get_nodes_in_group("boss")[0].fade_out()
		boss_phase = false
		Globals.increment_round_score()
		$MainTimer.start()
		

func start_main_phase():
	main_phase = true
	round_number += 1
	for n in range(round_number):
		for node in $TurretPaths.get_children():
			node.add_turret()
	set_energy_sequence_mode(0)
	set_active_energy(true)

func start_breather_phase():
	breather_phase = true
	for node in $TurretPaths.get_children():
		node.remove_turrets()
	set_energy_sequence_mode(1)
	set_active_energy(true)

func start_boss_phase():
	boss_phase = true
	left_has_boss = not left_has_boss
	if left_has_boss:
		$EnergyPaths/EnergyOrbPaths.mode = 1
		$EnergyPaths/EnergyOrbPaths2.mode = 2
	else:
		$EnergyPaths/EnergyOrbPaths.mode = 2
		$EnergyPaths/EnergyOrbPaths2.mode = 1
		
	set_active_energy(true)
	
	var boss = boss_scene.instance()
	if left_has_boss:
		boss.global_position = $BossSpawns/left.global_position
	else:
		boss.global_position = $BossSpawns/right.global_position
	add_child(boss)
	
	
	
	

func _on_SurvivalTimer_timeout():
	Globals.increment_time_score()
