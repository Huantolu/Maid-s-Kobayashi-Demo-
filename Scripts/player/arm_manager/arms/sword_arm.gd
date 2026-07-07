extends Area2D



func _ready() -> void:
	body_entered.connect(_on_body_entered)
	$AnimationPlayer.play("sword_swing")
	
	$AnimationPlayer.animation_finished.connect(func(_anim_name): queue_free())
	
func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group()
