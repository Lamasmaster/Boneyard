//Quartermaster / Deck Technician bundled together
/datum/job/quartermaster
	title = "Quartermaster"
	department_types = list(/decl/department/sup_maint)
	total_positions = 1
	spawn_positions = 1
	selection_color = "#bb9040"
	supervisors = "Vault-Tec regulations and the First Citizen"
	economic_power = 5
	access = list()
	minimal_access = list()
	minimal_player_age = 3
	ideal_character_age = 40
	outfit_type = /decl/hierarchy/outfit/job/citizen
	min_skill = list(
		SKILL_LITERACY = SKILL_ADEPT,
	    SKILL_FINANCE  = SKILL_BASIC,
	    SKILL_HAULING  = SKILL_BASIC,
	    SKILL_EVA      = SKILL_BASIC,
	    SKILL_PILOT    = SKILL_BASIC
	)
	max_skill = list(
		SKILL_PILOT    = SKILL_MAX
	)
	skill_points = 18
	software_on_spawn = list(
		/datum/computer_file/program/supply,
		/datum/computer_file/program/deck_management,
		/datum/computer_file/program/reports
	)

/datum/job/catering
	title = "Catering Worker"
	department_types = list(/decl/department/sup_maint)
	total_positions = 3
	spawn_positions = 3
	selection_color = "#bb9040"
	supervisors = "the Quartermaster"
	access = list()
	minimal_access = list()
	outfit_type = /decl/hierarchy/outfit/job/citizen
	min_skill = list(
		SKILL_LITERACY  = SKILL_ADEPT,
		SKILL_COOKING   = SKILL_ADEPT,
	    SKILL_BOTANY    = SKILL_BASIC,
	    SKILL_CHEMISTRY = SKILL_BASIC
	)

//Engineer
/datum/job/technician
	title = "Technician"
	department_types = list(/decl/department/sup_maint)
	total_positions = 4
	spawn_positions = 4
	selection_color = "#bb9040"
	supervisors = "the Quartermaster"
	access = list()
	minimal_access = list()
	outfit_type = /decl/hierarchy/outfit/job/citizen
	min_skill = list(
		SKILL_LITERACY = SKILL_ADEPT,
		SKILL_FINANCE  = SKILL_BASIC,
		SKILL_HAULING  = SKILL_BASIC
	)
	max_skill = list(
		SKILL_PILOT    = SKILL_MAX
	)
	software_on_spawn = list(
		/datum/computer_file/program/supply,
		/datum/computer_file/program/deck_management,
		/datum/computer_file/program/reports
	)
