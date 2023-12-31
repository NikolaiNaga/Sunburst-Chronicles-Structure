extends RefCounted

class_name Job

var name : String
var level_requirement : int
var mana_cost : int
var exp_gain : int
var gold_gain : int

func do_job() -> void:
	PlayerClass.mana -= mana_cost
	PlayerClass.gold += gold_gain
	LevelingSystem.gain_experience(exp_gain)
	pass

func try_to_do_job() -> bool:
	if LevelingSystem.current_level >= level_requirement and PlayerClass.mana >= mana_cost:
		do_job()
		return true
	return false
