extends CanvasLayer

func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	%Mana.text = str(Player.mana) + "/" + str(Player.max_mana)
	%Fortitude.text = str(Player.fortitude) + "/" + str(Player.max_fortitude)
	%CurrentLevel.text = "LVL: " + str(LevelingSystem.current_level)
	%Gold.text = str(Player.gold)
	%CurrentLevel2.text = "  LVL: " + str(LevelingSystem.current_level)
	%Experience.text = "XP: " + str(LevelingSystem.experience) + "/" + str(LevelingSystem.experience_required)
	
	UpdateProgressBar()

func _on_mana_icon_pressed():
	$Main/Alignement/Space/Panel/JobControl.show()
	$Main/Alignement/Space/Panel/ProfileControl.hide()
	$Main/Alignement/Space/Panel/HomeControl.hide()
	$Main/Alignement/Space/Panel/BossControl.hide()

func _on_fortitude_timer_timeout():
	Player.fortitude = clamp(Player.fortitude + Player.fortitude_regen, 0, Player.max_fortitude)

func _on_mana_timer_timeout():
	Player.mana = clamp(Player.mana + Player.mana_regen, 0, Player.max_mana)

func _on_home_button_pressed():
	$Main/Alignement/Space/Panel/HomeControl.show()
	$Main/Alignement/Space/Panel/ProfileControl.hide()
	$Main/Alignement/Space/Panel/JobControl.hide()
	$Main/Alignement/Space/Panel/BossControl.hide()

func UpdateProgressBar():
	%ProgressBar.value = (LevelingSystem.experience / LevelingSystem.experience_required) * 100

func _on_profile_button_pressed():
	$Main/Alignement/Space/Panel/ProfileControl.show()
	$Main/Alignement/Space/Panel/JobControl.hide()
	$Main/Alignement/Space/Panel/HomeControl.hide()
	$Main/Alignement/Space/Panel/BossControl.hide()


func _on_texture_rect_pressed():
	$Main/Alignement/Space/Panel/BossControl.show()
	$Main/Alignement/Space/Panel/ProfileControl.hide()
	$Main/Alignement/Space/Panel/JobControl.hide()
	$Main/Alignement/Space/Panel/HomeControl.hide()
