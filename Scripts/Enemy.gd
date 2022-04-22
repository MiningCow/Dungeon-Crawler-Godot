extends "res://Scripts/Entity.gd"

onready var state_machine = $StateMachine
var target = null

func _physics_process(delta):
	state_machine.update(delta)
	main(delta)
	move()

func can_see_target():
	var space_state = get_world_2d().direct_space_state
	var raycast = space_state.intersect_ray(position, target.position, [self], collision_mask)

	return raycast.collider == target

func main(delta):
	pass

func _on_VisionRange_body_entered(body):
	if target: return
	target = body

func _on_VisionRange_body_exited(body):
	if body == target:
		target = null
