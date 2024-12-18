extends ExpressionEmote

enum Direction {
	Left,
	Right,
	Down
}

class ExpressionAnimation:
	# Angry
	const Angry_Left = "Angry_Left"
	const Angry_Right = "Angry_Right"
	const Angry_Down = "Angry_Down"
	# Happy
	const Happy_Left = "Happy_Left"
	const Happy_Right = "Happy_Right"
	const Happy_Down = "Happy_Down"
	# Neutral
	const Neutral_Left = "Neutral_Left"
	const Neutral_Right = "Neutral_Right"
	const Neutral_Down = "Neutral_Down"
var expression_animation = ExpressionAnimation

@export var player: PlayerMovement

@export var left : Node2D
@export var right : Node2D
@export var down : Node2D

func reset_to_default()->void:
	play(ExpressionAnimation.Neutral_Down)
	pass
	
func change_expression(expression: int)->void:
	if expression == expression_class.None:
		_change_expression_to_neutral()
	elif expression == expression_class.Happy:
		_change_expression_to_happy()
	elif expression == expression_class.Angry:
		_change_expression_to_angry()
	elif expression == expression_class.Neutral:
		_change_expression_to_neutral()
	else: 
		printerr("Expression doesn't exist...")
	pass

func _calculate_player_direction_to_object()->Direction:
	var node = [down, left, right]
	
	var closest : Node2D = null
	var closest_distance : float = INF
	var to_position : Vector2 = player.global_position
	
	for item : Node2D in node:
		var distance : float = to_position.distance_squared_to(item.global_position)
		if distance < closest_distance:
			closest = item
			closest_distance = distance
	
	if  closest == left:
		return Direction.Left
	if  closest == right:
		return Direction.Right
	return Direction.Down

func _change_expression_to_angry()->void:
	var direction = _calculate_player_direction_to_object()
	
	if direction == Direction.Left:
		play(ExpressionAnimation.Angry_Left)
	elif direction == Direction.Right:
		play(ExpressionAnimation.Angry_Right)
	elif direction == Direction.Down:
		play(ExpressionAnimation.Angry_Down)
	else:
		printerr("Invalid direction...")
	pass

func _change_expression_to_happy()->void:
	var direction = _calculate_player_direction_to_object()
	
	if direction == Direction.Left:
		play(ExpressionAnimation.Happy_Left)
	elif direction == Direction.Right:
		play(ExpressionAnimation.Happy_Right)
	elif direction == Direction.Down:
		play(ExpressionAnimation.Happy_Down)
	else:
		printerr("Invalid direction...")
	pass

func _change_expression_to_neutral()->void:
	var direction = _calculate_player_direction_to_object()
	
	if direction == Direction.Left:
		play(ExpressionAnimation.Neutral_Left)
	elif direction == Direction.Right:
		play(ExpressionAnimation.Neutral_Right)
	elif direction == Direction.Down:
		play(ExpressionAnimation.Neutral_Down)
	else:
		printerr("Invalid direction...")
	pass
