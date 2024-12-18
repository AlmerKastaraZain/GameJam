extends CharacterBody2D

class_name PlayerMovement

@export var _movement_speed = 100

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	
func _get_input() -> void:
	var input_direction = Input.get_vector("left", "right", "up", "down")
	var res = input_direction * _movement_speed
	velocity = res.normalized() * _movement_speed

# Called every frame. 'delta' is the elapsed time since the previous frame.
func move() -> void:
	_get_input()
	move_and_slide()
	pass
