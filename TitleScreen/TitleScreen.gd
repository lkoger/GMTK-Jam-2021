extends Control

var scene_path_to_load

func _ready() -> void:
	get_node('/root/Globals')._play('title')
	# Connect the pressed() method of every scene to this scene
	for button in $Menu/CenterRow/Buttons.get_children():
		button.connect("pressed", self, "_on_menu_button_pressed", [button.next_scene])
		
func _on_menu_button_pressed(next_scene):
	# Do this check so that we eliminate the possibility of clicking
	#		randomly and possibly ending up on the wrong scene
	if scene_path_to_load == null or scene_path_to_load == "":
		scene_path_to_load = next_scene
		
	get_tree().change_scene(scene_path_to_load)
