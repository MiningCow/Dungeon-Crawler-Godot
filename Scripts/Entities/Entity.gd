extends KinematicBody2D

class_name Entity

onready var stats = $Stats
onready var health: int = stats.max_health setget set_health
onready var speed: int = stats.speed setget ,get_speed
func get_speed(): return stats.speed

var motion: Vector2 = Vector2.ZERO

func move():
	motion = move_and_slide(motion)

func _on_Hurtbox_area_entered(hitbox):
	take_damage(hitbox.damage)
	print("%s damaged!" % name)

func set_health(value):
	if value != health:
		health = clamp(value, 0, stats.max_health)
	else: health = 0

func take_damage(damage):
	$Sound.play()
	self.health -= damage
	if health == 0:
		die()

func die():
	queue_free()
