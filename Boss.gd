extends KinematicBody2D

var speed = 0.3
var active = false

func _ready():
	$Tween.interpolate_property(self, "modulate",  modulate, Color(modulate.r, modulate.g, modulate.b, 1.0), 4.0)
	$Tween.start()

func set_active():
	active = not active
	for node in $Turrets.get_children():
		node.set_active(active)
	if active:
		$TurnTimer.start()

func _physics_process(delta):
	if active:
		rotation += delta * speed

func fade_out():
	for node in $Turrets.get_children():
		node.set_active(false)
	$Tween.interpolate_property(self, 'modulate', modulate, Color(modulate.r, modulate.g, modulate.b, 0.0), 4.0)
	$Tween.start()
	$Tween.connect("tween_completed", self, "destroy_self")

func destroy_self(object, node):
	queue_free()

func course_correct():
	# randomly change rotation
	if randi() % 2 == 0:
		speed *= -1
	# Speed up by 10 percent
	speed *= 1.1
	for node in $Turrets.get_children():
		node.speed_up()
