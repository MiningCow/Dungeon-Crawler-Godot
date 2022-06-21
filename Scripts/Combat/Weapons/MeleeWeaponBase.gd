extends Weapon

func _ready():
	$Hitbox.damage = damage

func attack():
	can_attack = false
	sound.play()
	animation.play("attack")

func _on_AnimationPlayer_animation_finished(anim_name):
	timer.start()
