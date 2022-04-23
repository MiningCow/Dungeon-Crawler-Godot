extends "res://Scripts/Hitbox.gd"

export(int) var lifetime

func _ready():
	$Timer.wait_time = lifetime

func die():
	queue_free()
