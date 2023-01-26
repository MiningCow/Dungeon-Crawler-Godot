extends Node

class_name Stats

export(int) var speed
export(int) var max_health setget set_max_health
export(int) var health: int = max_health setget set_health

func set_max_health(value):
	max_health = value

func set_health(value):
	if value != health:
		health = clamp(value, 0, max_health)
	else: health = 0
