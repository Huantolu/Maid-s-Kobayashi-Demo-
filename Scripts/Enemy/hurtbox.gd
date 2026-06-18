extends Area2D

func _on_area_entered(area):
	if area.is_in_group("player_attack"):
		get_parent().queue_free()
