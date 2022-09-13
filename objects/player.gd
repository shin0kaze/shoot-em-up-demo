extends CharacterBody2D


const SPEED = 300
const SHIFT_MOD = 0.4
var Bullet = preload('res://objects/weapons/bullet.tscn')
var health = 6
var lives = 3
var fire_time= 0.0
var stats = {}
var bbox = Vector2(400, 400)


func _ready():
	pass

func _physics_process(delta):
	var move_vector = Vector2(
		Input.get_action_strength('game_right') - Input.get_action_strength('game_left'),
		Input.get_action_strength('game_down') - Input.get_action_strength('game_up'))
	velocity = move_vector.normalized() * SPEED 
	
	if Input.is_action_pressed('game_sneak'):
		velocity *= SHIFT_MOD
	move_and_slide() # delta is applied automatically
	look_at(get_global_mouse_position())

func _process(delta):
	if Input.is_action_pressed('game_shoot'):
		shoot()
	if Input.is_action_just_pressed('game_use_skill'):
		$ClearBomb.activate()

func shoot():
	if get_time() - fire_time < 0.1:
		return
	fire_time = get_time()
	var bullet = Bullet.instantiate()
	bullet.transform = $Muzzle.global_transform
	get_tree().get_root().call_deferred('add_child', bullet)

func on_0_health():
	stats.lives.on_0_health()

func die():
	print('omg i die')

func resurrect():
	stats.values().all(restore)
	print('im alive')

func restore(stat):
	stat.restore()

func get_time():
	return float(Time.get_ticks_msec()) / 1000
