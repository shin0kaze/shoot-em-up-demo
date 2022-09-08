
extends 'res://components/component.gd'

class_name Health, 'res://assets/icons/health_ico.png'
@export var health = 4

func _init():
	stats_name = 'health'

func apply_damage(damage = 0):
	self.health -= damage
	print(self.health)
	if health <= 0:
		self.entity.die()
