extends Node

@export var mute: bool = false

var sounds := {}

func _ready():
	sounds = {
		"jump": $Jump,
		"punch": $Punch,
		"music_menu": $Music_menu,
		"music_lvl": $Music_lvl_test,
		"test": $test_sound
	}

func play_sound(sound_name: String):
	if sounds.has(sound_name):
		sounds[sound_name].play()

func stop_sound(sound_name: String):
	if sounds.has(sound_name):
		sounds[sound_name].stop()
