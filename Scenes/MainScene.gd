extends Node2D

signal game_over()

var exp
var times_defeated

# Called when the node enters the scene tree for the first time.
func _ready():
	exp = 1000000000000000000
	times_defeated = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_boss_core_get_exp(amount):
	exp += round(amount)


func _on_boss_core_boss_defeated():
	times_defeated += 1
	if times_defeated == 10:
		end_game()

func end_game():
	game_over.emit()
	get_tree().paused = true
	
	
