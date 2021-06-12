extends KinematicBody2D
class_name Player

export var health_path : NodePath = ""
onready var health = get_node(health_path)

func ready():
	pass

func add_energy(amnt):
	health.add_energy(amnt)

