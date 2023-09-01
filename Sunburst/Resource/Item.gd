extends Resource
class_name Item_Resource

@export var Item_Name: String
@export var Item_Image: Texture2D
@export var Item_Cost: int

@export var Item_Bulwark: int
@export var Item_Strength: int
@export var Item_PVPdef: int
@export var Item_PVPatt: int

@export var Item_BossDamage: int

@export var Item_CurrentQuanitiy: int
@export var Item_MaxQuantity: int

func buy_item():
	if PlayerClass.gold >= Item_Cost and Item_CurrentQuanitiy < Item_MaxQuantity:
		PlayerClass.gold -= Item_Cost
		PlayerClass.additional_boss_damage += Item_BossDamage
		PlayerClass.bulwark += Item_Bulwark
		PlayerClass.strength += Item_Strength
		PlayerClass.pvp_attack += Item_PVPatt
		PlayerClass.pvp_defense += Item_PVPdef
		Item_MaxQuantity += 1
