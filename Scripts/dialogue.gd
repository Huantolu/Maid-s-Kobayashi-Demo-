class_name Dialogue
extends Control
  

@onready var content: RichTextLabel = $Content
@onready var type_timer: Timer = $TypeTyper
@onready var voice_test: AudioStreamPlayer = $DialogueVoiceTest

var _playing_voice := false

# We are going to use this logic to test, will be removed later
func _ready() -> void:
	await(get_tree().create_timer(0.1).timeout)
	update_message("It was hard to get these...I-I needed to do like a minigame, then there was a box to give it to that puppet and then...")

  


# Update the message and starts typing
func update_message(message: String) -> void:
	content.bbcode_text = message
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
