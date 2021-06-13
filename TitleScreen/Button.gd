extends Button

export(String, FILE, "*.tscn") var next_scene

func _ready() -> void:
	$AnimationPlayer.play("Pulse")
