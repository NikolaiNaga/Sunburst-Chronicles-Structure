extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	Update_Profile_Labels()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	Update_Profile_Labels()
	Update_buttons()

func Update_Profile_Labels():
	%PlayerName.text = str(PlayerClass.PlayerName)
	%PlayerLevel.text = "Level: " + str(LevelingSystem.current_level)
	%PlayerExperience.text = "Experience: " + str(LevelingSystem.experience) + "/" + str(LevelingSystem.experience_required)
	%PlayerTotalExperience.text = "Total Experience: " + str(LevelingSystem.experience_total)
	
	%PlayerMana.text = "[color=#2474aa]Mana: [/color]" + str(PlayerClass.max_mana)
	%PlayerFortitude.text = "[color=#873600]Fortitude: [/color]" + str(PlayerClass.max_fortitude)
	
	%PlayerBulwark.text = "[color=#16A085]Bulwark: [/color]" + str(PlayerClass.bulwark)
	%PlayerStrength.text = "[color=#ff0000]Strength: [/color]" + str(PlayerClass.strength)
	
	%PlayerPVPd.text = "PVP Defense: " + str(PlayerClass.get_pvp_defense())
	%PlayerPVPa.text = "PVP Attack: " + str(PlayerClass.get_pvp_attack())
	
	%PlayerSkillPoints.text = "[color=#ff9900]Skill Points: " + str(PlayerClass.skill_points)
	%PlayerDamage.text = "[color=#FDFEFE]Boss Damage: " + str(Boss.get_damage_output())


func _on_add_mana_pressed():
	if PlayerClass.skill_points >= 1:
		PlayerClass.skill_points -= 1
		PlayerClass.max_mana += 1

func _on_add_fortitude_pressed():
	if PlayerClass.skill_points >= 1:
		PlayerClass.skill_points -= 1
		PlayerClass.max_fortitude += 1

func _on_add_bulwark_pressed():
	if PlayerClass.skill_points >= 1:
		PlayerClass.skill_points -= 1
		PlayerClass.bulwark += 1

func _on_add_strength_pressed():
	if PlayerClass.skill_points >= 1:
		PlayerClass.skill_points -= 1
		PlayerClass.strength += 1

func Update_buttons():
	if PlayerClass.skill_points == 0:
		$MarginContainer/MarginContainer/VBoxContainer/HBoxContainer4/AddStrength.hide()
		$MarginContainer/MarginContainer/VBoxContainer/HBoxContainer3/AddBulwark.hide()
		$MarginContainer/MarginContainer/VBoxContainer/HBoxContainer2/AddFortitude.hide()
		$MarginContainer/MarginContainer/VBoxContainer/HBoxContainer/AddMana.hide()
	else:
		$MarginContainer/MarginContainer/VBoxContainer/HBoxContainer4/AddStrength.show()
		$MarginContainer/MarginContainer/VBoxContainer/HBoxContainer3/AddBulwark.show()
		$MarginContainer/MarginContainer/VBoxContainer/HBoxContainer2/AddFortitude.show()
		$MarginContainer/MarginContainer/VBoxContainer/HBoxContainer/AddMana.show()
