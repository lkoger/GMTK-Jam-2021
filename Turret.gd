extends PathFollow2D
class_name Turret

var foobar
var target = null
var world = null
var active = false

func _ready():
	#assert(foobar)
	assert(target)
	assert(world)
	offset = randi()
	if active:
		$SpawnTimer.start()

func _physics_process(delta):
	offset += 1
	$Sprite.look_at(target.global_position)

func spawn():
	$Sprite/Particles2D.emitting = true
	$ChargeUpTimer.start()

func _spawn():
	var foo = foobar.instance()
	foo.target = target
	foo.global_position = global_position
	world.add_child(foo)

func destroy():
	$ChargeUpTimer.stop()
	$SpawnTimer.stop()
	queue_free()

func set_active(val):
	active = val
	if active:
		$SpawnTimer.start()
	else:
		$Tween.interpolate_property(self, 'modulate', modulate, Color(modulate.r, modulate.g, modulate.b, 0.0), 4.0)
		$Tween.start()
		$SpawnTimer.stop()
