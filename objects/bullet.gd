extends Area2D

const SPEED: int = 500
const LIFETIME: float = 5

func _physics_process(delta: float):
	position += transform.x * SPEED * delta


func _on_bullet_body_entered(body):
	if body.is_in_group('attackable'):
		print('punch')
	queue_free()
