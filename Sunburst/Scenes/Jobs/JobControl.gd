extends Control

var JobPressed : Job

func _on_button_pressed():
	%ZoneControl.show()

func _ready():
	Set_Buttons()

func Set_Buttons():
	await get_tree().create_timer(0.1).timeout
	var idx: int = 0
	for job_name in Game.jobs:
		var button : TextureButton = %Zone.get_child(idx)
		idx += 1
		var job : Job = Game.jobs[job_name]
		button.connect("pressed", on_job_pressed.bind(job))

func on_job_pressed(job : Job):
	JobPressed = job
	$JobPopup.show()
	$JobPopup/VBoxContainer/JobName.text = job.name
	%ManaCost.text = "Mana: " + str(job.mana_cost)
	%ExpGain.text = "Exp: " + str(job.exp_gain)
	%GoldGain.text = "Gold: " + str(job.gold_gain)
	%LevelRequirement.text = "Level Requirement: " + str(job.level_requirement)

func _on_back_pressed():
	$JobPopup.hide()
	JobPressed = null

func _on_do_job_pressed():
	if JobPressed.try_to_do_job() == true:
		print("Doing Job")

