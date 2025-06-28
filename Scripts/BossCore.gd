class_name Boss extends Node2D

@export var max_health: float
var health: float
@export var regen_amount: float
@export var regen_speed: float

@export var regen_timer: Timer
# Called when the node enters the scene tree for the first time.
func _ready():
	health = max_health
	regen_timer.wait_time = regen_speed


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func level_up():
	max_health *= 2
	regen_amount = round(regen_amount * 1.5)
	health = max_health


func _on_regen_timer_timeout():
	if health < max_health:
		if health + regen_amount > max_health:
			health = max_health
		else:	
			health += regen_amount
	print(health)


func _on_base_character_deal_damage(damage):
	health -= damage
	print(health)

