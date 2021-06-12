extends Node2D

var titleScreenWav: AudioStream = preload("res://Music/title-screen-loop.wav")
var mainWav: AudioStream = preload("res://Music/main-loop.wav")
var breatherRoundWav: AudioStream = preload("res://Music/breather-round-loop.wav")

func _play(song):
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
