extends Player

var velocity := Vector2.ZERO
var speed := 200.0
var state = "idle-forward"
var flipped = false

func _ready():
	pass

func _process(delta):
	velocity = Vector2.ZERO
	var new_state = 'idle'
	
	if Input.is_action_pressed("dex_up"):
		velocity.y -= 1.0
		new_state = 'move-up'
	elif Input.is_action_pressed("dex_down"):
		velocity.y += 1.0
		new_state = 'move-down'
	if Input.is_action_pressed("dex_left"):
		velocity.x -= 1.0
		new_state = 'move-side'
		flipped = true
	elif Input.is_action_pressed("dex_right"):
		velocity.x += 1.0
		new_state = 'move-side'
		flipped = false
		
	_change_state(new_state)
	$AnimatedSprite.flip_h = flipped
	
	velocity = velocity.normalized() * speed

# TODO(koger): Movement is snappy. Is this desirable? Do we want acceleration,
# sliding, and other effects that make it feel more slugish?
func _physics_process(delta):
	velocity = move_and_slide(velocity)

func _change_state(new_state):
	if new_state != state:
		state = new_state
		$AnimatedSprite.play(state)

func increment_energy_collected():
	Globals.dextr_energy_collected += 1

func increment_hits_taken():
	Globals.dextr_hits_taken += 1
