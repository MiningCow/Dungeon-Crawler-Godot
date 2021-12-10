extends Position2D

onready var player = $".."
const MAX_SPEED = 100
const ACCELERATION = 100
const DECELERATION = 2
var motion = 0
#var last_player_direction: Vector2 = Vector2.ZERO

func _physics_process(delta):
	var player_input_direction = player.get_input_direction()
	if player_input_direction == Vector2.ZERO:
		move_back(position * DECELERATION * delta)
#		move_back(DECELERATION * delta)
	else:
		move_away_from_player(player_input_direction * ACCELERATION * delta)

func move_back(deceleration):
	position -= deceleration
	position = position.clamped(MAX_SPEED)
#	position = position.move_toward(Vector2.ZERO, amount)

func move_away_from_player(acceleration):
	position += acceleration
	position = position.clamped(MAX_SPEED)
	
