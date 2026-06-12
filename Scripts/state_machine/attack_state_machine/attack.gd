extends State

@export var idle_state: State

var timer := 0.0

func enter() -> void:
	# Activa el hitbox al iniciar el golpe 
	parent.collision_hitbox.set_deferred("disabled", false)
	timer = 0.1
	print("punch state!")



func process_physics(delta: float) -> State:
	timer -= delta
	if timer <= 0:
		parent.collision_hitbox.set_deferred("disabled", true)
		return idle_state
	return null
