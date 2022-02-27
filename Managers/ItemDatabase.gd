extends Node

var items = Array()

func _ready():
	var directory = Directory.new()
	directory.open("res://Items/")
	directory.list_dir_begin()

	var filename = directory.get_next()
	while(filename):
		if not directory.current_is_dir():
			items.append(load("res://Items/%s" % filename))

		filename = directory.get_next()

func get_item(item_id: String):
	for item in items:
		if item.id == item_id:
			return item

	return null
