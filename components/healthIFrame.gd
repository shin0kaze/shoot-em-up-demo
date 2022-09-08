extends 'res://components/component.gd'

class_name HealthIFrame, 'res://assets/icons/health_ico.png'


signal health_changed
@export var health = 4
@export var frame_duration = 1.
var previous_time = .0

func _init():
	stats_name = 'health'

func apply_damage(damage = 0):
	var current_time = float(Time.get_ticks_msec()) / 1000
	if current_time - previous_time < frame_duration:
		return

	previous_time = current_time
	self.health -= damage
	emit_signal('health_changed', self.health)
	if health <= 0:
		self.entity.die()
		
#func shoot():
#	if get_time() - fire_time < 0.3:
#		return
#	fire_time = get_time()
#	var bullet = Bullet.instantiate()
#	bullet.transform = $Muzzle.global_transform
#	get_tree().get_root().call_deferred('add_child', bullet)
