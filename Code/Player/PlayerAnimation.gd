extends AnimationPlayer
@export var player: CharacterBody2D

func get_degree(angle: float)->float:
	return angle * PI / 180;
	
class AnimationState:
	var Idle_Up = "Up_Idle";
	var Idle_Down = "Down_Idle";
	var Idle_Left = "Left_Idle";
	var Idle_Right = "Right_Idle";
	var Up = "Up";
	var Down = "Down";
	var Left = "Left";
	var Right = "Right";
var animation_state = AnimationState.new()

var current_direction = animation_state.Idle_Down


func _process(delta: float) -> void:
	if player.velocity == Vector2.ZERO:
		_set_idle_animation_on_previous_direction();
		return
	
	_get_walking_animation();
	pass
	
func _get_walking_animation()->void:
	var angle = player.velocity.angle()
	
	# dont ask me how this work, this is from previous project, and even I am confused with this.
	# It gets the angle and set it animation accordingly
	if angle < get_degree(45) && angle > -get_degree(45):
		current_direction = animation_state.Right
		play(current_direction)
	elif angle <= -get_degree(45) && angle >= -get_degree(135):
		current_direction = animation_state.Up
		play(current_direction)
	elif angle >= get_degree(45) && angle <= get_degree(135):
		current_direction = animation_state.Down
		play(current_direction)
	else:
		current_direction = animation_state.Left
		play(current_direction)
	
func _set_idle_animation_on_previous_direction()->void:
	if current_direction == animation_state.Up:
		current_direction = animation_state.Idle_Up
		play(current_direction)
		
	elif current_direction == animation_state.Down:
		current_direction = animation_state.Idle_Down
		play(current_direction)
		
	elif current_direction == animation_state.Right:
		current_direction = animation_state.Idle_Right
		play(current_direction)
		
	elif current_direction == animation_state.Left:
		current_direction = animation_state.Idle_Left
		play(current_direction)
	pass
