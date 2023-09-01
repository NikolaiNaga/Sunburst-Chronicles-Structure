extends Control

@export var _item_resources: Array[Item_Resource]

@onready var item_list: ItemList = $MarginContainer/PanelContainer/VBoxContainer/ItemList

var sword = preload("res://Sunburst/Scenes/Shop/Items/Sword.tres") as Item_Resource
var fire_sword = preload("res://Sunburst/Scenes/Shop/Items/FireSword.tres") as Item_Resource
var diamond_sword = preload("res://Sunburst/Scenes/Shop/Items/DiamondSword.tres") as Item_Resource

func _ready():
	item_list.add_item(sword.Item_Name, sword.Item_Image)
	item_list.add_item(diamond_sword.Item_Name, diamond_sword.Item_Image)
	item_list.add_item(fire_sword.Item_Name, fire_sword.Item_Image)

func _on_item_list_item_selected(index):
	var selected_item = _item_resources[index]
	$MarginContainer/ItemShowcase.updateItemDetails(selected_item)
	$MarginContainer/ItemShowcase.show()


