extends Node

class_name DialogueController
@export var player_controller : PlayerController
@export var dialogue_panel : Panel
@export var dialogue_text : RichTextLabel
@export var dialogue_name : RichTextLabel
@export var dialogue_action : RichTextLabel

@export var next_char_timer : Timer
@export var next_char_wait_time = 0.075
var dialogue_has_ended = true
var current_dialogue_index = 0
var current_dialogue_object: DialogueSO
var dialogue_text_selected : RichTextLabel

func _ready() -> void:
	next_char_timer.wait_time = next_char_wait_time                         
	pass

func start_dialogue(dialogue: DialogueSO)-> void:
	dialogue_panel.visible = true
	dialogue_has_ended = false
	player_controller.change_state_to_dialogue()
	current_dialogue_object = dialogue
	current_dialogue_index = 0
	_change_dialogue(current_dialogue_object, current_dialogue_index)
	pass


func get_skip_input_dialogue()->void:
	if Input.is_action_just_pressed("interact") && dialogue_has_ended:
		_next_dialogue()
		dialogue_has_ended = false
	pass
	
func _next_dialogue()->void:
	_change_dialogue(current_dialogue_object, current_dialogue_index)
	pass

func _end_dialogue()->void:
	dialogue_panel.visible = false
	player_controller.change_state_to_active()
	pass

var current_dialogue = ""
func _change_dialogue(dialogue: DialogueSO, n: int):
	if (len(dialogue.dialogue) <= current_dialogue_index):
		_end_dialogue()
		return
	
	dialogue_text.text = ""
	current_char = 0
	
	current_dialogue = dialogue.dialogue[n]
	
	if (dialogue.player_turn[n] == 3):
		dialogue_text.visible = false
		dialogue_name.visible = false
		dialogue_action.visible = true
		dialogue_text_selected = dialogue_action
	elif (dialogue.player_turn[n] == 2):
		dialogue_text.visible = true
		dialogue_name.visible = true
		dialogue_action.visible = false
		dialogue_name.text = dialogue.npc_name
		dialogue_text_selected = dialogue_text
	else:
		dialogue_text.visible = true
		dialogue_name.visible = true
		dialogue_action.visible = false
		dialogue_name.text = dialogue.player_name
		dialogue_text_selected = dialogue_text
	
	next_char_timer.start()		
	current_dialogue_index += 1

var current_char = 0
# This add a character when timer timeout
func _on_next_char_timeout() -> void:
	if current_char >= current_dialogue.length():
		dialogue_has_ended = true
		return
	
	dialogue_text_selected.text += current_dialogue[current_char]
	current_char += 1
	pass # Replace with function body.
