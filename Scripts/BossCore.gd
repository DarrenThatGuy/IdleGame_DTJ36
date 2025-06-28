class_name Boss extends Node2D

@export var max_health: float
var health: float
@export var regen_amount: float

@export var regen_timer: Timer
# Called when the node enters the scene tree for the first time.
func _ready():
	health = max_health


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func level_up():
	max_health *= 2
	health = max_health


func _on_regen_timer_timeout():
	health += regen_amount
