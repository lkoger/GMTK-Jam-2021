extends Node2D

var titleScreenWav: AudioStream = preload("res://Music/title-screen-loop.wav")
var mainWav: AudioStream = preload("res://Music/main-loop.wav")
var breatherRoundWav: AudioStream = preload("res://Music/breather-round-loop.wav")
var bossWav: AudioStream = preload("res://Music/boss.wav")
var deathWav: AudioStream = preload("res://Music/death.wav")

var current_song = ""
var next_song = ""

func _play(song):
	if song != current_song:
		current_song = song
		match song:
			'title':
				$AudioStreamPlayer.set_stream(titleScreenWav)
				$AudioStreamPlayer.play()
			'main':
				$AudioStreamPlayer.set_stream(mainWav)
				$AudioStreamPlayer.play(70)
			'breather':
				$AudioStreamPlayer.set_stream(breatherRoundWav)
				$AudioStreamPlayer.play(40)
			'boss':
				$AudioStreamPlayer.set_stream(bossWav)
				$AudioStreamPlayer.play()
			'death':
				$AudioStreamPlayer.set_stream(deathWav)
				$AudioStreamPlayer.play()


func _on_AudioStreamPlayer_finished():
	if next_song != "":
		_play(next_song)
		next_song = ""
	else:
		$AudioStreamPlayer.play()

func get_song_time_left():
	if $AudioStreamPlayer.playing:
		return $AudioStreamPlayer.stream.get_length() - $AudioStreamPlayer.get_playback_position()
	else:
		return INF

func fade_out_music(time_to_fade):
	if $AudioStreamPlayer.is_playing():
		$Tween.interpolate_property($AudioStreamPlayer, "volume_db", 0.0, -50.0, time_to_fade)
		$Tween.start()

func set_next_song(song):
	next_song = song


func _on_Tween_tween_completed(object, key):
	$AudioStreamPlayer.volume_db = 0.0

func _change_music_volume(value):
	$AudioStreamPlayer.volume_db = value
