extends Area2D

export(Resource) var item

var effect: PackedScene

func _ready():
	if not item:
		item = ItemDatabase.get_item("undefined")

	$Sprite.texture = item.texture

#	create_effect()

func set_item(new_item: Item) -> void :
	item = new_item

func pickup() -> void :
	var player = GameManager.player
	player.inventory.add_item(item.id, 1)

	queue_free()

# For effects they can just be a packed scene in the resource
