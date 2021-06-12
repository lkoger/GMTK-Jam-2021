extends PathFollow2D

var foobar
var target = null
var world = null

func _ready():
	#assert(foobar)
	assert(target)
	assert(world)
	offset = randi()

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
