/*
Most powerful sidearm in the game, no role is going to start with it and the town will have to work hard \
to acquire it. If anything stronger is added handgun wise it should be automatically denied since this exists.
*/
/obj/item/gun/projectile/pistol/boneyard/heavy
	name = "14mm pistol"
	icon = 'mods/content/boneyard/assets/icons/weapons/ballistic/sigsauer.dmi'
	desc = "A large framed semi-automatic pistol, the SIG-Sauer 14mm autopistol was imported alongside matching 14mm ammunition to the U.S. in limited quantities."
	load_method = MAGAZINE
	caliber = CALIBER_PISTOL_HEAVY
	magazine_type = /obj/item/ammo_magazine/pistol_heavy
	allowed_magazines = /obj/item/ammo_magazine/pistol_heavy
	fire_delay = 6
	accuracy_power = 9 //To reflect it being 20% more accurate in games
	safety_icon = "safety"
	ammo_indicator = FALSE

/obj/item/ammo_magazine/pistol_heavy
	name = "pistol magazine (14mm)"
	icon = 'mods/content/boneyard/assets/icons/weapons/ballistic/ammunition/ammo_mags.dmi'
	icon_state = "test"
	origin_tech = "{'combat':2}" //Doesn't really matter we don't use RnD
	mag_type = MAGAZINE
	caliber = CALIBER_PISTOL_HEAVY
	material = /decl/material/solid/metal/steel
	ammo_type = /obj/item/ammo_casing/boneyard/pistol_heavy
	max_ammo = 6
	multiple_sprites = 1

/obj/item/ammo_magazine/pistol_heavy/empty
	initial_ammo = 0
