extends KinematicBody2D

const MAX_SPEED = 500
const ACCELERATION = 4000
const FRICTION = 4000
var motion: Vector2 = Vector2.ZERO

var inventory_resource = preload("res://Inventory.gd")
var inventory: Inventory = inventory_resource.new()

#func _ready():
#	pass
#	pseudo code
#	inventory.board = config.player inventory board shape

func _physics_process(delta):
	var input_direction: Vector2 = get_input_direction();
	if input_direction == Vector2.ZERO:
		apply_friction(ACCELERATION * delta)
	else:
		move(input_direction * ACCELERATION * delta)
	motion = move_and_slide(motion)

	if Input.is_action_just_pressed("open_inventory"):
		print("INVENTORY")
		for item in inventory.get_items():
			print(item.display_name)

func get_input_direction():
	var input : Vector2 = Vector2()
	input.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	input.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	return input.normalized()

func apply_friction(amount):
	motion = motion.move_toward(Vector2.ZERO, amount)

func move(acceleration):
	motion += acceleration
	motion = motion.clamped(MAX_SPEED)

#func _process(delta):
#	pass
