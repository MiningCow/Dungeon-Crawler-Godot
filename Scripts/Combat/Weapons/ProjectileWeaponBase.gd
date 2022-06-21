extends Weapon

onready var projectile_start = $Sprite/ProjectileStart

export(PackedScene) var projectile
export(float) var spread

func attack():
	sound.play()
#	create bullet
	var new_projectile = projectile.instance()
#	set props
	var direction = projectile_start.global_position.direction_to(get_global_mouse_position())
	if spread: direction = direction.rotated(rng.randf_range(-spread, spread))
	new_projectile.direction = direction
	new_projectile.position = projectile_start.global_position
#	new_projectile.damage += damage
	get_parent().get_node("Projectiles").add_child(new_projectile)
	.attack()
