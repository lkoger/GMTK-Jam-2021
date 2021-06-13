extends Path2D

export (PackedScene) var turret
export (PackedScene) var foobar
export var target_path : NodePath = ""
onready var target = get_node(target_path)

export var world_path : NodePath = ""
onready var world = get_node(world_path)

export var num_turrets := 1

func _ready():
	pass

func add_turret():
	var t = turret.instance()
	t.foobar = foobar
	t.target = target
	t.world = world
	add_child(t)
	t.set_active(true)

func remove_turrets():
	for node in get_children():
		node.destroy()

func set_active(val):
	for node in get_children():
		node.set_active(val)
