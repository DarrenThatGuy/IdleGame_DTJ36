class_name DPSCharacter2 extends Character

@export var deadeye_active = false
@export var deadeye_timer : Timer
@export var deadeye_cooldown : float = 20
@export var deadeye_duration : float = 1

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
