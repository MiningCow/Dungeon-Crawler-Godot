extends Interactable

export(Resource) var item

func _ready():
	if not item:
		item = ItemDatabase.get_item("undefined")

	$Sprite.texture = item.texture


func set_item(new_item: Item) -> void:
	item = new_item


func pickup() -> void :
	var player = GameManager.player
	player.inventory.add_item(item.id, 1)

	queue_free()


func interact(interactor): pickup()
