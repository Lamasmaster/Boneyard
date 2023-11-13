/*Root*/
/turf/simulated/floor/planetary
	name = "planetary ground with atmosphere"
	icon = 'mods/content/boneyard/assets/icons/buildings/f13floors.dmi'
	icon_state = "plating"
	initial_gas = list(/decl/material/gas/oxygen = MOLES_O2STANDARD, /decl/material/gas/nitrogen = MOLES_N2STANDARD)

/*Baseline Subtypes*/
/turf/simulated/floor/planetary/floor
	name = "floor"
	icon_state = "floor"

/*Dark Subtypes*/
/turf/simulated/floor/planetary/floor/dark
	icon_state = "dark"

/*White Subtypes*/
/turf/simulated/floor/planetary/floor/white
	icon_state = "white"

/*Red Subtypes*/
/turf/simulated/floor/planetary/floor/red
	icon_state = "redfull"

/*Blue Subtypes*/
/turf/simulated/floor/planetary/floor/blue
	icon_state = "bluefull"

/*Green Subtypes*/
/turf/simulated/floor/planetary/floor/green
	icon_state = "greenfull"

/*Wasteland Subtypes*/
/turf/simulated/floor/planetary/wasteland
	name = "devastated dirt"
	icon_state = "wasteland1"
