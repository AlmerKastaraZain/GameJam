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
	NPC_expression = null                     
	pass

func start_dialogue(dialogue: DialogueSO)-> void:
	dialogue_panel.visible = true
	dialogue_has_ended = false
	player_controller.change_state_to_dialogue()
	current_dialogue_object = dialogue
	current_dialogue_index = 0
	_change_dialogue(current_dialogue_object, current_dialogue_index)
	pass

var NPC_expression : NPC
func start_NPC_dialogue(dialogue: DialogueSO, npc: NPC)-> void:
	NPC_expression = npc
	start_dialogue(dialogue);
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
	NPC_expression.NPC_AnimationPlayer.reset_to_default()
	NPC_expression = null
	dialogue_panel.visible = false
	player_controller.change_state_to_active()
	pass

var current_dialogue = ""

func handle_expression(expression: int)->void:
	NPC_expression.NPC_AnimationPlayer.change_expression(expression)
	pass

func _change_dialogue(dialogue: DialogueSO, n: int):
	if (len(dialogue.dialogue) <= current_dialogue_index):
		_end_dialogue()
		return
	
	dialogue_text.text = ""
	dialogue_action.text = ""
	current_char = 0
	
	current_dialogue = dialogue.dialogue[n].dialogue
	if NPC_expression != null:
		handle_expression(dialogue.dialogue[n].NPC_expression)
		dialogue.npc_name = NPC_expression.NPC_name
	else:
		dialogue.npc_name = "Unnamed"
	
	if (dialogue.dialogue[n].player_turn == 3):
		show_action_text()
		dialogue_text_selected = dialogue_action
	elif (dialogue.dialogue[n].player_turn == 2):
		show_dialogue_text()
		dialogue_name.text = dialogue.npc_name
		dialogue_text_selected = dialogue_text
	else:
		show_dialogue_text()
		dialogue_name.text = dialogue.player_name
		dialogue_text_selected = dialogue_text
	
	next_char_timer.wait_time = dialogue.dialogue[n].char_per_second
	next_char_timer.start()
	current_dialogue_index += 1

func show_action_text()->void:
	dialogue_text.visible = false
	dialogue_name.visible = false
	dialogue_action.visible = true
	pass
	
func show_dialogue_text()->void:
	dialogue_text.visible = true
	dialogue_name.visible = true
	dialogue_action.visible = false
	pass

var current_char = 0
# This add a character when timer timeout
func _on_next_char_timeout() -> void:
	if current_char >= current_dialogue.length():
		dialogue_has_ended = true
		return
	
	dialogue_text_selected.text += current_dialogue[current_char]
	current_char += 1
	pass # Replace with function body.
