extends CanvasLayer

func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	%Mana.text = str(PlayerClass.mana) + "/" + str(PlayerClass.max_mana)
	%Fortitude.text = str(PlayerClass.fortitude) + "/" + str(PlayerClass.max_fortitude)
	%CurrentLevel.text = "LVL: " + str(LevelingSystem.current_level)
	%Gold.text = str(PlayerClass.gold)
	%CurrentLevel2.text = "  LVL: " + str(LevelingSystem.current_level)
	%Experience.text = "XP: " + str(LevelingSystem.experience) + "/" + str(LevelingSystem.experience_required)
	%SolarDust.text = str(PlayerClass.solardust)
	
	update_levelup()
	UpdateProgressBar()
	Skill_Points_Image()

func _on_mana_icon_pressed():
	%JobControl.show()
	$Main/Alignement/Space/Panel/ProfileControl.hide()
	$Main/Alignement/Space/Panel/HomeControl.hide()
	$Main/Alignement/Space/Panel/BossControl.hide()
	$Main/Alignement/Space/Panel/Shop.hide()

func _on_fortitude_timer_timeout():
	PlayerClass.fortitude = clamp(PlayerClass.fortitude + PlayerClass.fortitude_regen, 0, PlayerClass.max_fortitude)

func _on_mana_timer_timeout():
	PlayerClass.mana = clamp(PlayerClass.mana + PlayerClass.mana_regen, 0, PlayerClass.max_mana)

func _on_home_button_pressed():
	$Main/Alignement/Space/Panel/HomeControl.show()
	$Main/Alignement/Space/Panel/ProfileControl.hide()
	%JobControl.hide()
	$Main/Alignement/Space/Panel/BossControl.hide()
	$Main/Alignement/Space/Panel/Shop.hide()

func UpdateProgressBar():
	%ProgressBar.value = (LevelingSystem.experience / LevelingSystem.experience_required) * 100

func _on_profile_button_pressed():
	$Main/Alignement/Space/Panel/ProfileControl.show()
	%JobControl.hide()
	$Main/Alignement/Space/Panel/HomeControl.hide()
	$Main/Alignement/Space/Panel/BossControl.hide()
	$Main/Alignement/Space/Panel/Shop.hide()


func _on_texture_rect_pressed():
	$Main/Alignement/Space/Panel/BossControl.show()
	$Main/Alignement/Space/Panel/ProfileControl.hide()
	%JobControl.hide()
	$Main/Alignement/Space/Panel/HomeControl.hide()
	$Main/Alignement/Space/Panel/Shop.hide()

func Skill_Points_Image():
	if PlayerClass.skill_points >= 1:
		%SkillPointsImage.show()
		%SkillPointsAmount.text = str(PlayerClass.skill_points)
	else:
		%SkillPointsImage.hide()

func _on_skill_points_image_pressed():
	$Main/Alignement/Space/Panel/ProfileControl.show()
	$Main/Alignement/Space/Panel/BossControl.hide()
	%JobControl.hide()
	$Main/Alignement/Space/Panel/HomeControl.hide()
	$Main/Alignement/Space/Panel/Shop.hide()

func _on_shop_button_pressed():
	$Main/Alignement/Space/Panel/Shop.show()
	$Main/Alignement/Space/Panel/BossControl.hide()
	$Main/Alignement/Space/Panel/ProfileControl.hide()
	%JobControl.hide()
	$Main/Alignement/Space/Panel/HomeControl.hide()

func update_levelup():
	%LevelUp.text = "You are now level " + str(LevelingSystem.current_level) + "!"
	%LevelUp.text += "+3 skill points!"
