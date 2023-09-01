extends Node

class_name LevelingSystem

# Level System Data
static var current_level: int = 1
static var experience: int = 0
static var experience_total: int = 0
static var experience_required = get_required_experience(current_level + 1)

# Experience / Level System
static func get_required_experience(level):
	return round(pow(level, 1.2) + level + 4)

static func gain_experience(amount):
	experience_total += amount
	experience += amount
	while experience >= experience_required:
		experience -= experience_required
		level_up()

static func level_up():
	current_level += 1
	experience_required = get_required_experience(current_level + 1)
	PlayerClass.skill_points += 3
	PlayerClass.mana = PlayerClass.max_mana
	PlayerClass.fortitude = PlayerClass.max_fortitude

