extends RefCounted

class_name Boss

# Boss Variables
static var current_boss_level = 1
static var damage_to_boss_required = get_health_required(current_boss_level +1)
static var damage_to_boss = 12
static var damage_to_boss_total = 0

# Damage Calculations
static var level_damage_contribution: float = 0.0

static func get_damage_output():
	return PlayerClass.bulwark + PlayerClass.strength + 1 + (LevelingSystem.current_level * level_damage_contribution) + PlayerClass.additional_boss_damage

# Boss System
static func get_health_required(level):
	return round(pow(level, 1.7) + level + 7)

static func deal_damage(amount):
	damage_to_boss_total += amount
	damage_to_boss -= amount
	if damage_to_boss <= 0:
		boss_level_up()

static func boss_level_up():
	current_boss_level +=1
	damage_to_boss_required = get_health_required(current_boss_level + 1)
	damage_to_boss = damage_to_boss_required
	PlayerClass.solardust += 1
