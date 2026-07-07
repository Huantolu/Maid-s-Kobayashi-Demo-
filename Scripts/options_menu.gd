class_name OptionsMenu
extends Control



@onready var back_menu: Button = $"MarginContainer/VBoxContainer/Back Menu" as Button


signal exit_options_menu


func _ready():
	back_menu.button_down.connect(on_exit_pressed)
	set_process(false)


func on_exit_pressed() -> void:
	exit_options_menu.emit()
	set_process(false)
