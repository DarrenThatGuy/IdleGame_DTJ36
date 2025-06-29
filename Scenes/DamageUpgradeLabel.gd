extends Label

@export var character_to_label : Character


# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false
	var new_sb = StyleBoxFlat.new()
	new_sb.bg_color = Color.DARK_GRAY
	add_theme_stylebox_override("normal", new_sb)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	text = "Upgrade " + character_to_label.name + "'s damage multiplier from " + str(character_to_label.attack_damage_mult) + " to " + str(character_to_label.attack_damage_mult + character_to_label.multiplier_upgrade)
	global_position = get_global_mouse_position() - Vector2(size.x / 2, size.y)

func _on_upgrade_button_mouse_entered():
	visible = true
	
func _on_upgrade_button_mouse_exited():
	visible = false
