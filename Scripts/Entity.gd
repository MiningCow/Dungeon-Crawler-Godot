extends KinematicBody2D

export(int) var speed
var motion: Vector2 = Vector2.ZERO

func move():
	motion = move_and_slide(motion)

func _on_Hurtbox_area_entered(area):
	damage()

func damage():
	print("%s damaged!" % name)
