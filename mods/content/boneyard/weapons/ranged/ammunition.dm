/* AMMUNITION USED IN BONEYARD */
/*
Refer to mods\content\boneyard\weapons\ranged\defines.dm for defines.
Magazines are to be kept within respective .dm files of the weapon types.
Projetile types are to be kept in vicinity of the respective casings.
*/

/obj/item/ammo_casing/boneyard/pistol_heavy
	desc = "A pistol bullet casing."
	caliber = CALIBER_PISTOL_HEAVY
	projectile_type = /obj/item/projectile/bullet/pistol/boneyard/heavy
	icon = 'icons/obj/ammo/casings/pistol.dmi'
	bullet_color = COLOR_BRASS
	marking_color = COLOR_PAKISTAN_GREEN

/obj/item/projectile/bullet/pistol/boneyard/heavy
	fire_sound = 'mods/content/boneyard/assets/sounds/weapons/ballistics/14mm.ogg'
	damage = 45
	armor_penetration = 25
	penetration_modifier = 1.5
	penetrating = 1
	distance_falloff = 1.5
