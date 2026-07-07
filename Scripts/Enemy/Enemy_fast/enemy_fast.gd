extends CharacterBody2D

@export var speed := 100
@export var chase_speed := 130
@export var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")

var direction := 1
var player: CharacterBody2D = null
var is_chasing := false

func _ready():
	player = get_tree().get_first_node_in_group("player")


func _physics_process(delta: float) -> void:

	if not is_on_floor():
		velocity.y += gravity * delta


	if is_chasing and is_instance_valid(player):
		if player.global_position.x > global_position.x:
			direction = 1
		else:
			direction = -1
		velocity.x = direction * chase_speed
	else:
		velocity.x = direction * speed
	move_and_slide()
	if is_on_floor():
		if is_on_wall():
			direction *= -1




func _on_detection_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		player = body
		is_chasing = true
		
		print("chasing player!")



func _on_detection_area_body_exited(body: Node2D) -> void:
	if body == player:
		is_chasing = false
		player = null
		print("player lost")
