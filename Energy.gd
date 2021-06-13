extends Area2D

var amount := 10.0
var lifetime := 5.0

func _ready():
	$LifeTimer.wait_time = lifetime
	$LifeTimer.start()

func _on_Energy_body_entered(body):
	if body is Player:
		_transfer_energy(body)

func _transfer_energy(body):
	body.add_energy(amount)
	queue_free()


func _on_LifeTimer_timeout():
	$Particles2D.emitting = false
	$Particles2D2.emitting = false
	$FadeAwayTimer.start()

func _on_FadeAwayTimer_timeout():
	queue_free()
