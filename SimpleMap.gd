extends Node2D

export (PackedScene) var foobar
export var flump_target_path : NodePath = ""
export var doople_target_path : NodePath = ""

func _process(delta):
	pass

func _spawn_foo_bar():
	$FooPath/FooSpawnLocation.offset = randi()
	$BarPath/BarSpawnLocation.offset = randi()

	var foo = foobar.instance()
	foo.target = get_node(flump_target_path)
	foo.global_position = $FooPath/FooSpawnLocation.global_position
	add_child(foo)
	
	var bar = foobar.instance()
	bar.target = get_node(doople_target_path)
	bar.global_position = $BarPath/BarSpawnLocation.global_position
	add_child(bar)
	
