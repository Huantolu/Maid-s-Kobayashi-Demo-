extends Area2D

func _on_area_entered(area):
	if area.is_in_group("player_attack"):
		die()

func die():
	var player = get_tree().get_first_node_in_group("player")
	PlayerManager.shake_camera(100, 0.2)
	get_parent().queue_free()
