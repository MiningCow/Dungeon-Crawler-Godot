extends KinematicBody2D

onready var state_machine = $StateMachine
export(int) var speed = 10000
var target
var motion: Vector2 = Vector2.ZERO

func _physics_process(delta):
	state_machine.update(delta)
	move_and_slide(motion)

func can_see_target():
	var space_state = get_world_2d().direct_space_state
	var raycast = space_state.intersect_ray(position, target.position, [self], collision_mask)

	if (raycast.collider == target):
		print("true")
		return true

	return false

func _on_VisionRange_body_entered(body):
	if target: return
	target = body

func _on_VisionRange_body_exited(body):
	if body == target:
		target = null
