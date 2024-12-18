extends Resource

class_name SingleDialogueSO

@export var dialogue : String
@export_enum("Player:1", "Npc:2", "Action:3") var player_turn: int
@export_enum("None:0", "Happy:1", "Angry:2", "Neutral:3") var NPC_expression: int
@export var char_per_second : float
