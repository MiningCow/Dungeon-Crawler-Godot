extends Entity

var ground_item_scene = preload("res://Scenes/GroundItem.tscn")
var inventory_resource = preload("res://Resources/Inventory.gd")
var inventory: Inventory = inventory_resource.new()
var weapon = get_node_or_null("Weapon")

onready var hand_position = $HandPosition
#func _ready():
#	pseudo code
#	inventory.board = config.player inventory board shape

signal player_is_attacking(using)

func _physics_process(delta):
	var input_direction: Vector2 = get_input_direction();

	if input_direction != Vector2.ZERO:
		motion = input_direction * self.speed * delta
	else:
		motion = Vector2.ZERO
	move()

	if Input.is_action_just_pressed("open_inventory"):
		print("INVENTORY")
		for item in inventory.get_items():
			print(item.display_name)

	if Input.is_action_just_pressed("interact"):
		var items_in_range = $PickupArea.items_in_range
		if items_in_range.size():
			items_in_range[items_in_range.values()[0]].pickup()

	if Input.is_action_just_pressed("drop"):
		var item = inventory.get_item(0)

		if inventory.get_items() :
			inventory.remove_item(0)

			var ground_item = ground_item_scene.instance()
			ground_item.position = position
			ground_item.item = item
			get_tree().get_root().get_node("/root/World/").add_child(ground_item)

	if Input.is_action_just_pressed("hotbar_1"): equip(inventory.get_item(0))

func get_input_direction():
	var input : Vector2 = Vector2()
	input.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	input.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	return input.normalized()

func equip(item):
	if !(item is WeaponItem): return

	var old_weapon = get_node_or_null("Weapon")
	if old_weapon:
		old_weapon.free()
	var new_weapon = item.weapon.instance()
	new_weapon.position = hand_position.position
	add_child(new_weapon)

func die(): #temp player death
	print("player died!")
	health = stats.max_health

func _input(event):
	if event.is_action_pressed("attack"):  emit_signal("player_is_attacking", true)
	if event.is_action_released("attack"): emit_signal("player_is_attacking", false)
#	if event.is_action_pressed("attack"):  is_attacking = true
#	if event.is_action_released("attack"): is_attacking = false

