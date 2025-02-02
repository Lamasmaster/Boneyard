// A SLUG: Small, little HP, poisonous.
/mob/living/simple_animal/hostile/slug
	name = "slug"
	desc = "A vicious, viscous little creature, it has a mouth of too many teeth and a penchant for blood."
	icon = 'icons/mob/simple_animal/slug.dmi'
	response_harm = "stomps on"
	destroy_surroundings = 0
	mob_default_max_health = 15
	speed = 0
	move_to_delay = 0
	density = TRUE
	min_gas = null
	mob_size = MOB_SIZE_MINISCULE
	can_escape = TRUE
	pass_flags = PASS_FLAG_TABLE
	natural_weapon = /obj/item/natural_weapon/bite
	holder_type = /obj/item/holder/slug
	faction = "Hostile Fauna"

/mob/living/simple_animal/hostile/slug/proc/check_friendly_species(var/mob/living/M)
	return istype(M) && M.faction == faction

/mob/living/simple_animal/hostile/slug/ListTargets(var/dist = 7)
	. = ..()
	for(var/mob/living/M in .)
		if(M.faction == faction)
			. -= M

/mob/living/simple_animal/hostile/slug/get_scooped(var/mob/living/carbon/target, var/mob/living/initiator)
	if(target == initiator || (istype(initiator) && initiator.faction == faction))
		return ..()
	to_chat(initiator, SPAN_WARNING("\The [src] wriggles out of your hands before you can pick it up!"))

/mob/living/simple_animal/hostile/slug/proc/attach(var/mob/living/carbon/human/H)
	var/obj/item/clothing/suit/space/S = H.get_covering_equipped_item_by_zone(BP_CHEST)
	if(istype(S) && !length(S.breaches))
		S.create_breaches(BRUTE, 20)
		if(!length(S.breaches)) //unable to make a hole
			return
	var/obj/item/organ/external/chest = GET_EXTERNAL_ORGAN(H, BP_CHEST)
	var/obj/item/holder/slug/holder = new(get_turf(src))
	src.forceMove(holder)
	chest.embed(holder,0,"\The [src] latches itself onto \the [H]!")
	holder.sync(src)

/mob/living/simple_animal/hostile/slug/AttackingTarget()
	. = ..()
	if(ishuman(.))
		var/mob/living/carbon/human/H = .
		if(prob(H.getBruteLoss()/2))
			attach(H)

/mob/living/simple_animal/hostile/slug/handle_regular_status_updates()
	. = ..()
	if(. && istype(src.loc, /obj/item/holder) && isliving(src.loc.loc)) //We in somebody
		var/mob/living/L = src.loc.loc
		if(src.loc in L.get_visible_implants(0))
			if(prob(1))
				to_chat(L, "<span class='warning'>You feel strange as \the [src] pulses...</span>")
			var/datum/reagents/R = L.reagents
			R.add_reagent(/decl/material/liquid/presyncopics, 0.5)

/obj/item/holder/slug/attack(var/mob/target, var/mob/user)
	var/mob/living/simple_animal/hostile/slug/V = contents[1]
	if(!V.stat && ishuman(target))
		var/mob/living/carbon/human/H = target
		if(!do_mob(user, H, 30))
			return
		V.attach(H)
		qdel(src)
		return
	..()