extends Node2D

@export var mute: bool = false





func play_music_test() -> void:
	if not mute:
		$Music_lvl_test.play()

func play_music_menu() -> void:
	if not mute:
		$Music_menu.play()


func play_jump() -> void:
	if not mute:
		$Jump.play()
