extends Node

signal player_initialized

var player

func _process(delta):
	if not player:
		initialize_player()
		return

func initialize_player():
	player = get_tree().get_root().get_node("/root/World/YSort/Player")
	if not player:
		print("Couldn't find player to initialize")
		return

	emit_signal("player_initialized", player)
	print("player initialized")

	#load inventory
