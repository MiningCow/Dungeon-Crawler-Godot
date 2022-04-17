extends Node
class_name StateMachine

export(NodePath) var initial_state
var current_state
var previous_state
var states_map

func update(delta):
	state_logic()
	current_state.update(delta)

func _ready():
	if initial_state:
		set_state(get_node(initial_state))
	else:
		set_state(get_child(0))
	pass

func state_logic():
	pass

func set_state(new_state):
	if current_state:
		previous_state = current_state
		current_state.exit()

	current_state = new_state
	current_state.enter(previous_state)
