extends Area2D

export(Resource) var item

var effect: PackedScene

func _ready():
	if not item:
		item = ItemDatabase.get_item("undefined")

	$Sprite.texture = item.texture

	create_effect()

func set_item(new_item: Item) -> void :
	item = new_item

func pickup() -> void :
	GameManager.player.inventory.add_item(item.id, 1)
	queue_free()

func create_effect() -> void:
	if item.effect == Item.ItemEffect.BLUE_GLOW:
		effect = load("res://Scenes/Effects/BlueGlow.tscn")
		print("Effect = ", effect)

	if effect:
		print("Effect exists")
		var instance = effect.instance()
		add_child(instance)
