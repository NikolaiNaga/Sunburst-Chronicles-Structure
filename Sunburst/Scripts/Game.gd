extends Node

class_name Game

const JOBS_FILE_PATH = "res://Sunburst/Data/Jobs.json"
var jobs_data
static var jobs : Dictionary = {}

func _ready() -> void:
	load_json()
	for job_name in jobs_data:
		var job_data = jobs_data[job_name]
		var job := Job.new()
		job.name = job_name
		job.exp_gain = job_data.exp_gain
		job.level_requirement = job_data.level
		job.gold_gain = job_data.gold_gain
		job.mana_cost = job_data.mana_cost
		jobs[job_name] = job
 
func load_json():
	var json_text = FileAccess.get_file_as_string(JOBS_FILE_PATH)
	jobs_data = JSON.parse_string(json_text)

