extends AnimationPlayer

class_name ExpressionEmote

class ExpressionClass:
	const None = 0
	const Happy = 1
	const Angry = 2
	const Neutral = 3

func _ready() -> void:
	play("Neutral_Down")

var expression_class = ExpressionClass

func reset_to_default()->void:
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

func _change_expression_to_angry()->void:
	pass

func _change_expression_to_happy()->void:
	pass

func _change_expression_to_neutral()->void:
	pass
