class_name Player
extends CharacterBody2D

@export var max_hp: int = 100
@onready var current_hp: int = max_hp
@onready var movement_state_machine: Node = $movement_state_machine
@onready var attack_state_machine: Node = $attack_state_machine
@onready var collision_hitbox: CollisionShape2D = $Hitbox/collision_hitbox
@onready var hurtbox: Area2D = $Hurtbox
@onready var camera_2d: Camera2D = $Camera2D



@export var rotation_speed = 10.0
@onready var player_model: Node3D = $SubViewport/Sophia_Model
var facing_direction := 1
var jumps_left: int = 0
const TOTAL_JUMPS: int = 2

var _is_dead := false

var is_dead: bool:
	set(value):
		if _is_dead == value:
			return

		_is_dead = value

		if _is_dead:
			AudioController.stop_music()
			AudioController.play_sound("player_hurt")
			camera_2d.screen_shake(15, 0.3)

			await get_tree().create_timer(1.5).timeout

			AudioController.play_sound("player_death")

			Engine.time_scale = 0.5
			camera_2d.screen_shake(25, 1.5)
			await get_tree().create_timer(1.5, true).timeout
			Engine.time_scale = 1.0
			get_tree().reload_current_scene()

	get:
		return _is_dead

func _ready() -> void:
	movement_state_machine.init(self)
	attack_state_machine.init(self)
	
	hurtbox.area_entered.connect(_on_hurtbox_area_entered)

func die():
	if is_dead:
		return

	is_dead = true
	set_physics_process(false)

	print("Jugador muerto")


func _unhandled_input(event: InputEvent) -> void:
	movement_state_machine.process_input(event)
	attack_state_machine.process_input(event)

func _physics_process(delta: float) -> void:
	if is_dead:
		velocity = Vector2.ZERO
		move_and_slide()
		return
	movement_state_machine.process_physics(delta)
	attack_state_machine.process_physics(delta)

func _process(delta: float) -> void:
	movement_state_machine.process_frame(delta)
	attack_state_machine.process_frame(delta)

func update_attack_hitbox():
	if facing_direction == 1:
		collision_hitbox.position.x = 45
	else:
		collision_hitbox.position.x = -45



func _on_hurtbox_area_entered(area: Area2D) -> void:
	if area.is_in_group("enemy_hitbox"):
		die()
