extends Control

export(String, FILE, "*.tscn") var new_game
export(String, FILE, "*.tscn") var main_menu

func _ready() -> void:
	get_node('/root/Globals')._play('death')
	var final_time_text = ""
	final_time_text += str(Globals.time_alive_score) + " seconds"
	
	$MarginContainer/CenterContainer/HBoxContainer/TotalStats/MiddleSection/Stats/Time.text = final_time_text

	if(Globals.rounds_alive_score == 1):
		$MarginContainer/CenterContainer/HBoxContainer/TotalStats/MiddleSection/Stats/Rounds.text = str(Globals.rounds_alive_score) + " round"
	else:
		$MarginContainer/CenterContainer/HBoxContainer/TotalStats/MiddleSection/Stats/Rounds.text = str(Globals.rounds_alive_score) + " rounds"

	
	$MarginContainer/CenterContainer/HBoxContainer/AMB1sStats/Stats/Numbers/Energy.text = str(Globals.ambi_energy_collected)
	$MarginContainer/CenterContainer/HBoxContainer/AMB1sStats/Stats/Numbers/Damage.text = str(Globals.ambi_hits_taken)
	$MarginContainer/CenterContainer/HBoxContainer/D3XTRsStats/Stats/Numbers/Energy.text = str(Globals.dextr_energy_collected)
	$MarginContainer/CenterContainer/HBoxContainer/D3XTRsStats/Stats/Numbers/Damage.text = str(Globals.dextr_hits_taken)


func _on_NewGame_pressed() -> void:
	if ResourceLoader.exists(new_game):
		var _error = get_tree().change_scene(new_game)


func _on_TitleScreen_pressed() -> void:
	if ResourceLoader.exists(main_menu):
		var _error = get_tree().change_scene(main_menu)
