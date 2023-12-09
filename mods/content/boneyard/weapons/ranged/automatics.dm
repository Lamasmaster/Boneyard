/obj/item/gun/projectile/automatic/assault_rifle/boneyard
	name = "assault rifle"
	icon = 'mods/content/boneyard/assets/icons/weapons/ballistic/coltak112.dmi'
	desc = "The Colt AK-112 assault rifle long outdated by time of the Great War. Capable of holding 24 and 100 round magazines."
	caliber = CALIBER_RIFLE_ASSAULT
	ammo_type = /obj/item/ammo_casing/boneyard/assault_rifle
	magazine_type = /obj/item/ammo_magazine/boneyard/assault_rifle
	allowed_magazines = /obj/item/ammo_magazine/boneyard/assault_rifle
	auto_eject = 0
	burst_delay = 1
	firemodes = list(
		list(mode_name="semi auto",      burst=1,    fire_delay=null, one_hand_penalty=8,  burst_accuracy=null,            dispersion=null),
		list(mode_name="3-round bursts", burst=3,    fire_delay=null, one_hand_penalty=9,  burst_accuracy=list(0,-1,-1),   dispersion=list(0.0, 0.6, 1.0)),
	)

/obj/item/ammo_magazine/boneyard/assault_rifle
	name = "assault rifle magazine"
	icon = 'mods/content/boneyard/assets/icons/weapons/ballistic/ammunition/ammo_mags.dmi'
	icon_state = "test"
	origin_tech = "{'combat':2}" //Doesn't matter we have no R&D
	mag_type = MAGAZINE
	caliber = CALIBER_RIFLE_ASSAULT
	material = /decl/material/solid/metal/steel
	ammo_type = /obj/item/ammo_casing/boneyard/assault_rifle
	max_ammo = 24
	multiple_sprites = 1

/obj/item/ammo_magazine/boneyard/assault_rifle/empty
	initial_ammo = 0

/obj/item/ammo_magazine/boneyard/assault_rifle/drum
	name = "machine gun drum magazine"
	icon_state = "test"
	max_ammo = 100

/obj/item/ammo_magazine/boneyard/assault_rifle/drum/empty
	initial_ammo = 0

/*labels = list("practice")*/