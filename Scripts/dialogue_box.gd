extends CanvasLayer

@onready var portrait: TextureRect = $Panel/Portrait
@onready var dialogue_texst: RichTextLabel = $Panel/DialogueTexst

func _ready():
	$DialogueManager
