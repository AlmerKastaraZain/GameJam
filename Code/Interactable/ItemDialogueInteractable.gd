extends DialogueInteractable

@export var _player_controller: PlayerController
@export var _Item: ItemSO 
@export var _alt_dialogue: DialogueSO

func _ready() -> void:
	_dialogue_controller = get_tree().root.get_node("./Scene/Controller/DialogueController")
	_player_controller = get_tree().root.get_node("./Scene/Controller/PlayerController")
	pass
	
func action() -> void:
	if  _player_controller._current_held_item == null:
		_player_controller.change_current_held_item(_Item)
		_dialogue_controller.start_dialogue(_dialogue)
	else: 
		_dialogue_controller.start_dialogue(_alt_dialogue)
	pass
