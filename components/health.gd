extends Component


class_name Health, 'res://assets/icons/health_ico.png'

@export var init_health = 4
var health = init_health

func _init():
	stats_name = 'health'

func apply_damage(damage = 0):
	self.health -= damage
	if health <= 0:
		self.entity.on_0_health()
