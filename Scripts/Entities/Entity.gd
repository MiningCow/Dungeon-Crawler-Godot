extends KinematicBody2D

class_name Entity

onready var stats = $Stats
onready var health setget set_health, get_health
onready var speed: int = stats.speed setget set_speed, get_speed

var motion: Vector2 = Vector2.ZERO

func move():
	motion = move_and_slide(motion)

func _on_Hurtbox_area_entered(hitbox):
	take_damage(hitbox.damage)

func set_health(value): stats.health = value
func get_health(): return stats.health

func set_speed(value): stats.speed = value
func get_speed(): return stats.speed

func take_damage(damage):
	$Sound.play()
	self.health -= damage
	if self.health == 0: die()

func die():
	queue_free()
