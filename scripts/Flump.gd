extends KinematicBody2D

var velocity := Vector2.ZERO
var speed := 200.0

func _ready():
	pass

func _process(delta):
	velocity = Vector2.ZERO
	if Input.is_action_pressed("flump_up"):
		velocity.y -= 1.0
	elif Input.is_action_pressed("flump_down"):
		velocity.y += 1.0
	if Input.is_action_pressed("flump_left"):
		velocity.x -= 1.0
	elif Input.is_action_pressed("flump_right"):
		velocity.x += 1.0
	
	velocity = velocity.normalized() * speed

# TODO(koger): Movement is snappy. Is this desirable? Do we want acceleration,
# sliding, and other effects that make it feel more slugish?
func _physics_process(delta):
	velocity = move_and_slide(velocity)
