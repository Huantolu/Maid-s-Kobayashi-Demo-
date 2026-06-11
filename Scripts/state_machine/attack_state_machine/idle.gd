extends State

@export var attack_state: State



func process_input(event: InputEvent) -> State:
	if Input.is_action_just_pressed("attack"):
		return attack_state
	return null
