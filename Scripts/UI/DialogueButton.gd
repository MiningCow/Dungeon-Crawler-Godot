extends TextureButton

onready var label = $Label
export(int) var id

func set_text(text):
	label.bbcode_text = "[center]" + text + "[/center]"
