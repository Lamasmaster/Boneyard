//Brig Chief / Forensic Tech
/datum/job/sergeant_guard
	title = "Sergeant of the Guard"
	department_types = list(/decl/department/guard)
	total_positions = 1
	spawn_positions = 1
	selection_color = "#dd0000"
	supervisors = "the Captain of The Guard"
	economic_power = 5
	access = list()
	minimal_access = list()
	minimal_player_age = 7
	outfit_type = /decl/hierarchy/outfit/job/citizen
	guestbanned = 1
	min_skill = list(
		SKILL_LITERACY  = SKILL_ADEPT,
		SKILL_EVA       = SKILL_BASIC,
		SKILL_COMBAT    = SKILL_BASIC,
		SKILL_WEAPONS   = SKILL_ADEPT,
		SKILL_FORENSICS = SKILL_BASIC
	)
	max_skill = list(
		SKILL_COMBAT    = SKILL_MAX,
		SKILL_WEAPONS   = SKILL_MAX,
		SKILL_FORENSICS = SKILL_MAX
	)
	skill_points = 20
	software_on_spawn = list(
		/datum/computer_file/program/digitalwarrant,
		/datum/computer_file/program/camera_monitor
	)

//Regular Master-at-Arms
/datum/job/security_guard
	title = "Security Guard"
	department_types = list(/decl/department/guard)
	total_positions = 4
	spawn_positions = 4
	selection_color = "#dd0000"
	supervisors = "the Captain & Sergeant of The Guard"
	economic_power = 4
	access = list()
	minimal_access = list()
	minimal_player_age = 7
	outfit_type = /decl/hierarchy/outfit/job/citizen
	guestbanned = 1
	min_skill = list(
		SKILL_LITERACY  = SKILL_BASIC,
		SKILL_EVA       = SKILL_BASIC,
		SKILL_COMBAT    = SKILL_BASIC,
		SKILL_WEAPONS   = SKILL_ADEPT,
		SKILL_FORENSICS = SKILL_BASIC
	)
	max_skill = list(
		SKILL_COMBAT    = SKILL_MAX,
	    SKILL_WEAPONS   = SKILL_MAX,
	    SKILL_FORENSICS = SKILL_MAX
	)
	software_on_spawn = list(
		/datum/computer_file/program/digitalwarrant,
		/datum/computer_file/program/camera_monitor
	)
