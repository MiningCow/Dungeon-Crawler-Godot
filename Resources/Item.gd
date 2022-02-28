extends Resource
class_name Item

enum ItemEffect { NONE, BLUE_GLOW, GOLD_GLOW, SHINE }

export(String) var id = ""
export(String) var display_name = ""
export(String, MULTILINE) var description = ""
export(Texture) var texture = null
export(ItemEffect) var effect
#export(Array) var shape
