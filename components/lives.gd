extends Component


class_name Lives, 'res://assets/icons/health_ico.png'
signal life_spent
@export var lives = 2

func _init():
	stats_name = 'lives'

func on_0_health():
	lives-=1
	if lives < 0:
		self.entity.die()
		return

	self.entity.resurrect()
	emit_signal('life_spent', self.lives)
