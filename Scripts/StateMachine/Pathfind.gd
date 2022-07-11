extends State

class_name Pathfind

onready var navigate = get_tree().get_root().get_node("World/Navigation2D")
export(int) var threshold = 10
export(int) var target_distance_goal
var reached_target = false
var path = []

func enter(last_state):
	update_path()

func update(delta):
	move_along_path(delta)

func move_along_path(delta):
	var speed = owner.speed

	if path.size():
		var distance_to_point = owner.global_position.distance_to(path[0])
		owner.motion = owner.position.direction_to(path[0]) * speed * delta
		if distance_to_point <= threshold:
			path.remove(0)

		reached_target = path.size() <= 1 && distance_to_point <= target_distance_goal

func set_path(target):
	path = navigate.get_simple_path(owner.global_position, target, true)
	path.remove(0)

func update_path():
	pass
