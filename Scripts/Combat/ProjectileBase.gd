extends Sprite

export(Vector2) var direction = Vector2.ZERO
export(int) var speed

func _ready():
	rotation = direction.angle()

func _physics_process(delta):
	position += direction * speed * delta

func _on_Hitbox_area_entered(area):
#	if area is Hurtbox: area.damage()
	die()

func _on_Hitbox_body_entered(body):
	die()

func die():
	queue_free()
