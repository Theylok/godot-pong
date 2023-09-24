extends CharacterBody2D

@export var _initial_speed: float = 200.0
@export var _speed_increment: float = 10.0

var _movement_direction: Vector2 = Vector2.ZERO
var _speed: float = 0.0
var _starting_position: Vector2 = Vector2.ZERO


func _enter_tree() -> void:
	_starting_position = position

	
func _physics_process(delta: float) -> void:
	_movement_direction = _movement_direction.limit_length()
	
	if not _movement_direction.is_zero_approx():
		velocity = _movement_direction * _speed * delta
		var collision := move_and_collide(velocity)
		
		if collision:
			_movement_direction = _movement_direction.bounce(collision.get_normal())
			_speed += _speed_increment
			
			if collision.get_collider() is Paddle:
				$BlipSound.play()
			else:
				$BlipSound2.play()
			
			
func reset(direction: Vector2) -> void:
	_speed = _initial_speed
	position = _starting_position
	_movement_direction = direction
