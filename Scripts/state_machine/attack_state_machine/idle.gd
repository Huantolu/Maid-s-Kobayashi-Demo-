extends State

@export var attack_state: State
# Called when the node enters the scene tree for the first time.
func enter() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func process_input(event: InputEvent) -> State:
	if event.is_action_pressed("attack"):
		return attack_state
	return null
