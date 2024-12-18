extends Area2D


class_name PlayerInteract

var player : PlayerMovement
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player = get_parent()
	pass # Replace with function body.

func _interact() -> void:
	var areas = get_overlapping_areas()
	for area in areas:
		if area.has_meta('Interactable'):
			player.velocity = Vector2.ZERO
			var object = area as Interactable
			object.action()
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func scan_for_interaction() -> void:
	if	Input.is_action_just_pressed("interact"):
		_interact();
	pass
