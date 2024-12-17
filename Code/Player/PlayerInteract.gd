extends Area2D


class_name PlayerInteract
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _interact() -> void:
	var areas = get_overlapping_areas()
	for area in areas:
		if area.has_meta('Interactable'):
			var object = area as Interactable
			object.action()
			
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func scan_for_interaction() -> void:
	if	Input.is_action_just_pressed("interact"):
		_interact();
	pass
