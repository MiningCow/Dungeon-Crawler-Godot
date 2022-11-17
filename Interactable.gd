extends Area2D
class_name Interactable

signal interaction(interactor)
onready var interaction_indicator = $InteractionIndicator

func interact(interactor): emit_signal("interaction", interactor)

func show_indicator(): interaction_indicator.show()
func hide_indicator(): interaction_indicator.hide()
