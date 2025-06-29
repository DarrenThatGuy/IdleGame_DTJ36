class_name DPSCharacter2 extends Character

@export var deadeye_active = false
@export var deadeye_timer : Timer
@export var deadeye_cooldown : float = 60
@export var deadeye_duration : float = 1
@export var deadeye_upgrade_number : int = 0
@export var deadeye_upgrade_cost : int = 100

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
	
func _on_deadeye_timer_timeout():
	attack_damage = 2
	print("Deadeye Active")
	await get_tree().create_timer(deadeye_duration).timeout
	attack_damage = 1
	print("Deadeye Ended")


func _on_dps_2_upgrade_pressed():
	upgrade()

func deadeye_upgrade():
	if deadeye_upgrade_number == 0:
		deadeye_active = true
		deadeye_timer.start()
	else:
		deadeye_cooldown -= 10
		deadeye_duration += 1
	deadeye_upgrade_number += 1


func _on_dps2_ability_pressed():
	if  deadeye_upgrade_cost > game_head.exp:
		print("EXP too Low")
	else:
		game_head.exp -= deadeye_upgrade_cost
		deadeye_upgrade()
		deadeye_upgrade_cost *= 3.5
