extends Node2D

@export var dialogue_resources: Array[DialogueResource] = []
var current_dialogue_index := 0
var dialogue_active := false

func _ready():
	# Debug node paths
	var intro = load("res://Game_Dialogue.dialogue")
	DialogueManager.show_dialogue_balloon(intro, "a")
	DialogueManager.dialogue_ended.connect(_on_dialogue_ended)
#	if dialogue_resources.size() > 0:


func pause_game(state: bool):
	get_tree().paused = state

func start_dialogue(index: int):
	if index >= dialogue_resources.size(): return
	
	dialogue_active = true
	pause_game(true)
	DialogueManager.show_dialogue_balloon(dialogue_resources[index], "a")

func _on_dialogue_ended():
	if dialogue_active:
		dialogue_active = false
		pause_game(false)
		current_dialogue_index += 1
		if current_dialogue_index < dialogue_resources.size():
			start_dialogue(current_dialogue_index)

func _on_boss_core_boss_defeated():
	start_dialogue(current_dialogue_index)
