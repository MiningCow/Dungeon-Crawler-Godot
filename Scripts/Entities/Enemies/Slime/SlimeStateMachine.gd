extends StateMachine

onready var pursue = $Pursue
onready var stop = $Stop

func state_logic():
	match current_state:
		stop:
			if owner.target && owner.can_see_target():
				set_state(pursue)
		pursue:
#			if pursue.reached_target: print("attack state")
			if !owner.target:
				set_state(stop)
