class_name Dialogue
extends Control
  

@onready var content: RichTextLabel = $Content
@onready var type_timer: Timer = $TypeTyper
@onready var voice_test: AudioStreamPlayer = $DialogueVoiceTest

var _playing_voice := false

@onready var _calc: PauseCalculator
  


# We are going to use this logic to test, will be removed later
func _ready() -> void:
	await(get_tree().create_timer(0.1).timeout)
	update_message("[color=#ff0000]Hi[/color] [wave]I was generated[/wave] for the [rainbow]dialogue[/rainbow] system test for the godot game [shake rate=20 level=10]engine[/shake]")

 
  
func update_message(message: String) -> void:
	content.bbcode_text = _calc.extract_pauses_from_string(
		message
	)
	content.visible_characters = 0
	type_timer.start()
	_playing_voice = true
	voice_test.play_voice(0)


func _on_type_typer_timeout() -> void:
	if content.visible_characters < content.text.length():
		voice_test.play_voice(0)
		content.visible_characters += 1
	else:
		type_timer.stop()
