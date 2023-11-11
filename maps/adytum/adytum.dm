/*
Part of Angel's Boneyard / Los Angeles
An urban map that has only the bare essentials, a low pop map if you will
*/

#if !defined(USING_MAP_DATUM)

//Modifications

	#include "../../mods/content/boneyard/_boneyard.dme"

	#define USING_MAP_DATUM /datum/map/adytum

	#include "adytum_areas.dm"
	#include "adytum_define.dm"
	#include "adytum_departments.dm"
	#include "adytum_jobs.dm"
	#include "adytum_unit_testing.dm"

	#include "adytum-1.dmm"

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring Testing Site

#endif
