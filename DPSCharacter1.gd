class_name DPSCharacter1 extends Character

@export var bleed_active = false
@export var bleed_timer : Timer
@export var bleed_time : float = 20
@export var bleed_amount : float = .995
@export var bleed_upgrade_number : int = 0
@export var ability_upgrade_cost : int = 100

signal bleed_boss(bleed_multiplier)

# Called when the node enters the scene tree for the first time.
func _ready():
	super()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func attack():
	super()
	
func _on_attack_timer_timeout():
	super()


func _on_bleed_timer_timeout():
	bleed_boss.emit(bleed_amount)


func _on_dps_1_upgrade_pressed():
	upgrade()

func bleed_upgrade():
	if bleed_upgrade_number == 0:
		bleed_active = true
		bleed_timer.start()
	else:
		bleed_amount -= .05
		bleed_time -= 1
	bleed_upgrade_number += 1


func _on_dps1_ability_pressed():
	if  ability_upgrade_cost > game_head.exp:
		print("EXP too Low")
	else:
		game_head.exp -= ability_upgrade_cost
		bleed_upgrade()
		ability_upgrade_cost *= 3.5
