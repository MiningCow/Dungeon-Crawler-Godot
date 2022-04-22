extends KinematicBody2D

export(int) var speed
var motion: Vector2 = Vector2.ZERO

func move():
	motion = move_and_slide(motion)
