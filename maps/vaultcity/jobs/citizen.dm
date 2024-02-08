//Assistant
/datum/job/citizen
	title = "Citizen"
	total_positions = -1
	spawn_positions = -1
	supervisors = "Vault-Tec regulations and the First Citizen"
	description = "You are a resident of Vault 8, try to assist wherever you can but make sure to abide the law."
	economic_power = 1
	access = list()
	minimal_access = list()
	outfit_type = /decl/hierarchy/outfit/job/citizen
	department_types = list(/decl/department/citizen)

/* Keeping this here for sake of having less files even if it makes it harder to look through.*/

/decl/hierarchy/outfit/job/citizen
	name = "Job - Citizen"
	uniform = /obj/item/clothing/under/vault_jumpsuit
	shoes = /obj/item/clothing/shoes/jackboots
