extends Pathfind

class_name PathfindEntity

func enter(last_state):
	add_to_group("pathfind")
	.enter(last_state)

func exit():
	remove_from_group("pathfind")
