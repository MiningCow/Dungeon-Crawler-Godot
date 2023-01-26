extends Stats

signal health_changed(health)
signal stats_changed()

func set_health(value):
	.set_health(value)
	emit_signal("health_changed", health)

func set_max_health(value):
	.set_max_health(value)
	emit_signal("stats_changed")
