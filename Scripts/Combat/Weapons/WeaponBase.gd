extends Position2D

class_name Weapon

onready var timer = $Timer
onready var sound = $Sound
onready var animation = $AnimationPlayer

export(int) var damage
export(float) var cooldown

var attacking: bool
var do_look_at_mouse: bool = true
var can_attack: bool = true
var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize()
	timer.wait_time = cooldown
	get_parent().connect("player_is_attacking", self, "_on_Player_attack")
	look_at_mouse()

func _input(event):
	if event is InputEventMouseMotion:
		look_at_mouse()

func _physics_process(delta):
	if attacking && can_attack: attack()
#	DEBUG CAN_ATTACK
#	if can_attack:
#		$Sprite.self_modulate = Color.green
#	else:
#		$Sprite.self_modulate = Color.red

func attack():
	can_attack = false
	timer.start()

func _on_Timer_timeout():
	can_attack = true

func look_at_mouse():
	if do_look_at_mouse:
		var mouse = get_global_mouse_position()

		if mouse.x > global_position.x:
			scale.y = 1
		else:
			scale.y = -1

		look_at(mouse)

func _on_Player_attack(is_attacking):
	attacking = is_attacking
