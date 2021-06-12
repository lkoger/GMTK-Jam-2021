tool
extends Control


export(String, FILE, "*.tscn") var next_scene

func _get_configuration_warning() -> String:
	return "Please add the next scene to button" if not next_scene else ""


func _on_Button_pressed() -> void:
	if ResourceLoader.exists(next_scene):
		var _error = get_tree().change_scene(next_scene)
