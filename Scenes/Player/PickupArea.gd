extends Area2D

var items_in_range := {}

func _on_PickupArea_area_entered(area):
	items_in_range[area] = area

func _on_PickupArea_area_exited(area):
	if items_in_range.has(area):
		items_in_range.erase(area)
