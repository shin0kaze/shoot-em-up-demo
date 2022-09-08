extends Area2D


var damage = 1
var speed
var lifetime


func _init(speed = 500, lifetime = 2.0):
	self.speed = speed
	self.lifetime = lifetime

func _physics_process(delta: float):
	position += transform.y * speed * delta
	lifetime -= delta
	if lifetime < 0:
		queue_free()

func _on_enemy_bullet_body_entered(body):
	if body.is_in_group('player'):
		body.stats['health'].apply_damage(self.damage)
	queue_free()
