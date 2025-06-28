extends ProgressBar

@export var BossNode: Boss

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	max_value = BossNode.max_health
	value = BossNode.health
