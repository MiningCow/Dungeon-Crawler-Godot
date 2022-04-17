extends "res://Scripts/StateMachine/State.gd"

func update(delta):
	if owner.motion: owner.motion = owner.motion.move_toward(Vector2.ZERO, 500 * delta)
