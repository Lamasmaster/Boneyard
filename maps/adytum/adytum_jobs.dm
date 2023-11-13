/datum/map/adytum
	default_job_type = /datum/job/resident
	default_department_type = /decl/department/resident
	id_hud_icons = 'maps/adytum/hud.dmi'

/datum/job/resident
	title = "Resident"
	total_positions = -1
	spawn_positions = -1
	supervisors = "Mayor"
	description = "You are a resident of Adytum, abide the law and try to survive."
	economic_power = 1
	access = list()
	minimal_access = list()
	outfit_type = /decl/hierarchy/outfit/job/resident
	department_types = list(/decl/department/resident)

/* Reminder to shove this later into it's own file so it doesn't clutter jobs
	also replace the uniform with generic waster outfit.*/

/decl/hierarchy/outfit/job/resident
	name = "Job - Resident"
	uniform = /obj/item/clothing/under/vault_jumpsuit
	shoes = /obj/item/clothing/shoes/jackboots
