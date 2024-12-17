extends Node

class_name PlayerController
var current_player_state = PlayerState.Active

func change_state_to_inactive() -> void:
	current_player_state = PlayerState.Inactive
	pass
	
func change_state_to_dialogue() -> void:
	current_player_state = PlayerState.Dialogue
	pass
func change_state_to_active() -> void:
	current_player_state = PlayerState.Active
	pass

enum PlayerState {
	Active,
	Dialogue,
	Inactive
}

@export var player_movement: PlayerMovement
@export var player_interact: PlayerInteract
@export var dialogue_controller: DialogueController


func _process(delta: float) -> void:
	if current_player_state == PlayerState.Active:
		player_movement.move()
		player_interact.scan_for_interaction()
	if current_player_state == PlayerState.Dialogue:
		dialogue_controller.get_skip_input_dialogue()
	pass
