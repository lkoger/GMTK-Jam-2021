extends Node2D

export (PackedScene) var foobar
export (PackedScene) var energy_ball
export var flump_target_path : NodePath = ""
export var doople_target_path : NodePath = ""

func _ready():
	get_node('/root/Globals')._play('main')
	$FooPath/FooSpawnLocation.offset = randi()
	$BarPath/BarSpawnLocation.offset = randi()

func _physics_process(delta):
	$FooPath/FooSpawnLocation.offset += 1#randi()
	$FooPath/FooSpawnLocation/Sprite.look_at(get_node(flump_target_path).global_position)
	$BarPath/BarSpawnLocation.offset += 1#randi()
	$BarPath/BarSpawnLocation/Sprite.look_at(get_node(doople_target_path).global_position)

func _spawn_energy():
	$EnergyOrbPath/SpawnLocation.offset = randi()
	$EnergyOrbPath2/SpawnLocation.offset = randi()
	
	var energy = energy_ball.instance()
	energy.global_position = $EnergyOrbPath/SpawnLocation.global_position
	add_child(energy)

	energy = energy_ball.instance()
	energy.global_position = $EnergyOrbPath2/SpawnLocation.global_position
	add_child(energy)

func _spawn_foo_bar():
	$FooPath/FooSpawnLocation.offset += 1#randi()
	$BarPath/BarSpawnLocation.offset += 1#randi()
	
	$FooPath/FooSpawnLocation/Sprite/Particles2D.emitting = true
	$BarPath/BarSpawnLocation/Sprite/Particles2D.emitting = true

	$MobTimer2.start()


func _spawn_foo_bar2():
	var foo = foobar.instance()
	foo.target = get_node(flump_target_path)
	foo.global_position = $FooPath/FooSpawnLocation.global_position
	add_child(foo)
	
	var bar = foobar.instance()
	bar.target = get_node(doople_target_path)
	bar.global_position = $BarPath/BarSpawnLocation.global_position
	add_child(bar)
	
	$MobTimer.start()
