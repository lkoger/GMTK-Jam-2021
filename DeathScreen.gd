extends Control

export(String, FILE, "*.tscn") var new_game
export(String, FILE, "*.tscn") var main_menu

func _ready() -> void:
	get_node('/root/Globals')._play('death')
	
	var minutes = Globals.time_alive_score / 60
	var seconds = Globals.time_alive_score % 60
	var final_time_text = ""
	if(minutes == 1):
		final_time_text = str(minutes) + " minute "
	elif(minutes == 0):
		pass
	else:
		final_time_text = str(minutes) + " minutes "
	
	if(seconds == 1):
		final_time_text += str(seconds) + " second "
	elif(seconds == 0):
		pass
	else:
		final_time_text += str(seconds) + " seconds "
	
	$MarginContainer/CenterContainer/VBoxContainer/MiddleSection/Stats/Time.text = final_time_text
	
	if(Globals.rounds_alive_score == 1):
		$MarginContainer/CenterContainer/VBoxContainer/MiddleSection/Stats/Rounds.text = str(Globals.rounds_alive_score) + " round"
	else:
		$MarginContainer/CenterContainer/VBoxContainer/MiddleSection/Stats/Rounds.text = str(Globals.rounds_alive_score) + " rounds"
	
	#var ambi_energy_collected = 0
	#var dextr_energy_collected = 0
	#var ambi_hits_taken = 0
	#var dextr_hits_taken = 0
	
	print(Globals.ambi_energy_collected)
	print(Globals.dextr_energy_collected)
	print(Globals.ambi_hits_taken)
	print(Globals.dextr_hits_taken)


func _on_NewGame_pressed() -> void:
	if ResourceLoader.exists(new_game):
		var _error = get_tree().change_scene(new_game)


func _on_TitleScreen_pressed() -> void:
	if ResourceLoader.exists(main_menu):
		var _error = get_tree().change_scene(main_menu)
