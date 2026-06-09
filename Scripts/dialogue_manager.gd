extends Node

signal dialogue_finished
signal line_changed(text: String, speaker: String)

var dialogue: Array = []
var current_line := 0

func load_dialogue(path: String) -> void:
	var file = FileAccess.open(path, FileAccess.READ)
	
	var json = JSON.parse_string(file.get_as_text())
	
	if json == null:
		push_error("Can't open dialogue")
		return
	
	dialogue = json["DIALOGUE"]
	current_line = 0


func start_dialogue() -> void:
	current_line = 0
	show_current_line()


func show_current_line() -> void:
	if current_line >= dialogue.size():
		dialogue_finished.emit()
		return

	var entry = dialogue[current_line]

	if entry[0] == "_skip":
		current_line += 1
		show_current_line()
		return

	line_changed.emit(
		entry[0],
		entry[1]
	)

func next_line() -> void:
	current_line += 1
	show_current_line()
