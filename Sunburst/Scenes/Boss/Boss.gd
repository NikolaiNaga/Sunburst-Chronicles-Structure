extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	Boss_Update()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_attack_boss_pressed():
	if PlayerClass.fortitude >= 5:
		Boss.deal_damage(Boss.get_damage_output())
		PlayerClass.fortitude -= 5
		LevelingSystem.gain_experience(3)
		Boss_Update()

func Boss_Update():
	%BossLevel.text = "Boss Level: " + str(Boss.current_boss_level)
	%BossHealth.text = "Health: " + str(Boss.damage_to_boss)
	%BossDamage.text = "Damage: " + str(Boss.get_damage_output())
