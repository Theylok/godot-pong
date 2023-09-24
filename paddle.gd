extends CharacterBody2D
class_name Paddle

enum PlayerID { PLAYER_1, PLAYER_2 }

@export var _player_id: PlayerID = PlayerID.PLAYER_1
@export var _speed: float = 400.0


func _physics_process(delta: float) -> void:
	var _movement_input: float = 0.0
	
	if _player_id == PlayerID.PLAYER_1:
		_movement_input = Input.get_axis("p1_up", "p1_down")
	else:
		_movement_input = Input.get_axis("p2_up", "p2_down")
		
	velocity.y = _movement_input * _speed * delta
	move_and_collide(velocity)
