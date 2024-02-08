/*
Most of the Vault City without Vault 8.
An urban map which is meant to be the one actually used.
*/

#if !defined(USING_MAP_DATUM)

//Modifications

	#include "../../mods/content/boneyard/_boneyard.dme"

	#define USING_MAP_DATUM /datum/map/vaultcity

	#include "vaultcity_areas.dm"
	#include "vaultcity_define.dm"
	#include "vaultcity_departments.dm"
	#include "vaultcity_jobs.dm"
	#include "vaultcity_unit_testing.dm"

	#include "jobs\citizen.dm"
	#include "jobs\council.dm"
	#include "jobs\scimed.dm"
	#include "jobs\security.dm"
	#include "jobs\supply_maintenence.dm"

	#include "vaultcity-1.dmm"

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring Testing Site

#endif
