extends "res://Scripts/StateMachine/State.gd"

func update(delta):
	var target_direction: Vector2 = owner.target.position - owner.position
	owner.motion += target_direction
	owner.motion = owner.motion.normalized() * owner.speed * delta

func enter(last_state):
	pass

func exit():
	pass
