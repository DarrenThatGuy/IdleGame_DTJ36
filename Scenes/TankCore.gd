class_name TankCharacter extends Character

signal toggle_shred(time, shred_amount)

@export  var shred_active = false
@export var shread_timer : Timer
@export var shred_time : float = 1
@export var shred_amount : float = 1.05
@export var shred_upgrade_number : int = 0
@export var shred_upgrade_cost = 100

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

func shred():
	toggle_shred.emit(shred_time, shred_amount)

func _on_shred_timer_timeout():
	shred()


func _on_tank_upgade_pressed():
	upgrade()

func shred_upgrade():
	if shred_upgrade_number == 0:
		shred_active = true
		shread_timer.start()
	else:
		shred_amount += .01
		shred_time += 1
	shred_upgrade_number += 1


func _on_tank_ability_pressed():
	if  shred_upgrade_cost > game_head.exp:
		print("EXP too Low")
	else:
		game_head.exp -= shred_upgrade_cost
		shred_upgrade()
		shred_upgrade_cost *= 3.5
		
