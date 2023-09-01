extends Node

class_name Player

# Player Name
var PlayerName: String = "NoName"

# Ressources
var max_mana: int = 10
var max_fortitude: int = 10
var mana: int = max_mana
var fortitude: int = max_fortitude

var mana_regen: int = 1
var fortitude_regen: int = 1

# Items & Currency
var gold: int = 0
var solardust: int = 0

var skill_points: int = 0

# Player
var bulwark: int = 0
var strength: int = 0

func get_pvp_defense():
	return 1 + (bulwark * 3) + strength

func get_pvp_attack():
	return 1 + (strength * 3) + bulwark

var additional_boss_damage: int = 0


