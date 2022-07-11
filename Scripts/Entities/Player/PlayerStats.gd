extends Stats

signal health_changed(using)

func set_health(value):
	.set_health(value)
	emit_signal("health_changed", health)
