extends Interactable

class_name DialogueInteractable
var _dialogue_controller : DialogueController
var _grandma : NPC
@export var _dialogue : DialogueSO


func _ready() -> void:
	_grandma = get_parent() as NPC
	_dialogue_controller = get_tree().root.get_node("./Scene/Controller/DialogueController")
	pass
	 
func action() -> void:
	_dialogue_controller.start_NPC_dialogue(_dialogue, _grandma)
	pass
