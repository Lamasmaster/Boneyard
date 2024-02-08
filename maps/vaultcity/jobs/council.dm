//Captain
/datum/job/first_citizen
	title = "First Citizen"
	head_position = 1
	department_types = list(/decl/department/council)
	total_positions = 1
	spawn_positions = 1
	supervisors = "Vault-Tec regulations and your conscience."
	selection_color = "#1d1d4f"
	req_admin_notify = 1
	access = list() 			//See get_access()
	minimal_access = list() 	//See get_access()
	minimal_player_age = 14
	economic_power = 20
	ideal_character_age = 70
	outfit_type = /decl/hierarchy/outfit/job/citizen //Placeholder
	guestbanned = 1
	must_fill = 1
	not_random_selectable = 1
	min_skill = list(
		SKILL_LITERACY    = SKILL_ADEPT,
		SKILL_SCIENCE     = SKILL_ADEPT,
		SKILL_PILOT       = SKILL_ADEPT
	)
	max_skill = list(
		SKILL_PILOT       = SKILL_MAX,
		SKILL_SCIENCE     = SKILL_MAX
	)
	skill_points = 30
	software_on_spawn = list(
		/datum/computer_file/program/comm,
		/datum/computer_file/program/card_mod,
		/datum/computer_file/program/camera_monitor,
		/datum/computer_file/program/reports
	)

/datum/job/first_citizen/equip_job(var/mob/living/carbon/human/H)
	. = ..()
	if(.)
		H.implant_loyalty(src)

/datum/job/first_citizen/get_access()
	return get_all_station_access()

//Chief Research Officer
/datum/job/research_overseer
	title = "Research Overseer"
	head_position = 1
	department_types = list(/decl/department/council)
	total_positions = 1
	spawn_positions = 1
	supervisors = "Vault-Tec regulations and First Citizen"
	selection_color = "#1d3b4f"
	req_admin_notify = 1
	economic_power = 15
	access = list()
	minimal_access = list()
	minimal_player_age = 14
	ideal_character_age = 50
	guestbanned = 1
	must_fill = 1
	not_random_selectable = 1
	outfit_type = /decl/hierarchy/outfit/job/citizen //Placeholder
	min_skill = list(
		SKILL_LITERACY = SKILL_ADEPT,
		SKILL_COMPUTER = SKILL_BASIC,
		SKILL_FINANCE  = SKILL_ADEPT,
		SKILL_BOTANY   = SKILL_BASIC,
		SKILL_ANATOMY  = SKILL_BASIC,
		SKILL_DEVICES  = SKILL_BASIC,
		SKILL_SCIENCE  = SKILL_ADEPT)
	max_skill = list(
		SKILL_ANATOMY  = SKILL_MAX,
		SKILL_DEVICES  = SKILL_MAX,
		SKILL_SCIENCE  = SKILL_MAX
	)
	skill_points = 30
	event_categories = list(ASSIGNMENT_SCIENTIST)

/datum/job/research_overseer/equip_job(var/mob/living/carbon/human/H)
	. = ..()
	if(.)
		H.implant_loyalty(H)

//Chief of Security
/datum/job/captain_guard
	title = "Captain of the Guard"
	head_position = 1
	department_types = list(/decl/department/council)
	total_positions = 1
	spawn_positions = 1
	supervisors = "Vault-Tec regulations and the First Citizen"
	selection_color = "#1d3b4f"
	req_admin_notify = 1
	economic_power = 10
	access = list()
	minimal_access = list()
	minimal_player_age = 14
	guestbanned = 1
	must_fill = 1
	not_random_selectable = 1
	outfit_type = /decl/hierarchy/outfit/job/citizen //Placeholder
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
	skill_points = 28
	software_on_spawn = list(
		/datum/computer_file/program/comm,
		/datum/computer_file/program/digitalwarrant,
		/datum/computer_file/program/camera_monitor,
		/datum/computer_file/program/reports
	)
	event_categories = list(ASSIGNMENT_SECURITY)

/datum/job/captain_guard/equip_job(var/mob/living/carbon/human/H)
	. = ..()
	if(.)
		H.implant_loyalty(H)
