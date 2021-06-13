extends Control

export(String, FILE, "*.tscn") var new_game
export(String, FILE, "*.tscn") var main_menu

func _ready() -> void:
	get_node('/root/Globals')._play('death')

func _on_NewGame_pressed() -> void:
	if ResourceLoader.exists(new_game):
		var _error = get_tree().change_scene(new_game)


func _on_TitleScreen_pressed() -> void:
	if ResourceLoader.exists(main_menu):
		var _error = get_tree().change_scene(main_menu)
