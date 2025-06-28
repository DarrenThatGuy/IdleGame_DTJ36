class_name Boss extends Node2D
const base_defense: float = 1

var health: float
@export var max_health: float
@export var regen_amount: float
@export var regen_speed: float
@export var defense_value : float = 1
@export var regen_timer: Timer

signal get_exp(amount)
# Called when the node enters the scene tree for the first time.
func _ready():
	health = max_health
	regen_timer.wait_time = regen_speed


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if health <= 0:
		level_up()

func level_up():
	max_health *= 2
	regen_amount = round(regen_amount * 2)
	health = max_health


func _on_regen_timer_timeout():
	if health < max_health:
		if health + regen_amount > max_health:
			health = max_health
		else:	
			health += regen_amount


func _on_base_character_deal_damage(damage):
	health -= damage * defense_value
	get_exp.emit(damage)
	



func _on_tank_character_toggle_shred(shred_time, shred_amount):
	defense_value += shred_amount
	print("Shred ON")
	await get_tree().create_timer(shred_time).timeout
	defense_value -= shred_amount
	print("Shred OFF")


func _on_dps_character_1_bleed_boss(bleed_multiplier):
	health *= bleed_multiplier
	print(health)

func _on_healer_character_toggle_embolden(embolden_time, embolden_amount):
	defense_value += embolden_amount
	print("Embolden ON")
	await get_tree().create_timer(embolden_time).timeout
	defense_value -= embolden_amount
	print("Embolden OFF")

