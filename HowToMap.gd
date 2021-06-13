extends Node2D

var energy_scene = preload("res://Energy.tscn")
var foo_scene = preload("res://Foo.tscn")

export(String, FILE, "*.tscn") var next_scene

func _ready():
	spawn_foo_balls($"D3X-TR".position)
	spawn_energy_balls($AMB1.position)
	$Health.energy -= 25.0
	$Health.normal_decay_rate = false

#func _process(delta):
#	if Input.is_action_just_pressed("ui_cancel"):
#		get_tree().change_scene("res://TitleScreen/TitleScreen.tscn")

func spawn_energy_balls(origin):
	var radius := 200.0
	for i in range(0, 360, 15):
		var j = deg2rad(i)
		var pos = Vector2(cos(j), sin(j)) * radius
		var e = energy_scene.instance()
		e.lifetime = 0.0
		add_child(e)
		e.position = origin + pos
		e.amount = 0.5209

func spawn_foo_balls(origin):
	var radius := 280.0
	for i in range(0, 360, 15):
		var j = deg2rad(i)
		var pos = Vector2(cos(j), sin(j)) * radius
		var f = foo_scene.instance()
		f.still = true
		add_child(f)
		f.position = origin + pos
		f.damage = 1.0


func _on_Button_pressed() -> void:
	if ResourceLoader.exists(next_scene):
		var _error = get_tree().change_scene(next_scene)
