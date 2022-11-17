extends Area2D

var interactions_in_range := {}
var player
var closest_interaction

func _on_PickupArea_area_entered(area):
	interactions_in_range[area] = area
#	if interactions_in_range.size() < 1: area.show_indicator()
	find_closest_interaction()

func _on_PickupArea_area_exited(area):
	area.hide_indicator()
	if interactions_in_range.has(area):
		interactions_in_range.erase(area)

func find_closest_interaction() -> void:
#	if interactions_in_range.size() <= 1: return

	for interaction in interactions_in_range.values(): interaction.hide_indicator()

	closest_interaction = get_closest_node(interactions_in_range)
	if closest_interaction:
		closest_interaction.show_indicator()

func attempt_interaction() -> void:
	closest_interaction = get_closest_node(interactions_in_range)
	if closest_interaction:
		closest_interaction.interact(player)
#		get_closest_node(interactions_in_range).interact(player)

func get_closest_node(nodes):
	if !nodes.size(): return

	var closest_node = nodes[nodes.keys()[0]]
	for node in nodes.values():
		var distance = node.global_position.distance_to(global_position)
		if distance < closest_node.global_position.distance_to(global_position): closest_node = node
	return closest_node
