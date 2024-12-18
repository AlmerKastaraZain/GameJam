extends Resource

class_name DialogueSO
@export var player_name : String
@export var npc_name : String

@export_group("Dialogue")
@export var dialogue : Array[String]
@export var player_turn : Array[int]
@export var char_per_second : Array[float]
# 1 = Player
# 2 = NPC
# 3 = Action
