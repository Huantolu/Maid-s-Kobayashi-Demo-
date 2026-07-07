extends State

@export var idle_state: State


func enter():
	print("le spin")
		
	parent.spin_jump_requested = true



func process_physics(delta: float) -> State:
	if parent.is_on_floor():
		return idle_state


	return null
