class_name Character extends Node2D

@export var attack_damage: float
@export var attack_damage_mult: float
@export var attack_speed: float


@export var attack_timer: Timer

signal deal_damage(damage)

func _ready():
	attack_timer.wait_time = attack_speed
	attack_timer.start()

func attack():
	deal_damage.emit(attack_damage * attack_damage_mult)
	
func _on_attack_timer_timeout():
	attack()
