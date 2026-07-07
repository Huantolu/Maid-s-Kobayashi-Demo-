extends CharacterBody2D 
@export var speed := 100 
@export var chase_speed := 150 
@export var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")
var direction := 1
@onready var ground_check: RayCast2D = $GroundRay 
func _ready() -> void: 
	update_raycast_direction()
func _physics_process(delta: float) -> void: 
	if not is_on_floor(): 
		velocity.y += gravity * delta 
	velocity.x = direction * speed 
	move_and_slide() 
	if is_on_floor(): 
		if is_on_wall() or !ground_check.is_colliding(): 
			direction *= -1 
			update_raycast_direction() 

func update_raycast_direction(): 
	ground_check.target_position = Vector2(direction * 20, 20)
