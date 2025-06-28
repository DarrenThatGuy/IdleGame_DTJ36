class_name DPSCharacter1 extends Character

@export var bleed_active = false
@export var bleed_timer : Timer
@export var bleed_time : float = 20
@export var bleed_amount : float = .95

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
