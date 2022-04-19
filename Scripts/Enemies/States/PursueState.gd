extends "res://Scripts/StateMachine/PathfindMovingTarget.gd"

func update_path():
	if owner.target:
		set_path(owner.target.position)
