#define COMMANDED_HEAL 8//we got healing powers yo
#define COMMANDED_HEALING 9

/mob/living/simple_animal/hostile/commanded/nanomachine
	name = "swarm"
	desc = "a cloud of tiny, tiny robots."
	icon = 'icons/mob/simple_animal/nanomachines.dmi'
	natural_weapon = /obj/item/natural_weapon/nanomachine
	mob_default_max_health = 10
	can_escape = TRUE
	known_commands = list("stay", "stop", "attack", "follow", "heal", "emergency protocol")
	gene_damage = -1
	response_help_1p = "You wave your hand through $TARGET$."
	response_help_3p = "$USER$ waves $USER_HIS$ hand through $TARGET$."
	response_harm =    "agitates"
	response_disarm =  "fans at"
	ai = /datum/ai/nanomachines

	var/regen_time = 0
	var/emergency_protocols = 0

/obj/item/natural_weapon/nanomachine
	name = "decompilers"
	attack_verb = list("swarmed")
	force = 2
	sharp = TRUE

/datum/ai/nanomachines
	expected_type = /mob/living/simple_animal/hostile/commanded/nanomachine

/datum/ai/nanomachines/do_process(time_elapsed)
	. = ..()
	var/mob/living/simple_animal/hostile/commanded/nanomachine/swarm = body
	switch(swarm.stance)
		if(COMMANDED_HEAL)
			if(!swarm.target_mob)
				swarm.target_mob = swarm.FindTarget(COMMANDED_HEAL)
			if(swarm.target_mob)
				swarm.move_to_heal()
		if(COMMANDED_HEALING)
			swarm.heal()

/mob/living/simple_animal/hostile/commanded/nanomachine/handle_living_non_stasis_processes()
	. = ..()
	if(!.)
		return FALSE
	regen_time++
	if(regen_time == 2 && current_health < get_max_health()) //slow regen
		regen_time = 0
		heal_overall_damage(1)

/mob/living/simple_animal/hostile/commanded/nanomachine/death(gibbed, deathmessage, show_dead_message)
	..(null, "dissipates into thin air", "You have been destroyed.")
	qdel(src)

/mob/living/simple_animal/hostile/commanded/nanomachine/proc/move_to_heal()
	if(!target_mob)
		return 0
	walk_to(src,target_mob,1,move_to_delay)
	if(Adjacent(target_mob))
		stance = COMMANDED_HEALING

/mob/living/simple_animal/hostile/commanded/nanomachine/proc/heal()
	if(current_health <= 3 && !emergency_protocols) //dont die doing this.
		return 0
	if(!target_mob)
		return 0
	if(!Adjacent(target_mob) || SA_attackable(target_mob))
		stance = COMMANDED_HEAL
		return 0
	if(target_mob.stat || target_mob.current_health >= target_mob.get_max_health()) //he's either dead or healthy, move along.
		allowed_targets -= target_mob
		target_mob = null
		stance = COMMANDED_HEAL
		return 0
	src.visible_message("\The [src] glows green for a moment, healing \the [target_mob]'s wounds.")
	adjustBruteLoss(3)
	target_mob.adjustBruteLoss(-5, do_update_health = FALSE)
	target_mob.adjustFireLoss(-5)

/mob/living/simple_animal/hostile/commanded/nanomachine/misc_command(var/mob/speaker,var/text)
	if(stance != COMMANDED_HEAL || stance != COMMANDED_HEALING) //dont want attack to bleed into heal.
		allowed_targets = list()
		target_mob = null
	if(findtext(text,"heal")) //heal shit pls
		if(findtext(text,"me")) //assumed want heals on master.
			target_mob = speaker
			stance = COMMANDED_HEAL
			return 1
		var/list/targets = get_targets_by_name(text)
		if(targets.len > 1 || !targets.len)
			src.say("ERROR. TARGET COULD NOT BE PARSED.")
			return 0
		target_mob = targets[1]
		stance = COMMANDED_HEAL
		return 1
	if(findtext(text,"emergency protocol"))
		if(findtext(text,"deactivate"))
			if(emergency_protocols)
				src.say("EMERGENCY PROTOCOLS DEACTIVATED.")
			emergency_protocols = 0
			return 1
		if(findtext(text,"activate"))
			if(!emergency_protocols)
				src.say("EMERGENCY PROTOCOLS ACTIVATED.")
			emergency_protocols = 1
			return 1
		if(findtext(text,"check"))
			src.say("EMERGENCY PROTOCOLS [emergency_protocols ? "ACTIVATED" : "DEACTIVATED"].")
			return 1
	return 0