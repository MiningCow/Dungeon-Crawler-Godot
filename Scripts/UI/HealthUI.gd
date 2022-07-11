extends Control

onready var hearts = $Hearts
onready var heartContainers = $HeartContainers
var player

func _ready():
	GameManager.connect("player_initialized", self, "on_Player_initialized")

func on_Player_initialized(player):
	player = player
	player.stats.connect("health_changed", self, "on_Health_changed")
	player.stats.connect("stats_changed", self, "on_Stats_changed")
	heartContainers.rect_size.x = player.stats.max_health * 32
	hearts.rect_size.x = player.stats.health * 32

func on_Health_changed(health):
	hearts.rect_size.x = health * 32

func on_Stats_changed():
	heartContainers.rect_size.x = player.stats.max_health * 32

