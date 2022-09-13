extends Component


class_name HealthIFrame, 'res://assets/icons/health_ico.png'

signal health_changed
@export var init_health = 6
@export var frame_duration = 1.
var health = init_health
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
		self.entity.on_0_health()

func current():
	return self.health

func restore():
	self.health = self.init_health
	emit_signal('health_changed', self.health)
