class_name TankCharacter extends Character

signal toggle_shred(time, shred_amount)

@export  var shred_active = false
@export var shread_timer : Timer
@export var shred_time : float = 2
@export var shred_amount : float = 1.05

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
