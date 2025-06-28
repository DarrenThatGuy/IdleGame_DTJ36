class_name Character extends Node

@export var attack_damage: float
@export var attack_speed: float

@export var attack_timer: Timer

signal deal_damage(damage)

func _ready():
	attack_timer.wait_time = attack_speed
	attack_timer.start()

func attack():
	print( name + " ATTACKING")
	deal_damage.emit(attack_damage)
	
func _on_attack_timer_timeout():
	attack()
