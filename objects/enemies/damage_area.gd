extends Area2D

var player

func _physics_process(delta):
	if player:
		player.stats['health'].apply_damage(1)

func _on_damage_area_body_entered(body):
	if body.is_in_group('player'):
		player = body


func _on_damage_area_body_exited(body):
	if body.is_in_group('player'):
		player = null
