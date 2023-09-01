extends Control

func updateItemDetails(selected_item: Item_Resource):
	$PanelContainer/VBoxContainer/ItemName.text = selected_item.Item_Name
	$PanelContainer/VBoxContainer/HBoxContainer/ItemImage.texture = selected_item.Item_Image
	$PanelContainer/VBoxContainer/HBoxContainer/ItemCost.text = "Gold: " + str(selected_item.Item_Cost)
	$PanelContainer/VBoxContainer/HBoxContainer2/ItemBulwark.text = "Bulwark: " + str(selected_item.Item_Bulwark)
	$PanelContainer/VBoxContainer/HBoxContainer2/ItemStrength.text = "Strength: " + str(selected_item.Item_Strength)
	$PanelContainer/VBoxContainer/HBoxContainer3/ItemPVPatt.text = "PVP Attack: " + str(selected_item.Item_PVPatt)
	$PanelContainer/VBoxContainer/HBoxContainer3/ItemPVPatt2.text = "PVP Defense: " + str(selected_item.Item_PVPdef)
	$PanelContainer/VBoxContainer/HBoxContainer4/ItemBossDamage.text = "Boss Damage: " + str(selected_item.Item_BossDamage)

func _on_close_pressed():
	$".".hide()

func _on_buy_pressed():
	pass
