extends Node2D

var titleScreenWav: AudioStream = preload("res://Music/title-screen-loop.wav")
var mainWav: AudioStream = preload("res://Music/main-loop.wav")
var breatherRoundWav: AudioStream = preload("res://Music/breather-round-loop.wav")
var current_song = ""

func _play(song):
	if song != current_song:
		current_song = song
		match song:
			'title':
				$AudioStreamPlayer.set_stream(titleScreenWav)
				$AudioStreamPlayer.play()
			'main':
				$AudioStreamPlayer.set_stream(mainWav)
				$AudioStreamPlayer.play()
			'breather':
				$AudioStreamPlayer.set_stream(breatherRoundWav)
				$AudioStreamPlayer.play()


func _on_AudioStreamPlayer_finished():
	current_song = ""
