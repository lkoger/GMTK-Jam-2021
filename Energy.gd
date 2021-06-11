extends Area2D

var amount := 10.0


func _on_Energy_body_entered(body):
	if body is Player:
		_transfer_energy(body)

func _transfer_energy(body):
	body.add_energy(amount)
	queue_free()


func _on_LifeTimer_timeout():
	queue_free()
