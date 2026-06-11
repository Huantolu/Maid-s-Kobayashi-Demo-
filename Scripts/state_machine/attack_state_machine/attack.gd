extends State

@export var idle_state: State
# Called when the node enters the scene tree for the first time.
func enter() -> void:
	print("testing")
	await get_tree().create_timer(0.5).timeout
