extends Resource

class_name DialogueSO
@export var player_name : String
@export var no_npc_expression : bool
var npc_name : String

@export_group("Dialogue")
@export var dialogue : Array[SingleDialogueSO]
