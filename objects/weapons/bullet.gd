extends Area2D

var damage = 1
var speed: int
var lifetime: float
func _init(speed: int = 500, lifetime: float = 1.0):
	self.speed = speed
	self.lifetime = lifetime

func _physics_process(delta: float):
	position += transform.x * speed * delta
	lifetime -= delta
	if lifetime < 0:
		queue_free()

func _on_bullet_body_entered(body):
	if body.is_in_group('projectile_bound'):
		queue_free()
		return
	
	
	body.stats['health'].apply_damage(damage)
	queue_free()
