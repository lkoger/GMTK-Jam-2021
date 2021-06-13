extends Control

func show_round():
	$CenterContainer/Label.text = "ROUND " + str(Globals.rounds_alive_score+1)
	fade_in()

func fade_in():
	$Tween.interpolate_property(self, "modulate",  modulate, Color(modulate.r, modulate.g, modulate.b, 1.0), 2.0)
	$Tween.start()
	$FadeTimer.start()

func fade_out():
	$Tween.interpolate_property(self, 'modulate', modulate, Color(modulate.r, modulate.g, modulate.b, 0.0), 2.0)
	$Tween.start()
