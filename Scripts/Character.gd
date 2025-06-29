class_name Character extends Node2D

@export var game_head : Node2D

const base_damage = 1
const base_upgrade_cost = 100

var damage_upgrade_number = 0

@export var attack_damage: float
@export var attack_damage_mult: float
@export var multiplier_upgrade: float
@export var attack_speed: float
@export var upgrade_cost: float
@export var attack_timer: Timer

signal deal_damage(damage)

func _ready():
	attack_timer.wait_time = attack_speed
	attack_timer.start()
	upgrade_cost = base_upgrade_cost

func attack():
	deal_damage.emit(attack_damage * (attack_damage_mult))
	
func _on_attack_timer_timeout():
	attack()

func upgrade():
	if upgrade_cost > game_head.exp:
		print("EXP too Low")
	else:
		game_head.exp -= upgrade_cost
		attack_damage_mult += multiplier_upgrade
		damage_upgrade_number += 1
		upgrade_cost = base_upgrade_cost * (damage_upgrade_number * 3.5)
		print(attack_damage_mult)
