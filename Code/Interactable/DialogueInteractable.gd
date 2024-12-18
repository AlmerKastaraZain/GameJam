extends Interactable

class_name DialogueInteractable
var _dialogue_controller : DialogueController
@export var _dialogue : DialogueSO

func _ready() -> void:
	_dialogue_controller = get_tree().root.get_node("./Scene/Controller/DialogueController")
	pass
	 
func action() -> void:
	_dialogue_controller.start_dialogue(_dialogue)
	pass
