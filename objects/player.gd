extends CharacterBody2D

const SPEED: int = 300
const SHIFT_MOD: float = 0.4
var fire_time: float = 0.0
var Bullet = preload("res://objects/bullet.tscn")

func _ready():
	print('hello 2')
	pass

func _physics_process(delta: float):
	var move_vector = Vector2(
		Input.get_action_strength('game_right') - Input.get_action_strength('game_left'),
		Input.get_action_strength('game_down') - Input.get_action_strength('game_up'))
	velocity = move_vector.normalized() * SPEED 
	
	if Input.is_action_pressed('game_sneak'):
		velocity *= SHIFT_MOD
	move_and_slide() # delta is applied automatically
	look_at(get_global_mouse_position())

func _process(delta: float):
	if Input.is_action_just_pressed('game_shoot'):
		shoot()
	
func shoot():
	if get_time() - fire_time < 0.3:
		return
	fire_time = get_time()
	var bullet = Bullet.instantiate()
	bullet.transform = $Muzzle.global_transform
	get_tree().get_root().call_deferred('add_child', bullet)

func get_time():
	return float(Time.get_ticks_msec()) / 1000
