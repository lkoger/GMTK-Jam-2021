extends Node2D


func _ready():
	$Tween.connect("tween_completed", self, "_fade_out")
	$Tween.interpolate_property(self, "modulate",  modulate, Color(modulate.r, modulate.g, modulate.b, 1.0), 4.0)
	$Tween.start()

func _fade_out(object, nodepath):
	$Tween.interpolate_property(self, "modulate",  modulate, Color(modulate.r, modulate.g, modulate.b, 0.0), 1.0)

func _on_Timer_timeout():
	queue_free()
