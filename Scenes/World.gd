extends Node2D

func _on_NavigationTimer_timeout():
	get_tree().call_group("pathfind", "update_path")
