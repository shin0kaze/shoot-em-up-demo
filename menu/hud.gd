extends CanvasLayer

@export var HealthValuePath: NodePath
@onready var health = get_node(HealthValuePath)
@onready var player = get_parent()

func _ready():
	if player.is_in_group('player'):
		player.stats['health'].health_changed.connect(update_health)

func update_health(health):
	self.health.text = str(health)

