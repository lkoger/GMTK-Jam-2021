extends KinematicBody2D
class_name Player

onready var health = get_node("/root/Health")

func ready():
	pass

func add_energy(amnt):
	health.add_energy(amnt)

