//Scientist
/datum/job/researcher
	title = "Researcher"
	department_types = list(/decl/department/sci_med)
	total_positions = 6
	spawn_positions = 4
	supervisors = "the Research Overseer"
	selection_color = "#013d3b"
	economic_power = 7
	access = list()
	minimal_access = list()
	alt_titles = list()
	minimal_player_age = 7
	outfit_type = /decl/hierarchy/outfit/job/citizen
	min_skill = list(
		SKILL_LITERACY = SKILL_ADEPT,
		SKILL_COMPUTER = SKILL_BASIC,
		SKILL_DEVICES  = SKILL_BASIC,
		SKILL_SCIENCE  = SKILL_ADEPT
	)
	max_skill = list(
		SKILL_ANATOMY  = SKILL_MAX,
	    SKILL_DEVICES  = SKILL_MAX,
	    SKILL_SCIENCE  = SKILL_MAX
	)
	skill_points = 20

//Doctor
/datum/job/doctor
	title = "Medical Doctor"
	department_types = list(/decl/department/sci_med)
	minimal_player_age = 3
	total_positions = 5
	spawn_positions = 3
	supervisors = "the Research Overseer"
	selection_color = "#013d3b"
	economic_power = 7
	access = list()
	minimal_access = list()
	outfit_type = /decl/hierarchy/outfit/job/citizen
	min_skill = list(
		SKILL_LITERACY = SKILL_ADEPT,
		SKILL_EVA      = SKILL_BASIC,
		SKILL_MEDICAL  = SKILL_BASIC,
		SKILL_ANATOMY  = SKILL_BASIC
	)
	max_skill = list(
		SKILL_MEDICAL   = SKILL_MAX,
		SKILL_CHEMISTRY = SKILL_MAX
	)
	software_on_spawn = list(
		/datum/computer_file/program/suit_sensors,
		/datum/computer_file/program/camera_monitor
	)
	skill_points = 22
