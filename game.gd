extends Node

const Ball = preload("res://ball.gd")

var _player_score: Dictionary = { 0: 0, 1: 0 }

@onready var _ball: Ball = $Ball


func _ready() -> void:
	_ball.reset(Vector2(1 - (2 * randi_range(0, 1)), 0))
	
	
func _score(player_id: Paddle.PlayerID) -> void:		
	_player_score[player_id] += 1
	
	var direction: Vector2 = Vector2(1, 0) if player_id == Paddle.PlayerID.PLAYER_2 else Vector2(-1, 0)
	_ball.reset(direction)
	
	$Player1Score.text = "%03d" % _player_score[Paddle.PlayerID.PLAYER_1]
	$Player2Score.text = "%03d" % _player_score[Paddle.PlayerID.PLAYER_2]
	
	$ScoreSound.play()


func _on_end_zone_left_body_entered(body: Node2D) -> void:
	_score(Paddle.PlayerID.PLAYER_2)


func _on_end_zone_right_body_entered(body: Node2D) -> void:
	_score(Paddle.PlayerID.PLAYER_1)
