extends KinematicBody2D

const MAX_SPEED = 500
const ACCELERATION = 4000
const FRICTION = 4000
var motion: Vector2 = Vector2.ZERO

var inventory_resource = preload("res://Resources/Inventory.gd")
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

	if Input.is_action_just_pressed("interact"):
		var items_in_range = $PickupArea.items_in_range
		if items_in_range.size():
			items_in_range[items_in_range.values()[0]].pickup()

	if Input.is_action_just_pressed("drop"):
		var inventory = GameManager.player.inventory
		var item = inventory.get_item(0)

		if inventory.get_items() :
			inventory.remove_item(0)

			var ground_item_scene = load("res://Scenes/GroundItem/GroundItem.tscn")
			var ground_item = ground_item_scene.instance()
			ground_item.position = position
			ground_item.item = item
			get_tree().get_root().get_node("/root/World/").add_child(ground_item)



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