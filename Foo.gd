extends KinematicBody2D

var target = null

var velocity := Vector2.ZERO
var speed := 100.0
var direction := Vector2.ZERO

func _ready():
	assert(is_instance_valid(target))
	_adjust_direction()

func _process(delta):
	velocity = direction
	velocity = velocity.normalized() * speed

# TODO(koger): Movement is snappy. Is this desirable? Do we want acceleration,
# sliding, and other effects that make it feel more slugish?
func _physics_process(delta):
	var collision = move_and_collide(velocity*delta)
	if collision:
		queue_free()
#		_adjust_direction()
#		direction = Vector2.ZERO
#		$Timer.start()

func _adjust_direction():
	direction = target.global_position - global_position


func _on_Timer_timeout():
	_adjust_direction()
