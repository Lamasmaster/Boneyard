/obj/proc/get_food_consumption_method(mob/eater)
	return EATING_METHOD_EAT

/obj/proc/is_edible(var/mob/eater)
	return get_edible_material_amount(eater) > 0

/obj/proc/get_edible_material_amount(var/mob/eater)
	return 0

/obj/proc/get_food_default_transfer_amount(mob/eater)
	return eater?.get_eaten_transfer_amount(2) // arbitrary, should be overridden downstream

/obj/proc/show_food_consumed_message(mob/user, mob/target)
	if(user == target)
		user?.visible_message(
			SPAN_NOTICE("\The [target] finishes eating \the [src]."),
			SPAN_NOTICE("You finish eating \the [src].")
		)
	else
		user?.visible_message(
			SPAN_NOTICE("\The [user] feeds the last of \the [src] to \the [target]."),
			SPAN_NOTICE("You feed the last of \the [src] to \the [target].")
		)

/obj/proc/handle_consumed(mob/feeder, mob/eater, consumption_method = EATING_METHOD_EAT)
	transfer_eaten_material(eater, get_food_default_transfer_amount(eater))
	play_feed_sound(eater, consumption_method)
	if(!get_edible_material_amount(eater))
		if(feeder && eater)
			show_food_consumed_message(feeder, eater)
			feeder.drop_from_inventory(src)
			eater.update_personal_goal(/datum/goal/achievement/specific_object/food, type)
		physically_destroyed()
		return TRUE
	return FALSE

/obj/proc/transfer_eaten_material(mob/eater, amount)
	reagents?.trans_to_mob(eater, amount, CHEM_INGEST)

/obj/proc/show_feed_message_start(var/mob/user, var/mob/target)
	target = target || user
	if(user)
		if(user == target)
			to_chat(user, SPAN_NOTICE("You begin trying to take a bite from \the [target]."))
		else
			user.visible_message(SPAN_NOTICE("\The [user] is trying to feed \the [src] to \the [target]!"))

/obj/proc/show_feed_message_end(var/mob/user, var/mob/target)
	target = target || user
	if(user)
		if(user == target)
			to_chat(user, SPAN_NOTICE("You take a bite of \the [src]."))
		else
			user.visible_message(SPAN_NOTICE("\The [user] feeds some of \the [src] to \the [target]!"))

/obj/proc/show_food_inedible_message(mob/user, mob/target)
	target = target || user
	if(user)
		if(user == target)
			to_chat(user, SPAN_WARNING("There is nothing in \the [src] that you can eat."))
		else
			to_chat(user, SPAN_WARNING("There is nothing in \the [src] that \the [target] can eat."))

/obj/proc/show_food_no_mouth_message(mob/user, mob/target)
	target = target || user
	if(user)
		if(user == target)
			to_chat(user, SPAN_WARNING("Where do you intend to put \the [src]? You don't have a mouth!"))
		else
			to_chat(user, SPAN_WARNING("Where do you intend to put \the [src]? \The [target] doesn't have a mouth!"))

/obj/proc/play_feed_sound(var/mob/user, consumption_method = EATING_METHOD_EAT)
	var/turf/play_turf = get_turf(user)
	if(!play_turf)
		return
	switch(consumption_method)
		if(EATING_METHOD_EAT)
			playsound(user.loc, 'sound/items/eatfood.ogg', rand(10, 50), 1)
		if(EATING_METHOD_DRINK)
			playsound(user.loc, 'sound/items/drink.ogg', rand(10, 50), 1)

/obj/proc/show_food_empty_message(mob/user, mob/target)
	to_chat(user, SPAN_NOTICE("\The [src] is empty."))

/obj/proc/is_food_empty(mob/eater)
	return get_edible_material_amount(eater) <= 0

// General proc for handling an attempt to eat an item, or to eat from an
// item. At time of writing, only handles classic SS13 eating (reagents).
// Returns EATEN_INVALID for an inability to eat, EATEN_UNABLE for an attempt
// prevented by something, and EATEN_SUCCESS for a successful bite.
/obj/proc/handle_eaten_by_mob(var/mob/user, var/mob/target)

	if(!istype(user))
		return EATEN_INVALID

	if(!target)
		target = user

	if(!istype(target))
		return EATEN_INVALID

	if(!is_edible(target))
		show_food_inedible_message(user, target)
		return EATEN_UNABLE

	if(is_food_empty(target))
		show_food_empty_message(user, target)
		return EATEN_UNABLE

	if(!target.check_has_mouth())
		show_food_no_mouth_message(user, target)
		return EATEN_UNABLE

	if(!target.can_eat_food_currently(src, user))
		return EATEN_UNABLE

	var/blocked = target.check_mouth_coverage()
	if(blocked)
		to_chat(user, SPAN_NOTICE("\The [blocked] is in the way!"))
		return EATEN_UNABLE

	if(user != target && !user.can_force_feed(target, src))
		return EATEN_UNABLE

	var/consumption_method = get_food_consumption_method(target)
	user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
	if(user != target)
		if(!user.can_force_feed(target, src))
			return EATEN_UNABLE
		show_feed_message_start(user, target, consumption_method)
		if(!do_mob(user, target))
			return EATEN_UNABLE
		var/contained = json_encode(REAGENT_LIST(src))
		admin_attack_log(user, target, "Fed the victim with [name] (Reagents: [contained])", "Was fed [src] (Reagents: [contained])", "used [src] (Reagents: [contained]) to feed")

	show_feed_message_end(user, target, consumption_method)
	handle_consumed(user, target, consumption_method)
	return EATEN_SUCCESS

/obj/attack_animal(var/mob/user)
	if((isanimal(user) || isalien(user)) && is_edible(user) && handle_eaten_by_mob(user) == EATEN_SUCCESS)
		// TODO: put this in the mob AI.
		spawn(5)
			if(user && QDELETED(src) && !user.client)
				user.custom_emote(1,"[pick("burps", "cries for more", "burps twice", "looks at the area where the food was")]")
		return TRUE
	return ..()
