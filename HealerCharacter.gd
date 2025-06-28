class_name HealerCharacter extends Character

@export var embolden_active = false
@export var embolden_timer : Timer
@export var embolden_time : float = 1
@export var embolden_amount : float = 1.05

signal embolden_signal(embolden_time, embolden_amount)

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

func embolden():
	embolden_signal.emit(embolden_time, embolden_amount)


func _on_embolden_timer_timeout():
	embolden()
