extends CanvasLayer

@export var HealthValuePath: NodePath
@onready var health = get_node(HealthValuePath)
@export var LivesValuePath: NodePath
@onready var lives = get_node(LivesValuePath)
@onready var player = get_node('../../Player')

func _ready():
	if not player:
		printerr('player not found')
		return
		
	player.stats['health'].health_changed.connect(update_health)
	update_health(player.stats['health'].health)
	player.stats['lives'].life_spent.connect(update_lives)
	update_lives(player.stats['lives'].lives)

func update_health(health):
	self.health.text = str(health)

func update_lives(lives):
	self.lives.text = str(lives)

