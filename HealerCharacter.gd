class_name HealerCharacter extends Character

@export var embolden_active = false
@export var embolden_timer : Timer
@export var embolden_time : float = 1
@export var embolden_amount : float = 1.05
@export var embolden_upgrade_number : int = 0
@export var embolden_upgrade_cost : int = 100


signal embolden_signal(embolden_time, embolden_amount)

# Called when the node enters the scene tree for the first time.
func _ready():
	super()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func upgrade():
	super()

func attack():
	super()
	
func _on_attack_timer_timeout():
	super()

func embolden():
	embolden_signal.emit(embolden_time, embolden_amount)


func _on_embolden_timer_timeout():
	embolden()


func _on_healer_upgrade_pressed():
	upgrade()

func embolden_upgrade():
	if embolden_upgrade_number == 0:
		embolden_active = true
		embolden_timer.start()
	else:
		embolden_amount += .01
		embolden_time += 1
	embolden_upgrade_number += 1


func _on_healer_ability_pressed():
	if  embolden_upgrade_cost > game_head.exp:
		print("EXP too Low")
	else:
		game_head.exp -= embolden_upgrade_cost
		embolden_upgrade()
		embolden_upgrade_cost *= 3.5
