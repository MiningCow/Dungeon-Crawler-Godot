extends StaticBody2D
class_name Npc

export(String, FILE, "*.json") var dialogue_path
onready var sprite = $Sprite
var dialogue

func _ready():
	dialogue = get_dialogue()
#	interaction_indicator.set_text(name)

func get_dialogue():
	var f = File.new()
	assert(f.file_exists(dialogue_path), "Dialogue file does not exist at path " + dialogue_path)
	f.open(dialogue_path, File.READ)
	var json = parse_json(f.get_as_text())
	f.close()

	assert(typeof(json) == TYPE_DICTIONARY)

	return json

func talk():
#	interaction_indicator.visible = false
	DialogueManager.begin_dialogue(dialogue, self)


func _on_Interactable_interaction(interactor):
#	print("Talked to ", name)
	talk()
