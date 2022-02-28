extends Resource
class_name Inventory

#signal inventory_updated(indexes)
signal inventory_updated

export(Array, Resource) var _items = [] setget set_items, get_items
#export(Array) var board = [] setget set_board_shape, get_board_shape

func set_items(items: Array):
	_items = items
	emit_signal("inventory_updated", self)

func get_items():
	return _items

func get_item(index: int):
	if _items:
		return _items[index]
	else:
		return null

func add_item(new_item_id: String, quantity: int):
	if quantity < 1:
		print("Adding less than 1 items to inventory")
		return

	var new_item = ItemDatabase.get_item(new_item_id)

	if not new_item:
		print("Couldn't find item ", new_item_id)
		return

	for i in quantity:
		_items.append(new_item)

func remove_item(index: int) -> void :
	_items.erase(_items[index])

#func place_item(placePosition: Vector2, item: Item) -> void : # not sure if it should be a void or what should be returned if it fails to place the item
#	pass

#func can_place(placePosition: Vector2, item: Item) -> bool :
#	return true

#func set_shape(shape: Array) -> void :
#	pass


