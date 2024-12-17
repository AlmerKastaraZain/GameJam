extends Interactable

var dialogue_controller : DialogueController
@export var dialogue : DialogueSO

func _ready() -> void:
	dialogue_controller = get_tree().root.get_node("./MainScene/Controller/DialogueController")
	pass
	 
func action() -> void:
	dialogue_controller.start_dialogue(dialogue)
	pass
