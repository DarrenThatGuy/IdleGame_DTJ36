extends Label

var current_phase


# Called when the node enters the scene tree for the first time.
func _ready():
	current_phase = 1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	text = "The Great Unstoppable Lord of Skull Palace - Phase " + str(current_phase)


func _on_boss_core_boss_defeated():
	current_phase += 1


func _on_node_2d_game_over():
	text = "Boss Defeated! Congratulations!"
