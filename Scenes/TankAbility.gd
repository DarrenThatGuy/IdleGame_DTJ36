extends Button

@export var character_to_upgrade : Character

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	text = str(character_to_upgrade.ability_upgrade_cost) + " EXP\nUpgrade " + character_to_upgrade.name + " Ability"
