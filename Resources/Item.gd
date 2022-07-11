extends Resource
class_name Item

#enum ItemType { NONE, WEAPON, FOOD }

export(String) var id = ""
export(String) var display_name = ""
export(String, MULTILINE) var description = ""
export(Texture) var texture = null
#export(ItemType) var item_type
#export(Array) var shape
