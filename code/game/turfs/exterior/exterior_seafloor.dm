/turf/exterior/seafloor
	name = "sea floor"
	desc = "A thick layer of silt and debris from above."
	icon = 'icons/turf/exterior/seafloor.dmi'
	icon_edge_layer = EXT_EDGE_SEAFLOOR
	var/detail_decal

/turf/exterior/seafloor/get_diggable_resources()
	return dug ? null : list(/obj/item/stack/material/ore/sand = list(3, 2))

/turf/exterior/seafloor/flooded
	flooded = TRUE
	color = COLOR_LIQUID_WATER

/turf/exterior/seafloor/Initialize()
	if(prob(20))
		LAZYADD(decals, image("asteroid[rand(0,9)]", 'icons/turf/mining_decals.dmi'))
	. = ..()
