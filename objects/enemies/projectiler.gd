extends Node2D


var Bullet = preload('res://objects/enemies/enemy_bullet.tscn')
var fire_time = 0.0


func _process(delta):
	if float(Time.get_ticks_msec()) / 1000 - fire_time < 0.6:
		return
	fire_time = float(Time.get_ticks_msec()) / 1000
	
	var bullet = Bullet.instantiate()
	bullet.transform = self.global_transform
	get_tree().get_root().call_deferred('add_child', bullet)
