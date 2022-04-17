extends "res://Scripts/StateMachine/StateMachine.gd"

onready var pursue = $Pursue
onready var stop = $Stop

func _ready():
	states_map = {
		"pursue": pursue,
		"stop": stop
	}

func state_logic():
	match current_state:
		stop:
			if owner.target && owner.can_see_target(): set_state(pursue)
		pursue:
			if !owner.target: set_state(stop)
