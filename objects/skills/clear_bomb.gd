extends Area2D

var charges = 3

func activate():
	
	if charges > 0:
		self.get_overlapping_areas().filter(is_enemy_bullet).all(clear)
		charges-=1

func is_enemy_bullet(body):
	return body.is_in_group('enemy_bullet')

func clear(body):
	body.queue_free()

