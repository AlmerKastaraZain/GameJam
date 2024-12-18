extends Node

class_name PlayerController
var _current_player_state = PlayerState.Active
var _current_held_item : ItemSO

func change_current_held_item(item: ItemSO) -> void:
	_current_held_item = item
	pass

func change_state_to_inactive() -> void:
	_current_player_state = PlayerState.Inactive
	pass

func change_state_to_dialogue() -> void:
	_current_player_state = PlayerState.Dialogue
	pass
func change_state_to_active() -> void:
	_current_player_state = PlayerState.Active
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
	if _current_player_state == PlayerState.Active:
		player_movement.move()
		player_interact.scan_for_interaction()
	if _current_player_state == PlayerState.Dialogue:
		dialogue_controller.get_skip_input_dialogue()
	pass
